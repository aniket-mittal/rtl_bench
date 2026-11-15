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

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wb_cyc_o <= 1'b0;
            wb_adr_o <= {aw{1'b0}};
            wb_stb_o <= 1'b0;
            wb_we_o <= 1'b0;
            wb_sel_o <= {(dw/8){1'b0}};
            wb_dat_o <= {dw{1'b0}};
            wb_cti_o <= 3'b000;
            wb_bte_o <= 2'b00;
            cbu_ack_o <= 1'b0;
            cbu_err_o <= 1'b0;
            cbu_dat_o <= {dw{1'b0}};
            cbu_adr_o <= {aw{1'b0}};
            cbu_adr_r <= {aw{1'b0}};
            cbu_dat_r <= {dw{1'b0}};
            cbu_we_r <= 1'b0;
            cbu_sel_r <= {(dw/8){1'b0}};
        end else begin
            if (cbu_rqt_i) begin
                wb_cyc_o <= 1'b1;
                wb_adr_o <= cbu_adr_i;
                wb_stb_o <= 1'b1;
                wb_we_o <= cbu_we_i;
                wb_sel_o <= cbu_sel_i;
                wb_dat_o <= cbu_dat_i;
                wb_cti_o <= 3'b000; // Classic cycle
                wb_bte_o <= 2'b00; // Linear burst
                cbu_adr_r <= cbu_adr_i;
                cbu_dat_r <= cbu_dat_i;
                cbu_we_r <= cbu_we_i;
                cbu_sel_r <= cbu_sel_i;
            end else begin
                wb_cyc_o <= 1'b0;
                wb_stb_o <= 1'b0;
                wb_we_o <= 1'b0;
                wb_sel_o <= {(dw/8){1'b0}};
                wb_dat_o <= {dw{1'b0}};
                wb_cti_o <= 3'b000;
                wb_bte_o <= 2'b00;
            end

            if (wb_ack_i) begin
                cbu_ack_o <= 1'b1;
                cbu_err_o <= 1'b0;
                cbu_dat_o <= wb_dat_i;
                cbu_adr_o <= cbu_adr_r;
            end else if (wb_err_i) begin
                cbu_ack_o <= 1'b0;
                cbu_err_o <= 1'b1;
                cbu_dat_o <= {dw{1'b0}};
                cbu_adr_o <= cbu_adr_r;
            end else begin
                cbu_ack_o <= 1'b0;
                cbu_err_o <= 1'b0;
            end
        end
    end

endmodule