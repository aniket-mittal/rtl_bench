module mg_02124(clk,rst_n,p_mosi,p_miso,p_valid,sha_reset_n,sha_init,sha_next,sha_mode,sha_block,sha_digest);
input clk; 
  input rst_n; 
  input [255:0] p_mosi; 
  output [255:0] p_miso; 
  input p_valid; 
  output sha_reset_n; 
  output sha_init; 
  output sha_next; 
  output sha_mode; 
  output [511:0] sha_block; 
  input [255:0] sha_digest; 
  reg [1:0] pValidPrev; 
  assign p_miso = sha_digest; 
  assign sha_reset_n = !(p_valid && !pValidPrev[0]); 
  assign sha_init = (pValidPrev[0] && !pValidPrev[1]); 
  assign sha_next = 'b0; 
  assign sha_mode = 'b1; 
  assign sha_block = {p_mosi, 1'b1, 255'h100}; 
  [MASKED] 
 endmodule