module mg_04727(input wire clk, input wire reset, input wire in, output wire p);
reg [1:0] x; 
  reg [1:0] init = 0; 
  [MASKED] 
  assign p = (&init) & x[0] & !x[1]; 
 endmodule