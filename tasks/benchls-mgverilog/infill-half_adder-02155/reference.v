module mg_02155 ( DATA_A, DATA_B, SAVE, CARRY );
input DATA_A; 
 input DATA_B; 
 output SAVE; 
 output CARRY; 
  assign SAVE = DATA_A ^ DATA_B; 
  assign CARRY = DATA_A & DATA_B; 
 endmodule