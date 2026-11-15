module origen_193785(
    input [5:0] opcode,
    output reg regdst,
    output reg regwrite,
    output reg memtoreg,
    output reg alusrc,
    output reg er,
    output reg ew,
    output reg PCSrc,
    output reg jump,
    output reg [2:0] aluop
);

always @(*) begin
    case (opcode)
        6'b000000: begin // R-type instructions
            regdst = 1'b1;
            regwrite = 1'b1;
            memtoreg = 1'b0;
            alusrc = 1'b0;
            er = 1'b0;
            ew = 1'b0;
            PCSrc = 1'b0;
            jump = 1'b0;
            aluop = 3'b010; // ALU operation depends on funct field
        end
        6'b100011: begin // Load word (lw)
            regdst = 1'b0;
            regwrite = 1'b1;
            memtoreg = 1'b1;
            alusrc = 1'b1;
            er = 1'b1;
            ew = 1'b0;
            PCSrc = 1'b0;
            jump = 1'b0;
            aluop = 3'b000; // Addition
        end
        6'b101011: begin // Store word (sw)
            regdst = 1'b0; // Don't care
            regwrite = 1'b0;
            memtoreg = 1'b0; // Don't care
            alusrc = 1'b1;
            er = 1'b0;
            ew = 1'b1;
            PCSrc = 1'b0;
            jump = 1'b0;
            aluop = 3'b000; // Addition
        end
        6'b000100: begin // Branch (beq)
            regdst = 1'b0; // Don't care
            regwrite = 1'b0;
            memtoreg = 1'b0; // Don't care
            alusrc = 1'b0;
            er = 1'b0;
            ew = 1'b0;
            PCSrc = 1'b1;
            jump = 1'b0;
            aluop = 3'b001; // Subtraction
        end
        6'b000010: begin // Jump (j)
            regdst = 1'b0; // Don't care
            regwrite = 1'b0;
            memtoreg = 1'b0; // Don't care
            alusrc = 1'b0; // Don't care
            er = 1'b0;
            ew = 1'b0;
            PCSrc = 1'b1;
            jump = 1'b1;
            aluop = 3'b000; // Don't care
        end
        6'b001000, 6'b001100, 6'b001101, 6'b001010: begin // Other immediate instructions
            regdst = 1'b0;
            regwrite = 1'b1;
            memtoreg = 1'b0;
            alusrc = 1'b1;
            er = 1'b0;
            ew = 1'b0;
            PCSrc = 1'b0;
            jump = 1'b0;
            aluop = 3'b010; // ALU operation depends on opcode
        end
        default: begin
            regdst = 1'b0;
            regwrite = 1'b0;
            memtoreg = 1'b0;
            alusrc = 1'b0;
            er = 1'b0;
            ew = 1'b0;
            PCSrc = 1'b0;
            jump = 1'b0;
            aluop = 3'b000;
        end
    endcase
end

endmodule