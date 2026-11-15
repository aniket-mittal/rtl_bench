module mg_06539 (clk,controlbitsfifo_q,desc_address_fifo_empty,desc_address_fifo_q,descriptor_write_waitrequest,park,reset_n,status_token_fifo_data,status_token_fifo_empty,status_token_fifo_q,atlantic_error,controlbitsfifo_rdreq,desc_address_fifo_rdreq,descriptor_write_address,descriptor_write_busy,descriptor_write_write,descriptor_write_writedata,status_token_fifo_rdreq,t_eop);
output atlantic_error; 
  output controlbitsfifo_rdreq; 
  output desc_address_fifo_rdreq; 
  output [ 31: 0] descriptor_write_address; 
  output descriptor_write_busy; 
  output descriptor_write_write; 
  output [ 31: 0] descriptor_write_writedata; 
  output status_token_fifo_rdreq; 
  output t_eop; 
  input clk; 
  input [ 6: 0] controlbitsfifo_q; 
  input desc_address_fifo_empty; 
  input [ 31: 0] desc_address_fifo_q; 
  input descriptor_write_waitrequest; 
  input park; 
  input reset_n; 
  input [ 23: 0] status_token_fifo_data; 
  input status_token_fifo_empty; 
  input [ 23: 0] status_token_fifo_q; 
  wire atlantic_error; 
  wire can_write; 
  wire controlbitsfifo_rdreq; 
  wire desc_address_fifo_rdreq; 
  reg [ 31: 0] descriptor_write_address; 
  wire descriptor_write_busy; 
  reg descriptor_write_write; 
  reg descriptor_write_write0; 
  reg [ 31: 0] descriptor_write_writedata; 
  wire fifos_not_empty; 
  wire [ 7: 0] status_reg; 
  reg status_token_fifo_rdreq; 
  wire status_token_fifo_rdreq_in; 
  wire t_eop; 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  descriptor_write_writedata <= 0; 
  else if (~descriptor_write_waitrequest) 
  descriptor_write_writedata <= {park, controlbitsfifo_q, status_token_fifo_q}; 
  end 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  descriptor_write_address <= 0; 
  else if (~descriptor_write_waitrequest) 
  descriptor_write_address <= desc_address_fifo_q + 28; 
  end 
  assign fifos_not_empty = ~status_token_fifo_empty && ~desc_address_fifo_empty; 
  assign can_write = ~descriptor_write_waitrequest && fifos_not_empty; 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  descriptor_write_write0 <= 0; 
  else if (~descriptor_write_waitrequest) 
  descriptor_write_write0 <= status_token_fifo_rdreq; 
  end 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  descriptor_write_write <= 0; 
  else if (~descriptor_write_waitrequest) 
  descriptor_write_write <= descriptor_write_write0; 
  end 
  assign status_token_fifo_rdreq_in = status_token_fifo_rdreq ? 1'b0 : can_write; 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  status_token_fifo_rdreq <= 0; 
  else 
  status_token_fifo_rdreq <= status_token_fifo_rdreq_in; 
  end 
  assign desc_address_fifo_rdreq = status_token_fifo_rdreq; 
  assign descriptor_write_busy = descriptor_write_write0 | descriptor_write_write; 
  assign status_reg = status_token_fifo_data[23 : 16]; 
  assign t_eop = status_reg[7]; 
  assign atlantic_error = status_reg[6] | status_reg[5] | status_reg[4] | status_reg[3] | status_reg[2] | status_reg[1] | status_reg[0]; 
  assign controlbitsfifo_rdreq = status_token_fifo_rdreq; 
 endmodule