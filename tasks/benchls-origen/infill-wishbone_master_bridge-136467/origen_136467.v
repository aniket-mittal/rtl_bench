module origen_136467 #(
    parameter aw = 32,
    parameter dw = 32
) (
    input wire clk,
    input wire rst,
    input wire wb_ack_i,
    input wire wb_err_i,
    input wire wb_rty_i,
    input wire [dw-1:0] wb_dat_i,
    input wire [aw-1:0] cbu_adr_i,
    input wire [dw-1:0] cbu_dat_i,
    input wire cbu_rqt_i,
    input wire cbu_we_i,
    input wire [(dw/8)-1:0] cbu_sel_i,

    output reg wb_cyc_o,
    output reg [aw-1:0] wb_adr_o,
    output reg wb_stb_o,
    output reg wb_we_o,
    output reg [(dw/8)-1:0] wb_sel_o,
    output reg [dw-1:0] wb_dat_o,
    output reg [2:0] wb_cti_o,
    output reg [1:0] wb_bte_o,
    output reg cbu_ack_o,
    output reg cbu_err_o,
    output reg [dw-1:0] cbu_dat_o,
    output reg [aw-1:0] cbu_adr_o
);

    reg [aw-1:0] cbu_adr_r;
    reg [dw-1:0] cbu_dat_r;
    reg cbu_we_r;
    reg [(dw/8)-1:0] cbu_sel_r;

    [MASKED]

endmodule