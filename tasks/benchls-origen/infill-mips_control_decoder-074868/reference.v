module origen_074868(
    input [5:0] op,
    input [5:0] low6,
    input [31:0] instr,
    output reg [4:0] aluCtrl,
    output reg ifWrGrf,
    output reg [4:0] grfWa,
    output reg [4:0] grfRa1,
    output reg [4:0] grfRa2,
    output reg ifReDm,
    output reg ifWrDm,
    output reg ifBeq,
    output reg ifJal,
    output reg ifJr,
    output reg ifJ,
    output reg ifImmExt,
    output reg [1:0] tUseRs,
    output reg [1:0] tUseRt,
    output reg [1:0] tNew,
    output reg ifAddu,
    output reg ifSubu,
    output reg ifOri,
    output reg ifLui,
    output reg ifLw,
    output reg ifSw
);

    always @(*) begin
        // Default values
        aluCtrl = 5'b0;
        ifWrGrf = 1'b0;
        grfWa = 5'b0;
        grfRa1 = instr[25:21];
        grfRa2 = instr[20:16];
        ifReDm = 1'b0;
        ifWrDm = 1'b0;
        ifBeq = 1'b0;
        ifJal = 1'b0;
        ifJr = 1'b0;
        ifJ = 1'b0;
        ifImmExt = 1'b0;
        tUseRs = 2'b11;
        tUseRt = 2'b11;
        tNew = 2'b00;
        ifAddu = 1'b0;
        ifSubu = 1'b0;
        ifOri = 1'b0;
        ifLui = 1'b0;
        ifLw = 1'b0;
        ifSw = 1'b0;

        case(op)
            6'b000000: begin // R-type instructions
                case(low6)
                    6'b100001: begin // ADDU
                        aluCtrl = 5'b00001;
                        ifWrGrf = 1'b1;
                        grfWa = instr[15:11];
                        tUseRs = 2'b01;
                        tUseRt = 2'b01;
                        tNew = 2'b10;
                        ifAddu = 1'b1;
                    end
                    6'b100011: begin // SUBU
                        aluCtrl = 5'b00010;
                        ifWrGrf = 1'b1;
                        grfWa = instr[15:11];
                        tUseRs = 2'b01;
                        tUseRt = 2'b01;
                        tNew = 2'b10;
                        ifSubu = 1'b1;
                    end
                    6'b001000: begin // JR
                        ifJr = 1'b1;
                        tUseRs = 2'b00;
                    end
                endcase
            end
            6'b001101: begin // ORI
                aluCtrl = 5'b00011;
                ifWrGrf = 1'b1;
                grfWa = instr[20:16];
                ifImmExt = 1'b1;
                tUseRs = 2'b01;
                tNew = 2'b10;
                ifOri = 1'b1;
            end
            6'b001111: begin // LUI
                aluCtrl = 5'b00100;
                ifWrGrf = 1'b1;
                grfWa = instr[20:16];
                ifImmExt = 1'b1;
                tNew = 2'b10;
                ifLui = 1'b1;
            end
            6'b100011: begin // LW
                aluCtrl = 5'b00101;
                ifWrGrf = 1'b1;
                grfWa = instr[20:16];
                ifReDm = 1'b1;
                ifImmExt = 1'b1;
                tUseRs = 2'b01;
                tNew = 2'b11;
                ifLw = 1'b1;
            end
            6'b101011: begin // SW
                aluCtrl = 5'b00110;
                ifWrDm = 1'b1;
                ifImmExt = 1'b1;
                tUseRs = 2'b01;
                tUseRt = 2'b10;
                ifSw = 1'b1;
            end
            6'b000100: begin // BEQ
                aluCtrl = 5'b00111;
                ifBeq = 1'b1;
                tUseRs = 2'b00;
                tUseRt = 2'b00;
            end
            6'b000011: begin // JAL
                ifJal = 1'b1;
                ifWrGrf = 1'b1;
                grfWa = 5'b11111; // $ra
                tNew = 2'b00;
            end
            6'b000010: begin // J
                ifJ = 1'b1;
            end
        endcase
    end

endmodule