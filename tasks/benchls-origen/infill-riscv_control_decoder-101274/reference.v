module origen_101274 (
    input [6:0] IN,
    output reg [1:0] ALUOP,
    output reg Brach, PCRead, MemtoReg, MemWrite, ALUSrc, RegWrite, AddPC, MemRead
);

always @(*) begin
    case (IN)
        7'b0000011: begin // Load
            ALUOP = 2'b00;
            Brach = 1'b0;
            PCRead = 1'b0;
            MemtoReg = 1'b1;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            AddPC = 1'b1;
            MemRead = 1'b1;
        end
        7'b0010011: begin // I-type ALU
            ALUOP = 2'b10;
            Brach = 1'b0;
            PCRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            AddPC = 1'b1;
            MemRead = 1'b0;
        end
        7'b0100011: begin // Store
            ALUOP = 2'b00;
            Brach = 1'b0;
            PCRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
            AddPC = 1'b1;
            MemRead = 1'b0;
        end
        7'b0110011: begin // R-type ALU
            ALUOP = 2'b10;
            Brach = 1'b0;
            PCRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            AddPC = 1'b1;
            MemRead = 1'b0;
        end
        7'b1100011: begin // Branch
            ALUOP = 2'b01;
            Brach = 1'b1;
            PCRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            AddPC = 1'b0;
            MemRead = 1'b0;
        end
        7'b1100111: begin // JALR
            ALUOP = 2'b00;
            Brach = 1'b0;
            PCRead = 1'b1;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            AddPC = 1'b0;
            MemRead = 1'b0;
        end
        7'b1101111: begin // JAL
            ALUOP = 2'b00;
            Brach = 1'b0;
            PCRead = 1'b1;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            AddPC = 1'b0;
            MemRead = 1'b0;
        end
        7'b0110111: begin // LUI
            ALUOP = 2'b00;
            Brach = 1'b0;
            PCRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            AddPC = 1'b1;
            MemRead = 1'b0;
        end
        7'b0010111: begin // AUIPC
            ALUOP = 2'b00;
            Brach = 1'b0;
            PCRead = 1'b1;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            AddPC = 1'b1;
            MemRead = 1'b0;
        end
        default: begin
            ALUOP = 2'b00;
            Brach = 1'b0;
            PCRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            AddPC = 1'b0;
            MemRead = 1'b0;
        end
    endcase
end

endmodule