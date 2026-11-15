module mg_04405 (input wire clk,input wire reset_b,input wire fifo_empty,output wire fifo_read,input wire [8:0] fifo_data,output wire ready,input wire read,output reg [7:0] port);
parameter IDLE = 3'b000, 
  PROCESS_PACKET = 3'b001, 
  PROCESS_LAST = 3'b010, 
  END_OF_PACKET_1 = 3'b011, 
  END_OF_PACKET_2 = 3'b100, 
  END_OF_PACKET_3 = 3'b101; 
  reg [02:00] state, next_state; 
  reg [08:00] last_fifo_data; 
  reg [07:00] next_port; 
  reg hold_off_ready; 
  wire end_of_packet; 
  assign ready = (~fifo_empty && ~hold_off_ready) || (state == PROCESS_LAST); 
  assign fifo_read = (~fifo_empty & read & ((next_state == PROCESS_PACKET) | (next_state == PROCESS_LAST))); 
  assign end_of_packet = fifo_data[8]; 
  always @(posedge clk or negedge reset_b) 
  if (~reset_b) begin 
  state <= IDLE; 
  port <= 8'h0; 
  end 
  else begin 
  state <= next_state; 
  port <= next_port; 
  last_fifo_data <= fifo_data; 
  end 
  always @* 
  case(state) 
  IDLE: begin 
  hold_off_ready = 1'b0; 
  if (read && ~fifo_empty) begin 
  next_state = PROCESS_PACKET; 
  next_port = fifo_data[7:0]; 
  end 
  else begin 
  next_state = IDLE; 
  next_port = 8'h00; 
  end 
  end 
  PROCESS_PACKET: begin 
  hold_off_ready = 1'b0; 
  if (end_of_packet | fifo_empty) begin 
  next_state = PROCESS_LAST; 
  next_port = fifo_data[7:0]; 
  end 
  else begin 
  next_state = PROCESS_PACKET; 
  next_port = fifo_data[7:0]; 
  end 
  end 
  PROCESS_LAST: begin 
  hold_off_ready = 1'b1; 
  next_state = END_OF_PACKET_1; 
  next_port = 8'h00; 
  end 
  END_OF_PACKET_1: begin 
  hold_off_ready = 1'b1; 
  next_state = END_OF_PACKET_2; 
  next_port = 8'h00; 
  end 
  END_OF_PACKET_2: begin 
  hold_off_ready = 1'b1; 
  next_state = END_OF_PACKET_3; 
  next_port = 8'h00; 
  end 
  END_OF_PACKET_3: begin 
  hold_off_ready = 1'b1; 
  next_state = IDLE; 
  next_port = 8'h00; 
  end 
  default: begin 
  hold_off_ready = 1'b0; 
  next_state = IDLE; 
  next_port = 8'h00; 
  end 
  endcase 
 endmodule