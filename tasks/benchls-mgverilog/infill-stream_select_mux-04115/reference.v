module mg_04115 (clk,reset,sync_data,sync_valid,stream_in_data_0,stream_in_startofpacket_0,stream_in_endofpacket_0,stream_in_empty_0,stream_in_valid_0,stream_in_data_1,stream_in_startofpacket_1,stream_in_endofpacket_1,stream_in_empty_1,stream_in_valid_1,stream_out_ready,sync_ready,stream_in_ready_0,stream_in_ready_1,stream_out_data,stream_out_startofpacket,stream_out_endofpacket,stream_out_empty,stream_out_valid);
parameter DW = 23; 
 parameter EW = 1; 
 input clk; 
 input reset; 
 input sync_data; 
 input sync_valid; 
 input [DW: 0] stream_in_data_0; 
 input stream_in_startofpacket_0; 
 input stream_in_endofpacket_0; 
 input [EW: 0] stream_in_empty_0; 
 input stream_in_valid_0; 
 input [DW: 0] stream_in_data_1; 
 input stream_in_startofpacket_1; 
 input stream_in_endofpacket_1; 
 input [EW: 0] stream_in_empty_1; 
 input stream_in_valid_1; 
 input stream_out_ready; 
 output sync_ready; 
 output stream_in_ready_0; 
 output stream_in_ready_1; 
 output reg [DW: 0] stream_out_data; 
 output reg stream_out_startofpacket; 
 output reg stream_out_endofpacket; 
 output reg [EW: 0] stream_out_empty; 
 output reg stream_out_valid; 
 wire enable_setting_stream_select; 
 reg between_frames; 
 reg stream_select_reg; 
 always @(posedge clk) 
 begin 
  if (reset) 
  begin 
  stream_out_data <= 'h0; 
  stream_out_startofpacket <= 1'b0; 
  stream_out_endofpacket <= 1'b0; 
  stream_out_empty <= 'h0; 
  stream_out_valid <= 1'b0; 
  end 
  else if (stream_in_ready_0) 
  begin 
  stream_out_data <= stream_in_data_0; 
  stream_out_startofpacket <= stream_in_startofpacket_0; 
  stream_out_endofpacket <= stream_in_endofpacket_0; 
  stream_out_empty <= stream_in_empty_0; 
  stream_out_valid <= stream_in_valid_0; 
  end 
  else if (stream_in_ready_1) 
  begin 
  stream_out_data <= stream_in_data_1; 
  stream_out_startofpacket <= stream_in_startofpacket_1; 
  stream_out_endofpacket <= stream_in_endofpacket_1; 
  stream_out_empty <= stream_in_empty_1; 
  stream_out_valid <= stream_in_valid_1; 
  end 
  else if (stream_out_ready) 
  stream_out_valid <= 1'b0; 
 end 
 always @(posedge clk) 
 begin 
  if (reset) 
  between_frames <= 1'b1; 
  else if (stream_in_ready_0 & stream_in_endofpacket_0) 
  between_frames <= 1'b1; 
  else if (stream_in_ready_1 & stream_in_endofpacket_1) 
  between_frames <= 1'b1; 
  else if (stream_in_ready_0 & stream_in_startofpacket_0) 
  between_frames <= 1'b0; 
  else if (stream_in_ready_1 & stream_in_startofpacket_1) 
  between_frames <= 1'b0; 
 end 
 always @(posedge clk) 
 begin 
  if (reset) 
  stream_select_reg <= 1'b0; 
  else if (enable_setting_stream_select & sync_valid) 
  stream_select_reg <= sync_data; 
 end 
 assign sync_ready = enable_setting_stream_select; 
 assign stream_in_ready_0 = (stream_select_reg) ? 
  1'b0 : stream_in_valid_0 & (~stream_out_valid | stream_out_ready); 
 assign stream_in_ready_1 = (stream_select_reg) ? 
  stream_in_valid_1 & (~stream_out_valid | stream_out_ready) : 1'b0; 
 assign enable_setting_stream_select = 
  (stream_in_ready_0 & stream_in_endofpacket_0) | 
  (stream_in_ready_1 & stream_in_endofpacket_1) | 
  (~(stream_in_ready_0 & stream_in_startofpacket_0) & between_frames) | 
  (~(stream_in_ready_1 & stream_in_startofpacket_1) & between_frames); 
 endmodule