module origen_007269 (
    input wire clk,
    input wire rst,
    input wire tx_en,
    input wire [7:0] tx_data,
    input wire bpsclk,
    output wire tx_stop,
    output wire tx_out
);

    reg [3:0] i;
    reg rTX;
    reg isDone;

    [MASKED]

    assign tx_out = rTX;
    assign tx_stop = isDone;

endmodule