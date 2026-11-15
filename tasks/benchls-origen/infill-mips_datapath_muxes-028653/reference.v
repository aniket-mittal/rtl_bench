module origen_028653 (
    input [1:0] RegDst,
    input ALUSrc,
    input [1:0] MemToReg,
    input Branch1, Branch2, Branch3, Branch4, Zero,
    input [4:0] rt, rd,
    input [31:0] RD2, imm32, Result, imm16_shifted, RD, PC4, PCbeq, PCj,
    output reg [4:0] WA,
    output reg [31:0] B, WD, next_pc
);

    // Write Address Selection
    always @(*) begin
        case(RegDst)
            2'b00: WA = rt;
            2'b01: WA = rd;
            2'b10: WA = 5'd31;
            2'b11: WA = 5'd0;
        endcase
    end

    // ALU Operand B Selection
    always @(*) begin
        B = ALUSrc ? imm32 : RD2;
    end

    // Write Data Selection
    always @(*) begin
        case(MemToReg)
            2'b00: WD = Result;
            2'b01: WD = imm16_shifted;
            2'b10: WD = RD;
            2'b11: WD = PC4;
        endcase
    end

    // Next Program Counter Selection
    wire signed [31:0] RD2_signed = RD2;
    wire branch_taken = (Branch1 & Zero) |
                        (Branch2 & ~Zero) |
                        (Branch3 & (RD2_signed < 0)) |
                        (Branch4 & (RD2_signed >= 0));

    always @(*) begin
        if (branch_taken)
            next_pc = PCbeq;
        else if (Branch1 & Branch2)
            next_pc = PCj;
        else if (Branch3 & Branch4)
            next_pc = Result;
        else
            next_pc = PC4;
    end

endmodule