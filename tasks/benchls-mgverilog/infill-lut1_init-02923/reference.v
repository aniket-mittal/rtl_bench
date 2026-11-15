module mg_02923 (output o,input a);
parameter [1:0] INIT = 2'h0; 
  parameter EQN = "(A)"; 
  assign o = a ? INIT[1] : INIT[0]; 
 endmodule