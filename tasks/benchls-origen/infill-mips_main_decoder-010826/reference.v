module origen_010826 (
    input [5:0] opcode,
    output reg MtoRFSel,
    output reg RFDSel,
    output reg ALUInSel,
    output reg Branch,
    output reg Jump,
    output reg RFWE,
    output reg DMWE,
    output reg [1:0] ALUOp
);

    always @(*) begin
        case(opcode)
            6'b100011: begin // Load Word
                MtoRFSel = 1'b1;
                RFDSel = 1'b0;
                ALUInSel = 1'b1;
                Branch = 1'b0;
                Jump = 1'b0;
                RFWE = 1'b1;
                DMWE = 1'b0;
                ALUOp = 2'b00;
            end
            6'b101011: begin // Store Word
                MtoRFSel = 1'bx;
                RFDSel = 1'bx;
                ALUInSel = 1'b1;
                Branch = 1'b0;
                Jump = 1'b0;
                RFWE = 1'b0;
                DMWE = 1'b1;
                ALUOp = 2'b00;
            end
            6'b000000: begin // R-type
                MtoRFSel = 1'b0;
                RFDSel = 1'b1;
                ALUInSel = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                RFWE = 1'b1;
                DMWE = 1'b0;
                ALUOp = 2'b10;
            end
            6'b001000: begin // Add Immediate
                MtoRFSel = 1'b0;
                RFDSel = 1'b0;
                ALUInSel = 1'b1;
                Branch = 1'b0;
                Jump = 1'b0;
                RFWE = 1'b1;
                DMWE = 1'b0;
                ALUOp = 2'b00;
            end
            6'b000010: begin // Jump
                MtoRFSel = 1'bx;
                RFDSel = 1'bx;
                ALUInSel = 1'bx;
                Branch = 1'b0;
                Jump = 1'b1;
                RFWE = 1'b0;
                DMWE = 1'b0;
                ALUOp = 2'bxx;
            end
            6'b000100: begin // Branch on Equal
                MtoRFSel = 1'bx;
                RFDSel = 1'bx;
                ALUInSel = 1'b0;
                Branch = 1'b1;
                Jump = 1'b0;
                RFWE = 1'b0;
                DMWE = 1'b0;
                ALUOp = 2'b01;
            end
            default: begin
                MtoRFSel = 1'bx;
                RFDSel = 1'bx;
                ALUInSel = 1'bx;
                Branch = 1'b0;
                Jump = 1'b0;
                RFWE = 1'b0;
                DMWE = 1'b0;
                ALUOp = 2'bxx;
            end
        endcase
    end

endmodule