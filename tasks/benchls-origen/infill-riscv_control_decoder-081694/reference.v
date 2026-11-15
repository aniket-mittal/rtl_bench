module origen_081694 (
    input wire [6:0] instr,
    output reg [1:0] RdSrc,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg [1:0] ALUOp
);

    always @(*) begin
        case (instr[6:2])
            5'b01100: begin // R-type arithmetic
                RdSrc = 2'b00;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b1;
                ALUOp = 2'b10;
            end
            5'b00100: begin // I-type arithmetic
                RdSrc = 2'b00;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b10;
            end
            5'b00000: begin // Load
                RdSrc = 2'b00;
                Branch = 1'b0;
                MemRead = 1'b1;
                MemtoReg = 1'b1;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b00;
            end
            5'b01000: begin // Store
                RdSrc = 2'bxx;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'bx;
                MemWrite = 1'b1;
                ALUSrc = 1'b1;
                RegWrite = 1'b0;
                ALUOp = 2'b00;
            end
            5'b11000: begin // Branch
                RdSrc = 2'bxx;
                Branch = 1'b1;
                MemRead = 1'b0;
                MemtoReg = 1'bx;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b0;
                ALUOp = 2'b01;
            end
            5'b11011: begin // JAL
                RdSrc = 2'b10;
                Branch = 1'b1;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'bx;
                RegWrite = 1'b1;
                ALUOp = 2'b00;
            end
            5'b00101: begin // AUIPC
                RdSrc = 2'b11;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b00;
            end
            5'b11001: begin // JALR
                RdSrc = 2'b10;
                Branch = 1'b1;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b00;
            end
            5'b01101: begin // LUI
                RdSrc = 2'b01;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'bx;
                RegWrite = 1'b1;
                ALUOp = 2'b00;
            end
            5'b11100: begin // System
                RdSrc = 2'bxx;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'bx;
                MemWrite = 1'b0;
                ALUSrc = 1'bx;
                RegWrite = 1'b0;
                ALUOp = 2'b00;
            end
            5'b00011: begin // Fence
                RdSrc = 2'bxx;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'bx;
                MemWrite = 1'b0;
                ALUSrc = 1'bx;
                RegWrite = 1'b0;
                ALUOp = 2'b00;
            end
            default: begin
                RdSrc = 2'b00;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b0;
                ALUOp = 2'b00;
            end
        endcase
    end

endmodule