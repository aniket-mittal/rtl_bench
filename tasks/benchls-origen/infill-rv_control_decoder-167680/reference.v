module origen_167680(
    input [4:0] inst,
    input [31:0] full,
    output reg [1:0] ALUop,
    output reg branch,
    output reg memRead,
    output reg memToReg,
    output reg memWrite,
    output reg ALUsrc,
    output reg RegWrite,
    output reg jump,
    output reg auipc,
    output reg outnew,
    output reg jal,
    output reg flag
);

always @(*) begin
    case (inst)
        5'b01100: begin // R-type
            ALUop = 2'b10;
            branch = 0;
            memRead = 0;
            memToReg = 0;
            memWrite = 0;
            ALUsrc = 0;
            RegWrite = 1;
            jump = 0;
            auipc = 0;
            outnew = 0;
            jal = 0;
            flag = 0;
        end
        5'b00100: begin // I-type (addi)
            ALUop = 2'b00;
            branch = 0;
            memRead = 0;
            memToReg = 0;
            memWrite = 0;
            ALUsrc = 1;
            RegWrite = 1;
            jump = 0;
            auipc = 0;
            outnew = 0;
            jal = 0;
            flag = 0;
        end
        5'b11000: begin // Branch
            ALUop = 2'b01;
            branch = 1;
            memRead = 0;
            memToReg = 0;
            memWrite = 0;
            ALUsrc = 0;
            RegWrite = 0;
            jump = 0;
            auipc = 0;
            outnew = 0;
            jal = 0;
            flag = 0;
        end
        5'b00000: begin // Load
            ALUop = 2'b00;
            branch = 0;
            memRead = 1;
            memToReg = 1;
            memWrite = 0;
            ALUsrc = 1;
            RegWrite = 1;
            jump = 0;
            auipc = 0;
            outnew = 0;
            jal = 0;
            flag = 0;
        end
        5'b01000: begin // Store
            ALUop = 2'b00;
            branch = 0;
            memRead = 0;
            memToReg = 0;
            memWrite = 1;
            ALUsrc = 1;
            RegWrite = 0;
            jump = 0;
            auipc = 0;
            outnew = 0;
            jal = 0;
            flag = 0;
        end
        5'b11011: begin // Jal
            ALUop = 2'b00;
            branch = 0;
            memRead = 0;
            memToReg = 0;
            memWrite = 0;
            ALUsrc = 0;
            RegWrite = 1;
            jump = 0;
            auipc = 0;
            outnew = 0;
            jal = 1;
            flag = 0;
        end
        5'b11001: begin // Jalr
            ALUop = 2'b00;
            branch = 0;
            memRead = 0;
            memToReg = 0;
            memWrite = 0;
            ALUsrc = 1;
            RegWrite = 1;
            jump = 1;
            auipc = 0;
            outnew = 0;
            jal = 0;
            flag = 0;
        end
        5'b00101: begin // Auipc
            ALUop = 2'b00;
            branch = 0;
            memRead = 0;
            memToReg = 0;
            memWrite = 0;
            ALUsrc = 1;
            RegWrite = 1;
            jump = 0;
            auipc = 1;
            outnew = 0;
            jal = 0;
            flag = 0;
        end
        5'b11100: begin // Fence, Fence.i, Ecall, Ebreak
            if (full[20]) begin
                ALUop = 2'b00;
                branch = 0;
                memRead = 0;
                memToReg = 0;
                memWrite = 0;
                ALUsrc = 0;
                RegWrite = 0;
                jump = 0;
                auipc = 0;
                outnew = 0;
                jal = 0;
                flag = 0;
            end else begin
                ALUop = 2'b00;
                branch = 0;
                memRead = 0;
                memToReg = 0;
                memWrite = 0;
                ALUsrc = 0;
                RegWrite = 0;
                jump = 0;
                auipc = 0;
                outnew = 1;
                jal = 0;
                flag = 1;
            end
        end
        default: begin
            ALUop = 2'b00;
            branch = 0;
            memRead = 0;
            memToReg = 0;
            memWrite = 0;
            ALUsrc = 0;
            RegWrite = 0;
            jump = 0;
            auipc = 0;
            outnew = 0;
            jal = 0;
            flag = 0;
        end
    endcase
end

endmodule