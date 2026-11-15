module mg_04752 (input h_reset_n,input t_crt_clk,input c_shift_ld,input m_att_data_b32,input c_cr0b_b6,input c_cr0b_b5,input c_cr0a_b5,input c_t_vsync,input ar12_b4,output cursor_blink_rate,output finalcursor,output char_blink_rate);
reg mux_op; 
  reg [2:0] shifted_data; 
  reg ctvsync_hold; 
  reg [4:0] blink_rate; 
  wire [2:0] m_att_data_b32_d; 
  wire int_final_cursor; 
  always @(posedge t_crt_clk or negedge h_reset_n) 
  if (!h_reset_n) shifted_data <= 3'b0; 
  else if (c_shift_ld) shifted_data <= {shifted_data[1:0], m_att_data_b32}; 
  assign m_att_data_b32_d = shifted_data; 
  always @* 
  case({c_cr0b_b6, c_cr0b_b5}) 
  2'b00: mux_op = m_att_data_b32; 
  2'b01: mux_op = m_att_data_b32_d[0]; 
  2'b10: mux_op = m_att_data_b32_d[1]; 
  2'b11: mux_op = m_att_data_b32_d[2]; 
  endcase 
  always @(posedge t_crt_clk or negedge h_reset_n) 
  if (!h_reset_n) begin 
  ctvsync_hold <= 1'b0; 
  blink_rate <= 5'b0; 
  end else begin 
  ctvsync_hold <= c_t_vsync; 
  if (ar12_b4) 
  blink_rate <= 5'b0; 
  else if (c_t_vsync && ~ctvsync_hold) 
  blink_rate <= blink_rate + 1'b1; 
  end 
  assign cursor_blink_rate = ~blink_rate[3]; 
  assign char_blink_rate = blink_rate[4]; 
  assign int_final_cursor = ~( ~cursor_blink_rate | (~mux_op) ); 
  assign finalcursor = (int_final_cursor & (~c_cr0a_b5)); 
 endmodule