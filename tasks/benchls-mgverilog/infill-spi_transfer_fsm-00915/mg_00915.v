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
 [MASKED] 
 assign tx_data = tx_table[index]; 
 endmodule