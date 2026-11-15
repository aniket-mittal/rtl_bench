module origen_162667(
    input [5:0] OpCode,
    input EX_RegW,
    input EX_MemRead,
    input [4:0] EX_RegRD,
    input [4:0] ID_RegRS,
    input [4:0] ID_RegRT,
    input [4:0] M_RegRD,
    input [4:0] EX_RegRS,
    input [4:0] EX_RegRT,
    input M_MemRead,
    output reg IF_WriteSel_ID,
    output reg ControlNopSel,
    output reg PCWriteSel,
    output reg EXMemEn,
    output reg controlNopSelMem
);

initial begin
    IF_WriteSel_ID = 1;
    PCWriteSel = 1;
    ControlNopSel = 0;
    EXMemEn = 1;
    controlNopSelMem = 0;
end

[MASKED]

endmodule