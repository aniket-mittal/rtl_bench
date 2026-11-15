module origen_150187(
    input Clk,
    input MemtoReg, DontMove, jal, RegWrite, MemRead, MemWrite,
    input [31:0] ReadData, ALUResult, PCResult,
    input [4:0] WriteRegister,
    output reg MemtoReg_o, DontMove_o, jal_o, RegWrite_o, MemRead_o, MemWrite_o,
    output reg [31:0] ReadData_o, ALUResult_o, PCResult_o,
    output reg [4:0] WriteRegister_o
);

initial begin
    MemtoReg_o = 0;
    DontMove_o = 0;
    jal_o = 0;
    RegWrite_o = 0;
    MemRead_o = 0;
    MemWrite_o = 0;
    ReadData_o = 0;
    ALUResult_o = 0;
    PCResult_o = 0;
    WriteRegister_o = 0;
end

reg MemtoReg_r, DontMove_r, jal_r, RegWrite_r, MemRead_r, MemWrite_r;
reg [31:0] ReadData_r, ALUResult_r, PCResult_r;
reg [4:0] WriteRegister_r;

always @(posedge Clk) begin
    MemtoReg_r <= MemtoReg;
    DontMove_r <= DontMove;
    jal_r <= jal;
    RegWrite_r <= RegWrite;
    MemRead_r <= MemRead;
    MemWrite_r <= MemWrite;
    ReadData_r <= ReadData;
    ALUResult_r <= ALUResult;
    PCResult_r <= PCResult;
    WriteRegister_r <= WriteRegister;
end

always @(negedge Clk) begin
    MemtoReg_o <= MemtoReg_r;
    DontMove_o <= DontMove_r;
    jal_o <= jal_r;
    RegWrite_o <= RegWrite_r;
    MemRead_o <= MemRead_r;
    MemWrite_o <= MemWrite_r;
    ReadData_o <= ReadData_r;
    ALUResult_o <= ALUResult_r;
    PCResult_o <= PCResult_r;
    WriteRegister_o <= WriteRegister_r;
end

endmodule