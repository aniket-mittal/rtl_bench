module origen_049589 (
    input [15:0] PORT1, PORT2,
    input [2:0] ALUCON,
    output reg [15:0] ALUOUT,
    output reg carry
);

    reg [16:0] temp;

    always @(*) begin
        case (ALUCON)
            3'b000: begin // Addition
                temp = PORT1 + PORT2;
                ALUOUT = temp[15:0];
                carry = (PORT1[15] & PORT2[15] & ~ALUOUT[15]) | (~PORT1[15] & ~PORT2[15] & ALUOUT[15]);
            end
            3'b001: begin // Subtraction
                temp = PORT1 - PORT2;
                ALUOUT = temp[15:0];
                carry = (PORT1[15] & ~PORT2[15] & ~ALUOUT[15]) | (~PORT1[15] & PORT2[15] & ALUOUT[15]);
            end
            3'b010: begin // Bitwise AND
                ALUOUT = PORT1 & PORT2;
                carry = 1'b0;
            end
            3'b011: begin // Bitwise OR
                ALUOUT = PORT1 | PORT2;
                carry = 1'b0;
            end
            3'b100: begin // Bitwise XOR
                ALUOUT = PORT1 ^ PORT2;
                carry = 1'b0;
            end
            3'b101: begin // Bitwise NOT
                ALUOUT = ~PORT1;
                carry = 1'b0;
            end
            3'b110: begin // Left Shift
                ALUOUT = PORT1 << 1;
                carry = 1'b0;
            end
            3'b111: begin // Right Shift
                ALUOUT = PORT1 >> 1;
                carry = 1'b0;
            end
            default: begin
                ALUOUT = 16'b0;
                carry = 1'b0;
            end
        endcase
    end

endmodule