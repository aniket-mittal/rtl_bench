module origen_064983 (
    input wire reset,
    input wire startStop,
    input wire clock,
    output reg [7:0] seconds,
    output reg [7:0] minutes,
    output reg [7:0] hours
);

    parameter secondReference = 25_175_000;

    reg keepCounting;
    reg [24:0] counter;
    reg startStop_prev;

    [MASKED]

endmodule