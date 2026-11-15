module mg_07027(Address, Din, Clock, Reset, WriteEnabled, Dout);
input [5:0] Address; 
  input [6:0] Din; 
  input Reset; 
  input Clock, WriteEnabled; 
  output [6:0] Dout; 
  reg [6:0] Data [39:0]; 
  [MASKED] 
  assign Dout = Data[Address]; 
 endmodule