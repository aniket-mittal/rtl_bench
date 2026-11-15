module origen_041372 (
    input [1:0] vz,
    input clock,
    input start,
    input clear,
    output reg [4:0] controller_out
);

    // State encoding
    parameter [6:0] A = 7'b0000001,
                    B = 7'b0000010,
                    C = 7'b0000100,
                    D = 7'b0001000,
                    E = 7'b0010000,
                    F = 7'b0100000,
                    G = 7'b1000000;

    reg [6:0] current_state, next_state;

    // State transition logic
    always @(*) begin
        case (current_state)
            A: case (vz)
                2'b00: next_state = B;
                2'b01: next_state = C;
                2'b10: next_state = D;
                2'b11: next_state = E;
            endcase
            B: case (vz)
                2'b00: next_state = C;
                2'b01: next_state = D;
                2'b10: next_state = E;
                2'b11: next_state = F;
            endcase
            C: case (vz)
                2'b00: next_state = D;
                2'b01: next_state = E;
                2'b10: next_state = F;
                2'b11: next_state = G;
            endcase
            D: case (vz)
                2'b00: next_state = E;
                2'b01: next_state = F;
                2'b10: next_state = G;
                2'b11: next_state = A;
            endcase
            E: case (vz)
                2'b00: next_state = F;
                2'b01: next_state = G;
                2'b10: next_state = A;
                2'b11: next_state = B;
            endcase
            F: case (vz)
                2'b00: next_state = G;
                2'b01: next_state = A;
                2'b10: next_state = B;
                2'b11: next_state = C;
            endcase
            G: case (vz)
                2'b00: next_state = A;
                2'b01: next_state = B;
                2'b10: next_state = C;
                2'b11: next_state = D;
            endcase
            default: next_state = A;
        endcase
    end

    // State update logic
    always @(posedge clock) begin
        if (!clear)
            current_state <= 7'b0;
        else if (start)
            current_state <= A;
        else
            current_state <= next_state;
    end

    // Output logic
    always @(*) begin
        case (current_state)
            A: controller_out = 5'b00110;
            B: controller_out = 5'b10101;
            C: controller_out = 5'b01110;
            D: controller_out = 5'b11001;
            E: controller_out = 5'b01101;
            F: controller_out = 5'b01000;
            G: controller_out = 5'b10001;
            default: controller_out = 5'b00000;
        endcase
    end

endmodule