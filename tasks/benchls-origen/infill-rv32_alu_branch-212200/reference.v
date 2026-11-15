module origen_212200(
    input [31:0] A,
    input [31:0] B,
    input [6:0] opcode,
    input [2:0] func3,
    input func7,
    output reg B_cond,
    output reg [31:0] alu_out
);

always @(*) begin
    case (opcode)
        7'b0110111: // LUI
            alu_out = {B[31:12], 12'b0};
        7'b0010111: // AUIPC
            alu_out = A + {B[31:12], 12'b0};
        7'b1101111: // JAL
            alu_out = A + 32'd4;
        7'b1100111: // JALR
            alu_out = A + 32'd4;
        7'b1100011: // B
            case (func3)
                3'b000: // BEQ
                    B_cond = (A == B);
                3'b001: // BNE
                    B_cond = (A != B);
                3'b100: // BLT
                    B_cond = ($signed(A) < $signed(B));
                3'b101: // BGE
                    B_cond = ($signed(A) >= $signed(B));
                3'b110: // BLTU
                    B_cond = (A < B);
                3'b111: // BGEU
                    B_cond = (A >= B);
                default:
                    B_cond = 1'b0;
            endcase
        7'b0000011: // L
            alu_out = A + B;
        7'b0100011: // S
            alu_out = A + B;
        7'b0010011: // AI
            case (func3)
                3'b000: // ADDI
                    alu_out = A + B;
                3'b001: // SLLI
                    alu_out = A << B[4:0];
                3'b010: // SLTI
                    alu_out = {31'b0, ($signed(A) < $signed(B))};
                3'b011: // SLTIU
                    alu_out = {31'b0, (A < B)};
                3'b100: // XORI
                    alu_out = A ^ B;
                3'b101: // SRLI, SRAI
                    alu_out = (func7) ? ($signed(A) >>> B[4:0]) : (A >> B[4:0]);
                3'b110: // ORI
                    alu_out = A | B;
                3'b111: // ANDI
                    alu_out = A & B;
                default:
                    alu_out = 32'b0;
            endcase
        7'b0110011: // AR
            case (func3)
                3'b000: // ADD, SUB
                    alu_out = (func7) ? (A - B) : (A + B);
                3'b001: // SLL
                    alu_out = A << (B[4:0]);
                3'b010: // SLT
                    alu_out = {31'b0, ($signed(A) < $signed(B))};
                3'b011: // SLTU
                    alu_out = {31'b0, (A < B)};
                3'b100: // XOR
                    alu_out = A ^ B;
                3'b101: // SRL, SRA
                    alu_out = (func7) ? ($signed(A) >>> B[4:0]) : (A >> B[4:0]);
                3'b110: // OR
                    alu_out = A | B;
                3'b111: // AND
                    alu_out = A & B;
                default:
                    alu_out = 32'b0;
            endcase
        default:
            alu_out = 32'b0;
    endcase
end

endmodule