module origen_209317(
    input clk,
    input reset,
    input start_receiving,
    input ps2_clk,
    input ps2_dat,
    output reg [7:0] command,
    output reg received
);

reg [2:0] clk_div;
reg process_cmd;
reg [3:0] counter;

[MASKED]

assign ps2_clk = process_cmd ? 1'b0 : 1'bz;
assign ps2_dat = process_cmd ? 1'b0 : 1'bz;

endmodule