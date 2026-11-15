module origen_030179(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUop,
    output reg [31:0] Result,
    output reg Overflow,
    output reg CarryOut,
    output Zero
);

    wire [31:0] add_result;
    wire [31:0] sub_result;
    wire add_overflow, sub_overflow;
    wire add_carry, sub_carry;

    assign add_result = A + B;
    assign sub_result = A + (~B + 1);
    
    assign add_overflow = (A[31] == B[31]) && (A[31] != add_result[31]);
    assign sub_overflow = (A[31] != B[31]) && (A[31] != sub_result[31]);
    
    assign add_carry = (A[31] & B[31]) | ((A[31] | B[31]) & ~add_result[31]);
    assign sub_carry = (A[31] & ~B[31]) | ((A[31] | ~B[31]) & ~sub_result[31]);

    always @(*) begin
        case(ALUop)
            4'b0000: Result = A & B;
            4'b0001: Result = A | B;
            4'b0010: Result = add_result;
            4'b0011: Result = B << A[4:0];
            4'b0100: Result = $signed(B) >>> A[4:0];
            4'b0101: Result = B >> A[4:0];
            4'b0110: Result = sub_result;
            4'b0111: Result = {31'b0, $signed(A) < $signed(B)};
            4'b1000: Result = A ^ B;
            default: Result = 32'b0;
        endcase

        case(ALUop)
            4'b0010: begin
                Overflow = add_overflow;
                CarryOut = add_carry;
            end
            4'b0110: begin
                Overflow = sub_overflow;
                CarryOut = sub_carry;
            end
            default: begin
                Overflow = 1'b0;
                CarryOut = 1'b0;
            end
        endcase
    end

    assign Zero = (Result == 32'b0);

endmodule