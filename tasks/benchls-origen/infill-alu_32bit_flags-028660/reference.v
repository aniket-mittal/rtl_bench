module origen_028660 (
    input [31:0] A, B,
    input [3:0] ALUctrl,
    output reg [31:0] ALUout,
    output reg N, C, V,
    output Z
);

    wire [32:0] sum;
    wire [32:0] diff;

    assign sum = {1'b0, A} + {1'b0, B};
    assign diff = {1'b0, A} - {1'b0, B};
    assign Z = (ALUout == 32'b0);

    always @(*) begin
        case (ALUctrl)
            4'b0000: begin // AND
                ALUout = A & B;
                {C, V} = 2'bxx;
                N = ALUout[31];
            end
            4'b0001: begin // OR
                ALUout = A | B;
                {C, V} = 2'bxx;
                N = ALUout[31];
            end
            4'b0011: begin // XOR
                ALUout = A ^ B;
                {C, V} = 2'bxx;
                N = ALUout[31];
            end
            4'b0010: begin // Unsigned addition
                ALUout = sum[31:0];
                C = sum[32];
                V = 1'bx;
                N = 1'b0;
            end
            4'b0110: begin // Unsigned subtraction
                ALUout = diff[31:0];
                C = diff[32];
                V = 1'bx;
                N = 1'b0;
            end
            4'b1100: begin // NOR
                ALUout = ~(A | B);
                {C, V} = 2'bxx;
                N = ALUout[31];
            end
            4'b0111: begin // NOT of A
                ALUout = ~A;
                {C, V} = 2'bxx;
                N = ALUout[31];
            end
            4'b1101: begin // Logical left shift of A by 1
                ALUout = A << 1;
                C = A[31];
                V = 1'bx;
                N = ALUout[31];
            end
            4'b1010: begin // Signed addition with overflow detection
                ALUout = sum[31:0];
                C = sum[32];
                V = (A[31] == B[31]) && (A[31] != ALUout[31]);
                N = ALUout[31];
            end
            4'b1110: begin // Signed subtraction with overflow detection
                ALUout = diff[31:0];
                C = diff[32];
                V = (A[31] != B[31]) && (A[31] != ALUout[31]);
                N = ALUout[31];
            end
            4'b1111: begin // Signed comparison
                ALUout = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
                {C, V} = 2'bxx;
                N = ALUout[31];
            end
            4'b0100: begin // Unsigned comparison
                ALUout = (A < B) ? 32'd1 : 32'd0;
                {C, V} = 2'bxx;
                N = 1'b0;
            end
            default: begin
                ALUout = 32'bx;
                {N, C, V} = 3'bxxx;
            end
        endcase
    end

endmodule