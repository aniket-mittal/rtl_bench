module mg_07040(input wire iCLOCK,input wire inRESET,input wire iRESET_SYNC,input wire [31:0] iSYSREG_IDTR,input wire iRD_START,input wire [6:0] iRD_IRQ_NUM,output wire oRD_FINISH,output wire [31:0] oRD_HUNDLER,output wire oLDST_USE,output wire oLDST_REQ,input wire iLDST_BUSY,output wire [1:0] oLDST_ORDER,output wire oLDST_RW,output wire [13:0] oLDST_ASID,output wire [1:0] oLDST_MMUMOD,output wire [31:0] oLDST_PDT,output wire [31:0] oLDST_ADDR,output wire [31:0] oLDST_DATA,input wire iLDST_REQ,input wire [31:0] iLDST_DATA);
localparam L_PARAM_INTHUNDLE_STT_IDLE = 1'b0; 
  localparam L_PARAM_INTHUNDLE_STT_LOAD = 1'b1; 
  reg b_inthundl_read_state; 
  reg b_inthundl_read; 
  reg b_inthundl_readend; 
  reg [31:0] b_inthundl_idt_data; 
  wire [31:0] inthundle_read_addr = iSYSREG_IDTR + {iRD_IRQ_NUM, 3'h0} + 32'h4; 
  [MASKED] 
  assign oRD_FINISH = b_inthundl_readend; 
  assign oRD_HUNDLER = b_inthundl_idt_data; 
  assign oLDST_USE = b_inthundl_read_state == L_PARAM_INTHUNDLE_STT_LOAD; 
  assign oLDST_REQ = b_inthundl_read; 
  assign oLDST_ORDER = 2'h2; 
  assign oLDST_RW = 1'b0; 
  assign oLDST_ASID = 14'h0; 
  assign oLDST_MMUMOD = 2'h0; 
  assign oLDST_PDT = 32'h0; 
  assign oLDST_ADDR = inthundle_read_addr; 
  assign oLDST_DATA = 32'h0; 
 endmodule