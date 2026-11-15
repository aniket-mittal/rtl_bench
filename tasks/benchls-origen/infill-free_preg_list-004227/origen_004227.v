module origen_004227 (
    input wire clk,
    input wire rst,
    input wire dispatch_en_i,
    input wire retire_en_i,
    input wire [5:0] retire_preg_i,
    input wire recover_en_i,
    input wire [4:0] recover_head_i,
    output reg free_preg_vld_o,
    output reg [5:0] free_preg_o,
    output reg [4:0] free_preg_cur_head_o
);

    reg [5:0] FL [31:0];
    reg [4:0] head, tail;
    reg [5:0] count;

    [MASKED]

endmodule