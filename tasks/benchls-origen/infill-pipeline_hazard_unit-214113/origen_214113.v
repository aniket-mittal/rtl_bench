module origen_214113(
    // Inputs
    IFIDrs, IFIDrt,
    IDEXrt, IDEXrd,
    EXMemRead, EXRegWrite,
    MEMRegWrite,
    WBRegWrite,
    EXMemWrite, MEMMemWrite,
    opcode,
    Jump,
    PCsrc,

    // Outputs
    PCWrite,
    IFIDWrite,
    ControlWrite,
    FlushSignal
);

    input  [4:0] IFIDrs, IFIDrt, IDEXrt, IDEXrd;
    input        EXMemRead, EXRegWrite, MEMRegWrite, WBRegWrite;
    input        EXMemWrite, MEMMemWrite;
    input  [5:0] opcode;
    input  [1:0] Jump;
    input        PCsrc;

    output reg PCWrite, IFIDWrite, ControlWrite, FlushSignal;

    initial begin
        PCWrite = 0;
        IFIDWrite = 0;
        ControlWrite = 0;
        FlushSignal = 0;
    end

    [MASKED]

endmodule