module mg_01278 (output o,input a,input b,input c,input d,input e);
parameter [31:0] INIT = 32'h0; 
  parameter EQN = "(A)"; 
  assign o = INIT >> {e, d, c, b, a}; 
 endmodule