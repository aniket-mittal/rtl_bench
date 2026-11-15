module origen_208111 #(
    parameter BASE_ADDR = 32'h4000_0000
) (
    input Clock,
    input ResetN,
    input [31:0] ReadAddress,
    input ReadEN,
    output reg [31:0] ReadData,
    input [31:0] WriteAddress,
    input [31:0] WriteData,
    input WriteEN,
    input CurrentFB
);

    reg Activate;
    reg [31:0] FB1Addr;
    reg [31:0] FB2Addr;
    reg [31:0] FBSize;
    reg FBselect;

    [MASKED]

endmodule