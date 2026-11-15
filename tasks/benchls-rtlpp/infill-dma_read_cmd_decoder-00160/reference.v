module rtlpp_00160 (
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
  output [255:0] read_command_data_out;
  output [63:0] read_address;
  output [31:0] read_length;
  output [7:0] read_transmit_channel;
  output read_generate_sop;
  output read_generate_eop;
  output read_park;
  output read_transfer_complete_IRQ_mask;
  output [7:0] read_burst_count;
  output [15:0] read_stride;
  output [15:0] read_sequence_number;
  output [7:0] read_transmit_error;
  output read_early_done_enable;
  input read_stop;
  input read_sw_reset;

  wire [DATA_WIDTH-1:0] read_cmd_data;
  assign read_cmd_data = read_command_data_in;

  assign read_address[31:0] = read_cmd_data[31:0];
  assign read_length = read_cmd_data[95:64];

  generate
    if (DATA_WIDTH == 256)
    begin
      assign read_early_done_enable = read_cmd_data[248];
      assign read_transmit_error = read_cmd_data[247:240];
      assign read_transmit_channel = read_cmd_data[231:224];
      assign read_generate_sop = read_cmd_data[232];
      assign read_generate_eop = read_cmd_data[233];
      assign read_park = read_cmd_data[234];
      assign read_transfer_complete_IRQ_mask = read_cmd_data[238];
      assign read_burst_count = read_cmd_data[119:112];
      assign read_stride = read_cmd_data[143:128];
      assign read_sequence_number = read_cmd_data[111:96];
      assign read_address[63:32] = read_cmd_data[191:160];
    end
    else
    begin
      assign read_early_done_enable = read_cmd_data[120];
      assign read_transmit_error = read_cmd_data[119:112];
      assign read_transmit_channel = read_cmd_data[103:96];
      assign read_generate_sop = read_cmd_data[104];
      assign read_generate_eop = read_cmd_data[105];
      assign read_park = read_cmd_data[106];
      assign read_transfer_complete_IRQ_mask = read_cmd_data[110];
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