module origen_096059 (
    input [31:0] Instruction,
    output reg [3:0] OPOut
);

    wire [10:0] OpCode;
    assign OpCode = Instruction[31:21];

    [MASKED]

endmodule

module testbench;
    reg [31:0] Instruction;
    wire [3:0] OPOut;

    CtrlSgnl uut (
        .Instruction(Instruction),
        .OPOut(OPOut)
    );

    initial begin
        // Test cases
        Instruction = 32'b10010001000000000000000000000000; #10; // ADDI
        Instruction = 32'b10101011000000000000000000000000; #10; // ADD
        Instruction = 32'b01010100000000000000000000000000; #10; // B.cond
        Instruction = 32'b00010100000000000000000000000000; #10; // B
        Instruction = 32'b10010100000000000000000000000000; #10; // BL
        Instruction = 32'b11010110000000000000000000000000; #10; // BR
        Instruction = 32'b10110100000000000000000000000000; #10; // CBZ
        Instruction = 32'b11111000010000000000000000000000; #10; // LDUR
        Instruction = 32'b11111000000000000000000000000000; #10; // STUR
        Instruction = 32'b11101011000000000000000000000000; #10; // SUBS
        Instruction = 32'b00000000000000000000000000000000; #10; // Unknown
        ;
    end

    initial begin
        $monitor("Time=%0t Instruction=%b OPOut=%b", $time, Instruction, OPOut);
    end
endmodule