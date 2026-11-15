module origen_157665 #(
    parameter TOP0_0 = 16,
    parameter LDD0_0 = 16
)(
    input clk200,
    input rst,
    input [TOP0_0-1:0] cap_wdis,
    input [LDD0_0-1:0] cap_plus,
    input cap_trig,
    output reg capr_rdy,
    output [TOP0_0-1:0] wdis
);

reg [TOP0_0-1:0] t_wdis;
reg [LDD0_0-1:0] cap_plus_cnt;
reg cap_plus_en;

localparam S_OFF = 1'b0, S_ON = 1'b1;
reg state;

[MASKED]

assign wdis = t_wdis;

endmodule