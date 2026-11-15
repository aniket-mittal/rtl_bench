module rtlpp_05977 (
  clk,
  reset,

  mm_response_readdata,
  mm_response_read,
  mm_response_address,
  mm_response_byteenable,
  mm_response_waitrequest,

  src_response_data,
  src_response_valid,
  src_response_ready,

  sw_reset,
  response_watermark,
  response_fifo_full,
  response_fifo_empty,
  done_strobe,
  actual_bytes_transferred,
  error,
  early_termination,
  transfer_complete_IRQ_mask,
  error_IRQ_mask,
  early_termination_IRQ_mask,
  descriptor_buffer_full
);

  parameter RESPONSE_PORT = 0;   
  parameter FIFO_DEPTH = 256;    
  parameter FIFO_DEPTH_LOG2 = 8;
  localparam FIFO_WIDTH = (RESPONSE_PORT == 0) ? 41 : 51;

  input clk;
  input reset;

  output reg [31:0] mm_response_readdata;
  input mm_response_read;
  input mm_response_address;  
  input [3:0] mm_response_byteenable;
  output reg mm_response_waitrequest;

  output reg [255:0] src_response_data;  
  output reg src_response_valid;
  input src_response_ready;

  input sw_reset;
  output reg [15:0] response_watermark;
  output reg response_fifo_full;
  output reg response_fifo_empty;
  input done_strobe;
  input [31:0] actual_bytes_transferred;
  input [7:0] error;
  input early_termination;

  input transfer_complete_IRQ_mask;
  input [7:0] error_IRQ_mask;
  input early_termination_IRQ_mask;
  input descriptor_buffer_full;  

  reg [FIFO_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];
  reg [FIFO_DEPTH_LOG2-1:0] fifo_head;
  reg [FIFO_DEPTH_LOG2-1:0] fifo_tail;
  reg fifo_full;
  reg fifo_empty;
  integer i;

  wire [FIFO_WIDTH-1:0] fifo_input;
  reg [FIFO_WIDTH-1:0] fifo_output;
  wire fifo_read;
  reg [FIFO_DEPTH_LOG2-1:0] fifo_used;

  assign fifo_input = (RESPONSE_PORT == 0) ? {early_termination, error, actual_bytes_transferred} : {early_termination_IRQ_mask, error_IRQ_mask, transfer_complete_IRQ_mask, early_termination, error, actual_bytes_transferred};
  assign fifo_read = (RESPONSE_PORT == 0) ? ((mm_response_read == 1) & (fifo_empty == 0) & (mm_response_address == 1) & (mm_response_byteenable[3] == 1)) : ((fifo_empty == 0) & (src_response_ready == 1));

  [MASKED]

endmodule