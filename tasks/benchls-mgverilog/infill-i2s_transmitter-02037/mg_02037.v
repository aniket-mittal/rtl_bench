module mg_02037 (clk_i,rst_i,pcm_data_i,pcm_fifo_empty_i,pcm_fifo_rd_o,pcm_fifo_ur_o,bclk_o,ws_o,data_o);
parameter CLK_DIVISOR = 6; 
 input clk_i ; 
 input rst_i ; 
 input[31:0] pcm_data_i ; 
 input pcm_fifo_empty_i ; 
 output pcm_fifo_rd_o ; 
 output pcm_fifo_ur_o ; 
 output bclk_o ; 
 output ws_o ; 
 output data_o ; 
 reg audio_clock; 
 integer audio_clock_div; 
 integer bit_count; 
 reg word_sel; 
 reg [15:0] input_reg0; 
 reg [15:0] input_reg1; 
 reg [31:0] pcm_data_last; 
 reg prev_audio_clock; 
 reg pcm_fifo_rd_o; 
 reg pcm_fifo_ur_o; 
 reg bclk_o; 
 reg data_o; 
 always @(posedge clk_i or posedge rst_i) 
 begin 
  if (rst_i == 1'b1) 
  begin 
  audio_clock_div <= 0; 
  audio_clock <= 1'b0; 
  end 
  else 
  begin 
  if (audio_clock_div == (CLK_DIVISOR - 1)) 
  begin 
  audio_clock <= ~audio_clock; 
  audio_clock_div <= 0; 
  end 
  else 
  audio_clock_div <= audio_clock_div + 1; 
  end 
 end 
 [MASKED] 
 assign ws_o = word_sel; 
 endmodule