module mg_09652(input wire clk_in, output wire clk_out);
parameter M = 104; 
 localparam N = $clog2(M); 
 reg [N-1:0] divcounter = 0; 
 [MASKED] 
 assign clk_out = divcounter[N-1]; 
 endmodule