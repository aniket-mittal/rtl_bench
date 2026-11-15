module origen_015113(
    input [5:0] Opcode,
    input [5:0] funct,
    input IRQ,
    input ker,
    output reg [2:0] PCSrc,
    output reg [1:0] RegDst,
    output reg [1:0] MemToReg,
    output reg [5:0] ALUFun,
    output reg RegWr,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg Sign,
    output reg MemWr,
    output reg MemRd,
    output reg EXTOp,
    output reg LUOp,
    output reg Interrupt
);

    // Instruction type parameters
    localparam R_TYPE = 6'b000000;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam BEQ    = 6'b000100;
    localparam BNE    = 6'b000101;
    localparam J      = 6'b000010;
    localparam JAL    = 6'b000011;
    localparam LUI    = 6'b001111;
    localparam ADDI   = 6'b001000;

    always @(*) begin
        // Default values
        PCSrc = 3'b000;
        RegDst = 2'b00;
        MemToReg = 2'b00;
        ALUFun = 6'b000000;
        RegWr = 1'b0;
        ALUSrc1 = 1'b0;
        ALUSrc2 = 1'b0;
        Sign = 1'b1;
        MemWr = 1'b0;
        MemRd = 1'b0;
        EXTOp = 1'b0;
        LUOp = 1'b0;
        Interrupt = 1'b0;

        // Interrupt handling
        if (IRQ && !ker) begin
            Interrupt = 1'b1;
            PCSrc = 3'b100;
            RegDst = 2'b11;
            MemToReg = 2'b10;
        end
        else begin
            case(Opcode)
                R_TYPE: begin
                    RegDst = 2'b00;
                    RegWr = 1'b1;
                    case(funct)
                        6'b100000: ALUFun = 6'b000000; // ADD
                        6'b100010: ALUFun = 6'b000001; // SUB
                        6'b100100: ALUFun = 6'b011000; // AND
                        6'b100101: ALUFun = 6'b011110; // OR
                        6'b101010: ALUFun = 6'b110101; // SLT
                        6'b001000: PCSrc = 3'b011;     // JR
                        default: PCSrc = 3'b101;       // Undefined instruction
                    endcase
                end
                LW: begin
                    ALUFun = 6'b000000;
                    RegDst = 2'b01;
                    MemToReg = 2'b01;
                    ALUSrc2 = 1'b1;
                    MemRd = 1'b1;
                    RegWr = 1'b1;
                    EXTOp = 1'b1;
                end
                SW: begin
                    ALUFun = 6'b000000;
                    ALUSrc2 = 1'b1;
                    MemWr = 1'b1;
                    EXTOp = 1'b1;
                end
                BEQ: begin
                    ALUFun = 6'b000001;
                    PCSrc = 3'b001;
                end
                BNE: begin
                    ALUFun = 6'b000001;
                    PCSrc = 3'b001;
                end
                J: PCSrc = 3'b010;
                JAL: begin
                    PCSrc = 3'b010;
                    RegDst = 2'b10;
                    MemToReg = 2'b10;
                    RegWr = 1'b1;
                end
                LUI: begin
                    RegDst = 2'b01;
                    ALUSrc2 = 1'b1;
                    RegWr = 1'b1;
                    LUOp = 1'b1;
                end
                ADDI: begin
                    ALUFun = 6'b000000;
                    RegDst = 2'b01;
                    ALUSrc2 = 1'b1;
                    RegWr = 1'b1;
                    EXTOp = 1'b1;
                end
                default: PCSrc = 3'b101; // Undefined instruction
            endcase
        end
    end
endmodule