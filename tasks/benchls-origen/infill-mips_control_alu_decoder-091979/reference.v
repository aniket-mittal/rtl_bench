module origen_091979(
    input [5:0] Op,
    input [5:0] Funct,
    output reg MemtoReg,
    output reg MemWrite,
    output reg Branch,
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite,
    output reg [2:0] ALUControl
);

    reg [1:0] ALUOp;

    always @* begin
        case(Op)
            6'd0: begin // R-type
                RegWrite = 1'b1;
                RegDst = 1'b1;
                ALUSrc = 1'b0;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                ALUOp = 2'b10;
            end
            6'b100011: begin // Load word
                RegWrite = 1'b1;
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                ALUOp = 2'b00;
            end
            6'b101011: begin // Store word
                RegWrite = 1'b0;
                ALUSrc = 1'b1;
                Branch = 1'b0;
                MemWrite = 1'b1;
                ALUOp = 2'b00;
                RegDst = 1'bx;
                MemtoReg = 1'bx;
            end
            6'b000100: begin // Branch on equal
                RegWrite = 1'b0;
                ALUSrc = 1'b0;
                Branch = 1'b1;
                MemWrite = 1'b0;
                ALUOp = 2'b01;
                RegDst = 1'bx;
                MemtoReg = 1'bx;
            end
            6'b001000: begin // Add immediate
                RegWrite = 1'b1;
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                ALUOp = 2'b00;
            end
            default: begin
                RegWrite = 1'bx;
                RegDst = 1'bx;
                ALUSrc = 1'bx;
                Branch = 1'bx;
                MemWrite = 1'bx;
                MemtoReg = 1'bx;
                ALUOp = 2'bxx;
            end
        endcase
    end

    always @* begin
        case(ALUOp)
            2'b00: ALUControl = 3'b010; // Add
            2'b01: ALUControl = 3'b110; // Subtract
            2'b10: begin
                case(Funct)
                    6'b100000: ALUControl = 3'b010; // Add
                    6'b100010: ALUControl = 3'b110; // Subtract
                    6'b100100: ALUControl = 3'b000; // AND
                    6'b100101: ALUControl = 3'b001; // OR
                    6'b101010: ALUControl = 3'b111; // Set-on-less-than
                    default:   ALUControl = 3'bxxx;
                endcase
            end
            default: ALUControl = 3'bxxx;
        endcase
    end

endmodule