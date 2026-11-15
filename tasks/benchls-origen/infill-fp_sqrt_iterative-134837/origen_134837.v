module origen_134837 #(
    parameter INPUT_WIDTH = 17,
    parameter OUTPUT_WIDTH = 9,
    parameter EXCEPTION_WIDTH = 4,
    parameter ROUNDING_MODE_WIDTH = 3,
    parameter floatControlWidth = 5
) (
    input wire nReset,
    input wire clock,
    input wire inValid,
    input wire [INPUT_WIDTH-1:0] a,
    input wire [ROUNDING_MODE_WIDTH-1:0] roundingMode,
    input wire [floatControlWidth-1:0] control,
    output reg inReady,
    output reg outValid,
    output reg [OUTPUT_WIDTH-1:0] out,
    output reg [EXCEPTION_WIDTH-1:0] exceptionFlags
);

    localparam IDLE = 2'b00;
    localparam CALCULATE = 2'b01;
    localparam FINISH = 2'b10;

    reg [1:0] state;
    reg [INPUT_WIDTH-1:0] x;
    reg [OUTPUT_WIDTH-1:0] y;
    reg [OUTPUT_WIDTH:0] m;
    reg [5:0] i;

    [MASKED]

endmodule