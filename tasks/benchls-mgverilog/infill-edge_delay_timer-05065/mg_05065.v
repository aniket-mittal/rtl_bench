module mg_05065(clk, sigIn, waitCnt, sharedBit, sigOut);
parameter WAIT_CNT_SIZE=11; 
 input clk, sigIn; 
 input [WAIT_CNT_SIZE-1:0] waitCnt; 
 input sharedBit; 
 output sigOut; 
 reg sigInPosEdge, sigInPosEdgeLast; 
 reg [WAIT_CNT_SIZE-1:0] posEdgeDelayTimer; 
 reg sigOutReg; 
 initial begin 
  #0 
  sigOutReg=1'b0; 
  posEdgeDelayTimer=1'b0; 
  sigInPosEdge=1'b0; 
  sigInPosEdgeLast=1'b0; 
 end 
 always @(posedge sigIn) begin 
  sigInPosEdge=~sigInPosEdge; 
 end 
 [MASKED] 
 assign sigOut=sigOutReg; 
 endmodule