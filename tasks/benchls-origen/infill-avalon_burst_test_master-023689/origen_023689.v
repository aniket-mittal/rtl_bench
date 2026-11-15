module origen_023689 (
    input wire emif_usr_clk,
    input wire rst,
    input wire bt1,
    input wire bt2,
    input wire amm_ready,
    output reg amm_rd,
    output reg amm_wr,
    output reg [24:0] amm_addr,
    output reg [6:0] amm_burstcnt
);

    parameter burstlength = 6;
    reg [19:0] cnt;

    [MASKED]

endmodule