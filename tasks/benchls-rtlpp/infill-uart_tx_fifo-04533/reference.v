module rtlpp_04533
(
    input [7:0] data_in,
    input write_buffer,
    input reset_buffer,
    input en_16_x_baud,
    output serial_out,
    output buffer_full,
    output buffer_half_full,
    input clk
);

wire [7:0] fifo_data_out;
reg fifo_data_present;
reg fifo_read;

// UART transmitter logic
reg [7:0] shift_reg;
reg [3:0] bit_count;
reg sending;

assign serial_out = shift_reg[0]; // Serial output is the LSB of the shift register

always @(posedge clk) begin
    if (fifo_data_present && en_16_x_baud) begin
        if (!sending) begin
            sending <= 1;
            shift_reg <= fifo_data_out;
            bit_count <= 8;
        end else if (bit_count > 0) begin
            shift_reg <= {1'b0, shift_reg[7:1]}; // Shift right
            bit_count <= bit_count - 1;
        end else begin
            sending <= 0;
            fifo_read <= 1;
        end
    end else begin
        fifo_read <= 0;
    end
end

// FIFO buffer logic (simplified version of a 16x8 FIFO)
reg [7:0] fifo [15:0];
reg [4:0] fifo_head;
reg [4:0] fifo_tail;
reg [4:0] fifo_count;

assign fifo_data_out = fifo[fifo_tail];
assign buffer_full = (fifo_count == 16);
assign buffer_half_full = (fifo_count >= 8);
assign fifo_data_present = (fifo_count > 0);

always @(posedge clk or posedge reset_buffer) begin
    if (reset_buffer) begin
        fifo_head <= 0;
        fifo_tail <= 0;
        fifo_count <= 0;
        fifo_read <= 0;
        sending <= 0;
    end else begin
        if (write_buffer && !buffer_full) begin
            fifo[fifo_head] <= data_in;
            fifo_head <= (fifo_head + 1) % 16;
            fifo_count <= fifo_count + 1;
        end

        if (fifo_read && fifo_data_present) begin
            fifo_tail <= (fifo_tail + 1) % 16;
            fifo_count <= fifo_count - 1;
            fifo_read <= 0;
        end
    end
end

endmodule