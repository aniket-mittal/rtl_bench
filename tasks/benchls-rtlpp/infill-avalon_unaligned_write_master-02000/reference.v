module rtlpp_02000 (
  clk,
  reset,

  enable,
  address,
  start,
  waitrequest,
  stall,
  write_data,
  
  fifo_data,
  fifo_empty,
  fifo_readack
);

  parameter DATA_WIDTH = 32;
  parameter BYTEENABLE_WIDTH_LOG2 = 2;
  parameter ADDRESS_WIDTH = 32;
  parameter UNALIGNED_ACCESS_ENABLE = 0;  
  localparam BYTES_TO_NEXT_BOUNDARY_WIDTH = BYTEENABLE_WIDTH_LOG2 + 1;  

  input clk;
  input reset;
  
  input enable;  
  input [ADDRESS_WIDTH-1:0] address;
  input start;   
  input waitrequest;
  input stall;
  output wire [DATA_WIDTH-1:0] write_data;

  input [DATA_WIDTH-1:0] fifo_data;
  input fifo_empty;
  output wire fifo_readack;
  
  wire [BYTES_TO_NEXT_BOUNDARY_WIDTH-1:0] bytes_to_next_boundary;  
  wire [DATA_WIDTH-1:0] barrelshifter_A;
  wire [DATA_WIDTH-1:0] barrelshifter_B;
  reg [DATA_WIDTH-1:0] barrelshifter_B_d1;
  wire [DATA_WIDTH-1:0] combined_word;  
  wire [BYTES_TO_NEXT_BOUNDARY_WIDTH-2:0] bytes_to_next_boundary_minus_one;  
  reg [BYTES_TO_NEXT_BOUNDARY_WIDTH-2:0] bytes_to_next_boundary_minus_one_d1;
  wire [DATA_WIDTH-1:0] barrelshifter_input_A [0:((DATA_WIDTH/8)-1)];  
  wire [DATA_WIDTH-1:0] barrelshifter_input_B [0:((DATA_WIDTH/8)-1)];  

  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      bytes_to_next_boundary_minus_one_d1 <= 0;
    end
    else if (start)
    begin
      bytes_to_next_boundary_minus_one_d1 <= bytes_to_next_boundary_minus_one;
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      barrelshifter_B_d1 <= 0;
    end
    else
    begin
      if (start == 1)
      begin
        barrelshifter_B_d1 <= 0;
      end
      else if (fifo_readack == 1)
      begin
        barrelshifter_B_d1 <= barrelshifter_B;
      end
    end
  end

  assign bytes_to_next_boundary = (DATA_WIDTH/8) - address[BYTEENABLE_WIDTH_LOG2-1:0];  
  assign bytes_to_next_boundary_minus_one = bytes_to_next_boundary - 1;
  assign combined_word = barrelshifter_A | barrelshifter_B_d1;

  generate
    genvar input_offset;
    for(input_offset = 0; input_offset < (DATA_WIDTH/8); input_offset = input_offset + 1)
    begin: barrel_shifter_inputs
      assign barrelshifter_input_A[input_offset] = fifo_data << (8 * ((DATA_WIDTH/8)-(input_offset+1)));
      assign barrelshifter_input_B[input_offset] = fifo_data >> (8 * (input_offset + 1));
    end
  endgenerate

  assign barrelshifter_A = barrelshifter_input_A[bytes_to_next_boundary_minus_one_d1];
  assign barrelshifter_B = barrelshifter_input_B[bytes_to_next_boundary_minus_one_d1];
  
  generate
    if (UNALIGNED_ACCESS_ENABLE == 1)
    begin
      assign fifo_readack = (fifo_empty == 0) & (stall == 0) & (waitrequest == 0) & (enable == 1) & (start == 0);
      assign write_data = combined_word;
    end
    else
    begin
      assign fifo_readack = (fifo_empty == 0) & (stall == 0) & (waitrequest == 0) & (enable == 1);
      assign write_data = fifo_data;
    end
  endgenerate

endmodule