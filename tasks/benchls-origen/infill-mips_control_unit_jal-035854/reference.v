module origen_035854(
    input [5:0] Op,
    input [5:0] func,
    output reg [1:0] RegDst,
    output reg ALU_Asrc,
    output reg ALU_Bsrc,
    output reg Mem2Reg,
    output reg RegWrite,
    output reg MemWrite,
    output reg LinkPC,
    output reg [2:0] nPC_sel,
    output reg [1:0] ExtOp,
    output reg [2:0] ALUctrl
);

    // Instruction type decoding
    wire R_type = (Op == 6'b000000);
    wire ori = (Op == 6'b001101);
    wire lw = (Op == 6'b100011);
    wire sw = (Op == 6'b101011);
    wire beq = (Op == 6'b000100);
    wire lui = (Op == 6'b001111);
    wire jal = (Op == 6'b000011);
    wire j = (Op == 6'b000010);
    wire addiu = (Op == 6'b001001);

    // R-type instruction decoding
    wire jr = R_type && (func == 6'b001000);
    wire jalr = R_type && (func == 6'b001001);
    wire addu = R_type && (func == 6'b100001);
    wire subu = R_type && (func == 6'b100011);
    wire sll = R_type && (func == 6'b000000);

    always @(*) begin
        // Default values
        RegDst = 2'b00;
        ALU_Asrc = 1'b0;
        ALU_Bsrc = 1'b0;
        Mem2Reg = 1'b0;
        RegWrite = 1'b0;
        MemWrite = 1'b0;
        LinkPC = 1'b0;
        nPC_sel = 3'b000;
        ExtOp = 2'b00;
        ALUctrl = 3'b000;

        if (R_type) begin
            RegDst = 2'b01;
            RegWrite = 1'b1;
            if (jr) begin
                nPC_sel = 3'b010;
                RegWrite = 1'b0;
            end else if (jalr) begin
                nPC_sel = 3'b010;
                LinkPC = 1'b1;
            end else if (addu) begin
                ALUctrl = 3'b000;
            end else if (subu) begin
                ALUctrl = 3'b001;
            end else if (sll) begin
                ALU_Asrc = 1'b1;
                ALUctrl = 3'b010;
            end
        end else if (ori) begin
            ALU_Bsrc = 1'b1;
            RegWrite = 1'b1;
            ExtOp = 2'b00;
            ALUctrl = 3'b011;
        end else if (lw) begin
            ALU_Bsrc = 1'b1;
            Mem2Reg = 1'b1;
            RegWrite = 1'b1;
            ExtOp = 2'b01;
            ALUctrl = 3'b000;
        end else if (sw) begin
            ALU_Bsrc = 1'b1;
            MemWrite = 1'b1;
            ExtOp = 2'b01;
            ALUctrl = 3'b000;
        end else if (beq) begin
            nPC_sel = 3'b001;
            ALUctrl = 3'b001;
            ExtOp = 2'b01;
        end else if (lui) begin
            RegWrite = 1'b1;
            ExtOp = 2'b10;
        end else if (jal) begin
            RegDst = 2'b10;
            RegWrite = 1'b1;
            LinkPC = 1'b1;
            nPC_sel = 3'b011;
        end else if (j) begin
            nPC_sel = 3'b011;
        end else if (addiu) begin
            ALU_Bsrc = 1'b1;
            RegWrite = 1'b1;
            ExtOp = 2'b01;
            ALUctrl = 3'b000;
        end
    end

endmodule