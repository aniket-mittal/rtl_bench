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
            always @(posedge clock) begin
                if (reset) begin
                    for (i = 0; i < LATENCY; i = i + 1) begin
                        delay_regs[i] <= {WORD_SIZE{1'b0}};
                    end
                end else begin
                    for (i = LATENCY-1; i > 0; i = i - 1) begin
                        delay_regs[i] <= delay_regs[i-1];
                    end
                    delay_regs[0] <= result;
                end
            end
            assign delayed_result = delay_regs[LATENCY-1];
        end else begin : no_delay
            assign delayed_result = result;
        end
    endgenerate

endmodule