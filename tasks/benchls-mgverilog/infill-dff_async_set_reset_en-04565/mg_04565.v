module mg_04565(clk, D, S, R, E, Q);
input wire clk; 
  (* SETUP="clk 10e-12" *) (* NO_COMB *) 
  input wire D; 
  (* SETUP="clk 10e-12" *) (* NO_COMB *) 
  input wire E; 
  (* SETUP="clk 10e-12" *) (* NO_COMB *) 
  input wire S; 
  (* SETUP="clk 10e-12" *) (* NO_COMB *) 
  input wire R; 
  (* CLK_TO_Q = "clk 10e-12" *) 
  output reg Q; 
  [MASKED] 
 endmodule