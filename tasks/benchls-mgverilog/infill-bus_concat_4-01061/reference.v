module mg_01061 (input i3,input i2,input i1,input i0,output [3:0] o);
assign o = {i3, i2, i1, i0}; 
 endmodule