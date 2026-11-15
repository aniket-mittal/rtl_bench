module autovcoder_084850 #(
    parameter DATA_WIDTH   = 32*3,
    parameter NUM_INPUT_PORTS = 3,
    parameter SEL_DIWTH    = 2    // log(NUM_INPUT_PORTS) / log(2)
) (
    input clk,
    input rst,
    input [SEL_DIWTH-1:0] sel,
    input [NUM_INPUT_PORTS-1:0] in_valid,
    input [NUM_INPUT_PORTS*DATA_WIDTH-1:0] in,
    output reg [DATA_WIDTH-1:0] out,
    output reg out_valid
);

  reg [NUM_INPUT_PORTS*DATA_WIDTH-1:0] in_reg;

  [MASKED]


endmodule

