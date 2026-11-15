module mg_08261(clk, sclkPosEdge, instr, cs, dc, delayEn, parallelData);
input clk, sclkPosEdge; 
 input[9:0] instr; 
 output reg cs, dc, delayEn; 
 output[7:0] parallelData; 
 wire[1:0] code; 
 assign code = instr[9:8]; 
 assign parallelData = instr[7:0]; 
 always @( * ) begin 
  if (code == 2'b00) begin 
  ; 
  cs = 0; 
  dc = 1; 
  delayEn = 0; 
  end 
  if (code == 2'b01) begin 
  ; 
  cs = 0; 
  dc = 0; 
  delayEn = 0; 
  end 
  if (code == 2'b10) begin 
  ; 
  cs = 1; 
  delayEn = 1; 
  end 
 end 
 endmodule