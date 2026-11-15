module origen_080678 #(
    parameter ADDR_WIDTH = 7
)(
    input wire i_clk,
    input wire i_rst_n,
    input wire [7:0] i_out_x_length,
    input wire [7:0] i_output_layers,
    input wire i_calc_en,
    input wire i_npe_dat_vld,
    output reg [ADDR_WIDTH-1:0] o_ram_addr,
    output wire o_ram_rd_en
);

reg [7:0] r_cur_outXLength;
reg [7:0] r_cur_outlayers;
reg r_ram_rd_en;

[MASKED]

assign o_ram_rd_en = r_ram_rd_en;

endmodule