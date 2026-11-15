module rtlpp_00255(
    start_clk_dg, ctu_ddr0_dram_cken_dg, ctu_ddr1_dram_cken_dg,
    ctu_ddr2_dram_cken_dg, ctu_ddr3_dram_cken_dg,
    ctu_dram02_dram_cken_dg, ctu_dram13_dram_cken_dg, a_grst_dg,
    a_dbginit_dg, de_grst_dsync_edge_dg, de_dbginit_dsync_edge_dg,

    io_pwron_rst_l, cmp_gclk, ctu_ddr0_dram_cken_dl,
    ctu_ddr1_dram_cken_dl, ctu_ddr2_dram_cken_dl, ctu_ddr3_dram_cken_dl,
    ctu_dram02_dram_cken_dl, ctu_dram13_dram_cken_dl, start_clk_dl,
    a_grst_dl, a_dbginit_dl, de_grst_dsync_edge_dl,
    de_dbginit_dsync_edge_dl
);

    input io_pwron_rst_l;
    input cmp_gclk;

    input ctu_ddr0_dram_cken_dl;
    input ctu_ddr1_dram_cken_dl;
    input ctu_ddr2_dram_cken_dl;
    input ctu_ddr3_dram_cken_dl;
    input ctu_dram02_dram_cken_dl;
    input ctu_dram13_dram_cken_dl;
    input start_clk_dl;
    input a_grst_dl;
    input a_dbginit_dl;
    input de_grst_dsync_edge_dl;
    input de_dbginit_dsync_edge_dl;

    output start_clk_dg;
    output ctu_ddr0_dram_cken_dg;
    output ctu_ddr1_dram_cken_dg;
    output ctu_ddr2_dram_cken_dg;
    output ctu_ddr3_dram_cken_dg;
    output ctu_dram02_dram_cken_dg;
    output ctu_dram13_dram_cken_dg;
    output a_grst_dg;
    output a_dbginit_dg;
    output de_grst_dsync_edge_dg;
    output de_dbginit_dsync_edge_dg;

    reg start_clk_dg;
    reg ctu_ddr0_dram_cken_dg;
    reg ctu_ddr1_dram_cken_dg;
    reg ctu_ddr2_dram_cken_dg;
    reg ctu_ddr3_dram_cken_dg;
    reg ctu_dram02_dram_cken_dg;
    reg ctu_dram13_dram_cken_dg;
    reg a_grst_dg;
    reg a_dbginit_dg;
    reg de_grst_dsync_edge_dg;
    reg de_dbginit_dsync_edge_dg;

    always @ (posedge cmp_gclk or negedge io_pwron_rst_l) begin
        if (!io_pwron_rst_l) begin
            start_clk_dg <= 0;
        end else begin
            start_clk_dg <= start_clk_dl;
        end
    end

    always @ (posedge cmp_gclk) begin
        ctu_ddr0_dram_cken_dg <= ctu_ddr0_dram_cken_dl;
        ctu_ddr1_dram_cken_dg <= ctu_ddr1_dram_cken_dl;
        ctu_ddr2_dram_cken_dg <= ctu_ddr2_dram_cken_dl;
        ctu_ddr3_dram_cken_dg <= ctu_ddr3_dram_cken_dl;
        ctu_dram02_dram_cken_dg <= ctu_dram02_dram_cken_dl;
        ctu_dram13_dram_cken_dg <= ctu_dram13_dram_cken_dl;
        a_grst_dg <= a_grst_dl;
        a_dbginit_dg <= a_dbginit_dl;
        de_grst_dsync_edge_dg <= de_grst_dsync_edge_dl;
        de_dbginit_dsync_edge_dg <= de_dbginit_dsync_edge_dl;
    end

endmodule