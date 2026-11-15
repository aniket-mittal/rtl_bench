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

always @(*) begin
    if (OpCode == 6'b000100 || // BEQ
        OpCode == 6'b000001 || // BGEZBLTZ
        OpCode == 6'b000111 || // BGTZ
        OpCode == 6'b000110 || // BLEZ
        OpCode == 6'b000101) begin // BNE
        if ((ID_RegRS == EX_RegRD || ID_RegRT == EX_RegRD) && EX_RegW) begin
            IF_WriteSel_ID = 0;
            PCWriteSel = 0;
            ControlNopSel = 1;
        end
        else if (EX_MemRead && (ID_RegRS == EX_RegRD || ID_RegRT == EX_RegRD)) begin
            IF_WriteSel_ID = 0;
            PCWriteSel = 0;
            ControlNopSel = 1;
        end
        else if (M_MemRead && (ID_RegRS == M_RegRD || ID_RegRT == M_RegRD)) begin
            IF_WriteSel_ID = 0;
            PCWriteSel = 0;
            ControlNopSel = 1;
        end
    end
end

endmodule