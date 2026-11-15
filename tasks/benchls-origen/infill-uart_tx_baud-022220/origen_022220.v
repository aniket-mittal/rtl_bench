module origen_022220 (
    input wire clk_input,
    input wire [7:0] data_input,
    input wire data_load,
    input wire [31:0] baudRate,
    output reg tx_pin,
    output reg tx_complete
);

    reg [3:0] caseIndex;
    reg [3:0] bitIndex;
    reg [31:0] baudRateReg;
    reg [9:0] shiftReg;

    [MASKED]

endmodule