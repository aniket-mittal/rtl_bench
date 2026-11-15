module origen_200447 (
    input  wire [5:0] opCode,
    input  wire       zero,
    output reg        RegDst,
    output reg        InsMenRW,
    output reg        PCWre,
    output reg        ExtSel,
    output reg        DBDataSrc,
    output reg        WR,
    output reg        RD,
    output reg        ALUSrcB,
    output reg        ALUSrcA,
    output reg        PCSrc,
    output reg [3:0]  ALUop,
    output reg        RegWre
);

    always @(*) begin
        case (opCode)
            6'b000000: begin // R-type instructions
                RegDst   = 1'b1;
                PCWre    = 1'b1;
                ALUSrcB  = 1'b0;
                ALUSrcA  = 1'b0;
                PCSrc    = 1'b0;
                ALUop    = 4'b0010; // ADD
                RegWre   = 1'b1;
                ExtSel   = 1'b0;
                DBDataSrc= 1'b0;
                WR       = 1'b0;
                RD       = 1'b0;
                InsMenRW = 1'b1;
            end
            6'b100011: begin // Load Word (LW)
                RegDst   = 1'b0;
                PCWre    = 1'b1;
                ALUSrcB  = 1'b1;
                ALUSrcA  = 1'b0;
                PCSrc    = 1'b0;
                ALUop    = 4'b0010; // ADD
                RegWre   = 1'b1;
                ExtSel   = 1'b1;
                DBDataSrc= 1'b1;
                WR       = 1'b0;
                RD       = 1'b1;
                InsMenRW = 1'b1;
            end
            6'b101011: begin // Store Word (SW)
                RegDst   = 1'b0;
                PCWre    = 1'b1;
                ALUSrcB  = 1'b1;
                ALUSrcA  = 1'b0;
                PCSrc    = 1'b0;
                ALUop    = 4'b0010; // ADD
                RegWre   = 1'b0;
                ExtSel   = 1'b1;
                DBDataSrc= 1'b0;
                WR       = 1'b1;
                RD       = 1'b0;
                InsMenRW = 1'b1;
            end
            6'b000100: begin // Branch Equal (BEQ)
                RegDst   = 1'b0;
                PCWre    = 1'b0;
                ALUSrcB  = 1'b0;
                ALUSrcA  = 1'b0;
                PCSrc    = zero;
                ALUop    = 4'b0110; // SUB
                RegWre   = 1'b0;
                ExtSel   = 1'b1;
                DBDataSrc= 1'b0;
                WR       = 1'b0;
                RD       = 1'b0;
                InsMenRW = 1'b1;
            end
            6'b000010: begin // Jump (J)
                RegDst   = 1'b0;
                PCWre    = 1'b0;
                ALUSrcB  = 1'b0;
                ALUSrcA  = 1'b1;
                PCSrc    = 1'b1;
                ALUop    = 4'b0000; // NOP
                RegWre   = 1'b0;
                ExtSel   = 1'b0;
                DBDataSrc= 1'b0;
                WR       = 1'b0;
                RD       = 1'b0;
                InsMenRW = 1'b1;
            end
            default: begin
                RegDst   = 1'b0;
                PCWre    = 1'b1;
                ALUSrcB  = 1'b0;
                ALUSrcA  = 1'b0;
                PCSrc    = 1'b0;
                ALUop    = 4'b0000; // NOP
                RegWre   = 1'b0;
                ExtSel   = 1'b0;
                DBDataSrc= 1'b0;
                WR       = 1'b0;
                RD       = 1'b0;
                InsMenRW = 1'b1;
            end
        endcase
    end

endmodule