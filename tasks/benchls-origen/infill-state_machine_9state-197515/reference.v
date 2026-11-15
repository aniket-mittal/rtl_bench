module origen_197515 (
    input [9:0] SW,
    input KEY,
    output [9:0] LEDR
);

    // Define the states
    parameter A = 9'b000000001;
    parameter B = 9'b000000010;
    parameter C = 9'b000000100;
    parameter D = 9'b000001000;
    parameter E = 9'b000010000;
    parameter F = 9'b000100000;
    parameter G = 9'b001000000;
    parameter H = 9'b010000000;
    parameter I = 9'b100000000;

    // Inputs and outputs
    wire reset = SW[0];
    wire w = SW[1];
    wire clk = KEY;
    reg [8:0] state, state_next;
    wire z;

    // Next state logic
    always @(*) begin
        case (state)
            A: state_next = w ? B : A;
            B: state_next = w ? C : A;
            C: state_next = w ? D : B;
            D: state_next = w ? E : C;
            E: state_next = w ? F : D;
            F: state_next = w ? G : E;
            G: state_next = w ? H : F;
            H: state_next = w ? I : G;
            I: state_next = w ? A : H;
            default: state_next = A;
        endcase
    end

    // State register
    always @(posedge clk, posedge reset) begin
        if (reset)
            state <= A;
        else
            state <= state_next;
    end

    // Output logic
    assign LEDR[8:0] = state;
    assign LEDR[9] = (state == E) | (state == I);
    assign z = LEDR[9];

endmodule