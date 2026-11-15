module autovcoder_117388 (
    input CLOCK,
    input [2:0] color,
    output reg O_TX_SERIAL
);
  // input [7:0]TX_BYTE removed for now may be added later 
  // Time period 20ns freq = 50MHz
  parameter clks_per_bit = 434;
  parameter IDLE = 3'b000;
  parameter TX_START_BIT = 3'B001;
  parameter TX_DATA_BITS = 3'b011;
  parameter TX_STOP_BIT = 3'b100;

  parameter HASH = 8'b00100011;
  parameter DASH = 8'b00101101;
  parameter CHARS = 8'b01010011;
  parameter CHARI = 8'b01001001;
  parameter CHARF = 8'b01000110;
  parameter CHARC = 8'b01000011;
  parameter CHART = 8'b01010100;
  parameter CHARW = 8'b01010111;
  parameter CHARN = 8'b01001110;
  parameter CHARO = 8'b01001111;
  parameter CHARD = 8'b01000100;
  parameter CHARE = 8'b01000101;
  parameter ZERO = 8'b00110000;

  reg TX_DATA_VALID = 1;  //inputs
  reg [3:0] next_limit = 9;
  reg [3:0] next = 0;
  reg [2:0] r_state = IDLE;
  reg [8:0] r_clock_count = 0;
  reg [2:0] r_bit_index = 0;
  reg [7:0] r_data_bits = 0;
  reg r_TX_DONE = 0;

  [MASKED]

endmodule

