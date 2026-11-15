module origen_028932 (
    input [31:0] op,
    output reg [1:0] aluOp,
    output reg [3:0] aluCtrl,
    output reg [1:0] outcalc,
    output reg ina,
    output reg inb,
    output reg writein,
    output reg shiftsign,
    output reg extend,
    output reg luisign,
    output reg sign,
    output reg signslt
);

    always @(*) begin
        // aluOp generation
        aluOp[1] = (op[31:26] == 6'b000000);
        aluOp[0] = ~aluOp[1];

        // ALU Control generation
        casex ({aluOp, op[5:0]})
            8'b10_100000: aluCtrl = 4'b0010; // add
            8'b10_100010: aluCtrl = 4'b0110; // sub
            8'b10_100100: aluCtrl = 4'b0000; // and
            8'b10_100101: aluCtrl = 4'b0001; // or
            8'b10_100110: aluCtrl = 4'b0011; // xor
            8'b10_100111: aluCtrl = 4'b1100; // nor
            8'b10_101010: aluCtrl = 4'b0111; // slt
            8'b10_000000: aluCtrl = 4'b1000; // sll
            8'b10_000010: aluCtrl = 4'b1001; // srl
            8'b10_000011: aluCtrl = 4'b1010; // sra
            8'b01_xxxxxx: aluCtrl = 4'b0010; // default for non-R-type
            default:      aluCtrl = 4'b0000; // default case
        endcase

        // Input control
        ina = (op[31:26] == 6'b001111); // lui
        inb = (op[31:26] != 6'b000000); // non-R-type
        writein = aluOp[1];

        // Operation type signals
        extend = (op[31:26] == 6'b001000 || op[31:26] == 6'b100011 || op[31:26] == 6'b101011); // addi, lw, sw
        luisign = (op[31:26] == 6'b001111); // lui
        shiftsign = (op[5:0] == 6'b000011); // sra

        // Output control
        outcalc = (op[31:26] == 6'b000100) ? 2'b01 : // beq
                  (op[31:26] == 6'b000101) ? 2'b10 : // bne
                  2'b00; // default

        // Sign handling
        sign = (op[31:26] == 6'b001010 || op[31:26] == 6'b001011); // slti, sltiu
        signslt = (op[31:26] == 6'b001010 || op[5:0] == 6'b101010); // slti, slt
    end

endmodule