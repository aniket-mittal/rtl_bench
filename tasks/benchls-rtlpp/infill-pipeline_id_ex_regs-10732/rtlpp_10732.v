module rtlpp_10732(
    input  clock,
    input  reset,
    input  ID_Flush,
    input  ID_Stall,
    input  EX_Stall,
    
    input  ID_Link,
    input  ID_RegDst,
    input  ID_ALUSrcImm,
    input  [4:0] ID_ALUOp,
    input  ID_Movn,
    input  ID_Movz,
    input  ID_LLSC,
    input  ID_MemRead,
    input  ID_MemWrite,
    input  ID_MemByte,
    input  ID_MemHalf,
    input  ID_MemSignExtend,
    input  ID_Left,
    input  ID_Right,
    input  ID_RegWrite,
    input  ID_MemtoReg,
    input  ID_ReverseEndian,
    
    input  [4:0] ID_Rs,
    input  [4:0] ID_Rt,
    input  ID_WantRsByEX,
    input  ID_NeedRsByEX,
    input  ID_WantRtByEX,
    input  ID_NeedRtByEX,
    
    input  ID_KernelMode,
    input  [31:0] ID_RestartPC,
    input  ID_IsBDS,
    input  ID_Trap,
    input  ID_TrapCond,
    input  ID_EX_CanErr,
    input  ID_M_CanErr,
    
    input  [31:0] ID_ReadData1,
    input  [31:0] ID_ReadData2,
    input  [16:0] ID_SignExtImm, 
    
    output reg EX_Link,
    output [1:0] EX_LinkRegDst,
    output reg EX_ALUSrcImm,
    output reg [4:0] EX_ALUOp,
    output reg EX_Movn,
    output reg EX_Movz,
    output reg EX_LLSC,
    output reg EX_MemRead,
    output reg EX_MemWrite,
    output reg EX_MemByte,
    output reg EX_MemHalf,
    output reg EX_MemSignExtend,
    output reg EX_Left,
    output reg EX_Right,
    output reg EX_RegWrite,
    output reg EX_MemtoReg,
    output reg EX_ReverseEndian,
    output reg [4:0]  EX_Rs,
    output reg [4:0]  EX_Rt,
    output reg EX_WantRsByEX,
    output reg EX_NeedRsByEX,
    output reg EX_WantRtByEX,
    output reg EX_NeedRtByEX,
    output reg EX_KernelMode,
    output reg [31:0] EX_RestartPC,
    output reg EX_IsBDS,
    output reg EX_Trap,
    output reg EX_TrapCond,
    output reg EX_EX_CanErr,
    output reg EX_M_CanErr,
    output reg [31:0] EX_ReadData1,
    output reg [31:0] EX_ReadData2,
    output [31:0] EX_SignExtImm,
    output [4:0]      EX_Rd,
    output [4:0]      EX_Shamt
    );

    reg [16:0] EX_SignExtImm_pre;
    reg EX_RegDst;
    assign EX_LinkRegDst = (EX_Link) ? 2'b10 : ((EX_RegDst) ? 2'b01 : 2'b00);   
    assign EX_Rd = EX_SignExtImm[15:11];
    assign EX_Shamt = EX_SignExtImm[10:6];
    assign EX_SignExtImm = (EX_SignExtImm_pre[16]) ? {15'h7fff, EX_SignExtImm_pre[16:0]} : {15'h0000, EX_SignExtImm_pre[16:0]};
    
    [MASKED]

endmodule