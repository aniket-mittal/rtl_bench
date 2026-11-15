module rtlpp_02637(
    input  [7:0] DP_Hazards,
    input  [4:0] ID_Rs,
    input  [4:0] ID_Rt,
    input  [4:0] EX_Rs,
    input  [4:0] EX_Rt,
    input  [4:0] EX_RtRd,
    input  [4:0] MEM_RtRd,
    input  [4:0] WB_RtRd,
    input  EX_Link,
    input  EX_RegWrite,
    input  MEM_RegWrite,
    input  WB_RegWrite,
    input  MEM_MemRead,
    input  MEM_MemWrite,        
    input  InstMem_Read,
    input  InstMem_Ready,
    input  Mfc0,                
    input  IF_Exception_Stall,
    input  ID_Exception_Stall,
    input  EX_Exception_Stall,
    input  EX_ALU_Stall,
    input  M_Stall_Controller,  
    output IF_Stall,
    output ID_Stall,
    output EX_Stall,
    output M_Stall,
    output WB_Stall,
    output [1:0] ID_RsFwdSel,
    output [1:0] ID_RtFwdSel,
    output [1:0] EX_RsFwdSel,
    output [1:0] EX_RtFwdSel,
    output M_WriteDataFwdSel
    );

    wire WantRsByID, NeedRsByID, WantRtByID, NeedRtByID, WantRsByEX, NeedRsByEX, WantRtByEX, NeedRtByEX;
    assign WantRsByID = DP_Hazards[7];
    assign NeedRsByID = DP_Hazards[6];
    assign WantRtByID = DP_Hazards[5];
    assign NeedRtByID = DP_Hazards[4];
    assign WantRsByEX = DP_Hazards[3];
    assign NeedRsByEX = DP_Hazards[2];
    assign WantRtByEX = DP_Hazards[1];
    assign NeedRtByEX = DP_Hazards[0];

    wire [4:0] MEM_Rt = MEM_RtRd;

    wire EX_RtRd_NZ  = (EX_RtRd  != 5'b00000);
    wire MEM_RtRd_NZ = (MEM_RtRd != 5'b00000);
    wire WB_RtRd_NZ  = (WB_RtRd  != 5'b00000);

    wire Rs_IDEX_Match  = (ID_Rs == EX_RtRd)  & EX_RtRd_NZ  & (WantRsByID | NeedRsByID) & EX_RegWrite;
    wire Rt_IDEX_Match  = (ID_Rt == EX_RtRd)  & EX_RtRd_NZ  & (WantRtByID | NeedRtByID) & EX_RegWrite;
    wire Rs_IDMEM_Match = (ID_Rs == MEM_RtRd) & MEM_RtRd_NZ & (WantRsByID | NeedRsByID) & MEM_RegWrite;
    wire Rt_IDMEM_Match = (ID_Rt == MEM_RtRd) & MEM_RtRd_NZ & (WantRtByID | NeedRtByID) & MEM_RegWrite;
    wire Rs_IDWB_Match  = (ID_Rs == WB_RtRd)  & WB_RtRd_NZ  & (WantRsByID | NeedRsByID) & WB_RegWrite;
    wire Rt_IDWB_Match  = (ID_Rt == WB_RtRd)  & WB_RtRd_NZ  & (WantRtByID | NeedRtByID) & WB_RegWrite;

    wire Rs_EXMEM_Match = (EX_Rs == MEM_RtRd) & MEM_RtRd_NZ & (WantRsByEX | NeedRsByEX) & MEM_RegWrite;
    wire Rt_EXMEM_Match = (EX_Rt == MEM_RtRd) & MEM_RtRd_NZ & (WantRtByEX | NeedRtByEX) & MEM_RegWrite;
    wire Rs_EXWB_Match  = (EX_Rs == WB_RtRd)  & WB_RtRd_NZ  & (WantRsByEX | NeedRsByEX) & WB_RegWrite;
    wire Rt_EXWB_Match  = (EX_Rt == WB_RtRd)  & WB_RtRd_NZ  & (WantRtByEX | NeedRtByEX) & WB_RegWrite;

    wire Rt_MEMWB_Match = (MEM_Rt == WB_RtRd) & WB_RtRd_NZ  & WB_RegWrite;

    wire ID_Stall_1 = (Rs_IDEX_Match  &  NeedRsByID);
    wire ID_Stall_2 = (Rt_IDEX_Match  &  NeedRtByID);

    wire ID_Stall_3 = (Rs_IDMEM_Match &  (MEM_MemRead | MEM_MemWrite) & NeedRsByID);
    wire ID_Stall_4 = (Rt_IDMEM_Match &  (MEM_MemRead | MEM_MemWrite) & NeedRtByID);

    wire ID_Fwd_1   = (Rs_IDMEM_Match & ~(MEM_MemRead | MEM_MemWrite));
    wire ID_Fwd_2   = (Rt_IDMEM_Match & ~(MEM_MemRead | MEM_MemWrite));
    wire ID_Fwd_3   = (Rs_IDWB_Match);
    wire ID_Fwd_4   = (Rt_IDWB_Match);

    wire EX_Stall_1 = (Rs_EXMEM_Match &  (MEM_MemRead | MEM_MemWrite) & NeedRsByEX);
    wire EX_Stall_2 = (Rt_EXMEM_Match &  (MEM_MemRead | MEM_MemWrite) & NeedRtByEX);

    wire EX_Fwd_1   = (Rs_EXMEM_Match & ~(MEM_MemRead | MEM_MemWrite));
    wire EX_Fwd_2   = (Rt_EXMEM_Match & ~(MEM_MemRead | MEM_MemWrite));
    wire EX_Fwd_3   = (Rs_EXWB_Match);
    wire EX_Fwd_4   = (Rt_EXWB_Match);

    wire MEM_Fwd_1  = (Rt_MEMWB_Match);

    assign WB_Stall = M_Stall;
    assign M_Stall = IF_Stall | M_Stall_Controller;
    assign EX_Stall = (EX_Stall_1 | EX_Stall_2 | EX_Exception_Stall) | EX_ALU_Stall | M_Stall;
    assign ID_Stall = (ID_Stall_1 | ID_Stall_2 | ID_Stall_3 | ID_Stall_4 | ID_Exception_Stall) | EX_Stall;
    assign IF_Stall = InstMem_Read | InstMem_Ready | IF_Exception_Stall;

    assign ID_RsFwdSel = (ID_Fwd_1) ? 2'b01 : ((ID_Fwd_3) ? 2'b10 : 2'b00);
    assign ID_RtFwdSel = (Mfc0) ? 2'b11 : ((ID_Fwd_2) ? 2'b01 : ((ID_Fwd_4) ? 2'b10 : 2'b00));
    assign EX_RsFwdSel = (EX_Link) ? 2'b11 : ((EX_Fwd_1) ? 2'b01 : ((EX_Fwd_3) ? 2'b10 : 2'b00));
    assign EX_RtFwdSel = (EX_Link)  ? 2'b11 : ((EX_Fwd_2) ? 2'b01 : ((EX_Fwd_4) ? 2'b10 : 2'b00));
    assign M_WriteDataFwdSel = MEM_Fwd_1;

endmodule