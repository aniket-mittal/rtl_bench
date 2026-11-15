module mg_03579(input [31:0] I_dataA,input [31:0] I_dataB,input [2:0] I_branchOp,input I_Cin,output reg O_doBranch);
always @* begin 
  case (I_branchOp) 
  0: O_doBranch = (I_dataA == I_dataB); 
  1: O_doBranch = (I_dataA != I_dataB); 
  2: O_doBranch = (I_dataA > I_dataB); 
  3: O_doBranch = (I_dataA >= I_dataB); 
  4: O_doBranch = ($signed(I_dataA) > $signed(I_dataB)); 
  5: O_doBranch = ($signed(I_dataA) >= $signed(I_dataB)); 
  6: O_doBranch = I_Cin; 
  7: O_doBranch = 1; 
  endcase 
 end 
 endmodule