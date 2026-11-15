module rtlpp_04543
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
wire fifo_data_present;
wire fifo_read;

// Embedded kcuart_tx logic
reg [7:0] data_reg;
reg sending;
reg [3:0] bit_count;
reg serial_out_reg;

assign serial_out = serial_out_reg;

always @(posedge clk) begin
	if (en_16_x_baud && fifo_data_present) begin
		if (!sending) begin
			data_reg <= fifo_data_out;
			sending <= 1;
			bit_count <= 0;
		end else if (bit_count < 8) begin
			serial_out_reg <= data_reg[bit_count];
			bit_count <= bit_count + 1;
		end else begin
			sending <= 0;
		end
	end
end

assign fifo_read = !sending && bit_count == 8;

// Embedded bbfifo_16x8 logic
reg [7:0] fifo [15:0];
reg [3:0] write_ptr;
reg [3:0] read_ptr;
reg full_reg;
reg half_full_reg;
reg data_present_reg;

assign fifo_data_out = fifo[read_ptr];
assign fifo_data_present = data_present_reg;
assign buffer_full = full_reg;
assign buffer_half_full = half_full_reg;

[MASKED]

endmodule