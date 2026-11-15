module origen_111032 #(
    parameter LATENCY = 1
) (
    input wire clock,
    input wire reset,
    input wire data_in,
    output wire data_out
);

    DelayResult #(
        .LATENCY(LATENCY),
        .WORD_SIZE(1)
    ) delay_inst (
        .clock(clock),
        .reset(reset),
        .result(data_in),
        .delayed_result(data_out)
    );

endmodule

module DelayResult #(
    parameter LATENCY = 1,
    parameter WORD_SIZE = 18
) (
    input wire clock,
    input wire reset,
    input wire [WORD_SIZE-1:0] result,
    output wire [WORD_SIZE-1:0] delayed_result
);

    reg [WORD_SIZE-1:0] delay_regs [LATENCY-1:0];
    integer i;

    generate
        if (LATENCY > 0) begin : delay_logic
            [MASKED]
            assign delayed_result = delay_regs[LATENCY-1];
        end else begin : no_delay
            assign delayed_result = result;
        end
    endgenerate

endmodule