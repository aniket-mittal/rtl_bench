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
 always @(posedge clk_i or posedge rst_i) 
 begin 
  if (rst_i == 1'b1) 
  begin 
  input_reg0 <= 16'h0000; 
  input_reg1 <= 16'h0000; 
  bit_count <= 0; 
  data_o <= 1'b0; 
  word_sel <= 1'b0; 
  prev_audio_clock<= 1'b0; 
  pcm_fifo_rd_o <= 1'b0; 
  pcm_fifo_ur_o <= 1'b0; 
  pcm_data_last <= 32'h00000000; 
  end 
  else 
  begin 
  pcm_fifo_rd_o <= 1'b0; 
  pcm_fifo_ur_o <= 1'b0; 
  prev_audio_clock <= audio_clock; 
  if ((prev_audio_clock == 1'b1) && (audio_clock == 1'b0)) 
  begin 
  bclk_o <= 1'b0; 
  if (bit_count == 0) 
  begin 
  if (word_sel == 1'b0) 
  data_o <= input_reg0[15]; 
  else 
  data_o <= input_reg1[15]; 
  word_sel <= ~word_sel; 
  bit_count <= bit_count + 1; 
  if (pcm_fifo_empty_i == 1'b0) 
  begin 
  pcm_data_last <= pcm_data_i; 
  input_reg0 <= pcm_data_i[31:16]; 
  input_reg1 <= pcm_data_i[15:0]; 
  pcm_fifo_rd_o <= 1'b1; 
  end 
  else 
  begin 
  input_reg0 <= pcm_data_last[31:16]; 
  input_reg1 <= pcm_data_last[15:0]; 
  pcm_fifo_ur_o <= 1'b1; 
  end 
  end 
  else 
  begin 
  if (word_sel == 1'b0) 
  begin 
  data_o <= input_reg0[15]; 
  input_reg0 <= {input_reg0[14:0], 1'b0}; 
  end 
  else 
  begin 
  data_o <= input_reg1[15]; 
  input_reg1 <= {input_reg1[14:0], 1'b0}; 
  end 
  if (bit_count == 15) 
  bit_count <= 0; 
  else 
  bit_count <= bit_count + 1; 
  end 
  end 
  else if((prev_audio_clock == 1'b0) && (audio_clock == 1'b1)) 
  bclk_o <= 1'b1; 
  end 
 end 
 assign ws_o = word_sel; 
 endmodule