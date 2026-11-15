module mg_02884(input wire clk_in, output wire clk_out);
parameter M = 12; 
 localparam N = $clog2(M); 
 reg [N-1:0] divcounter = 0; 
 [MASKED] 
 assign clk_out = divcounter[N-1]; 
 endmodule