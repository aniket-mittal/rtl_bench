module origen_022710 (
    input [5:0] operationCode,
    input zero,
    output reg ALUSrcB,
    output reg ALUM2Reg,
    output reg RegWre,
    output reg InsMemRW,
    output reg DataMemRW,
    output reg ExtSel,
    output reg PCSrc,
    output reg RegOut,
    output reg PCWre,
    output reg [2:0] ALUFlag
);

    // Instruction opcodes
    localparam ADD  = 6'b000000;
    localparam SUB  = 6'b000001;
    localparam ORI  = 6'b010000;
    localparam AND  = 6'b010001;
    localparam OR   = 6'b010010;
    localparam MOVE = 6'b100000;
    localparam SW   = 6'b110000;
    localparam LW   = 6'b110001;
    localparam BEQ  = 6'b110010;
    localparam HALT = 6'b111111;

    always @(*) begin
        // Default values
        ALUSrcB = 1'b0;
        ALUM2Reg = 1'b0;
        RegWre = 1'b0;
        InsMemRW = 1'b1; // Always read from instruction memory
        DataMemRW = 1'b0;
        ExtSel = 1'b0;
        PCSrc = 1'b0;
        RegOut = 1'b0;
        PCWre = 1'b1; // Enable PC write by default
        ALUFlag = 3'b000;

        case (operationCode)
            ADD: begin
                RegWre = 1'b1;
                RegOut = 1'b1;
            end
            SUB: begin
                RegWre = 1'b1;
                RegOut = 1'b1;
                ALUFlag[0] = 1'b1;
            end
            ORI: begin
                ALUSrcB = 1'b1;
                RegWre = 1'b1;
                ALUFlag[1:0] = 2'b11;
            end
            AND: begin
                RegWre = 1'b1;
                RegOut = 1'b1;
                ALUFlag[2] = 1'b1;
            end
            OR: begin
                RegWre = 1'b1;
                RegOut = 1'b1;
                ALUFlag[1:0] = 2'b11;
            end
            MOVE: begin
                RegWre = 1'b1;
                RegOut = 1'b1;
            end
            SW: begin
                ALUSrcB = 1'b1;
                DataMemRW = 1'b1;
                ExtSel = 1'b1;
            end
            LW: begin
                ALUSrcB = 1'b1;
                ALUM2Reg = 1'b1;
                RegWre = 1'b1;
                ExtSel = 1'b1;
            end
            BEQ: begin
                ExtSel = 1'b1;
                ALUFlag[0] = 1'b1;
                PCSrc = zero;
            end
            HALT: begin
                PCWre = 1'b0;
            end
            default: begin
                // Do nothing for undefined opcodes
            end
        endcase
    end

endmodule