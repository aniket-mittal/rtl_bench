module origen_199381(
    input clock,
    input reset,
    input request,
    input blocked,
    output red,
    output green,
    output waiting
);

`ifdef FORMAL
    parameter GREEN_PERIOD = 5;
`else
    parameter GREEN_PERIOD = 10000;
`endif

    reg [7:0] state;
    reg [31:0] counter;

    localparam STATE_IDLE = 8'b00000001;
    localparam STATE_WAIT = 8'b00000010;
    localparam STATE_GREEN = 8'b00000100;

    [MASKED]

    assign waiting = (state == STATE_WAIT);
    assign green = (state == STATE_GREEN);
    assign red = !green;

endmodule