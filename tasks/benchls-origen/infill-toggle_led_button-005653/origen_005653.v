module origen_005653 (
    input wire clk,
    input wire btn,
    input wire reset,
    output reg led
);

    // State encoding
    localparam OFF = 1'b0;
    localparam ON = 1'b1;

    // State registers
    reg stateReg, stateNext;

    // Sequential logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            stateReg <= OFF;
        else
            stateReg <= stateNext;
    end

    // Combinational logic
    reg temp;
    [MASKED]

    // Output logic
    always @(*) begin
        led = temp;
    end

endmodule