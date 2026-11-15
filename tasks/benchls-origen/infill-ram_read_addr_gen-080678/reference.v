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

always @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        r_cur_outXLength <= 8'd0;
        r_cur_outlayers <= 8'd0;
        o_ram_addr <= {ADDR_WIDTH{1'b0}};
        r_ram_rd_en <= 1'b0;
    end else begin
        if (i_calc_en) begin
            r_cur_outXLength <= 8'd0;
            r_cur_outlayers <= 8'd0;
            o_ram_addr <= {ADDR_WIDTH{1'b0}};
            r_ram_rd_en <= 1'b1;
        end else if (i_npe_dat_vld) begin
            if (r_cur_outXLength == i_out_x_length - 1) begin
                r_cur_outXLength <= 8'd0;
                r_ram_rd_en <= 1'b1;
                if (r_cur_outlayers == i_output_layers - 1) begin
                    r_cur_outlayers <= 8'd0;
                end else begin
                    r_cur_outlayers <= r_cur_outlayers + 1'b1;
                end
                if (r_cur_outlayers != 8'd0) begin
                    o_ram_addr <= o_ram_addr + 1'b1;
                end
            end else begin
                r_cur_outXLength <= r_cur_outXLength + 1'b1;
                r_ram_rd_en <= 1'b0;
            end
        end else begin
            r_ram_rd_en <= 1'b0;
        end
    end
end

assign o_ram_rd_en = r_ram_rd_en;

endmodule