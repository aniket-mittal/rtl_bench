module mg_09365(input wire clk,output wire [8:0] cnt);
reg [8:0] contador = 9'b0; 
  assign cnt = contador; 
  always @(negedge clk) 
  contador <= (contador==9'h19f)? 9'b0 : contador+1; 
 endmodule