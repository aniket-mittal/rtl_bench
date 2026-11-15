module origen_209013 (
    input [31:0] instr,
    input over,
    input Gez,
    output reg [1:0] NPCOp,
    output reg RFWr,
    output reg EXTOp,
    output reg [2:0] ALUOp,
    output reg DMWr,
    output reg [1:0] A3Sel,
    output reg [1:0] WDSel,
    output reg DMSel,
    output reg BSel,
    output reg [15:0] imm16,
    output reg [25:0] addr26,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [4:0] A3,
    output reg [1:0] Tuse_rs,
    output reg [1:0] Tuse_rt,
    output reg [1:0] Tnew_E,
    output reg [1:0] Tnew_M
);

    always @(*) begin
        case (instr[31:26])
            6'b000000: begin // R-type
                case (instr[5:0])
                    6'b100001: begin // ADDU
                        NPCOp = 2'b00;
                        RFWr = 1'b1;
                        EXTOp = 1'b0;
                        ALUOp = 3'b000;
                        DMWr = 1'b0;
                        A3Sel = 2'b01;
                        WDSel = 2'b00;
                        DMSel = 1'b0;
                        BSel = 1'b1;
                        imm16 = 16'b0;
                        addr26 = 26'b0;
                        rs = instr[25:21];
                        rt = instr[20:16];
                        rd = instr[15:11];
                        A3 = instr[15:11];
                        Tuse_rs = 2'b01;
                        Tuse_rt = 2'b01;
                        Tnew_E = 2'b10;
                        Tnew_M = 2'b11;
                    end
                    // Add more R-type instructions here
                endcase
            end
            6'b100011: begin // LW
                NPCOp = 2'b00;
                RFWr = 1'b1;
                EXTOp = 1'b1;
                ALUOp = 3'b000;
                DMWr = 1'b0;
                A3Sel = 2'b00;
                WDSel = 2'b01;
                DMSel = 1'b0;
                BSel = 1'b0;
                imm16 = instr[15:0];
                addr26 = 26'b0;
                rs = instr[25:21];
                rt = instr[20:16];
                rd = 5'b0;
                A3 = instr[20:16];
                Tuse_rs = 2'b01;
                Tuse_rt = 2'b11;
                Tnew_E = 2'b10;
                Tnew_M = 2'b11;
            end
            6'b101011: begin // SW
                NPCOp = 2'b00;
                RFWr = 1'b0;
                EXTOp = 1'b1;
                ALUOp = 3'b000;
                DMWr = 1'b1;
                A3Sel = 2'b11;
                WDSel = 2'b10;
                DMSel = 1'b0;
                BSel = 1'b0;
                imm16 = instr[15:0];
                addr26 = 26'b0;
                rs = instr[25:21];
                rt = instr[20:16];
                rd = 5'b0;
                A3 = 5'b0;
                Tuse_rs = 2'b01;
                Tuse_rt = 2'b01;
                Tnew_E = 2'b10;
                Tnew_M = 2'b11;
            end
            6'b000100: begin // BEQ
                NPCOp = 2'b01;
                RFWr = 1'b0;
                EXTOp = 1'b1;
                ALUOp = 3'b001;
                DMWr = 1'b0;
                A3Sel = 2'b11;
                WDSel = 2'b11;
                DMSel = 1'b0;
                BSel = 1'b0;
                imm16 = instr[15:0];
                addr26 = 26'b0;
                rs = instr[25:21];
                rt = instr[20:16];
                rd = 5'b0;
                A3 = 5'b0;
                Tuse_rs = 2'b01;
                Tuse_rt = 2'b01;
                Tnew_E = 2'b10;
                Tnew_M = 2'b11;
            end
            6'b000010: begin // J
                NPCOp = 2'b10;
                RFWr = 1'b0;
                EXTOp = 1'b0;
                ALUOp = 3'b0;
                DMWr = 1'b0;
                A3Sel = 2'b11;
                WDSel = 2'b11;
                DMSel = 1'b0;
                BSel = 1'b0;
                imm16 = 16'b0;
                addr26 = instr[25:0];
                rs = 5'b0;
                rt = 5'b0;
                rd = 5'b0;
                A3 = 5'b0;
                Tuse_rs = 2'b0;
                Tuse_rt = 2'b0;
                Tnew_E = 2'b10;
                Tnew_M = 2'b11;
            end
            // Add more instruction types here
        endcase
    end
endmodule