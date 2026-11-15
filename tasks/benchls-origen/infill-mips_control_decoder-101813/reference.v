module origen_101813(
    input [5:0] op,
    input [5:0] funct,
    output reg MemToReg,
    output reg MemWrite,
    output reg MemRead,
    output reg Branch,
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite,
    output reg [1:0] ALUOp,
    output reg [3:0] ALUControl
);

    always @(*) begin
        // Instruction Decoding
        case(op)
            6'b000000: begin // R-type
                RegWrite = 1'b1;
                RegDst = 1'b1;
                ALUSrc = 1'b0;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                ALUOp = 2'b10;
            end
            6'b100011: begin // Load word
                RegWrite = 1'b1;
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                Branch = 1'b0;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                MemToReg = 1'b1;
                ALUOp = 2'b00;
            end
            6'b101011: begin // Store word
                RegWrite = 1'b0;
                RegDst = 1'bx;
                ALUSrc = 1'b1;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                MemToReg = 1'bx;
                ALUOp = 2'b00;
            end
            6'b000100: begin // Branch on equal
                RegWrite = 1'b0;
                RegDst = 1'bx;
                ALUSrc = 1'b0;
                Branch = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'bx;
                ALUOp = 2'b01;
            end
            default: begin
                RegWrite = 1'bx;
                RegDst = 1'bx;
                ALUSrc = 1'bx;
                Branch = 1'bx;
                MemRead = 1'bx;
                MemWrite = 1'bx;
                MemToReg = 1'bx;
                ALUOp = 2'bxx;
            end
        endcase

        // ALU Control Generation
        case(ALUOp)
            2'b00: ALUControl = 4'b0010; // Add for load/store
            2'b01: ALUControl = 4'b0110; // Subtract for branch
            2'b10: begin // R-type
                case(funct)
                    6'b100000: ALUControl = 4'b0010; // Add
                    6'b100010: ALUControl = 4'b0110; // Subtract
                    6'b100100: ALUControl = 4'b0000; // AND
                    6'b100101: ALUControl = 4'b0001; // OR
                    6'b101010: ALUControl = 4'b0111; // Set on less than
                    6'b111110: ALUControl = 4'b1010; // Custom operation
                    default:   ALUControl = 4'b0110; // Default to subtract
                endcase
            end
            default: ALUControl = 4'b0110; // Default to subtract
        endcase
    end

endmodule