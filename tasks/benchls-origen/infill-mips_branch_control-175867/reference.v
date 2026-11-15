module origen_175867(
    input [5:0] Opcode,
    input [5:0] Funct,
    input rst_n,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemWrite,
    output reg RegWrite,
    output reg MemtoReg,
    output reg Branch_gtz,
    output reg Branch_ne,
    output reg Branch_eq,
    output reg Branch_gez,
    output reg Branch_lez,
    output reg Branch_ltz,
    output reg [1:0] jump
);

always @(*) begin
    if (rst_n == 1'b0) begin
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        MemWrite = 1'b0;
        RegWrite = 1'b0;
        MemtoReg = 1'b0;
        Branch_gtz = 1'b0;
        Branch_ne = 1'b0;
        Branch_eq = 1'b0;
        Branch_gez = 1'b0;
        Branch_lez = 1'b0;
        Branch_ltz = 1'b0;
        jump = 2'b00;
    end
    else begin
        case (Opcode)
            6'b000000: begin // R-type
                RegDst = 1'b1;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
                Branch_gtz = 1'b0;
                Branch_ne = 1'b0;
                Branch_eq = 1'b0;
                Branch_gez = 1'b0;
                Branch_lez = 1'b0;
                Branch_ltz = 1'b0;
                jump = 2'b00;
            end
            6'b010111: begin // clo, clz
                RegDst = 1'b1;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
                ALUSrc = 1'b0;
                Branch_gtz = 1'b0;
                Branch_ne = 1'b0;
                Branch_eq = 1'b0;
                Branch_gez = 1'b0;
                Branch_lez = 1'b0;
                Branch_ltz = 1'b0;
                jump = 2'b00;
            end
            6'b001000, 6'b001001, 6'b001100, 6'b001101, 6'b001110, 6'b001010, 6'b001011: begin // Immediate instructions
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch_gtz = 1'b0;
                Branch_ne = 1'b0;
                Branch_eq = 1'b0;
                Branch_gez = 1'b0;
                Branch_lez = 1'b0;
                Branch_ltz = 1'b0;
                jump = 2'b00;
            end
            6'b001111: begin // lui
                RegDst = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
                Branch_gtz = 1'b0;
                Branch_ne = 1'b0;
                Branch_eq = 1'b0;
                Branch_gez = 1'b0;
                Branch_lez = 1'b0;
                Branch_ltz = 1'b0;
                jump = 2'b00;
            end
            6'b100011: begin // lw
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                MemtoReg = 1'b1;
                Branch_gtz = 1'b0;
                Branch_ne = 1'b0;
                Branch_eq = 1'b0;
                Branch_gez = 1'b0;
                Branch_lez = 1'b0;
                Branch_ltz = 1'b0;
                jump = 2'b00;
            end
            6'b101011: begin // sw
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                RegWrite = 1'b0;
                Branch_gtz = 1'b0;
                Branch_ne = 1'b0;
                Branch_eq = 1'b0;
                Branch_gez = 1'b0;
                Branch_lez = 1'b0;
                Branch_ltz = 1'b0;
                jump = 2'b00;
            end
            6'b000111, 6'b000101, 6'b000100, 6'b000001, 6'b000110, 6'b000001: begin // Branch instructions
                ALUSrc = 1'b0;
                MemtoReg = 1'b1;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                case (Opcode)
                    6'b000111: Branch_gtz = 1'b1; // bgtz
                    6'b000101: Branch_ne = 1'b1; // bne
                    6'b000100: Branch_eq = 1'b1; // beq
                    6'b000001: begin
                        if (Funct == 6'b000001) Branch_gez = 1'b1; // bgez
                        else if (Funct == 6'b000011) Branch_ltz = 1'b1; // bltz
                        else Branch_lez = 1'b1; // blez
                    end
                    default: ;
                endcase
                jump = 2'b00;
            end
            default: ;
        endcase
    end
end

endmodule