module mg_03973(output sout,input [7:0] outbyte,input ld,input clk);
reg [7:0] register = 8'h00; 
  assign sout = register[7]; 
  [MASKED] 
 endmodule