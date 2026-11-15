module mg_07747(input wire clk,input wire rsth,input wire mod_sel,input wire req,input wire [7:0] w_wdata,output wire ack);
wire en_wait_countup; 
  reg [15:0] en_wait_cnt; 
  reg [7:0] wait_cnt; 
  reg req_1d; 
  wire req_pe; 
  always @(posedge clk) begin 
  if(rsth) req_1d <= 0; 
  else req_1d <= req; 
  end 
  assign req_pe = (mod_sel) & (req & ~req_1d); 
  always @(posedge clk) begin 
  if(rsth) en_wait_cnt <= 49999; 
  else if(en_wait_cnt == 0) en_wait_cnt <= 49999; 
  else en_wait_cnt <= en_wait_cnt - 1; 
  end 
  assign en_wait_countup = (en_wait_cnt == 0); 
  always @(posedge clk) begin 
  if(rsth) wait_cnt <= 0; 
  else if(req_pe) wait_cnt <= w_wdata; 
  else if(wait_cnt == 0) wait_cnt <= wait_cnt; 
  else if(en_wait_countup) wait_cnt <= wait_cnt - 1; 
  end 
  assign ack = (wait_cnt == 0); 
 endmodule