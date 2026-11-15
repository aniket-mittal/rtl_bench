module jesd204_crc12 #(
  parameter WIDTH = 64
) (
  input clk,
  input reset,

  input init,

  input [WIDTH-1:0] data_in,
  output [11:0] crc12
);

  reg [11:0] state = 12'b0;

  wire [WIDTH-1:0] feedback;
  wire [WIDTH-1+12:0] full_state;

  assign full_state = {init ? 12'h0 : state, feedback};
  assign feedback = full_state[WIDTH-1+12:12] ^
                    full_state[WIDTH-1:11] ^
                    full_state[WIDTH-1:10] ^
                    full_state[WIDTH-1:9] ^
                    full_state[WIDTH-1:4] ^
                    full_state[WIDTH-1:3] ^
                    data_in;

  [MASKED]

  assign crc12 = state;

endmodule