module autovcoder_020638 #(
    parameter OVERSAMPLE = 250,
    parameter DATA_WIDTH = 32,
    parameter CHANNELS   = 2
) (
    input wire xclk_i,
    input wire reset_n,

    input wire signed [31:0] right_i,
    input wire signed [31:0] left_i,

    output wire signed [31:0] right_o,
    output wire signed [31:0] left_o,
    output wire               ready_o,

    output wire xck_o,
    output wire bclk_o,
    output wire daclrck_o,
    output wire dacdat_o,
    output wire adclrck_o,
    input  wire adcdat_i
);

  localparam BCLK_VALUE = (OVERSAMPLE / (DATA_WIDTH * CHANNELS * 2)) - 1;
  localparam LRCK_VALUE = (OVERSAMPLE / (CHANNELS)) - 1;

  localparam IDLE_S = 2'b00;
  localparam BCLK_S = 2'b01;

  reg [1:0] FSM_STATE = IDLE_S;
  reg [31:0]
      dac_right = 0, dac_left = 0, adc_left = 0, adc_right = 0, adc_left_reg = 0, adc_right_reg = 0;
  reg [10:0] bclk_counter = BCLK_VALUE, lrck_counter = 62;
  reg [$clog2(DATA_WIDTH)-1:0] bits_counter = DATA_WIDTH - 1;
  reg lrck = 1, bclk = 1, valid_out = 0;
  reg done = 0;

  [MASKED]

  assign xck_o = xclk_i;
  assign bclk_o = bclk;
  assign daclrck_o = lrck;
  assign adclrck_o = lrck;
  assign dacdat_o = (lrck == 1'b0) ? (dac_right[31]) : (dac_left[31]);

  assign left_o = adc_left_reg;
  assign right_o = adc_right_reg;
  assign ready_o = valid_out;

endmodule

