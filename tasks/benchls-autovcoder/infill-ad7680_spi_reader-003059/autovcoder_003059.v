module autovcoder_003059 #(
    parameter ms_wait = 99,
    parameter ms_clk1_a = 100,
    parameter ms_clk11_a = 140
) (
    input wire reset,
    input wire dataclk,
    input wire [31:0] main_state,
    input wire [5:0] channel,
    input wire ADC_DOUT,
    output reg ADC_CS,
    output reg ADC_SCLK,
    output reg [15:0] ADC_register
);

  // AD7680 16-bit ADC SPI output logic
  // (See Analog Devices AD7680 datasheet for more information.)

  [MASKED]

endmodule

