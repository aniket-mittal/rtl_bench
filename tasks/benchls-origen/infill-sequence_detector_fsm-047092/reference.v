module origen_047092 (
    input wire clk,
    input wire reset_n,
    input wire a,
    input wire b,
    output reg enter,
    output reg exit
);

    // State encoding
    localparam [2:0] s0 = 3'b000,
                     s1 = 3'b001,
                     s2 = 3'b010,
                     s3 = 3'b011,
                     s4 = 3'b100,
                     s5 = 3'b101,
                     s6 = 3'b110;

    // State register
    reg [2:0] state_reg, state_next;

    // State register logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end

    // Next state logic
    always @(*) begin
        state_next = state_reg; // Default: stay in current state
        case (state_reg)
            s0: if (a && !b) state_next = s1;
                else if (!a && b) state_next = s4;
            s1: if (!a && b) state_next = s2;
                else if (!a && !b) state_next = s0;
            s2: if (a && b) state_next = s3;
                else if (!a && !b) state_next = s0;
            s3: if (!a && !b) state_next = s0;
            s4: if (a && b) state_next = s5;
                else if (!a && !b) state_next = s0;
            s5: if (!a && b) state_next = s6;
                else if (!a && !b) state_next = s0;
            s6: if (!a && !b) state_next = s0;
            default: state_next = s0;
        endcase
    end

    // Output logic
    always @(*) begin
        enter = (state_reg == s3) && (state_next == s0);
        exit = (state_reg == s6) && (state_next == s0);
    end

endmodule