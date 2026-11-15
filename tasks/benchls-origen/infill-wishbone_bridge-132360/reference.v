module origen_132360 (
    input sys_rst,
    // Slave interface
    input wbs_clk_i,
    input [31:0] wbs_adr_i,
    input [31:0] wbs_dat_i,
    output reg [31:0] wbs_dat_o,
    input [3:0] wbs_sel_i,
    input wbs_tga_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    output reg wbs_ack_o,
    // Master interface
    input wbm_clk_i,
    output reg [31:0] wbm_adr_o,
    output reg [31:0] wbm_dat_o,
    input [31:0] wbm_dat_i,
    output reg [3:0] wbm_sel_o,
    output reg wbm_tga_o,
    output reg wbm_stb_o,
    output reg wbm_cyc_o,
    output reg wbm_we_o,
    input wbm_ack_i
);

    reg wbs_we_reg, wbs_tga_reg;
    reg [31:0] wbs_dat_reg;
    reg [31:0] wbm_dat_reg;
    reg wbs_stb;
    reg sync_ack, prev_sync_ack;

    always @(posedge wbs_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            wbs_we_reg <= 0;
            wbs_tga_reg <= 0;
            wbs_dat_reg <= 0;
        end else begin
            wbs_we_reg <= wbs_we_i;
            wbs_tga_reg <= wbs_tga_i;
            wbs_dat_reg <= wbs_dat_i;
        end
    end

    always @(posedge wbs_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            wbs_stb <= 0;
        end else begin
            wbs_stb <= wbs_stb_i & wbs_cyc_i;
        end
    end

    always @(posedge wbm_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            wbm_stb_o <= 0;
            wbm_cyc_o <= 0;
            wbm_adr_o <= 0;
            wbm_dat_o <= 0;
            wbm_sel_o <= 0;
            wbm_we_o <= 0;
            wbm_tga_o <= 0;
        end else begin
            if (wbs_stb && !wbm_stb_o) begin
                wbm_stb_o <= 1;
                wbm_cyc_o <= 1;
                wbm_adr_o <= wbs_adr_i;
                wbm_dat_o <= wbs_dat_reg;
                wbm_sel_o <= wbs_sel_i;
                wbm_we_o <= wbs_we_reg;
                wbm_tga_o <= wbs_tga_reg;
            end else if (wbm_ack_i) begin
                wbm_stb_o <= 0;
                wbm_cyc_o <= 0;
            end
        end
    end

    always @(posedge wbm_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            wbm_dat_reg <= 0;
        end else if (wbm_ack_i) begin
            wbm_dat_reg <= wbm_dat_i;
        end
    end

    always @(posedge wbs_clk_i or posedge sys_rst) begin
        if (sys_rst) begin
            sync_ack <= 0;
            prev_sync_ack <= 0;
            wbs_ack_o <= 0;
            wbs_dat_o <= 0;
        end else begin
            sync_ack <= wbm_ack_i;
            prev_sync_ack <= sync_ack;
            wbs_ack_o <= sync_ack & ~prev_sync_ack;
            wbs_dat_o <= wbm_dat_reg;
        end
    end

endmodule