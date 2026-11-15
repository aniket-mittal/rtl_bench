module origen_208881(
    input  signed [31:0] A,
    input  signed [31:0] B,
    input  [4:0] Op,
    output signed [31:0] C,
    output Over
);

    reg signed [31:0] result;
    reg over_flag;

    always @(*) begin
        case (Op)
            5'b00000: begin // Addition
                {over_flag, result} = A + B;
            end
            5'b00001: begin // Subtraction
                {over_flag, result} = A - B;
            end
            5'b00010: begin // Bitwise OR
                result = A | B;
                over_flag = 0;
            end
            5'b00011: begin // 16-bit left shift on B
                result = B << 16;
                over_flag = 0;
            end
            5'b00100: begin // Left shift on A by amount in B
                result = A << B[4:0];
                over_flag = 0;
            end
            5'b00111: begin // Left shift on B by amount in A
                result = B << A[4:0];
                over_flag = 0;
            end
            5'b00101: begin // Logical right shift on A by amount in B
                result = A >> B[4:0];
                over_flag = 0;
            end
            5'b01000: begin // Logical right shift on B by amount in A
                result = B >> A[4:0];
                over_flag = 0;
            end
            5'b00110: begin // Arithmetic right shift on A by amount in B
                result = A >>> B[4:0];
                over_flag = 0;
            end
            5'b01001: begin // Arithmetic right shift on B by amount in A
                result = B >>> A[4:0];
                over_flag = 0;
            end
            5'b01010: begin // Bitwise AND
                result = A & B;
                over_flag = 0;
            end
            5'b01011: begin // Bitwise OR
                result = A | B;
                over_flag = 0;
            end
            5'b01100: begin // Bitwise XOR
                result = A ^ B;
                over_flag = 0;
            end
            5'b01101: begin // Bitwise NOR
                result = ~(A | B);
                over_flag = 0;
            end
            5'b01110: begin // Signed comparison (A < B)
                result = (A < B) ? 32'b1 : 32'b0;
                over_flag = 0;
            end
            5'b01111: begin // Signed comparison (A >= B)
                result = (A >= B) ? 32'b1 : 32'b0;
                over_flag = 0;
            end
            5'b10000: begin // Bitwise XOR and store result
                result = A ^ B;
                over_flag = 0;
            end
            default: begin
                result = 32'b0;
                over_flag = 0;
            end
        endcase
    end

    assign C = result;
    assign Over = over_flag;

endmodule