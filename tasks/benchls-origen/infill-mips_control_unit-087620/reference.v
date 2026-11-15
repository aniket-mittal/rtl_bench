module origen_087620 #(
    parameter R = 6,
    parameter P = 4
)(
    input [R-1:0] opcode,
    output reg MemRead,
    output reg MemWrite,
    output reg RegWrite,
    output reg Branch,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemToReg,
    output reg NotOp,
    output reg [1:0] ALUOp
);

    // Instruction opcodes
    localparam R_FORMAT = 6'b000000;
    localparam LW       = 6'b100011;
    localparam SW       = 6'b101011;
    localparam BEQ      = 6'b000100;
    localparam BNE      = 6'b000101;
    localparam ADDI     = 6'b001000;

    always @(*) begin
        case(opcode)
            R_FORMAT: begin
                RegDst   = 1'b1;
                ALUSrc   = 1'b0;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
                NotOp    = 1'b0;
            end
            LW: begin
                RegDst   = 1'b0;
                ALUSrc   = 1'b1;
                MemToReg = 1'b1;
                RegWrite = 1'b1;
                MemRead  = 1'b1;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
                NotOp    = 1'b0;
            end
            SW: begin
                RegDst   = 1'bx;
                ALUSrc   = 1'b1;
                MemToReg = 1'bx;
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b1;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
                NotOp    = 1'b0;
            end
            BEQ: begin
                RegDst   = 1'bx;
                ALUSrc   = 1'b0;
                MemToReg = 1'bx;
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b1;
                ALUOp    = 2'b01;
                NotOp    = 1'b0;
            end
            BNE: begin
                RegDst   = 1'bx;
                ALUSrc   = 1'b0;
                MemToReg = 1'bx;
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b1;
                ALUOp    = 2'b01;
                NotOp    = 1'b1;
            end
            ADDI: begin
                RegDst   = 1'b0;
                ALUSrc   = 1'b1;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
                NotOp    = 1'b0;
            end
            default: begin
                RegDst   = 1'bx;
                ALUSrc   = 1'bx;
                MemToReg = 1'bx;
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'bxx;
                NotOp    = 1'b0;
            end
        endcase
    end

endmodule