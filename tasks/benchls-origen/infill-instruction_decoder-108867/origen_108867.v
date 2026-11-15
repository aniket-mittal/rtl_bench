module origen_108867(
    input wire clk,
    input wire init,
    input wire decoder_en,
    input wire [8:0] inst,
    input wire cmp,
    output reg [3:0] r1,
    output reg [3:0] r2,
    output reg [2:0] inst_type,
    output reg [3:0] funct,
    output reg [7:0] immediate,
    output reg branch,
    output reg branchi,
    output reg jump,
    output reg reg_hi_en,
    output reg reg_lo_en,
    output reg reg_readx_en,
    output reg reg_ready_en,
    output reg reg_swap_en,
    output reg y_is_imm,
    output reg is_cmp,
    output reg done
);

    [MASKED]

endmodule