module origen_023135(
    input [5:0] Op,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg ALUOp1,
    output reg ALUOp2
);

[MASKED]

endmodule

module testbench;
    reg [5:0] Op;
    wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2;

    main_control_unit uut (
        .Op(Op),
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp1(ALUOp1),
        .ALUOp2(ALUOp2)
    );

    initial begin
        $monitor("Time=%0t Op=%b RegDst=%b ALUSrc=%b MemtoReg=%b RegWrite=%b MemRead=%b MemWrite=%b Branch=%b ALUOp1=%b ALUOp2=%b",
                 $time, Op, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2);

        Op = 6'b000000; #10; // R-format
        Op = 6'b100011; #10; // lw
        Op = 6'b101011; #10; // sw
        Op = 6'b000100; #10; // beq

        ;
    end
endmodule