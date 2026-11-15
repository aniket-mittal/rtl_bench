module mg_02884(input wire clk_in, output wire clk_out);
parameter M = 12; 
 localparam N = $clog2(M); 
 reg [N-1:0] divcounter = 0; 
 always @(posedge clk_in) 
  if (divcounter == M - 1) 
  divcounter <= 0; 
  else 
  divcounter <= divcounter + 1; 
 assign clk_out = divcounter[N-1]; 
 endmodule