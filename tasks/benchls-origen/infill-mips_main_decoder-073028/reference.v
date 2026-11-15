module origen_073028(
    input [5:0] Op,
    input [5:0] Funct,
    input Equal,
    input EQZ,
    input LTZ,
    output reg [1:0] NPCOp,
    output reg RegWrite,
    output reg [3:0] ALUOp,
    output reg MemWrite,
    output reg [1:0] OpWidth,
    output reg LoadSigned,
    output reg [1:0] ExtOp,
    output reg [1:0] PCSrc,
    output reg [1:0] RegDst,
    output reg [1:0] RegSrc,
    output reg ALUSrc
);

    // Instruction type signals
    wire r_type = (Op == 6'b000000);
    wire addu   = r_type & (Funct == 6'b100001);
    wire subu   = r_type & (Funct == 6'b100011);
    wire jr     = r_type & (Funct == 6'b001000);
    wire ori    = (Op == 6'b001101);
    wire lw     = (Op == 6'b100011);
    wire sw     = (Op == 6'b101011);
    wire beq    = (Op == 6'b000100);
    wire lui    = (Op == 6'b001111);
    wire jal    = (Op == 6'b000011);

    // Control signal generation
    always @(*) begin
        // Default values
        NPCOp      = 2'b00;
        RegWrite   = 1'b0;
        ALUOp      = 4'b0000;
        MemWrite   = 1'b0;
        OpWidth    = 2'b10;
        LoadSigned = 1'b1;
        ExtOp      = 2'b00;
        PCSrc      = 2'b00;
        RegDst     = 2'b00;
        RegSrc     = 2'b00;
        ALUSrc     = 1'b0;

        if (addu | subu) begin
            RegWrite = 1'b1;
            ALUOp    = addu ? 4'b0000 : 4'b0001;
            RegDst   = 2'b01;
        end
        else if (ori) begin
            RegWrite = 1'b1;
            ALUOp    = 4'b0010;
            ExtOp    = 2'b00;
            ALUSrc   = 1'b1;
        end
        else if (lw) begin
            RegWrite   = 1'b1;
            ALUOp      = 4'b0000;
            ExtOp      = 2'b01;
            ALUSrc     = 1'b1;
            RegSrc     = 2'b01;
        end
        else if (sw) begin
            MemWrite = 1'b1;
            ALUOp    = 4'b0000;
            ExtOp    = 2'b01;
            ALUSrc   = 1'b1;
        end
        else if (beq) begin
            NPCOp  = 2'b01;
            ALUOp  = 4'b0001;
            ExtOp  = 2'b01;
            PCSrc  = Equal ? 2'b01 : 2'b00;
        end
        else if (lui) begin
            RegWrite = 1'b1;
            ExtOp    = 2'b10;
            RegSrc   = 2'b10;
        end
        else if (jal) begin
            NPCOp    = 2'b10;
            RegWrite = 1'b1;
            PCSrc    = 2'b10;
            RegDst   = 2'b10;
            RegSrc   = 2'b11;
        end
        else if (jr) begin
            NPCOp = 2'b11;
            PCSrc = 2'b11;
        end
    end

endmodule