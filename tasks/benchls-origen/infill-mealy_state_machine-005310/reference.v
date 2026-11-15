module origen_005310(
    input x,
    input clk,
    input reset,
    output [2:0] y
);

    // State encoding
    parameter [2:0] s0 = 3'b000,
                    s1 = 3'b001,
                    s2 = 3'b010,
                    s3 = 3'b011,
                    s4 = 3'b100;

    // State registers
    reg [2:0] state_reg, state_next;

    // Debug register
    reg [15:0] aut;

    // State register update
    always @(posedge clk or posedge reset) begin
        if (reset)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end

    // Next state logic
    always @(*) begin
        case (state_reg)
            s0: state_next = x ? s1 : s2;
            s1: state_next = x ? s3 : s4;
            s2: state_next = x ? s4 : s0;
            s3: state_next = x ? s0 : s1;
            s4: state_next = x ? s2 : s3;
            default: state_next = s0;
        endcase
    end

    // Output assignment
    assign y = state_reg;

    // Debug ASCII representation
    always @(state_reg) begin
        case (state_reg)
            s0: aut = "s0";
            s1: aut = "s1";
            s2: aut = "s2";
            s3: aut = "s3";
            s4: aut = "s4";
            default: aut = "??";
        endcase
    end

endmodule