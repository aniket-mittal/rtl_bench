module origen_063106(
    input [9:0] SW,
    input [0:0] KEY,
    output [9:0] LEDR
);

    wire clk, reset, w;
    reg [8:0] state, next_state;
    wire z;

    assign clk = KEY[0];
    assign reset = SW[0];
    assign w = SW[1];

    // State encoding
    localparam A = 9'b000000001,
               B = 9'b000000010,
               C = 9'b000000100,
               D = 9'b000001000,
               E = 9'b000010000,
               F = 9'b000100000,
               G = 9'b001000000,
               H = 9'b010000000,
               I = 9'b100000000;

    // State transition logic
    always @(*) begin
        case (state)
            A: next_state = w ? F : B;
            B: next_state = C;
            C: next_state = D;
            D: next_state = E;
            E: next_state = A;
            F: next_state = G;
            G: next_state = H;
            H: next_state = I;
            I: next_state = A;
            default: next_state = A;
        endcase
    end

    // State storage
    always @(posedge clk or negedge reset) begin
        if (!reset)
            state <= A;
        else
            state <= next_state;
    end

    // Output logic
    assign z = (state == E) || (state == I);
    assign LEDR[8:0] = state;
    assign LEDR[9] = z;

endmodule