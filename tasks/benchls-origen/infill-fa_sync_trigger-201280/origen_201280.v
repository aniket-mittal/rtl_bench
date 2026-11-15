module origen_201280 #(
    parameter FA_DIVISOR = 8'd100,
    parameter WATCHDOG   = 16'd10000
)
(
    input  wire       clk,
    input  wire       triggerIn,
    input  wire       FAenable,
    output wire       FAmarker,
    output reg        isSynchronized,
    output reg        triggered
);

    reg [7:0] fa_counter;
    reg [7:0] fa_stretch;
    reg [15:0] watchdog;

    reg triggerIn_d1;

    [MASKED]

    assign FAmarker = (fa_stretch != 0);

endmodule