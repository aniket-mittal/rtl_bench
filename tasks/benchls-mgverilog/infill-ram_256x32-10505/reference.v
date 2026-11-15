module mg_10505(output [31:0] RD,input [31:0] A, WD,input WE, clk);
reg [31:0] RAM [0:255]; 
  assign RD = (A != 0) ? RAM[A[7:0]] : 0; 
  always @ (posedge clk) 
  if (WE) 
  RAM[A[7:0]] <= WD; 
 endmodule