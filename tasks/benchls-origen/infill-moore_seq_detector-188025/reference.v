module origen_188025(
    input In1,
    input RST,
    input CLK,
    output reg Out1
);

    reg [1:0] current_state, next_state;

    parameter A = 2'b00, B = 2'b01, C = 2'b10;

    // State Memory
    always @(posedge CLK) begin
        if (!RST)
            current_state <= A;
        else
            current_state <= next_state;
    end

    // Next State Logic
    always @(*) begin
        case (current_state)
            A: begin
                if (In1)
                    next_state = B;
                else
                    next_state = A;
            end
            B: begin
                if (In1)
                    next_state = B;
                else
                    next_state = C;
            end
            C: begin
                if (In1)
                    next_state = A;
                else
                    next_state = C;
            end
            default: next_state = A;
        endcase
    end

    // Output Logic
    always @(*) begin
        case (current_state)
            A, B: Out1 = 1'b0;
            C: Out1 = 1'b1;
            default: Out1 = 1'b0;
        endcase
    end

endmodule