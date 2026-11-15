module origen_016071 (
    input wire clk,
    input wire Dir,
    input wire StepEnable,
    input wire rst,
    input wire [3:0] speed,
    output reg [3:0] StepDrive
);

    reg [2:0] state;
    reg [15:0] StepCounter;
    reg [15:0] StepLockOut;

    [MASKED]

endmodule