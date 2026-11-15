module origen_058839(
    input [5:0] OP,
    input [5:0] funct,
    output reg RegDst,
    output reg BranchEQ,
    output reg BranchNE,
    output reg MemRead,
    output reg MemToReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg Jump,
    output reg JumpAndLink,
    output reg LoadUpperImmediate,
    output reg JumpRegister,
    output reg [2:0] ALUOp
);

reg [13:0] ControlValues;

always @(*) begin
    case(OP)
        6'b000000: ControlValues = 14'b10000000100011; // R-type
        6'b001000: ControlValues = 14'b00000001100001; // ADDI
        6'b001101: ControlValues = 14'b00000001100001; // ORI
        6'b001100: ControlValues = 14'b00000001100001; // ANDI
        6'b101011: ControlValues = 14'b00000110000000; // SW
        6'b100011: ControlValues = 14'b00011001100000; // LW
        6'b000100: ControlValues = 14'b00100000000100; // BEQ
        6'b000101: ControlValues = 14'b01000000000100; // BNE
        6'b000010: ControlValues = 14'b00000000001000; // J
        6'b000011: ControlValues = 14'b00000000011000; // JAL
        6'b001111: ControlValues = 14'b00000001100010; // LUI
        default:   ControlValues = 14'b00000000000000; // Default
    endcase

    RegDst = ControlValues[13];
    BranchEQ = ControlValues[12];
    BranchNE = ControlValues[11];
    MemRead = ControlValues[10];
    MemToReg = ControlValues[9];
    MemWrite = ControlValues[8];
    ALUSrc = ControlValues[7];
    RegWrite = ControlValues[6];
    Jump = ControlValues[5];
    JumpAndLink = ControlValues[4];
    LoadUpperImmediate = ControlValues[3];
    ALUOp = ControlValues[2:0];

    JumpRegister = (OP == 6'b000000 && funct == 6'b001000) ? 1'b1 : 1'b0;
end

endmodule