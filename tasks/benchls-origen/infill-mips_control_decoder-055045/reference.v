module origen_055045(
    input [5:0] Op,
    input [5:0] Func,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemWrite,
    output reg nPC_sel,
    output reg ExtOp,
    output reg [2:0] ALUOp,
    output reg Jump,
    output reg RegRa,
    output reg JReg,
    output reg Jalr,
    output reg Lb
);

    parameter special = 6'b000000;
    parameter ori = 6'b001101;
    parameter lw = 6'b100011;
    parameter sw = 6'b101011;
    parameter beq = 6'b000100;
    parameter j = 6'b000010;
    parameter jal = 6'b000011;
    parameter lb = 6'b100000;

    always @(*) begin
        // Default values
        RegDst = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemWrite = 0;
        nPC_sel = 0;
        ExtOp = 0;
        ALUOp = 3'b000;
        Jump = 0;
        RegRa = 0;
        JReg = 0;
        Jalr = 0;
        Lb = 0;

        case(Op)
            special: begin
                RegDst = 1;
                RegWrite = 1;
                case(Func)
                    6'b100001: ALUOp = 3'b010; // addu
                    6'b100011: ALUOp = 3'b110; // subu
                    6'b000000: ALUOp = 3'b011; // sll
                    6'b001000: begin // jr
                        JReg = 1;
                        RegWrite = 0;
                    end
                    6'b001001: begin // jalr
                        JReg = 1;
                        Jalr = 1;
                    end
                endcase
            end
            ori: begin
                ALUSrc = 1;
                RegWrite = 1;
                ALUOp = 3'b001;
            end
            lw: begin
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                ExtOp = 1;
                ALUOp = 3'b010;
            end
            sw: begin
                ALUSrc = 1;
                MemWrite = 1;
                ExtOp = 1;
                ALUOp = 3'b010;
            end
            beq: begin
                nPC_sel = 1;
                ExtOp = 1;
                ALUOp = 3'b110;
            end
            j: begin
                Jump = 1;
            end
            jal: begin
                Jump = 1;
                RegRa = 1;
                RegWrite = 1;
            end
            lb: begin
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                ExtOp = 1;
                ALUOp = 3'b010;
                Lb = 1;
            end
        endcase
    end

endmodule