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

    [MASKED]

    initial begin
        out_serial_bit = 1'b1;
        transmitting = 1'b0;
        clk_counter = 0;
        curent_pos = 0;
    end

endmodule