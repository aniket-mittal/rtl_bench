module mg_04071(input rst_n,input clk,input clken,input j,input se0,output sync);
reg[6:0] data; 
 assign sync = (data == 7'b0101010 && !j && !se0); 
 [MASKED] 
 endmodule