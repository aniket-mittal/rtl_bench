module origen_054998(
    input wire stallSignal,
    input wire [5:0] opCode,
    output reg regDst,
    output reg branch,
    output reg memRead,
    output reg memToReg,
    output reg [1:0] aluOp,
    output reg memWrite,
    output reg aluSrc,
    output reg regWrite
);

    [MASKED]

endmodule

module testbench;
    reg stallSignal;
    reg [5:0] opCode;
    wire regDst, branch, memRead, memToReg, memWrite, aluSrc, regWrite;
    wire [1:0] aluOp;

    control_unit dut (
        .stallSignal(stallSignal),
        .opCode(opCode),
        .regDst(regDst),
        .branch(branch),
        .memRead(memRead),
        .memToReg(memToReg),
        .aluOp(aluOp),
        .memWrite(memWrite),
        .aluSrc(aluSrc),
        .regWrite(regWrite)
    );

    initial begin
        stallSignal = 0;
        opCode = 6'b000000;
        #10 opCode = 6'b100011;
        #10 opCode = 6'b101011;
        #10 opCode = 6'b000100;
        #10 ;
    end

    initial begin
        $monitor("Time=%0t opCode=%b regDst=%b branch=%b memRead=%b memToReg=%b aluOp=%b memWrite=%b aluSrc=%b regWrite=%b",
                 $time, opCode, regDst, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
    end
endmodule