module origen_047879 (
    input wire clock,
    input wire reset,
    input wire x,
    output reg ready,
    output reg unlock,
    output reg error
);

    // State encoding
    localparam [2:0] 
        s_reset = 3'b000,
        s1      = 3'b001,
        s2      = 3'b010,
        s3      = 3'b011,
        s4      = 3'b100,
        s5      = 3'b101,
        open    = 3'b110,
        s_error = 3'b111;

    reg [2:0] state, next_state;

    // State register
    always @(posedge clock or posedge reset) begin
        if (reset)
            state <= s_reset;
        else
            state <= next_state;
    end

    // Next state logic and output logic
    always @(*) begin
        // Default assignments
        next_state = state;
        ready = 0;
        unlock = 0;
        error = 0;

        case (state)
            s_reset: begin
                ready = 1;
                if (x)
                    next_state = s1;
                else
                    next_state = s_reset;
            end
            s1: begin
                if (!x)
                    next_state = s2;
                else
                    next_state = s_error;
            end
            s2: begin
                if (x)
                    next_state = s3;
                else
                    next_state = s_error;
            end
            s3: begin
                if (!x)
                    next_state = s4;
                else
                    next_state = s_error;
            end
            s4: begin
                if (x)
                    next_state = s5;
                else
                    next_state = s_error;
            end
            s5: begin
                if (x)
                    next_state = open;
                else
                    next_state = s_error;
            end
            open: begin
                unlock = 1;
                if (!x)
                    next_state = s_reset;
            end
            s_error: begin
                error = 1;
                if (!x) begin
                    next_state = s_reset;
                    ready = 1;
                end
            end
            default: next_state = s_reset;
        endcase
    end

endmodule