module mg_00383 (input d,clk,en,output reg q);
initial q <= 1'b0; 
  always @* if (en) q <= d; 
 endmodule