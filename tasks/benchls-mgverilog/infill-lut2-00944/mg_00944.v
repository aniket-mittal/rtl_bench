module mg_00944 (output o,input a,input b);
parameter [3:0] INIT = 4'h0; 
  parameter EQN = "(A)"; 
  wire [1:0] s1 = b ? INIT[ 3:2] : INIT[1:0]; 
  [MASKED] 
 endmodule