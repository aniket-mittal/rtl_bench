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
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            EX_Link           <= 1'b0;
            EX_RegDst         <= 1'b0;
            EX_ALUSrcImm      <= 1'b0;
            EX_ALUOp          <= 5'b0;
            EX_Movn           <= 1'b0;
            EX_Movz           <= 1'b0;
            EX_LLSC           <= 1'b0;
            EX_MemRead        <= 1'b0;
            EX_MemWrite       <= 1'b0;
            EX_MemByte        <= 1'b0;
            EX_MemHalf        <= 1'b0;
            EX_MemSignExtend  <= 1'b0;
            EX_Left           <= 1'b0;
            EX_Right          <= 1'b0;
            EX_RegWrite       <= 1'b0;
            EX_MemtoReg       <= 1'b0;
            EX_ReverseEndian  <= 1'b0;
            EX_RestartPC      <= 32'b0;
            EX_IsBDS          <= 1'b0;
            EX_Trap           <= 1'b0;
            EX_TrapCond       <= 1'b0;
            EX_EX_CanErr      <= 1'b0;
            EX_M_CanErr       <= 1'b0;
            EX_ReadData1      <= 32'b0;
            EX_ReadData2      <= 32'b0;
            EX_SignExtImm_pre <= 17'b0;
            EX_Rs             <= 5'b0;
            EX_Rt             <= 5'b0;
            EX_WantRsByEX     <= 1'b0;
            EX_NeedRsByEX     <= 1'b0;
            EX_WantRtByEX     <= 1'b0;
            EX_NeedRtByEX     <= 1'b0;
            EX_KernelMode     <= 1'b0;
        end
        else if (EX_Stall) begin
            EX_Link           <= EX_Link;
            EX_RegDst         <= EX_RegDst;
            EX_ALUSrcImm      <= EX_ALUSrcImm;
            EX_ALUOp          <= EX_ALUOp;
            EX_Movn           <= EX_Movn;
            EX_Movz           <= EX_Movz;
            EX_LLSC           <= EX_LLSC;
            EX_MemRead        <= EX_MemRead;
            EX_MemWrite       <= EX_MemWrite;
            EX_MemByte        <= EX_MemByte;
            EX_MemHalf        <= EX_MemHalf;
            EX_MemSignExtend  <= EX_MemSignExtend;
            EX_Left           <= EX_Left;
            EX_Right          <= EX_Right;
            EX_RegWrite       <= EX_RegWrite;
            EX_MemtoReg       <= EX_MemtoReg;
            EX_ReverseEndian  <= EX_ReverseEndian;
            EX_RestartPC      <= EX_RestartPC;
            EX_IsBDS          <= EX_IsBDS;
            EX_Trap           <= EX_Trap;
            EX_TrapCond       <= EX_TrapCond;
            EX_EX_CanErr      <= EX_EX_CanErr;
            EX_M_CanErr       <= EX_M_CanErr;
            EX_ReadData1      <= EX_ReadData1;
            EX_ReadData2      <= EX_ReadData2;
            EX_SignExtImm_pre <= EX_SignExtImm_pre;
            EX_Rs             <= EX_Rs;
            EX_Rt             <= EX_Rt;
            EX_WantRsByEX     <= EX_WantRsByEX;
            EX_NeedRsByEX     <= EX_NeedRsByEX;
            EX_WantRtByEX     <= EX_WantRtByEX;
            EX_NeedRtByEX     <= EX_NeedRtByEX;
            EX_KernelMode     <= EX_KernelMode;
        end
        else begin
            EX_Link           <= ID_Link;
            EX_RegDst         <= ID_RegDst;
            EX_ALUSrcImm      <= ID_ALUSrcImm;
            EX_ALUOp          <= (ID_Stall | ID_Flush) ? 5'b0 : ID_ALUOp;
            EX_Movn           <= ID_Movn;
            EX_Movz           <= ID_Movz;
            EX_LLSC           <= ID_LLSC;
            EX_MemRead        <= (ID_Stall | ID_Flush) ? 1'b0 : ID_MemRead;
            EX_MemWrite       <= (ID_Stall | ID_Flush) ? 1'b0 : ID_MemWrite;
            EX_MemByte        <= ID_MemByte;
            EX_MemHalf        <= ID_MemHalf;
            EX_MemSignExtend  <= ID_MemSignExtend;
            EX_Left           <= ID_Left;
            EX_Right          <= ID_Right;
            EX_RegWrite       <= (ID_Stall | ID_Flush) ? 1'b0 : ID_RegWrite;
            EX_MemtoReg       <= ID_MemtoReg;
            EX_ReverseEndian  <= ID_ReverseEndian;
            EX_RestartPC      <= ID_RestartPC;
            EX_IsBDS          <= ID_IsBDS;
            EX_Trap           <= (ID_Stall | ID_Flush) ? 1'b0 : ID_Trap;
            EX_TrapCond       <= ID_TrapCond;
            EX_EX_CanErr      <= (ID_Stall | ID_Flush) ? 1'b0 : ID_EX_CanErr;
            EX_M_CanErr       <= (ID_Stall | ID_Flush) ? 1'b0 : ID_M_CanErr;
            EX_ReadData1      <= ID_ReadData1;
            EX_ReadData2      <= ID_ReadData2;
            EX_SignExtImm_pre <= ID_SignExtImm;
            EX_Rs             <= ID_Rs;
            EX_Rt             <= ID_Rt;
            EX_WantRsByEX     <= (ID_Stall | ID_Flush) ? 1'b0 : ID_WantRsByEX;
            EX_NeedRsByEX     <= (ID_Stall | ID_Flush) ? 1'b0 : ID_NeedRsByEX;
            EX_WantRtByEX     <= (ID_Stall | ID_Flush) ? 1'b0 : ID_WantRtByEX;
            EX_NeedRtByEX     <= (ID_Stall | ID_Flush) ? 1'b0 : ID_NeedRtByEX;
            EX_KernelMode     <= ID_KernelMode;
        end
    end

endmodule