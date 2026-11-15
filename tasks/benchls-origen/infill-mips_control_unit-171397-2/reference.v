module origen_171397(
    input [5:0] opcode,
    input [5:0] funct,
    input Less, Gre, Equ, Judge,
    output reg [1:0] NPCOp,
    output reg GRFWr,
    output reg EXTOp,
    output reg [1:0] ALUOp,
    output reg DMWr,
    output reg [1:0] A3Sel,
    output reg [1:0] WDSel,
    output reg BSel,
    output reg Br,
    output reg Lah_Sel
);

always @(*) begin
    case (opcode)
        6'b000000: begin // R-type
            case (funct)
                6'b100001: begin // ADDU
                    NPCOp = 2'b00;
                    GRFWr = 1'b1;
                    EXTOp = 1'b0;
                    ALUOp = 2'b00;
                    DMWr = 1'b0;
                    A3Sel = 2'b01;
                    WDSel = 2'b00;
                    BSel = 1'b0;
                    Br = 1'b0;
                    Lah_Sel = 1'b0;
                end
                6'b100011: begin // SUBU
                    NPCOp = 2'b00;
                    GRFWr = 1'b1;
                    EXTOp = 1'b0;
                    ALUOp = 2'b01;
                    DMWr = 1'b0;
                    A3Sel = 2'b01;
                    WDSel = 2'b00;
                    BSel = 1'b0;
                    Br = 1'b0;
                    Lah_Sel = 1'b0;
                end
                6'b001000: begin // JR
                    NPCOp = 2'b10;
                    GRFWr = 1'b0;
                    EXTOp = 1'b0;
                    ALUOp = 2'b00;
                    DMWr = 1'b0;
                    A3Sel = 2'b00;
                    WDSel = 2'b00;
                    BSel = 1'b0;
                    Br = 1'b0;
                    Lah_Sel = 1'b0;
                end
            endcase
        end
        6'b001101: begin // ORI
            NPCOp = 2'b00;
            GRFWr = 1'b1;
            EXTOp = 1'b0;
            ALUOp = 2'b10;
            DMWr = 1'b0;
            A3Sel = 2'b01;
            WDSel = 2'b01;
            BSel = 1'b1;
            Br = 1'b0;
            Lah_Sel = 1'b0;
        end
        6'b100011: begin // LW
            NPCOp = 2'b00;
            GRFWr = 1'b1;
            EXTOp = 1'b1;
            ALUOp = 2'b00;
            DMWr = 1'b0;
            A3Sel = 2'b01;
            WDSel = 2'b10;
            BSel = 1'b1;
            Br = 1'b0;
            Lah_Sel = 1'b0;
        end
        6'b101011: begin // SW
            NPCOp = 2'b00;
            GRFWr = 1'b0;
            EXTOp = 1'b1;
            ALUOp = 2'b00;
            DMWr = 1'b1;
            A3Sel = 2'b00;
            WDSel = 2'b00;
            BSel = 1'b1;
            Br = 1'b0;
            Lah_Sel = 1'b0;
        end
        6'b000100: begin // BEQ
            NPCOp = Equ ? 2'b01 : 2'b00;
            GRFWr = 1'b0;
            EXTOp = 1'b1;
            ALUOp = 2'b01;
            DMWr = 1'b0;
            A3Sel = 2'b00;
            WDSel = 2'b00;
            BSel = 1'b0;
            Br = Equ;
            Lah_Sel = 1'b0;
        end
        6'b001111: begin // LUI
            NPCOp = 2'b00;
            GRFWr = 1'b1;
            EXTOp = 1'b1;
            ALUOp = 2'b11;
            DMWr = 1'b0;
            A3Sel = 2'b01;
            WDSel = 2'b01;
            BSel = 1'b1;
            Br = 1'b0;
            Lah_Sel = 1'b0;
        end
        6'b000000: begin // BSZEAL
            NPCOp = Judge ? 2'b01 : 2'b00;
            GRFWr = 1'b0;
            EXTOp = 1'b1;
            ALUOp = 2'b01;
            DMWr = 1'b0;
            A3Sel = 2'b00;
            WDSel = 2'b00;
            BSel = 1'b0;
            Br = Judge;
            Lah_Sel = 1'b0;
        end
        6'b000011: begin // JAL
            NPCOp = 2'b01;
            GRFWr = 1'b1;
            EXTOp = 1'b0;
            ALUOp = 2'b00;
            DMWr = 1'b0;
            A3Sel = 2'b10;
            WDSel = 2'b11;
            BSel = 1'b0;
            Br = 1'b0;
            Lah_Sel = 1'b0;
        end
        6'b010010: begin // LAH
            NPCOp = 2'b00;
            GRFWr = 1'b1;
            EXTOp = 1'b0;
            ALUOp = 2'b00;
            DMWr = 1'b0;
            A3Sel = 2'b01;
            WDSel = 2'b00;
            BSel = 1'b0;
            Br = 1'b0;
            Lah_Sel = 1'b1;
        end
        default: begin
            NPCOp = 2'b00;
            GRFWr = 1'b0;
            EXTOp = 1'b0;
            ALUOp = 2'b00;
            DMWr = 1'b0;
            A3Sel = 2'b00;
            WDSel = 2'b00;
            BSel = 1'b0;
            Br = 1'b0;
            Lah_Sel = 1'b0;
        end
    endcase
end

endmodule