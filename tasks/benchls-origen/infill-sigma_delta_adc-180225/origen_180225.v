module origen_180225(
    input clk,
    input rst,
    input [4:0] divider,
    input difpin,
    output reg refout,
    output reg [15:0] adcval,
    output reg valid
);

reg [4:0] divctr;
reg [15:0] accumulator;
reg [8:0] counter;
reg first_after_reset;

[MASKED]

endmodule