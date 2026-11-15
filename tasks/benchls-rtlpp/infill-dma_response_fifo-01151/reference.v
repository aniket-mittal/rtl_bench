module rtlpp_01151 (
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

  wire [FIFO_DEPTH_LOG2-1:0] fifo_used;
  wire fifo_full;
  wire fifo_empty;
  wire fifo_read;
  wire [FIFO_WIDTH-1:0] fifo_input;
  wire [FIFO_WIDTH-1:0] fifo_output;

  reg [FIFO_WIDTH-1:0] fifo_memory[FIFO_DEPTH-1:0];
  reg [FIFO_DEPTH_LOG2-1:0] rd_pointer;
  reg [FIFO_DEPTH_LOG2-1:0] wr_pointer;
  reg [FIFO_DEPTH_LOG2:0] fifo_count;

  assign fifo_full = (fifo_count == FIFO_DEPTH);
  assign fifo_empty = (fifo_count == 0);
  assign fifo_used = fifo_count[FIFO_DEPTH_LOG2-1:0];

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      rd_pointer <= 0;
      wr_pointer <= 0;
      fifo_count <= 0;
    end else if (sw_reset) begin
      rd_pointer <= 0;
      wr_pointer <= 0;
      fifo_count <= 0;
    end else begin
      if (done_strobe && !fifo_full) begin
        fifo_memory[wr_pointer] <= fifo_input;
        wr_pointer <= wr_pointer + 1;
        fifo_count <= fifo_count + 1;
      end

      if (fifo_read && !fifo_empty) begin
        rd_pointer <= rd_pointer + 1;
        fifo_count <= fifo_count - 1;
      end
    end
  end

  assign fifo_output = fifo_memory[rd_pointer];

  generate
    if (RESPONSE_PORT == 0) begin
      assign fifo_input = {early_termination, error, actual_bytes_transferred};  
      assign fifo_read = (mm_response_read == 1) & (fifo_empty == 0) & (mm_response_address == 1) & (mm_response_byteenable[3] == 1);

      assign mm_response_readdata = (mm_response_address == 0)? fifo_output[31:0] : {{23{1'b0}}, fifo_output[40:32]};
      assign mm_response_waitrequest = fifo_empty;
      assign response_watermark = {{(16-(FIFO_DEPTH_LOG2+1)){1'b0}}, fifo_full, fifo_used};  
      assign response_fifo_full = fifo_full;
      assign response_fifo_empty = fifo_empty;

      assign src_response_data = 0;
      assign src_response_valid = 0;
    end
    else if (RESPONSE_PORT == 1) begin
      assign fifo_input = {early_termination_IRQ_mask, error_IRQ_mask, transfer_complete_IRQ_mask, early_termination, error, actual_bytes_transferred};
      assign fifo_read = (fifo_empty == 0) & (src_response_ready == 1);

      assign src_response_data = {{204{1'b0}}, descriptor_buffer_full, fifo_output};  
      assign src_response_valid = (fifo_empty == 0);
      assign response_watermark = {{(16-(FIFO_DEPTH_LOG2+1)){1'b0}}, fifo_full, fifo_used};  
      assign response_fifo_full = fifo_full;
      assign response_fifo_empty = fifo_empty;

      assign mm_response_readdata = 0;
      assign mm_response_waitrequest = 0;
    end
    else begin
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