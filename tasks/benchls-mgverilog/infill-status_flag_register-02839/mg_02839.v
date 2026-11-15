module mg_02839(input wire iCLOCK,input wire inRESET,input wire iRESET_SYNC,input wire iCTRL_HOLD,input wire iPFLAGR_VALID,input wire [4:0] iPFLAGR,input wire iPREV_INST_VALID,input wire iPREV_BUSY,input wire iPREV_FLAG_WRITE,input wire iSHIFT_VALID,input wire [4:0] iSHIFT_FLAG,input wire iADDER_VALID,input wire [4:0] iADDER_FLAG,input wire iMUL_VALID,input wire [4:0] iMUL_FLAG,input wire iLOGIC_VALID,input wire [4:0] iLOGIC_FLAG,output wire [4:0] oFLAG);
reg [4:0] b_sysreg_flags; 
  [MASKED] 
  assign oFLAG = b_sysreg_flags; 
 endmodule