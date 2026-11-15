module mg_08352 (input wire clk_in,input wire rst_in,input wire en_in,input wire halt_in,input wire length_pulse_in,input wire [4:0] length_in,input wire length_wr_in,output wire en_out);
reg [7:0] q_length, d_length; 
 always @(posedge clk_in) 
  begin 
  if (rst_in) 
  begin 
  q_length <= 8'h00; 
  end 
  else 
  begin 
  q_length <= d_length; 
  end 
  end 
 [MASKED] 
 assign en_out = (q_length != 8'h00); 
 endmodule