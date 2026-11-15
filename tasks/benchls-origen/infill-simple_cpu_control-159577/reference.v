module origen_159577 (
    input  [3:0] opcode,
    output reg [2:0] aluOp,
    output reg memRead,
    output reg memWrite,
    output reg aluSrc,
    output reg [1:0] writeBackControl,
    output reg regWrt,
    output reg branchZero,
    output reg branchNeg,
    output reg jump,
    output reg jumpMem
);

always @(*) begin
    case (opcode)
        4'b0000: begin // Add
            aluOp = 3'b000;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluSrc = 1'b1;
            writeBackControl = 2'b01;
            regWrt = 1'b1;
            branchZero = 1'b0;
            branchNeg = 1'b0;
            jump = 1'b0;
            jumpMem = 1'b0;
        end
        4'b0001: begin // Subtract
            aluOp = 3'b001;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluSrc = 1'b1;
            writeBackControl = 2'b01;
            regWrt = 1'b1;
            branchZero = 1'b0;
            branchNeg = 1'b0;
            jump = 1'b0;
            jumpMem = 1'b0;
        end
        4'b0010: begin // Load Word
            aluOp = 3'b010;
            memRead = 1'b1;
            memWrite = 1'b0;
            aluSrc = 1'b1;
            writeBackControl = 2'b10;
            regWrt = 1'b1;
            branchZero = 1'b0;
            branchNeg = 1'b0;
            jump = 1'b0;
            jumpMem = 1'b0;
        end
        4'b0011: begin // Store Word
            aluOp = 3'b010;
            memRead = 1'b0;
            memWrite = 1'b1;
            aluSrc = 1'b1;
            writeBackControl = 2'b00;
            regWrt = 1'b0;
            branchZero = 1'b0;
            branchNeg = 1'b0;
            jump = 1'b0;
            jumpMem = 1'b0;
        end
        4'b0100: begin // Branch on Zero
            aluOp = 3'b001;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluSrc = 1'b1;
            writeBackControl = 2'b00;
            regWrt = 1'b0;
            branchZero = 1'b1;
            branchNeg = 1'b0;
            jump = 1'b0;
            jumpMem = 1'b0;
        end
        4'b0101: begin // Branch on Negative
            aluOp = 3'b001;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluSrc = 1'b1;
            writeBackControl = 2'b00;
            regWrt = 1'b0;
            branchZero = 1'b0;
            branchNeg = 1'b1;
            jump = 1'b0;
            jumpMem = 1'b0;
        end
        4'b0110: begin // Jump
            aluOp = 3'b010;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluSrc = 1'b1;
            writeBackControl = 2'b00;
            regWrt = 1'b0;
            branchZero = 1'b0;
            branchNeg = 1'b0;
            jump = 1'b1;
            jumpMem = 1'b0;
        end
        4'b0111: begin // Jump and Link
            aluOp = 3'b010;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluSrc = 1'b1;
            writeBackControl = 2'b11;
            regWrt = 1'b1;
            branchZero = 1'b0;
            branchNeg = 1'b0;
            jump = 1'b1;
            jumpMem = 1'b0;
        end
        4'b1000: begin // Jump to Memory
            aluOp = 3'b010;
            memRead = 1'b1;
            memWrite = 1'b0;
            aluSrc = 1'b1;
            writeBackControl = 2'b00;
            regWrt = 1'b0;
            branchZero = 1'b0;
            branchNeg = 1'b0;
            jump = 1'b0;
            jumpMem = 1'b1;
        end
        default: begin
            aluOp = 3'b000;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluSrc = 1'b0;
            writeBackControl = 2'b00;
            regWrt = 1'b0;
            branchZero = 1'b0;
            branchNeg = 1'b0;
            jump = 1'b0;
            jumpMem = 1'b0;
        end
    endcase
end

endmodule