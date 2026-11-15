module mg_04101(o, i);
output [1:28] o; 
 input [1:28] i; 
 assign o={i[2:28],i[1]}; 
 endmodule