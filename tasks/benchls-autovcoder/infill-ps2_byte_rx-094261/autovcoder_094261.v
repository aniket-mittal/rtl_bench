module autovcoder_094261 (
    // -- PS/2 input
    input ps2_clk,
    input ps2_data,

    // -- asynchronous reset
    input res,

    // -- data is valid when ready goes high
    output reg ready = 0,
    output reg error = 0,
    output reg [7:0] data
);

  `define BIT_START 0
  `define BIT_DATA_LSB 1
  `define BIT_DATA_MSB 8
  `define BIT_PARITY 9
  `define BIT_STOP 10

  reg  [10:0] buffer = 0;
  wire [10:0] buffer_next = {ps2_data, buffer[10:1]};
  reg  [ 3:0] state = 0;

  [MASKED]

endmodule

