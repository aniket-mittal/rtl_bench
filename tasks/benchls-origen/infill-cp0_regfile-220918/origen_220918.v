module origen_220918 (
    input  wire        clk,
    input  wire        rst,
    input  wire [4:0]  Sel,
    input  wire [31:0] CPIn,
    input  wire        HWInt,
    input  wire        EXLSet,
    input  wire        EXLClr,
    output wire [31:0] CPOut,
    output wire        IntReq,
    output wire [31:0] EPC
);

    reg [31:0] CP0Reg [0:31];
    reg        im;
    reg        exl;
    reg        ie;
    reg [31:0] HWint_lock;
    reg [31:0] EPC_reg;

    [MASKED]

    assign CPOut = CP0Reg[Sel];
    assign EPC = EPC_reg;
    assign IntReq = HWint_lock & im & ie & ~exl;

endmodule