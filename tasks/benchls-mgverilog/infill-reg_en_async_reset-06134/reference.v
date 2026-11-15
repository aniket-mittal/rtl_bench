module mg_06134(nrst, clk, en, din, regout);
parameter bits = 1; 
  input nrst; 
  input clk; 
  input en; 
  input [bits-1:0] din; 
  output reg [bits-1:0] regout; 
  always @(posedge clk or negedge nrst) begin 
  if (~nrst) begin 
  regout <= 0; 
  end else if (en) begin 
  regout <= din; 
  end 
  end 
 endmodule