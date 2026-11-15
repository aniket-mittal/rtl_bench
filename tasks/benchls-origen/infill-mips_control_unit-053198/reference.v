module origen_053198 (
    input [5:0] OpCode,
    input [5:0] Funct,
    input IRQ,
    output reg [2:0] PCSrc,
    output reg [1:0] RegDst,
    output reg ExtOp,
    output reg LuOp,
    output reg Branch,
    output reg [2:0] BranchOp,
    output reg [3:0] ALUOp,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] MemToReg,
    output reg RegWrite,
    output reg Exception
);

    // Define opcodes and function codes
    localparam R_TYPE = 6'b000000;
    localparam LW = 6'b100011;
    localparam SW = 6'b101011;
    localparam BEQ = 6'b000100;
    localparam BNE = 6'b000101;
    localparam J = 6'b000010;
    localparam JAL = 6'b000011;
    localparam ADDI = 6'b001000;
    localparam LUI = 6'b001111;

    // R-type function codes
    localparam ADD = 6'b100000;
    localparam SUB = 6'b100010;
    localparam AND = 6'b100100;
    localparam OR = 6'b100101;
    localparam SLT = 6'b101010;
    localparam JR = 6'b001000;

    always @(*) begin
        // Default values
        PCSrc = 3'b000;
        RegDst = 2'b00;
        ExtOp = 1'b0;
        LuOp = 1'b0;
        Branch = 1'b0;
        BranchOp = 3'b000;
        ALUOp = 4'b0000;
        ALUSrc1 = 1'b0;
        ALUSrc2 = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        MemToReg = 2'b00;
        RegWrite = 1'b0;
        Exception = 1'b0;

        if (IRQ) begin
            PCSrc = 3'b100; // Interrupt vector
        end else begin
            case (OpCode)
                R_TYPE: begin
                    RegDst = 2'b01;
                    RegWrite = 1'b1;
                    case (Funct)
                        ADD: ALUOp = 4'b0000;
                        SUB: ALUOp = 4'b0001;
                        AND: ALUOp = 4'b0010;
                        OR:  ALUOp = 4'b0011;
                        SLT: ALUOp = 4'b0100;
                        JR:  PCSrc = 3'b011;
                        default: Exception = 1'b1;
                    endcase
                end
                LW: begin
                    ALUOp = 4'b0000;
                    ALUSrc2 = 1'b1;
                    MemRead = 1'b1;
                    RegWrite = 1'b1;
                    ExtOp = 1'b1;
                    MemToReg = 2'b01;
                end
                SW: begin
                    ALUOp = 4'b0000;
                    ALUSrc2 = 1'b1;
                    MemWrite = 1'b1;
                    ExtOp = 1'b1;
                end
                BEQ: begin
                    Branch = 1'b1;
                    BranchOp = 3'b000;
                    ALUOp = 4'b0001;
                end
                BNE: begin
                    Branch = 1'b1;
                    BranchOp = 3'b001;
                    ALUOp = 4'b0001;
                end
                J: PCSrc = 3'b001;
                JAL: begin
                    PCSrc = 3'b001;
                    RegDst = 2'b10;
                    RegWrite = 1'b1;
                    MemToReg = 2'b10;
                end
                ADDI: begin
                    ALUOp = 4'b0000;
                    ALUSrc2 = 1'b1;
                    RegWrite = 1'b1;
                    ExtOp = 1'b1;
                end
                LUI: begin
                    RegWrite = 1'b1;
                    LuOp = 1'b1;
                end
                default: Exception = 1'b1;
            endcase
        end
    end

endmodule