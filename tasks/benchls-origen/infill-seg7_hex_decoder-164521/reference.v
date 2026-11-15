module origen_164521(
    input [3:0] SW,
    output reg [7:0] HEX0,
    output reg [7:0] HEX1
);

    parameter ZERO   = 8'b11000000;
    parameter ONE    = 8'b11111001;
    parameter TWO    = 8'b10100100;
    parameter THREE  = 8'b10110000;
    parameter FOUR   = 8'b10011001;
    parameter FIVE   = 8'b10010010;
    parameter SIX    = 8'b10000010;
    parameter SEVEN  = 8'b11111000;
    parameter EIGHT  = 8'b10000000;
    parameter NINE   = 8'b10010000;
    parameter A      = 8'b10001000;
    parameter B      = 8'b10000011;
    parameter C      = 8'b11000110;
    parameter D      = 8'b10100001;
    parameter E      = 8'b10000110;
    parameter F      = 8'b10001110;

    always @(SW) begin
        case (SW)
            4'b0000: begin
                HEX0 <= ZERO;
                HEX1 <= ZERO;
            end
            4'b0001: begin
                HEX0 <= ONE;
                HEX1 <= ZERO;
            end
            4'b0010: begin
                HEX0 <= TWO;
                HEX1 <= ZERO;
            end
            4'b0011: begin
                HEX0 <= THREE;
                HEX1 <= ZERO;
            end
            4'b0100: begin
                HEX0 <= FOUR;
                HEX1 <= ZERO;
            end
            4'b0101: begin
                HEX0 <= FIVE;
                HEX1 <= ZERO;
            end
            4'b0110: begin
                HEX0 <= SIX;
                HEX1 <= ZERO;
            end
            4'b0111: begin
                HEX0 <= SEVEN;
                HEX1 <= ZERO;
            end
            4'b1000: begin
                HEX0 <= EIGHT;
                HEX1 <= ZERO;
            end
            4'b1001: begin
                HEX0 <= NINE;
                HEX1 <= ZERO;
            end
            4'b1010: begin
                HEX0 <= A;
                HEX1 <= ZERO;
            end
            4'b1011: begin
                HEX0 <= B;
                HEX1 <= ZERO;
            end
            4'b1100: begin
                HEX0 <= C;
                HEX1 <= ZERO;
            end
            4'b1101: begin
                HEX0 <= D;
                HEX1 <= ZERO;
            end
            4'b1110: begin
                HEX0 <= E;
                HEX1 <= ZERO;
            end
            4'b1111: begin
                HEX0 <= F;
                HEX1 <= ZERO;
            end
            default: begin
                HEX0 <= ZERO;
                HEX1 <= ZERO;
            end
        endcase
    end

endmodule