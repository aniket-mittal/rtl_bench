module mg_06203 (input clock, input reset, input clear, input enable_in, output reg enable_out,input signed [30:0] addend, output reg signed [33:0] sum );
[MASKED] 
  always @(posedge clock) 
  enable_out <= #1 enable_in; 
 endmodule