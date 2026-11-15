module rtlpp_06600 (
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
  localparam FIFO_WIDTH = (RESPONSE_PORT == 0)? 41 : 51;  

  input clk;
  input reset;

  output [31:0] mm_response_readdata;
  input mm_response_read;
  input mm_response_address;  
  input [3:0] mm_response_byteenable;
  output mm_response_waitrequest;

  output [255:0] src_response_data;  
  output src_response_valid;
  input src_response_ready;

  input sw_reset;
  output [15:0] response_watermark;
  output response_fifo_full;
  output response_fifo_empty;
  input done_strobe;
  input [31:0] actual_bytes_transferred;
  input [7:0] error;
  input early_termination;

  input transfer_complete_IRQ_mask;
  input [7:0] error_IRQ_mask;
  input early_termination_IRQ_mask;
  input descriptor_buffer_full;  

  reg [FIFO_WIDTH-1:0] fifo_mem [FIFO_DEPTH-1:0];
  reg [FIFO_DEPTH_LOG2-1:0] fifo_head, fifo_tail;
  reg [FIFO_DEPTH_LOG2:0] fifo_count;
  reg fifo_full_flag, fifo_empty_flag;
  
  wire [FIFO_DEPTH_LOG2-1:0] fifo_used = fifo_count[FIFO_DEPTH_LOG2-1:0];
  wire fifo_full = fifo_full_flag;
  wire fifo_empty = fifo_empty_flag;

  wire fifo_read;
  wire [FIFO_WIDTH-1:0] fifo_input;
  reg [FIFO_WIDTH-1:0] fifo_output;

  initial begin
    fifo_head = 0;
    fifo_tail = 0;
    fifo_count = 0;
    fifo_full_flag = 0;
    fifo_empty_flag = 1;
    fifo_output = 0;
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      fifo_head <= 0;
      fifo_tail <= 0;
      fifo_count <= 0;
      fifo_full_flag <= 0;
      fifo_empty_flag <= 1;
    end else if (sw_reset) begin
      fifo_head <= 0;
      fifo_tail <= 0;
      fifo_count <= 0;
      fifo_full_flag <= 0;
      fifo_empty_flag <= 1;
    end else begin
      if (done_strobe && !fifo_full) begin
        fifo_mem[fifo_tail] <= fifo_input;
        fifo_tail <= fifo_tail + 1;
        fifo_count <= fifo_count + 1;
      end
      if (fifo_read && !fifo_empty) begin
        fifo_output <= fifo_mem[fifo_head];
        fifo_head <= fifo_head + 1;
        fifo_count <= fifo_count - 1;
      end
      fifo_full_flag <= (fifo_count == FIFO_DEPTH);
      fifo_empty_flag <= (fifo_count == 0);
    end
  end
  
  generate
    if (RESPONSE_PORT == 0) begin
      assign fifo_input = {early_termination, error, actual_bytes_transferred};  
      assign fifo_read = (mm_response_read) & (!fifo_empty) & (mm_response_address == 1) & (mm_response_byteenable[3] == 1); 

      assign mm_response_readdata = (mm_response_address == 0)? fifo_output[31:0] : {{23{1'b0}}, fifo_output[40:32]};
      assign mm_response_waitrequest = fifo_empty;
      assign response_watermark = {{(16-(FIFO_DEPTH_LOG2+1)){1'b0}}, fifo_full, fifo_used};  
      assign response_fifo_full = fifo_full;
      assign response_fifo_empty = fifo_empty;

      assign src_response_data = 0;
      assign src_response_valid = 0;
    end else if (RESPONSE_PORT == 1) begin
      assign fifo_input = {early_termination_IRQ_mask, error_IRQ_mask, transfer_complete_IRQ_mask, early_termination, error, actual_bytes_transferred};
      assign fifo_read = (!fifo_empty) & (src_response_ready);

      assign src_response_data = {{204{1'b0}}, descriptor_buffer_full, fifo_output};
      assign src_response_valid = (!fifo_empty);
      assign response_watermark = {{(16-(FIFO_DEPTH_LOG2+1)){1'b0}}, fifo_full, fifo_used};  
      assign response_fifo_full = fifo_full;
      assign response_fifo_empty = fifo_empty;

      assign mm_response_readdata = 0;
      assign mm_response_waitrequest = 0;
    end else begin
      assign fifo_input = 0;
      assign fifo_output = 0;
      assign mm_response_readdata = 0;
      assign mm_response_waitrequest = 0;
      assign src_response_data = 0;
      assign src_response_valid = 0;
      assign response_watermark = 0;
      assign response_fifo_full = 0;
      assign response_fifo_empty = 0;
    end
  endgenerate

endmodule