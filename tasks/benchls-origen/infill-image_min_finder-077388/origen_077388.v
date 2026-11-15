module origen_077388(
    input clk,
    input reset,
    output reg done,
    output reg sti_rd,
    output reg [6:0] sti_addr,
    input [15:0] sti_di,
    output reg res_wr,
    output reg res_rd,
    output reg [13:0] res_addr,
    output reg [7:0] res_do,
    input [7:0] res_di
);

    reg [3:0] state;
    reg [3:0] bit_count;
    reg [7:0] min_value;
    reg [15:0] input_buffer;
    reg [6:0] row, col;

    [MASKED]
endmodule