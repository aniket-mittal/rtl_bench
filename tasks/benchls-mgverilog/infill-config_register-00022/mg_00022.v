module mg_00022(RegOut,CA_reg_set,RegInit,Reset,Clk,CWR_pulse,CCSB,CA_reg,CD_in_reg);
output[15:0] RegOut; 
 input[6:0] CA_reg_set; 
 input[15:0] RegInit; 
 input Reset; 
 input Clk; 
 input CWR_pulse; 
 input CCSB; 
 input[7:0] CA_reg; 
 input[15:0] CD_in_reg; 
 reg[15:0] RegOut; 
 [MASKED] 
 endmodule