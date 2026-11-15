module origen_152838 (
    input           sys_rst,
    input           csr_selected,
    input [4:0]     csr_a,
    input           csr_we,
    input [31:0]    csr_di,
    output [31:0]   csr_do,

    output          sdram_cs_n,
    output          sdram_we_n,
    output          sdram_cas_n,
    output          sdram_ras_n,
    output [12:0]   sdram_adr,
    output [1:0]    sdram_ba,
    output          sdram_rst,
    output          bypass,

    output          idelay_rst,
    output          idelay_ce,
    output          idelay_inc,
    output          idelay_cal
);

    reg [31:0] tim_rp, tim_rcd, tim_cas, tim_refi, tim_rfc, tim_wr;
    reg [13:0] sdram_adr_reg;
    reg [1:0]  sdram_ba_reg;
    reg        sdram_cs_n_reg, sdram_we_n_reg, sdram_cas_n_reg, sdram_ras_n_reg;
    reg        sdram_rst_reg, bypass_reg;
    reg        idelay_rst_reg, idelay_ce_reg, idelay_inc_reg, idelay_cal_reg;

    always @(posedge sys_rst) begin
        tim_rp <= 32'h00000000;
        tim_rcd <= 32'h00000000;
        tim_cas <= 32'h00000000;
        tim_refi <= 32'h00000000;
        tim_rfc <= 32'h00000000;
        tim_wr <= 32'h00000000;
        sdram_adr_reg <= 14'h0000;
        sdram_ba_reg <= 2'b00;
        sdram_cs_n_reg <= 1'b1;
        sdram_we_n_reg <= 1'b1;
        sdram_cas_n_reg <= 1'b1;
        sdram_ras_n_reg <= 1'b1;
        sdram_rst_reg <= 1'b1;
        bypass_reg <= 1'b0;
        idelay_rst_reg <= 1'b1;
        idelay_ce_reg <= 1'b0;
        idelay_inc_reg <= 1'b0;
        idelay_cal_reg <= 1'b0;
    end

    always @(posedge csr_selected) begin
        if (csr_we) begin
            case (csr_a)
                5'd0: tim_rp <= csr_di;
                5'd1: tim_rcd <= csr_di;
                5'd2: tim_cas <= csr_di;
                5'd3: tim_refi <= csr_di;
                5'd4: tim_rfc <= csr_di;
                5'd5: tim_wr <= csr_di;
                5'd6: sdram_adr_reg <= csr_di[13:0];
                5'd7: sdram_ba_reg <= csr_di[1:0];
                5'd8: {sdram_cs_n_reg, sdram_we_n_reg, sdram_cas_n_reg, sdram_ras_n_reg} <= csr_di[3:0];
                5'd9: {sdram_rst_reg, bypass_reg} <= csr_di[1:0];
                5'd10: {idelay_rst_reg, idelay_ce_reg, idelay_inc_reg, idelay_cal_reg} <= csr_di[3:0];
            endcase
        end
    end

    assign csr_do = (csr_a == 5'd0) ? tim_rp :
                    (csr_a == 5'd1) ? tim_rcd :
                    (csr_a == 5'd2) ? tim_cas :
                    (csr_a == 5'd3) ? tim_refi :
                    (csr_a == 5'd4) ? tim_rfc :
                    (csr_a == 5'd5) ? tim_wr :
                    (csr_a == 5'd6) ? {18'h00000, sdram_adr_reg} :
                    (csr_a == 5'd7) ? {30'h00000000, sdram_ba_reg} :
                    (csr_a == 5'd8) ? {28'h0000000, sdram_cs_n_reg, sdram_we_n_reg, sdram_cas_n_reg, sdram_ras_n_reg} :
                    (csr_a == 5'd9) ? {30'h00000000, sdram_rst_reg, bypass_reg} :
                    (csr_a == 5'd10) ? {28'h0000000, idelay_rst_reg, idelay_ce_reg, idelay_inc_reg, idelay_cal_reg} :
                    32'h00000000;

    assign sdram_cs_n = sdram_cs_n_reg;
    assign sdram_we_n = sdram_we_n_reg;
    assign sdram_cas_n = sdram_cas_n_reg;
    assign sdram_ras_n = sdram_ras_n_reg;
    assign sdram_adr = sdram_adr_reg;
    assign sdram_ba = sdram_ba_reg;
    assign sdram_rst = sdram_rst_reg;
    assign bypass = bypass_reg;

    assign idelay_rst = idelay_rst_reg;
    assign idelay_ce = idelay_ce_reg;
    assign idelay_inc = idelay_inc_reg;
    assign idelay_cal = idelay_cal_reg;

endmodule