module origen_034436 #(
    parameter bowd_rate = 9600,
    parameter clk_pariod = 50
) (
    input wire clk,
    input wire send_flag,
    input wire [6:0] send_data,
    output reg out_serial_bit
);

    localparam max_clk = (1000000000 / (bowd_rate * clk_pariod)) - 1;

    reg [9:0] data_frame;
    reg [31:0] clk_counter;
    reg [3:0] curent_pos;
    reg transmitting;

    always @(posedge clk) begin
        if (send_flag && !transmitting) begin
            data_frame[0] = 1'b0; // Start bit
            data_frame[7:1] = send_data;
            data_frame[8] = ^send_data; // Even parity
            data_frame[9] = 1'b1; // Stop bit
            transmitting = 1'b1;
            clk_counter = 0;
            curent_pos = 0;
        end else if (transmitting) begin
            if (clk_counter == max_clk) begin
                clk_counter = 0;
                if (curent_pos <= 9) begin
                    out_serial_bit = data_frame[curent_pos];
                    curent_pos = curent_pos + 1;
                end else begin
                    transmitting = 1'b0;
                    out_serial_bit = 1'b1;
                end
            end else begin
                clk_counter = clk_counter + 1;
            end
        end else begin
            out_serial_bit = 1'b1;
        end
    end

    initial begin
        out_serial_bit = 1'b1;
        transmitting = 1'b0;
        clk_counter = 0;
        curent_pos = 0;
    end

endmodule