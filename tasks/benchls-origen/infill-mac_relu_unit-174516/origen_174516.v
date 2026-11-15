module origen_174516 #(
    parameter IMG_Width = 8,
    parameter IMG_Height = 8,
    parameter Datawidth = 8,
    parameter ReLU = 1
)(
    input [Datawidth-1:0] In,
    input CLK,
    input CLR,
    input Valid_IN,
    input [Datawidth-1:0] K,
    output reg Valid_OUT,
    output reg [Datawidth-1:0] Out
);

reg [Datawidth-1:0] hang, cot;
reg [Datawidth*2-1:0] R0;
reg [Datawidth*2-1:0] result;
reg [Datawidth-1:0] _result;

[MASKED]

endmodule