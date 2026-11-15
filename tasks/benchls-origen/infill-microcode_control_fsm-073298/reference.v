module origen_073298(
    input [10:0] op,
    input CLK,
    input CLR,
    output reg [15:0] control
);

    reg [3:0] state, nextstate;

    // State definitions
    parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011,
              S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110;

    // State transition logic
    always @(negedge CLK or negedge CLR) begin
        if (!CLR)
            state <= S0;
        else
            state <= nextstate;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: nextstate = S1;
            S1: nextstate = S2;
            S2: nextstate = S3;
            S3: nextstate = S4;
            S4: begin
                if (op == 11'b00000100000)
                    nextstate = S5;
                else if (op == 11'b00000010000)
                    nextstate = S6;
                else
                    nextstate = S4;
            end
            S5: nextstate = S1;
            S6: nextstate = S1;
            default: nextstate = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            S0: control = 16'b0000000000000001;
            S1: control = 16'b0000000000001000;
            S2, S3: control = 16'b0000000000010000;
            S4: control = 16'b0000000010000100;
            S5: control = 16'b0000001000000000;
            S6: control = 16'b0000000100000000;
            default: control = 16'b0000000000000000;
        endcase
    end

endmodule