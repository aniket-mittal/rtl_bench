module mg_07224(IDEXMemRead,IDEXRt,IFIDRs,IFIDRt,PCWrite,IFIDWrite,ctrlSetZero,IDEXRd,IDEXRegWrite,opcode,EXMEMRead,EXMEMRt,clk);
input[4:0] IDEXRt,IFIDRt,IFIDRs,IDEXRd,EXMEMRt; 
  input IDEXMemRead,IDEXRegWrite,EXMEMRead; 
  input[5:0] opcode; 
  input clk; 
  output PCWrite,IFIDWrite,ctrlSetZero; 
  reg PCWrite,IFIDWrite,ctrlSetZero; 
  initial 
  begin 
  PCWrite<=1; 
  IFIDWrite<=1; 
  ctrlSetZero<=0; 
  end 
  [MASKED] 
 endmodule