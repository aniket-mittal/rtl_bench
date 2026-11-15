module mg_02621 (clk_i,rst_i,addr_i,data_i,enable_i,write_i,ack_o,data_o);
input clk_i; 
 input rst_i; 
 input [31:0] addr_i; 
 input [255:0] data_i; 
 input enable_i; 
 input write_i; 
 output ack_o; 
 output [255:0] data_o; 
 reg [255:0] memory [0:511]; 
 reg [3:0] count; 
 reg ack; 
 reg ok; 
 reg [255:0] data; 
 wire [26:0] addr; 
 parameter STATE_IDLE = 3'h0, 
  STATE_WAIT = 3'h1, 
  STATE_ACK = 3'h2, 
  STATE_FINISH = 3'h3; 
 reg [1:0] state; 
 assign ack_o = ack; 
 assign addr = addr_i>>5; 
 assign data_o = data; 
 [MASKED] 
 always@(posedge clk_i) begin 
  if(ok && !write_i) begin 
  data = memory[addr]; 
  end 
 end 
 always@(posedge clk_i) begin 
  if(ok && write_i) begin 
  memory[addr] <= data_i; 
  end 
 end 
 endmodule