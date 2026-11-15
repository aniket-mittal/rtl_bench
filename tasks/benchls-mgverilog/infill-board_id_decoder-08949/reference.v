module mg_08949(clk,swIn,enable,tuningCode,boardOut);
input clk; 
  reg [3:0] clkCnt; 
  reg [3:0] clkCntAddr; 
  input [5:0] swIn; 
  reg [5:0] swInPrevious; 
  reg [5:0] swInStable; 
  reg [6:0] addr; 
  input enable; 
  input [6:0] tuningCode; 
  output [3:0] boardOut; 
  reg [3:0] boardState; 
  parameter numIDsPerBoard=4; 
  parameter waitBit=2; 
  parameter ADDR_WAIT=4'b1111; 
  initial begin 
  #0; 
  clkCnt = 3'b0; 
  boardState = 4'b0; 
  addr=7'b0000001; 
  end 
  always @(posedge clk) begin 
  if (enable==1'b1) clkCnt=clkCnt+3'b1; 
  else clkCnt=3'b0; 
  if(clkCnt[waitBit]==1'b1 && enable==1'b1) begin 
  boardState = {tuningCode>=(addr+7'b11), 
  tuningCode>=(addr+7'b10), 
  tuningCode>=(addr+7'b01), 
  tuningCode>=(addr+7'b00)}; 
  clkCnt = 3'b0; 
  end 
  end 
  always @(posedge clk) begin 
  if(swInPrevious != swIn) begin 
  swInPrevious=swIn; 
  clkCntAddr=1'b0; 
  end else if(swInPrevious == swIn && clkCntAddr < ADDR_WAIT) begin 
  clkCntAddr=clkCntAddr+1'b1; 
  end else begin 
  swInStable=swInPrevious; 
  end 
  addr=((~swInStable) - 1'b1)*numIDsPerBoard+1'b1; 
  end 
  assign boardOut=boardState; 
  endmodule