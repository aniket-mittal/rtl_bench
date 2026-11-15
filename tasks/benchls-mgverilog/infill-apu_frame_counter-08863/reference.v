module mg_08863 (input clk_in,input rst_in,input cpu_cycle_pulse_in,input apu_cycle_pulse_in,input [1:0] mode_in,input mode_wr_in,output reg e_pulse_out,output reg l_pulse_out,output reg f_pulse_out);
reg [14:0] q_apu_cycle_cnt, d_apu_cycle_cnt; 
 reg q_seq_mode, d_seq_mode; 
 reg q_irq_inhibit, d_irq_inhibit; 
 always @(posedge clk_in) 
  begin 
  if (rst_in) 
  begin 
  q_apu_cycle_cnt <= 15'h0000; 
  q_seq_mode <= 1'b0; 
  q_irq_inhibit <= 1'b0; 
  end 
  else 
  begin 
  q_apu_cycle_cnt <= d_apu_cycle_cnt; 
  q_seq_mode <= d_seq_mode; 
  q_irq_inhibit <= d_irq_inhibit; 
  end 
  end 
 always @* 
  begin 
  d_apu_cycle_cnt = q_apu_cycle_cnt; 
  d_seq_mode = (mode_wr_in) ? mode_in[1] : q_seq_mode; 
  d_irq_inhibit = (mode_wr_in) ? mode_in[0] : q_irq_inhibit; 
  e_pulse_out = 1'b0; 
  l_pulse_out = 1'b0; 
  f_pulse_out = 1'b0; 
  if (apu_cycle_pulse_in) 
  begin 
  d_apu_cycle_cnt = q_apu_cycle_cnt + 15'h0001; 
  if ((q_apu_cycle_cnt == 15'h0E90) || (q_apu_cycle_cnt == 15'h2BB1)) 
  begin 
  e_pulse_out = 1'b1; 
  end 
  else if (q_apu_cycle_cnt == 15'h1D20) 
  begin 
  e_pulse_out = 1'b1; 
  l_pulse_out = 1'b1; 
  end 
  else if (!q_seq_mode && (q_apu_cycle_cnt == 15'h3A42)) 
  begin 
  e_pulse_out = 1'b1; 
  l_pulse_out = 1'b1; 
  f_pulse_out = ~q_irq_inhibit; 
  d_apu_cycle_cnt = 15'h0000; 
  end 
  else if ((q_apu_cycle_cnt == 15'h48d0)) 
  begin 
  e_pulse_out = q_seq_mode; 
  l_pulse_out = q_seq_mode; 
  d_apu_cycle_cnt = 15'h0000; 
  end 
  end 
  if (cpu_cycle_pulse_in && mode_wr_in) 
  d_apu_cycle_cnt = 15'h48d0; 
  end 
 endmodule