module mg_06766 (input d,clk,en,output reg q);
always @* if (!en) q <= d; 
 endmodule