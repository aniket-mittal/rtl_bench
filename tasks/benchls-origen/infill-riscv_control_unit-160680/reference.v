module origen_160680 (
    input wire [6:0] opcode,
    output reg RegWrite,
    output reg ImmType,
    output reg PCToRegSrc,
    output reg RDSrc,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
    output reg ALUSrc,
    output reg [2:0] ALUOp
);

    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-type
                RegWrite = 1'b1;
                ImmType = 1'b0;
                PCToRegSrc = 1'b0;
                RDSrc = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                ALUSrc = 1'b0;
                ALUOp = 3'b110;
            end
            7'b0000011: begin // I-type (load)
                RegWrite = 1'b1;
                ImmType = 1'b1;
                PCToRegSrc = 1'b0;
                RDSrc = 1'b0;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                MemToReg = 1'b1;
                ALUSrc = 1'b1;
                ALUOp = 3'b000;
            end
            7'b0100011: begin // S-type (store)
                RegWrite = 1'b0;
                ImmType = 1'b1;
                PCToRegSrc = 1'b0;
                RDSrc = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                MemToReg = 1'b0;
                ALUSrc = 1'b1;
                ALUOp = 3'b000;
            end
            7'b1100011: begin // B-type (branch)
                RegWrite = 1'b0;
                ImmType = 1'b1;
                PCToRegSrc = 1'b0;
                RDSrc = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                ALUSrc = 1'b1;
                ALUOp = 3'b001;
            end
            7'b0010011: begin // I-type (immediate)
                RegWrite = 1'b1;
                ImmType = 1'b1;
                PCToRegSrc = 1'b0;
                RDSrc = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                ALUSrc = 1'b1;
                ALUOp = 3'b010;
            end
            7'b0110111: begin // U-type (LUI)
                RegWrite = 1'b1;
                ImmType = 1'b1;
                PCToRegSrc = 1'b0;
                RDSrc = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                ALUSrc = 1'b1;
                ALUOp = 3'b011;
            end
            7'b1101111: begin // J-type (JAL)
                RegWrite = 1'b1;
                ImmType = 1'b1;
                PCToRegSrc = 1'b1;
                RDSrc = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                ALUSrc = 1'b1;
                ALUOp = 3'b100;
            end
            default: begin
                RegWrite = 1'b0;
                ImmType = 1'b0;
                PCToRegSrc = 1'b0;
                RDSrc = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                ALUSrc = 1'b0;
                ALUOp = 3'b000;
            end
        endcase
    end

endmodule