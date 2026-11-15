module origen_078679(
    input [5:0] opcode,
    output reg jump,
    output reg memtoreg,
    output reg memwrite,
    output reg branch,
    output reg alusrc,
    output reg regdst,
    output reg regwrite,
    output reg [1:0] aluop
);

always @(*) begin
    case(opcode)
        6'b000000: begin // R-type instruction
            jump = 1'b0;
            memtoreg = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            alusrc = 1'b0;
            regdst = 1'b1;
            regwrite = 1'b1;
            aluop = 2'b10;
        end
        6'b000010: begin // Jump instruction
            jump = 1'b1;
            memtoreg = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            alusrc = 1'b0;
            regdst = 1'b0;
            regwrite = 1'b0;
            aluop = 2'b00;
        end
        6'b000100: begin // Branch instruction
            jump = 1'b0;
            memtoreg = 1'b0;
            memwrite = 1'b0;
            branch = 1'b1;
            alusrc = 1'b0;
            regdst = 1'b0;
            regwrite = 1'b0;
            aluop = 2'b01;
        end
        6'b001000: begin // Immediate instruction (ADDI)
            jump = 1'b0;
            memtoreg = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            alusrc = 1'b1;
            regdst = 1'b0;
            regwrite = 1'b1;
            aluop = 2'b00;
        end
        6'b100011: begin // Load word instruction
            jump = 1'b0;
            memtoreg = 1'b1;
            memwrite = 1'b0;
            branch = 1'b0;
            alusrc = 1'b1;
            regdst = 1'b0;
            regwrite = 1'b1;
            aluop = 2'b00;
        end
        6'b101011: begin // Store word instruction
            jump = 1'b0;
            memtoreg = 1'b1;
            memwrite = 1'b1;
            branch = 1'b0;
            alusrc = 1'b1;
            regdst = 1'b0;
            regwrite = 1'b0;
            aluop = 2'b00;
        end
        default: begin // Default case
            jump = 1'b0;
            memtoreg = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            alusrc = 1'b0;
            regdst = 1'b0;
            regwrite = 1'b0;
            aluop = 2'b00;
        end
    endcase
end

endmodule