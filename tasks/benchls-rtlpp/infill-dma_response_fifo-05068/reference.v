module rtlpp_05068 (
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

  reg [FIFO_WIDTH-1:0] fifo_memory [FIFO_DEPTH-1:0];
  reg [FIFO_DEPTH_LOG2-1:0] fifo_write_ptr = 0;
  reg [FIFO_DEPTH_LOG2-1:0] fifo_read_ptr = 0;
  reg [FIFO_DEPTH_LOG2:0] fifo_count = 0;
  reg [FIFO_WIDTH-1:0] fifo_output_reg;

  wire fifo_full = (fifo_count == FIFO_DEPTH);
  wire fifo_empty = (fifo_count == 0);
  wire fifo_read;
  wire [FIFO_WIDTH-1:0] fifo_input;

  assign fifo_read = (RESPONSE_PORT == 0) ? 
                     (mm_response_read && !fifo_empty && mm_response_address && mm_response_byteenable[3]) : 
                     (!fifo_empty && src_response_ready);

  assign fifo_input = (RESPONSE_PORT == 0) ? 
                      {early_termination, error, actual_bytes_transferred} : 
                      {early_termination_IRQ_mask, error_IRQ_mask, transfer_complete_IRQ_mask, early_termination, error, actual_bytes_transferred};

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      fifo_write_ptr <= 0;
      fifo_read_ptr <= 0;
      fifo_count <= 0;
      fifo_output_reg <= 0;
    end else if (sw_reset) begin
      fifo_write_ptr <= 0;
      fifo_read_ptr <= 0;
      fifo_count <= 0;
      fifo_output_reg <= 0;
    end else begin
      if (done_strobe && !fifo_full) begin
        fifo_memory[fifo_write_ptr] <= fifo_input;
        fifo_write_ptr <= fifo_write_ptr + 1;
        fifo_count <= fifo_count + 1;
      end
      if (fifo_read && !fifo_empty) begin
        fifo_output_reg <= fifo_memory[fifo_read_ptr];
        fifo_read_ptr <= fifo_read_ptr + 1;
        fifo_count <= fifo_count - 1;
      end
    end
  end

  assign mm_response_readdata = (RESPONSE_PORT == 0) ? 
                                ((mm_response_address == 0) ? fifo_output_reg[31:0] : {23'b0, fifo_output_reg[40:32]}) : 
                                0;
  assign mm_response_waitrequest = (RESPONSE_PORT == 0) ? fifo_empty : 0;
  assign src_response_data = (RESPONSE_PORT == 1) ? 
                             {{204{1'b0}}, descriptor_buffer_full, fifo_output_reg} : 
                             0;
  assign src_response_valid = (RESPONSE_PORT == 1) ? !fifo_empty : 0;
  assign response_watermark = {16'b0, fifo_full, fifo_count};
  assign response_fifo_full = fifo_full;
  assign response_fifo_empty = fifo_empty;

endmodule