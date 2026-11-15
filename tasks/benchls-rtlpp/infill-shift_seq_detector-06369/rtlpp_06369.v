module rtlpp_06369 (
    x,
    clk,
    reset,
    z
);
input   x;
input   clk;
input   reset;
output  z;

reg state_S1, state_S2, state_S3, state_S4;
reg z_out;

wire gnd;
wire vcc;

assign gnd = 1'b0;
assign vcc = 1'b1;

[MASKED]

assign z = z_out;

endmodule