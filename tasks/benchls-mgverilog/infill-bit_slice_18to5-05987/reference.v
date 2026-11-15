module mg_05987 (Din,Dout);
input [17:0]Din; 
  output [4:0]Dout; 
  wire [17:0]Din; 
  assign Dout[4:0] = Din[12:8]; 
 endmodule