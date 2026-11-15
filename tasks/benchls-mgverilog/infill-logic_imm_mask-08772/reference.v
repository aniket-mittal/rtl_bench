module mg_08772 (LogicImm, LowLogicImm, HighLogicImm,LowMaskSel_Top, HighMaskSel_Top, LowMaskSel_Bot, HighMaskSel_Bot);
input [5:0] LowMaskSel_Top, HighMaskSel_Top; 
  input [5:0] LowMaskSel_Bot, HighMaskSel_Bot; 
  output [63:0] LogicImm; 
  output [63:0] LowLogicImm, HighLogicImm; 
  wire [63:0] LowLogicImm, HighLogicImm; 
  genvar i; 
  generate 
  for (i=0;i<64;i=i+1) begin : MaskVal 
  if (i >= 32) begin 
  assign LowLogicImm[i] = (LowMaskSel_Top <= i[5:0]); 
  assign HighLogicImm[i] = (HighMaskSel_Top >= i[5:0]); 
  end 
  else begin 
  assign LowLogicImm[i] = (LowMaskSel_Bot <= i[5:0]); 
  assign HighLogicImm[i] = (HighMaskSel_Bot >= i[5:0]); 
  end 
  end 
  endgenerate 
  assign LogicImm = LowLogicImm & HighLogicImm; 
 endmodule