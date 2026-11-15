module origen_168719 #(
    parameter OUTPUT_BIT = 8
)(
    input  wire             i_clk,
    input  wire             i_rst_n,
    input  wire [31:0]      i_freq_cnt,
    input  wire [OUTPUT_BIT-1:0] i_amp_H,
    input  wire [OUTPUT_BIT-1:0] i_amp_L,
    output reg  [OUTPUT_BIT-1:0] o_mod_out,
    output reg              o_status
);

reg [31:0] freq_cnt;
reg        SM;

[MASKED]

endmodule