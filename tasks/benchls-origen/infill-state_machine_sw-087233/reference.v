module origen_087233(
    input [2:0] SW,
    input KEY0,
    output reg [6:0] HEX0, HEX1,
    output reg LEDG0,
    output reg [1:0] LEDR
);

    // State encoding
    parameter I = 3'b000, A = 3'b001, B = 3'b010, C = 3'b011, D = 3'b100, E = 3'b101;
    
    reg [2:0] state, next_state;

    // State transition logic
    always @(posedge KEY0) begin
        state <= next_state;
    end

    always @(*) begin
        case(state)
            I: begin
                if (SW[1:0] == 2'b10) next_state = A;
                else if (SW[1:0] == 2'b01) next_state = B;
                else if (SW[1:0] == 2'b11) next_state = C;
                else next_state = I;
            end
            A: begin
                if (SW[2]) next_state = D;
                else next_state = E;
            end
            B: begin
                if (SW[1:0] == 2'b00) next_state = I;
                else next_state = B;
            end
            C: begin
                if (SW[1:0] == 2'b01) next_state = B;
                else next_state = C;
            end
            D, E: begin
                if (SW[1:0] == 2'b00) next_state = I;
                else next_state = state;
            end
            default: next_state = I;
        endcase
    end

    // Output logic
    always @(*) begin
        case(state)
            I: begin
                HEX0 = 7'b1111001; // Display "I"
                HEX1 = 7'b1111111; // Off
                LEDG0 = 0;
                LEDR = 2'b00;
            end
            A: begin
                HEX0 = 7'b0001000; // Display "A"
                HEX1 = 7'b1111111; // Off
                LEDG0 = 1;
                LEDR = 2'b00;
            end
            B: begin
                HEX0 = 7'b0000011; // Display "b"
                HEX1 = 7'b1111111; // Off
                LEDG0 = 1;
                LEDR = 2'b00;
            end
            C: begin
                HEX0 = 7'b1000110; // Display "C"
                HEX1 = 7'b1111111; // Off
                LEDG0 = 0;
                LEDR = 2'b01;
            end
            D: begin
                HEX0 = 7'b0100001; // Display "d"
                HEX1 = 7'b1111111; // Off
                LEDG0 = 0;
                LEDR = 2'b11;
            end
            E: begin
                HEX0 = 7'b0000110; // Display "E"
                HEX1 = 7'b1111111; // Off
                LEDG0 = 0;
                LEDR = 2'b00;
            end
            default: begin
                HEX0 = 7'b1111111; // Off
                HEX1 = 7'b1111111; // Off
                LEDG0 = 0;
                LEDR = 2'b00;
            end
        endcase
    end

endmodule