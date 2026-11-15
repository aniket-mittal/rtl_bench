module origen_084456 #(
    parameter INIVAL = 0,
    parameter BW = 8
) (
    input wire clk,
    input wire rst_n,
    input wire data_in,
    input wire pol,
    input wire refclk,
    input wire [BW-1:0] flt_rise_st,
    input wire [BW-1:0] flt_fall_st,
    output reg data_out,
    output reg act_edge,
    output reg inact_edge
);

reg [BW-1:0] flt_count;
wire flt_count_full;
wire [BW-1:0] flt_threshold;

assign flt_threshold = data_in ? flt_rise_st : flt_fall_st;
assign flt_count_full = (flt_count == {BW{1'b1}});

[MASKED]

endmodule