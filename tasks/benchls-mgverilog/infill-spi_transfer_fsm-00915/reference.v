module mg_00915(clk,rst,start,busy,new_data,tx_data,rx_data,start_spi,done,chip_select);
parameter TRANSFER_COUNT = 2; 
 input clk, rst, start, busy, new_data; 
 input[7:0] rx_data; 
 output[7:0] tx_data; 
 output reg start_spi, done, chip_select; 
 reg[7:0] tx_table[TRANSFER_COUNT-1:0]; 
 reg[7:0] rx_table[TRANSFER_COUNT-1:0]; 
 localparam IDLE = 3'd0, STARTING = 3'd1, DELAY = 3'd2, 
  RUNNING = 3'd3, DONE = 3'd4; 
 reg[2:0] state; 
 reg[31:0] index; 
 reg i; 
 always @(posedge clk) begin 
  if(rst) begin 
  index <= 32'b0; 
  state <= IDLE; 
  done <= 1'b0; 
  start_spi <= 1'b0; 
  chip_select <= 1'b1; 
  rx_table[0] <= 8'b0; 
  rx_table[1] <= 8'b0; 
  tx_table[0] <= 8'b1111000; 
  tx_table[1] <= 8'b1111000; 
  end else begin 
  case(state) 
  IDLE: begin 
  index <= 32'b0; 
  chip_select <= 1'b1; 
  if(start) begin 
  state <= STARTING; 
  end 
  end 
  STARTING: begin 
  done <= 1'b0; 
  start_spi <= 1'b1; 
  chip_select <= 1'b0; 
  state <= DELAY; 
  end 
  DELAY: begin 
  state <= RUNNING; 
  start_spi <= 1'b0; 
  end 
  RUNNING: begin 
  if ((!busy) && new_data) begin 
  rx_table[index] <= rx_data; 
  index <= index + 1; 
  if(index == TRANSFER_COUNT) begin 
  done <= 1'b1; 
  state <= DONE; 
  end else begin 
  state <= STARTING; 
  start_spi <= 1'b1; 
  end 
  end 
  end 
  DONE: begin 
  state <= IDLE; 
  end 
  default: begin 
  state <= IDLE; 
  end 
  endcase 
  end 
 end 
 assign tx_data = tx_table[index]; 
 endmodule