`timescale 1ns / 1ps

module origen_140915 (
    input wire ap_clk,
    input wire ap_rst,
    input wire ap_start,
    output wire ap_done,
    output wire ap_idle,
    output wire ap_ready,
    input wire vld_i,
    input wire [31:0] x_i_V,
    input wire [31:0] rat_i_V,
    output wire vld_o,
    output wire [31:0] y_o_V
);

    reg [31:0] y_reg;
    reg done_reg, idle_reg, ready_reg, vld_o_reg;

    always @(posedge ap_clk or posedge ap_rst) begin
        if (ap_rst) begin
            y_reg <= 32'd0;
            done_reg <= 1'b0;
            idle_reg <= 1'b1;
            ready_reg <= 1'b0;
            vld_o_reg <= 1'b0;
        end else if (ap_start && vld_i) begin
            y_reg <= x_i_V * rat_i_V;
            done_reg <= 1'b1;
            idle_reg <= 1'b0;
            ready_reg <= 1'b1;
            vld_o_reg <= 1'b1;
        end else begin
            done_reg <= 1'b0;
            idle_reg <= 1'b1;
            ready_reg <= 1'b0;
            vld_o_reg <= 1'b0;
        end
    end

    assign y_o_V = y_reg;
    assign ap_done = done_reg;
    assign ap_idle = idle_reg;
    assign ap_ready = ready_reg;
    assign vld_o = vld_o_reg;

endmodule

