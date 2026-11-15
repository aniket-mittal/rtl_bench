module mg_04176 (rstCRC, CRCResult, CRCEn, CRC5_8BitIn, dataIn, ready, clk, rst);
input rstCRC; 
 input CRCEn; 
 input CRC5_8BitIn; 
 input [7:0] dataIn; 
 input clk; 
 input rst; 
 output [4:0] CRCResult; 
 output ready; 
 wire rstCRC; 
 wire CRCEn; 
 wire CRC5_8BitIn; 
 wire [7:0] dataIn; 
 wire clk; 
 wire rst; 
 reg [4:0] CRCResult; 
 reg ready; 
 reg doUpdateCRC; 
 reg [7:0] data; 
 reg [3:0] loopEnd; 
 reg [3:0] i; 
 [MASKED] 
 endmodule