module mg_10293(clk, rst, mfmIn, mfmEdge, skipMFMBit, currentRealBit, currentRealBitValid);
input clk; 
  input rst; 
  input mfmIn; 
  input mfmEdge; 
  input skipMFMBit; 
  output reg currentRealBit; 
  output reg currentRealBitValid; 
  reg [2:0] mfmTimer; 
  reg firstEdgeDetected; 
  reg currentMFMBitValid; 
  reg updateRealBit; 
  reg localSkipMFMBit; 
  reg skipOutputLoop; 
  reg [3:0] prevMFMBits; 
  always @(posedge clk) begin 
  if(rst) begin 
  mfmTimer <= 4'b0; 
  firstEdgeDetected <= 0; 
  currentMFMBitValid <= 0; 
  end else begin 
  currentMFMBitValid <= 0; 
  if(mfmEdge) begin 
  mfmTimer <= 4'b0; 
  firstEdgeDetected <= 1; 
  end else begin 
  if(firstEdgeDetected) begin 
  mfmTimer <= mfmTimer + 1'b1; 
  if(mfmTimer == 2) begin 
  currentMFMBitValid <= 1; 
  end 
  end 
  end 
  end 
  end 
  always @(posedge clk) begin 
  if(rst) begin 
  currentRealBit <= 0; 
  currentRealBitValid <= 0; 
  prevMFMBits <= 4'b0; 
  updateRealBit <= 0; 
  localSkipMFMBit <= 0; 
  skipOutputLoop <= 0; 
  end else begin 
  currentRealBitValid <= 0; 
  updateRealBit <= 0; 
  if(skipMFMBit) begin 
  localSkipMFMBit <= 1; 
  end 
  if(currentMFMBitValid) begin 
  prevMFMBits <= {prevMFMBits[2:0], mfmIn}; 
  updateRealBit <= updateRealBit + 1; 
  end 
  if(updateRealBit) begin 
  if(localSkipMFMBit) begin 
  localSkipMFMBit <= 0; 
  end else if(skipOutputLoop) begin 
  skipOutputLoop <= 0; 
  end else begin 
  skipOutputLoop <= 1; 
  casez (prevMFMBits) 
  4'b0100,4'bz010: begin 
  currentRealBit <= 0; 
  currentRealBitValid <= 1; 
  end 
  4'bzz01: begin 
  currentRealBit <= 1; 
  currentRealBitValid <= 1; 
  end 
  default: begin 
  ; 
  end 
  endcase 
  end 
  end 
  end 
  end 
 endmodule