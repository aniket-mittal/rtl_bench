module mg_03195 (input clk,input rst_n,input [2:0] wci_MCmd,input [0:0] wci_MAddrSpace,input [3:0] wci_MByteEn,input [19:0] wci_MAddr,input [31:0] wci_MData,output reg [1:0] wci_SResp,output reg [31:0] wci_SData,input [1:0] wci_MFlag,output reg [1:0] wci_SFlag,output reg wci_SThreadBusy,input [2:0] wsi0_MCmd,input wsi0_MReqLast,input wsi0_MBurstPrecise,input [11:0] wsi0_MBurstLength,input [31:0] wsi0_MData,input [3:0] wsi0_MByteEn,input [7:0] wsi0_MReqInfo,output wsi0_SThreadBusy,output reg [2:0] wsi1_MCmd,output reg wsi1_MReqLast,output reg wsi1_MBurstPrecise,output reg [11:0] wsi1_MBurstLength,output reg [31:0] wsi1_MData,output reg [3:0] wsi1_MByteEn,output reg [7:0] wsi1_MReqInfo,input wsi1_SThreadBusy,output wsi_m_MReset_n,input wsi_m_SReset_n,input wsi_s_MReset_n,output wsi_s_SReset_n);
reg [31:0] biasValue; 
  reg [2:0] wci_ctlSt; 
  wire wci_cfg_write, wci_cfg_read, wci_ctl_op; 
  assign wci_cfg_write = (wci_MCmd==3'h1 && wci_MAddrSpace[0]==1'b1); 
  assign wci_cfg_read = (wci_MCmd==3'h2 && wci_MAddrSpace[0]==1'b1); 
  assign wci_ctl_op = (wci_MCmd==3'h2 && wci_MAddrSpace[0]==1'b0); 
  assign wsi_m_MReset_n = rst_n; 
  assign wsi_s_SReset_n = rst_n; 
  assign wsi0_SThreadBusy = (wsi1_SThreadBusy || (wci_ctlSt!=2'h2)); 
  always@(posedge clk) 
  begin 
  if (wci_ctlSt == 2'h2) begin 
  wsi1_MData = wsi0_MData + biasValue; 
  wsi1_MCmd = wsi0_MCmd; 
  end else begin 
  wsi1_MData = 0; 
  wsi1_MCmd = 3'h0; 
  end 
  wsi1_MReqLast = wsi0_MReqLast; 
  wsi1_MBurstPrecise = wsi0_MBurstPrecise; 
  wsi1_MBurstLength = wsi0_MBurstLength; 
  wsi1_MByteEn = wsi0_MByteEn; 
  wsi1_MReqInfo = wsi0_MReqInfo; 
  wci_SThreadBusy = 1'b0; 
  wci_SResp = 2'b0; 
  if (rst_n==1'b0) begin 
  wci_ctlSt = 3'h0; 
  wci_SResp = 2'h0; 
  wci_SFlag = 2'h0; 
  wci_SThreadBusy = 2'b1; 
  biasValue = 32'h0000_0000; 
  end else begin 
  if (wci_cfg_write==1'b1) begin 
  biasValue = wci_MData; 
  wci_SResp = 2'h1; 
  end 
  if (wci_cfg_read==1'b1) begin 
  wci_SData = biasValue; 
  wci_SResp = 2'h1; 
  end 
  if (wci_ctl_op==1'b1) begin 
  case (wci_MAddr[4:2]) 
  2'h0 : wci_ctlSt = 3'h1; 
  2'h1 : wci_ctlSt = 3'h2; 
  2'h2 : wci_ctlSt = 3'h3; 
  2'h3 : wci_ctlSt = 3'h0; 
  endcase 
  wci_SData = 32'hC0DE_4201; 
  wci_SResp = 2'h1; 
  end 
  end 
  end 
 endmodule