module origen_206635(
    input [6:0] op,
    output reg RegWrite,
    output reg [3:0] ALUop,
    output reg ALUsrc,
    output reg branchCtrl,
    output reg PCtoRegSrc,
    output reg [1:0] RDsrc,
    output reg MRead,
    output reg MWrite,
    output reg MenToReg,
    output reg [1:0] ImmType
);

always @(*) begin
    case(op)
        7'b0110011: begin // R-type
            RegWrite = 1'b1;
            ALUop = 4'b0010;
            ALUsrc = 1'b0;
            branchCtrl = 1'b0;
            PCtoRegSrc = 1'b0;
            RDsrc = 2'b00;
            MRead = 1'b0;
            MWrite = 1'b0;
            MenToReg = 1'b0;
            ImmType = 2'b00;
        end
        7'b0100011: begin // S-type
            RegWrite = 1'b0;
            ALUop = 4'b0010;
            ALUsrc = 1'b1;
            branchCtrl = 1'b0;
            PCtoRegSrc = 1'b0;
            RDsrc = 2'b01;
            MRead = 1'b0;
            MWrite = 1'b1;
            MenToReg = 1'bx;
            ImmType = 2'b01;
        end
        7'b1100011: begin // B-type
            RegWrite = 1'b0;
            ALUop = 4'b0001;
            ALUsrc = 1'b0;
            branchCtrl = 1'b1;
            PCtoRegSrc = 1'b0;
            RDsrc = 2'bxx;
            MRead = 1'b0;
            MWrite = 1'b0;
            MenToReg = 1'bx;
            ImmType = 2'b10;
        end
        7'b0010111, 7'b0110111: begin // U-type
            RegWrite = 1'b1;
            ALUop = 4'b0110;
            ALUsrc = 1'b1;
            branchCtrl = 1'b0;
            PCtoRegSrc = 1'b1;
            RDsrc = 2'b00;
            MRead = 1'b0;
            MWrite = 1'b0;
            MenToReg = 1'b0;
            ImmType = 2'b11;
        end
        7'b1101111: begin // J-type
            RegWrite = 1'b1;
            ALUop = 4'b0110;
            ALUsrc = 1'b1;
            branchCtrl = 1'b1;
            PCtoRegSrc = 1'b1;
            RDsrc = 2'b00;
            MRead = 1'b0;
            MWrite = 1'b0;
            MenToReg = 1'b0;
            ImmType = 2'b11;
        end
        7'b0000011, 7'b0010011: begin // I-type
            RegWrite = 1'b1;
            ALUop = 4'b0010;
            ALUsrc = 1'b1;
            branchCtrl = 1'b0;
            PCtoRegSrc = 1'b0;
            RDsrc = 2'b00;
            MRead = op[3];
            MWrite = 1'b0;
            MenToReg = op[3];
            ImmType = 2'b00;
        end
        default: begin // Other instructions
            RegWrite = 1'b0;
            ALUop = 4'b0000;
            ALUsrc = 1'b0;
            branchCtrl = 1'b0;
            PCtoRegSrc = 1'b0;
            RDsrc = 2'b00;
            MRead = 1'b0;
            MWrite = 1'b0;
            MenToReg = 1'b0;
            ImmType = 2'b00;
        end
    endcase
end

endmodule