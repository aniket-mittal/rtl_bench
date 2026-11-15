module origen_051929 (
    input wire sys_clk,
    input wire rst_n,
    input wire dma_rst_i,
    input wire dma_de_16b_i,
    input wire [15:0] dma_d_16b_i,
    output reg dma_de_32b_o,
    output reg dma_we_32b_o,
    output reg [31:0] dma_d_32b_o
);

reg [2:0] allian_cnt;
reg dma_de_16b_d1;
reg [15:0] dma_d_16b_d1;

[MASKED]

endmodule