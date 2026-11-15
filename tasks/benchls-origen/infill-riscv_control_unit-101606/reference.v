module origen_101606(
    input [6:0] Opcode,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg [1:0] ALUOp,
    output reg JALR,
    output reg Jump,
    output reg PCtoReg,
    output reg [1:0] PCregsrc
);

    // Instruction type constants
    parameter R_TYPE = 7'b0110011;
    parameter LW     = 7'b0000011;
    parameter SW     = 7'b0100011;
    parameter RTypeI = 7'b0010011;
    parameter BR     = 7'b1100011;
    parameter jumplr = 7'b1100111;
    parameter jumpl  = 7'b1101111;
    parameter LUI    = 7'b0110111;
    parameter AUIPC  = 7'b0010111;

    always @(*) begin
        // Default values
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        RegWrite = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        Branch = 1'b0;
        ALUOp = 2'b00;
        JALR = 1'b0;
        Jump = 1'b0;
        PCtoReg = 1'b0;
        PCregsrc = 2'b00;

        case(Opcode)
            R_TYPE: begin
                RegWrite = 1'b1;
                ALUOp = 2'b10;
            end
            LW: begin
                ALUSrc = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                ALUOp = 2'b00;
            end
            SW: begin
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ALUOp = 2'b00;
            end
            RTypeI: begin
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b11;
            end
            BR: begin
                Branch = 1'b1;
                ALUOp = 2'b01;
            end
            jumplr: begin
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                JALR = 1'b1;
                Jump = 1'b1;
                PCtoReg = 1'b1;
                PCregsrc = 2'b01;
            end
            jumpl: begin
                RegWrite = 1'b1;
                Jump = 1'b1;
                PCtoReg = 1'b1;
                PCregsrc = 2'b10;
            end
            LUI: begin
                RegWrite = 1'b1;
                PCtoReg = 1'b1;
                PCregsrc = 2'b11;
            end
            AUIPC: begin
                RegWrite = 1'b1;
                PCtoReg = 1'b1;
                PCregsrc = 2'b00;
            end
        endcase
    end

endmodule