module origen_057735(
    input [5:0] op,
    input [5:0] funct,
    output reg [2:0] ALUOp,
    output reg MemWrite,
    output reg [1:0] MemtoReg,
    output reg RegWrite,
    output reg [1:0] RegDst,
    output reg [1:0] EXTOp,
    output reg Beq_if,
    output reg Bne_if,
    output reg J_if,
    output reg Jr_if,
    output reg Bgezal_if
);

    always @(*) begin
        // Default values
        ALUOp = 3'b000;
        MemWrite = 1'b0;
        MemtoReg = 2'b00;
        RegWrite = 1'b0;
        RegDst = 2'b00;
        EXTOp = 2'b00;
        Beq_if = 1'b0;
        Bne_if = 1'b0;
        J_if = 1'b0;
        Jr_if = 1'b0;
        Bgezal_if = 1'b0;

        case(op)
            6'b000000: begin // R-type instructions
                case(funct)
                    6'b100001: begin // addu
                        ALUOp = 3'b000;
                        MemtoReg = 2'b01;
                        RegWrite = 1'b1;
                        RegDst = 2'b01;
                    end
                    6'b100011: begin // subu
                        ALUOp = 3'b001;
                        MemtoReg = 2'b01;
                        RegWrite = 1'b1;
                        RegDst = 2'b01;
                    end
                    6'b001000: begin // jr
                        J_if = 1'b1;
                        Jr_if = 1'b1;
                    end
                endcase
            end
            6'b000010: begin // j
                J_if = 1'b1;
            end
            6'b000011: begin // jal
                J_if = 1'b1;
                MemtoReg = 2'b01;
                RegWrite = 1'b1;
                RegDst = 2'b10;
            end
            6'b000100: begin // beq
                Beq_if = 1'b1;
                EXTOp = 2'b01;
            end
            6'b000101: begin // bne
                Bne_if = 1'b1;
                EXTOp = 2'b01;
            end
            6'b000111: begin // bgezal
                J_if = 1'b1;
                Bgezal_if = 1'b1;
                MemtoReg = 2'b01;
                RegWrite = 1'b1;
                RegDst = 2'b10;
                EXTOp = 2'b01;
            end
            6'b001101: begin // ori
                ALUOp = 3'b010;
                MemtoReg = 2'b01;
                RegWrite = 1'b1;
            end
            6'b001111: begin // lui
                MemtoReg = 2'b01;
                RegWrite = 1'b1;
                EXTOp = 2'b10;
            end
            6'b100011: begin // lw
                RegWrite = 1'b1;
                EXTOp = 2'b01;
            end
            6'b101011: begin // sw
                MemWrite = 1'b1;
                EXTOp = 2'b01;
            end
        endcase
    end

endmodule