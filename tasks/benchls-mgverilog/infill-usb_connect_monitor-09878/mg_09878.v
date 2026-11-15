module mg_09878(connectStateIn, connectStateOut, resumeDetectedIn, resetEventOut, resumeIntOut, clk, rst);
input [1:0] connectStateIn; 
 input resumeDetectedIn; 
 input clk; 
 input rst; 
 output resetEventOut; 
 output [1:0] connectStateOut; 
 output resumeIntOut; 
 wire [1:0] connectStateIn; 
 wire resumeDetectedIn; 
 reg resetEventOut; 
 reg [1:0] connectStateOut; 
 reg resumeIntOut; 
 wire clk; 
 wire rst; 
 reg [1:0]oldConnectState; 
 reg oldResumeDetected; 
 always @(connectStateIn) 
 begin 
  connectStateOut <= connectStateIn; 
 end 
 [MASKED] 
 endmodule