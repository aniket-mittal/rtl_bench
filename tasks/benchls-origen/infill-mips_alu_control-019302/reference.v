module origen_019302(
    input [5:0] OP,
    input [5:0] func,
    output reg RegWrite,
    output reg RegDist,
    output reg ALUSrc,
    output reg [2:0] ALUControl,
    output reg Branch,
    output reg MemWrite,
    output reg MemtoReg,
    output reg jump
);

    always @(*) begin
        case(OP)
            6'b100011: begin // LOAD (LW)
                RegWrite = 1'b1;
                RegDist = 1'b0;
                ALUSrc = 1'b1;
                ALUControl = 3'b010;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                jump = 1'b0;
            end
            6'b101011: begin // STORE (SW)
                RegWrite = 1'b0;
                RegDist = 1'bx;
                ALUSrc = 1'b1;
                ALUControl = 3'b010;
                Branch = 1'b0;
                MemWrite = 1'b1;
                MemtoReg = 1'bx;
                jump = 1'b0;
            end
            6'b000000: begin // ADD_SUB (R-type)
                RegWrite = 1'b1;
                RegDist = 1'b1;
                ALUSrc = 1'b0;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                jump = 1'b0;
                case(func[3:0])
                    4'b0000: ALUControl = 3'b010; // ADD
                    4'b0010: ALUControl = 3'b110; // SUB
                    4'b0100: ALUControl = 3'b000; // AND
                    4'b0101: ALUControl = 3'b001; // OR
                    4'b1010: ALUControl = 3'b111; // SLT
                    default: ALUControl = 3'bxxx;
                endcase
            end
            6'b001101: begin // ORI
                RegWrite = 1'b1;
                RegDist = 1'b0;
                ALUSrc = 1'b1;
                ALUControl = 3'b001;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                jump = 1'b0;
            end
            6'b000111: begin // BGTZ
                RegWrite = 1'b0;
                RegDist = 1'bx;
                ALUSrc = 1'b0;
                ALUControl = 3'b011;
                Branch = 1'b1;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                jump = 1'b0;
            end
            6'b000010: begin // JUMP
                RegWrite = 1'b0;
                RegDist = 1'bx;
                ALUSrc = 1'bx;
                ALUControl = 3'bxxx;
                Branch = 1'bx;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                jump = 1'b1;
            end
            6'b001000: begin // ADDI
                RegWrite = 1'b1;
                RegDist = 1'b0;
                ALUSrc = 1'b1;
                ALUControl = 3'b010;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                jump = 1'b0;
            end
            default: begin
                RegWrite = 1'b0;
                RegDist = 1'bx;
                ALUSrc = 1'bx;
                ALUControl = 3'bxxx;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                jump = 1'b0;
            end
        endcase
    end

endmodule