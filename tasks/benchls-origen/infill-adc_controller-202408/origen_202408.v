module origen_202408 (
    input RESET_n,
    input CLOCK_50MHz,
    input [1:0] ADC_OUT,
    output reg ADC_CNVST,
    output reg ADC_CS_N,
    output reg ADC_REFSEL,
    output reg ADC_SCLK,
    output reg ADC_SD,
    output reg ADC_UB,
    output reg ADC_SEL,
    output reg BUSY,
    output reg [7:0] DATA_AD0,
    output reg [7:0] DATA_AD1
);

    reg [11:0] data0, data1;
    reg [3:0] state;
    reg [3:0] count;
    parameter IDLE = 4'd0, START_CONV = 4'd1, WAIT_CONV = 4'd2, READ_DATA0 = 4'd3, READ_DATA1 = 4'd4, DONE = 4'd5;

    [MASKED]

endmodule