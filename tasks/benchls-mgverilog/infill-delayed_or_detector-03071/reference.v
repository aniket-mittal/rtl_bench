module mg_03071(input wire clk, input wire [31:0] in, output out);
logic [63:0] d; 
  always_ff @(posedge clk) 
  d <= {d[31:0], in[0] ? in : 32'b0}; 
  wire tmp0 = (|d[38:0]); 
  assign out = (d[39] | tmp0); 
 endmodule