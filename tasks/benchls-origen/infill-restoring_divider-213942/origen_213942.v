module origen_213942 (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [31:0] A,
    input wire [31:0] B,
    output wire [31:0] D,
    output wire [31:0] R,
    output wire ok,
    output wire err
);

reg active;
reg [4:0] cycle;
reg [31:0] result;
reg [31:0] denom;
reg [31:0] work;

wire [32:0] sub;
assign sub = work - denom;

assign D = result;
assign R = work;
assign ok = ~active;
assign err = (B == 32'b0);

[MASKED]

endmodule