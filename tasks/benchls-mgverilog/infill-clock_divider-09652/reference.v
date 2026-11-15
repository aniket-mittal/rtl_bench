module mg_09652(input wire clk_in, output wire clk_out);
parameter M = 104; 
 localparam N = $clog2(M); 
 reg [N-1:0] divcounter = 0; 
 always @(posedge clk_in) 
  divcounter <= (divcounter == M - 1) ? 0 : divcounter + 1; 
 assign clk_out = divcounter[N-1]; 
 endmodule