module mg_09583 (clk,command_fifo_empty,command_fifo_q,m_read_waitrequest,m_write_waitrequest,read_go,reset_n,write_go,command_fifo_rdreq,read_command_data,read_command_valid,write_command_data,write_command_valid);
output command_fifo_rdreq; 
  output [ 58: 0] read_command_data; 
  output read_command_valid; 
  output [ 56: 0] write_command_data; 
  output write_command_valid; 
  input clk; 
  input command_fifo_empty; 
  input [103: 0] command_fifo_q; 
  input m_read_waitrequest; 
  input m_write_waitrequest; 
  input read_go; 
  input reset_n; 
  input write_go; 
  wire [ 3: 0] atlantic_channel; 
  wire [ 15: 0] bytes_to_transfer; 
  wire command_fifo_rdreq; 
  wire command_fifo_rdreq_in; 
  reg command_fifo_rdreq_reg; 
  reg command_valid; 
  wire [ 7: 0] control; 
  reg delay1_command_valid; 
  wire generate_eop; 
  wire [ 31: 0] read_address; 
  wire [ 7: 0] read_burst; 
  reg [ 58: 0] read_command_data; 
  wire read_command_valid; 
  wire read_fixed_address; 
  wire [ 31: 0] write_address; 
  wire [ 7: 0] write_burst; 
  reg [ 56: 0] write_command_data; 
  wire write_command_valid; 
  wire write_fixed_address; 
  assign read_address = command_fifo_q[31 : 0]; 
  assign write_address = command_fifo_q[63 : 32]; 
  assign bytes_to_transfer = command_fifo_q[79 : 64]; 
  assign read_burst = command_fifo_q[87 : 80]; 
  assign write_burst = command_fifo_q[95 : 88]; 
  assign control = command_fifo_q[103 : 96]; 
  assign generate_eop = control[0]; 
  assign read_fixed_address = control[1]; 
  assign write_fixed_address = control[2]; 
  assign atlantic_channel = control[6 : 3]; 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  read_command_data <= 0; 
  else 
  read_command_data <= {write_fixed_address, generate_eop, ~read_fixed_address, read_burst, bytes_to_transfer, read_address}; 
  end 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  write_command_data <= 0; 
  else 
  write_command_data <= {~write_fixed_address, write_burst, bytes_to_transfer, write_address}; 
  end 
  assign read_command_valid = command_valid; 
  assign write_command_valid = command_valid; 
  assign command_fifo_rdreq_in = (command_fifo_rdreq_reg || command_valid) ? 1'b0 : (~read_go && ~write_go && ~m_read_waitrequest && ~m_write_waitrequest); 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  command_fifo_rdreq_reg <= 0; 
  else if (~command_fifo_empty) 
  command_fifo_rdreq_reg <= command_fifo_rdreq_in; 
  end 
  assign command_fifo_rdreq = command_fifo_rdreq_reg; 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  delay1_command_valid <= 0; 
  else 
  delay1_command_valid <= command_fifo_rdreq_reg; 
  end 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  command_valid <= 0; 
  else 
  command_valid <= delay1_command_valid; 
  end 
 endmodule