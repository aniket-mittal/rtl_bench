module origen_220701(
    input clk,
    input rst,
    input load,
    input [5:0] a,
    input [5:0] b,
    output reg slow_clk,
    output reg [11:0] product
);

reg [5:0] la, lb;
reg [2:0] counter;
reg [11:0] temp;
reg [32:0] mcounter;
reg [6:0] Q;
reg [5:0] A;

[MASKED]

always @(posedge clk) begin
    mcounter <= mcounter + 1;
    slow_clk <= mcounter[0];
end

endmodule