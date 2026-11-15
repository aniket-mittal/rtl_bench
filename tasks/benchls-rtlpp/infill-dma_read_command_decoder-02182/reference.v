module rtlpp_02182 (
  read_command_data_in,     
  read_command_data_out,  
  read_address,
  read_length,
  read_transmit_channel,
  read_generate_sop,
  read_generate_eop,
  read_park,
  read_transfer_complete_IRQ_mask,
  read_burst_count,      
  read_stride,           
  read_sequence_number,  
  read_transmit_error,
  read_early_done_enable,
  read_stop,
  read_sw_reset
);
  parameter DATA_WIDTH = 256;

  input [DATA_WIDTH-1:0] read_command_data_in;
  output wire [255:0] read_command_data_out;
  output wire [63:0] read_address;
  output wire [31:0] read_length;
  output wire [7:0] read_transmit_channel;
  output wire read_generate_sop;
  output wire read_generate_eop;
  output wire read_park;
  output wire read_transfer_complete_IRQ_mask;
  output wire [7:0] read_burst_count;
  output wire [15:0] read_stride;
  output wire [15:0] read_sequence_number;
  output wire [7:0] read_transmit_error;
  output wire read_early_done_enable;
  input read_stop;
  input read_sw_reset;

  assign read_address[31:0] = read_command_data_in[31:0];
  assign read_length = read_command_data_in[95:64];

  generate
    if (DATA_WIDTH == 256)
    begin : data_width_256
      assign read_early_done_enable = read_command_data_in[248];
      assign read_transmit_error = read_command_data_in[247:240];
      assign read_transmit_channel = read_command_data_in[231:224];
      assign read_generate_sop = read_command_data_in[232];
      assign read_generate_eop = read_command_data_in[233];
      assign read_park = read_command_data_in[234];
      assign read_transfer_complete_IRQ_mask = read_command_data_in[238];
      assign read_burst_count = read_command_data_in[119:112];
      assign read_stride = read_command_data_in[143:128];
      assign read_sequence_number = read_command_data_in[111:96];
      assign read_address[63:32] = read_command_data_in[191:160];
    end
    else
    begin : data_width_other
      assign read_early_done_enable = read_command_data_in[120];
      assign read_transmit_error = read_command_data_in[119:112];
      assign read_transmit_channel = read_command_data_in[103:96];
      assign read_generate_sop = read_command_data_in[104];
      assign read_generate_eop = read_command_data_in[105];
      assign read_park = read_command_data_in[106];
      assign read_transfer_complete_IRQ_mask = read_command_data_in[110];
      assign read_burst_count = 8'h00;
      assign read_stride = 16'h0000;
      assign read_sequence_number = 16'h0000;
      assign read_address[63:32] = 32'h00000000;
    end
  endgenerate

  assign read_command_data_out = {{115{1'b0}},  
                                   read_address[63:32],
                                   read_early_done_enable,
                                   read_transmit_error,
                                   read_stride,
                                   read_burst_count,
                                   read_sw_reset,
                                   read_stop,
                                   read_generate_eop,
                                   read_generate_sop,
                                   read_transmit_channel,
                                   read_length,
                                   read_address[31:0]};

endmodule