module mg_03071(input wire clk, input wire [31:0] in, output out);
logic [63:0] d; 
  [MASKED] 
  wire tmp0 = (|d[38:0]); 
  assign out = (d[39] | tmp0); 
 endmodule