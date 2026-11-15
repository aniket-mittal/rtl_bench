module origen_074868(
    input [5:0] op,
    input [5:0] low6,
    input [31:0] instr,
    output reg [4:0] aluCtrl,
    output reg ifWrGrf,
    output reg [4:0] grfWa,
    output reg [4:0] grfRa1,
    output reg [4:0] grfRa2,
    output reg ifReDm,
    output reg ifWrDm,
    output reg ifBeq,
    output reg ifJal,
    output reg ifJr,
    output reg ifJ,
    output reg ifImmExt,
    output reg [1:0] tUseRs,
    output reg [1:0] tUseRt,
    output reg [1:0] tNew,
    output reg ifAddu,
    output reg ifSubu,
    output reg ifOri,
    output reg ifLui,
    output reg ifLw,
    output reg ifSw
);

    [MASKED]

endmodule