module origen_103029 (
    input logic Clk, Reset, LoadA, LoadB, Execute,
    output logic Shift_En, Ld_A, Ld_B
);

    // State encoding
    parameter [3:0] A=4'b0000, B=4'b0001, C=4'b0010, D=4'b0011, E=4'b0100,
                    F=4'b0101, G=4'b0110, H=4'b0111, I=4'b1000, J=4'b1001;

    reg [3:0] current_state, next_state;

    // Sequential logic
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            current_state <= A;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            A: next_state = Execute ? B : A;
            B: next_state = C;
            C: next_state = D;
            D: next_state = E;
            E: next_state = F;
            F: next_state = G;
            G: next_state = H;
            H: next_state = I;
            I: next_state = J;
            J: next_state = Execute ? J : A;
            default: next_state = A;
        endcase
    end

    // Output logic
    always @(*) begin
        Shift_En = 1'b0;
        Ld_A = 1'b0;
        Ld_B = 1'b0;

        case (current_state)
            A: begin
                Ld_A = LoadA;
                Ld_B = LoadB;
            end
            B, C, D, E, F, G, H, I: begin
                Shift_En = 1'b1;
            end
            default: begin
                // State J: all outputs disabled
            end
        endcase
    end

endmodule