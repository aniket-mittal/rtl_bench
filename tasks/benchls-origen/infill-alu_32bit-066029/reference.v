module origen_066029 (
    input [2:0] ALU_OP,
    input [31:0] A, B,
    output reg [31:0] F,
    output reg ZF,
    output reg OF
);

    reg [32:0] temp;
    reg carry_out;

    always @(*) begin
        case (ALU_OP)
            3'b000: begin // AND
                F = A & B;
                OF = 1'b0;
            end
            3'b001: begin // OR
                F = A | B;
                OF = 1'b0;
            end
            3'b010: begin // XOR
                F = A ^ B;
                OF = 1'b0;
            end
            3'b011: begin // NOR
                F = ~(A | B);
                OF = 1'b0;
            end
            3'b100: begin // Addition
                temp = {1'b0, A} + {1'b0, B};
                F = temp[31:0];
                OF = temp[32] ^ temp[31];
            end
            3'b101: begin // Subtraction
                temp = {1'b0, A} - {1'b0, B};
                F = temp[31:0];
                carry_out = temp[32];
                OF = (A[31] ^ B[31]) & (A[31] ^ F[31]);
            end
            3'b110: begin // Set Less Than (SLT)
                F = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
                OF = 1'b0;
            end
            3'b111: begin // Left Shift
                F = A << B[4:0];
                OF = 1'b0;
            end
        endcase

        ZF = (F == 32'd0) ? 1'b1 : 1'b0;
    end

endmodule