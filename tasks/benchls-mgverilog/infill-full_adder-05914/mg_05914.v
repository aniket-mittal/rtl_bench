module mg_05914 (input A,input B,input CARRY_IN,output SUM,output CARRY_OUT);
assign SUM = (A ^ B) ^ CARRY_IN; 
  [MASKED] 
 endmodule