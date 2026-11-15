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
    always @(*) begin
        case (stateReg)
            OFF: begin
                temp = 1'b0;
                if (btn)
                    stateNext = ON;
                else
                    stateNext = OFF;
            end
            ON: begin
                temp = 1'b1;
                if (btn)
                    stateNext = OFF;
                else
                    stateNext = ON;
            end
            default: begin
                temp = 1'b0;
                stateNext = OFF;
            end
        endcase
    end

    // Output logic
    always @(*) begin
        led = temp;
    end

endmodule