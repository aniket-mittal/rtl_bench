module origen_199172(
    input start,
    input clk,
    input [3:0] a,
    input [3:0] b,
    output reg flag,
    output reg [7:0] mul
);

reg [3:0] State;
reg c;
reg [3:0] Acc;
reg [3:0] Q;

wire [3:0] m1, m2, m3, m4;

assign m1 = {c, Acc[3:1]};
assign m2 = {Acc[0], Acc[3:1]};
assign m3 = {c, Q[3:1]};
assign m4 = {Q[0], Q[3:1]};

[MASKED]

endmodule