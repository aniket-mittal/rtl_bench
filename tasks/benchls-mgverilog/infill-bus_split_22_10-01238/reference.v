module mg_01238 (input [31:0] i,output [21:0] o1,output [9:0] o0);
assign o1 = i[31:10]; 
  assign o0 = i[9:0]; 
 endmodule