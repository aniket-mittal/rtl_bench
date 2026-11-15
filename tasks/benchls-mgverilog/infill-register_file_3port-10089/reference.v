module mg_10089 (clk, regA, regB, regTEST, regW, Wdat, RegWrite, Adat, Bdat, TESTdat);
input clk,RegWrite; 
  input [4:0] regTEST, regA, regB, regW; 
  input [31:0] Wdat; 
  output wire [31:0] Adat, Bdat, TESTdat; 
  reg [31:0] regfile [0:31]; 
  assign Adat=regfile[regA]; 
  assign Bdat=regfile[regB]; 
  assign TESTdat=regfile[regTEST]; 
  always @(posedge clk) begin 
  if(RegWrite) regfile[regW]=(regW==0)?0:Wdat; 
  end 
 endmodule