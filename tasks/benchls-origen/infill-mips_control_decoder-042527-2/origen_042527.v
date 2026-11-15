module origen_042527(
    input [31:0] Instruction,
    output reg RegWriteD,
    output reg MemtoRegD,
    output reg MemWriteD,
    output reg [2:0] ALUCtrlD,
    output reg ALUSrcD,
    output reg RegDstD,
    output reg JumpToTargetD,
    output reg JumpAndLinkD,
    output reg JumpRegD,
    output reg BgtzD,
    output reg BeqD
);

    wire [5:0] op = Instruction[31:26];
    wire [5:0] func = Instruction[5:0];

    [MASKED]

endmodule