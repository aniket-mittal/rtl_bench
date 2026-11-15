module origen_000662 (
    input wire clk,
    input wire resetn,
    input wire x,
    input wire y,
    output reg f,
    output reg g
);

    // State encoding
    localparam [3:0] A = 4'b0000,
                     B = 4'b0001,
                     C = 4'b0010,
                     D = 4'b0011,
                     E = 4'b0100,
                     F = 4'b0101,
                     G = 4'b0110,
                     H = 4'b0111,
                     I = 4'b1000;

    reg [3:0] current_state, next_state;

    // Combinational process for next state logic
    always @(*) begin
        case (current_state)
            A: next_state = resetn ? B : A;
            B: next_state = C;
            C: next_state = x ? D : C;
            D: next_state = x ? D : E;
            E: next_state = x ? F : C;
            F: next_state = y ? H : G;
            G: next_state = y ? H : I;
            H: next_state = H;
            I: next_state = I;
            default: next_state = A;
        endcase
    end

    // Sequential process for state register updates
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            current_state <= A;
        else
            current_state <= next_state;
    end

    // Output logic
    always @(*) begin
        f = (current_state == B);
        g = (current_state == F) || (current_state == G) || (current_state == H);
    end

endmodule