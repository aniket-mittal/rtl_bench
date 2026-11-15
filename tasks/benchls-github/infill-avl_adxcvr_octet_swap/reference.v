module avl_adxcvr_octet_swap #(
  parameter NUM_OF_LANES = 1
) (
  input clk,
  input reset,

  input in_valid,
  output in_ready,
  input [NUM_OF_LANES*32-1:0] in_data,
  input [3:0] in_sof,

  output out_valid,
  input out_ready,
  output [NUM_OF_LANES*32-1:0] out_data,
  output [3:0] out_sof
);

  assign in_ready = out_ready;
  assign out_valid = in_valid;

  generate
    genvar i;
    genvar j;

    for (j = 0; j < 4; j = j + 1) begin: gen_octet
      for (i = 0; i < NUM_OF_LANES; i = i + 1) begin: gen_lane
        assign out_data[i*32+j*8+7:i*32+j*8] = in_data[i*32+(3-j)*8+7:i*32+(3-j)*8];
      end
      assign out_sof[j] = in_sof[3-j];
    end
  endgenerate

endmodule