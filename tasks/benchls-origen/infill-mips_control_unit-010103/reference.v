module origen_010103 (
    input wire rst,
    input wire zero,
    input wire [5:0] op,
    input wire [5:0] func,
    output reg MemEn,
    output reg MemToReg,
    output reg MemWrite,
    output reg [3:0] ALUop,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg RegDst,
    output reg RegWrite,
    output reg PCSrc,
    output reg JSrc
);

    // Instruction opcodes
    localparam R_TYPE = 6'b000000;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam BEQ    = 6'b000100;
    localparam BNE    = 6'b000101;
    localparam J      = 6'b000010;
    localparam JAL    = 6'b000011;
    localparam ADDI   = 6'b001000;
    localparam ANDI   = 6'b001100;
    localparam ORI    = 6'b001101;

    // R-type function codes
    localparam ADD    = 6'b100000;
    localparam SUB    = 6'b100010;
    localparam AND    = 6'b100100;
    localparam OR     = 6'b100101;
    localparam SLT    = 6'b101010;
    localparam JR     = 6'b001000;

    always @(*) begin
        if (rst) begin
            {MemEn, MemToReg, MemWrite, ALUop, ALUSrcA, ALUSrcB, RegDst, RegWrite, PCSrc, JSrc} = 13'b0;
        end else begin
            // Default values
            MemEn = 0;
            MemToReg = 0;
            MemWrite = 0;
            ALUop = 4'b0000;
            ALUSrcA = 0;
            ALUSrcB = 0;
            RegDst = 0;
            RegWrite = 0;
            PCSrc = 0;
            JSrc = 0;

            case (op)
                R_TYPE: begin
                    RegDst = 1;
                    RegWrite = 1;
                    case (func)
                        ADD: ALUop = 4'b0010;
                        SUB: ALUop = 4'b0110;
                        AND: ALUop = 4'b0000;
                        OR:  ALUop = 4'b0001;
                        SLT: ALUop = 4'b0111;
                        JR:  begin
                            JSrc = 1;
                            PCSrc = 1;
                        end
                    endcase
                end
                LW: begin
                    MemEn = 1;
                    MemToReg = 1;
                    ALUop = 4'b0010;
                    ALUSrcB = 1;
                    RegWrite = 1;
                end
                SW: begin
                    MemEn = 1;
                    MemWrite = 1;
                    ALUop = 4'b0010;
                    ALUSrcB = 1;
                end
                BEQ: begin
                    ALUop = 4'b0110;
                    PCSrc = zero;
                end
                BNE: begin
                    ALUop = 4'b0110;
                    PCSrc = ~zero;
                end
                J: begin
                    PCSrc = 1;
                end
                JAL: begin
                    PCSrc = 1;
                    RegWrite = 1;
                    RegDst = 1;
                end
                ADDI: begin
                    ALUop = 4'b0010;
                    ALUSrcB = 1;
                    RegWrite = 1;
                end
                ANDI: begin
                    ALUop = 4'b0000;
                    ALUSrcB = 1;
                    RegWrite = 1;
                end
                ORI: begin
                    ALUop = 4'b0001;
                    ALUSrcB = 1;
                    RegWrite = 1;
                end
            endcase
        end
    end

endmodule