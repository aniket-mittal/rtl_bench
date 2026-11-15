module rtlpp_06308 (
  clk,
  reset,
  sw_reset,
  sw_stop,
  length,
  eop_enabled,
  eop,
  ready,
  valid,
  early_termination,
  address_in,
  write_in,
  max_burst_count,
  write_fifo_used,
  waitrequest,
  short_first_access_enable,
  short_last_access_enable,
  short_first_and_last_access_enable,
  last_access,

  address_out,
  write_out,
  burst_count,
  stall,
  reset_taken,
  stopped
);

  parameter BURST_ENABLE = 1;  
  parameter BURST_COUNT_WIDTH = 3;
  parameter WORD_SIZE = 4;
  parameter WORD_SIZE_LOG2 = 2;
  parameter ADDRESS_WIDTH = 32;
  parameter LENGTH_WIDTH = 32;
  parameter WRITE_FIFO_USED_WIDTH = 5;
  parameter BURST_WRAPPING_SUPPORT = 1;  
  localparam BURST_OFFSET_WIDTH = (BURST_COUNT_WIDTH == 1)? 1: (BURST_COUNT_WIDTH-1);

  input clk;
  input reset;
  input sw_reset;
  input sw_stop;

  input [LENGTH_WIDTH-1:0] length;
  input eop_enabled;
  input eop;
  input ready;
  input valid;
  input early_termination;
  input [ADDRESS_WIDTH-1:0] address_in;
  input write_in;
  input [BURST_COUNT_WIDTH-1:0] max_burst_count;  
  input [WRITE_FIFO_USED_WIDTH:0] write_fifo_used;  
  input waitrequest;  
  input short_first_access_enable;
  input short_last_access_enable;
  input short_first_and_last_access_enable;

  input last_access;

  output wire [ADDRESS_WIDTH-1:0] address_out;
  output wire write_out;
  output wire [BURST_COUNT_WIDTH-1:0] burst_count;
  output wire stall;  
  output wire reset_taken;  
  output wire stopped;  

  reg [ADDRESS_WIDTH-1:0] address_d1;
  reg [BURST_COUNT_WIDTH-1:0] burst_counter;  
  wire idle_state;
  wire decrement_burst_counter;
  wire ready_during_idle_state;  
  wire ready_for_quick_burst;    
  wire burst_begin_from_idle_state;
  wire burst_begin_quickly;      
  wire burst_begin;
  wire burst_of_one_enable;      
  wire [BURST_COUNT_WIDTH-1:0] short_length_burst;
  wire [BURST_COUNT_WIDTH-1:0] short_packet_burst;
  wire short_length_burst_enable;
  wire short_early_termination_burst_enable;
  wire short_packet_burst_enable;
  wire [3:0] mux_select;
  reg [BURST_COUNT_WIDTH-1:0] internal_burst_count;
  reg [BURST_COUNT_WIDTH-1:0] internal_burst_count_d1;
  reg packet_complete;
  wire [BURST_OFFSET_WIDTH-1:0] burst_offset;

  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      packet_complete <= 0;
    end
    else
    begin
      if ((packet_complete == 1) & (write_fifo_used == 0))
      begin
        packet_complete <= 0;
      end
      else if ((eop == 1) & (ready == 1) & (valid == 1))
      begin
        packet_complete <= 1;
      end
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      address_d1 <= 0;
    end
    else if (burst_begin == 1)
    begin
      address_d1 <= (burst_begin_quickly == 1)? (address_in + WORD_SIZE) : address_in;
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      burst_counter <= 0;
    end
    else
    if ((burst_begin == 1) & (sw_reset == 0) & (sw_stop == 0))  
    begin
      burst_counter <= internal_burst_count;
    end
    else if (decrement_burst_counter == 1)
    begin
      burst_counter <= burst_counter - 1'b1;
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      internal_burst_count_d1 <= 0;
    end
    else if (burst_begin == 1)
    begin
      internal_burst_count_d1 <= internal_burst_count;
    end
  end
  
  assign idle_state = (burst_counter == 0);  
  assign decrement_burst_counter = (idle_state == 0) & (waitrequest == 0);
  
  assign burst_offset = address_in[BURST_OFFSET_WIDTH+WORD_SIZE_LOG2-1:WORD_SIZE_LOG2];
  assign burst_of_one_enable = (short_first_access_enable == 1) | (short_last_access_enable == 1) | (short_first_and_last_access_enable == 1) | (early_termination == 1) |
                               ((BURST_WRAPPING_SUPPORT == 1) & (idle_state == 1) & (burst_offset != 0)) |  
                               ((BURST_WRAPPING_SUPPORT == 1) & (idle_state == 0) & (burst_offset != (max_burst_count - 1)));  
  assign short_length_burst_enable = ((length >> WORD_SIZE_LOG2) < max_burst_count) & (eop_enabled == 0) & (burst_of_one_enable == 0);
  assign short_early_termination_burst_enable = (short_packet_burst_enable == 0) & ((length >> WORD_SIZE_LOG2) < max_burst_count) & (eop_enabled == 1) & (burst_of_one_enable == 0);  
  assign short_packet_burst_enable = (eop_enabled == 1) & (packet_complete == 1) & (write_fifo_used < max_burst_count) & (burst_of_one_enable == 0);

  assign short_length_burst = (BURST_COUNT_WIDTH > 1) ? ((length >> WORD_SIZE_LOG2) & {(BURST_COUNT_WIDTH-1){1'b1}}) : 1'b1;
  assign short_packet_burst = (BURST_COUNT_WIDTH > 1) ? (write_fifo_used & {(BURST_COUNT_WIDTH-1){1'b1}}) : 1'b1;
  
  assign ready_during_idle_state = (burst_of_one_enable == 1) |  
                                   ((write_fifo_used >= short_length_burst) & (short_length_burst_enable == 1)) |
                                   ((write_fifo_used >= short_length_burst) & (short_early_termination_burst_enable == 1)) |
                                   ((write_fifo_used >= short_packet_burst) & (short_packet_burst_enable == 1)) |
                                    (write_fifo_used >= max_burst_count);
  
  assign ready_for_quick_burst = (length >= (max_burst_count << WORD_SIZE_LOG2)) & (burst_of_one_enable == 0) &  
                                 (  ((write_fifo_used > short_length_burst) & (short_length_burst_enable == 1)) |
                                    ((write_fifo_used > short_length_burst) & (short_early_termination_burst_enable == 1)) |
                                    ((write_fifo_used > short_packet_burst) & (short_packet_burst_enable == 1)) |
                                     (write_fifo_used > max_burst_count)  );

  assign burst_begin_from_idle_state = (write_in == 1) & (idle_state == 1) & (ready_during_idle_state == 1);   
  
  assign burst_begin_quickly = (last_access == 0) & (write_in == 1) & (burst_counter == 1) & (waitrequest == 0) & (ready_for_quick_burst == 1); 
  assign burst_begin = (burst_begin_quickly == 1) | (burst_begin_from_idle_state == 1);

  assign mux_select = {short_packet_burst_enable, short_early_termination_burst_enable, short_length_burst_enable, burst_of_one_enable};

  
  always @ (*)
  begin
    case (mux_select)
      4'b0001 : internal_burst_count = 1;
      4'b0010 : internal_burst_count = short_length_burst;
      4'b0100 : internal_burst_count = short_length_burst;
      4'b1000 : internal_burst_count = short_packet_burst;
      default : internal_burst_count = max_burst_count;
    endcase
  end

  generate
  if (BURST_ENABLE == 1)
  begin
    assign address_out = address_d1;
    assign burst_count = internal_burst_count_d1;
    assign write_out = (idle_state == 0);
    assign stall = (idle_state == 1);
    assign reset_taken = (sw_reset == 1) & (idle_state == 1);  
    assign stopped = (sw_stop == 1) & (idle_state == 1);       
  end
  else
  begin
    assign address_out = address_in;
    assign burst_count = 1;  
    assign write_out = write_in;
    assign stall = 0;
    assign reset_taken = sw_reset;
    assign stopped = sw_stop;
  end
  endgenerate

endmodule