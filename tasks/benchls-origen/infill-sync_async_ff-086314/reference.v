module origen_086314(
    input wire in1, in2, reset, clock,
    output reg out1, out2
);

    // Synchronous flip-flop
    always @(posedge clock) begin
        if (reset)
            out1 <= 1'b0;
        else
            out1 <= in1;
    end

    // Asynchronous flip-flop
    always @(posedge clock or posedge reset) begin
        if (reset)
            out2 <= 1'b0;
        else
            out2 <= in2;
    end

endmodule

