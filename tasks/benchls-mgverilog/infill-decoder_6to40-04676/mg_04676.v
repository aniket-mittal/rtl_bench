module mg_04676(addr_in,en,out);
input[5:0] addr_in; 
 wire[5:0] addr_in; 
 output[39:0] out; 
 wire[39:0] out; 
 input en; 
 wire en; 
 reg[39:0] decoded_out; 
 [MASKED] 
 assign out = (en)?decoded_out:40'd0; 
 endmodule