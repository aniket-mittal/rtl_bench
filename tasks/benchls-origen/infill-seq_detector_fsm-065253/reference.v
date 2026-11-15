module origen_065253 (
    input wire clk,
    input wire rst,
    input wire inp,
    output reg outp
);

    // State encoding
    localparam [1:0] A = 2'b00,
                     B = 2'b01,
                     C = 2'b10,
                     D = 2'b11;

    reg [1:0] state, next_state;

    // State transitions
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= A;
        else
            state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        next_state = A; // Default next state
        outp = 1'b0;    // Default output

        case (state)
            A: begin
                next_state = inp ? B : A;
            end
            B: begin
                next_state = inp ? C : A;
            end
            C: begin
                if (inp)
                    next_state = D;
                else begin
                    next_state = A;
                    outp = 1'b1;
                end
            end
            D: begin
                next_state = inp ? D : A;
            end
            default: begin
                next_state = A;
                outp = 1'b0;
            end
        endcase
    end

endmodule