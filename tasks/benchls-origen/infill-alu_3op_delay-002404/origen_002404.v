// ALU Module
module origen_002404(
    input [7:0] DATA1,
    input [7:0] DATA2,
    input [2:0] SELECT,
    output reg [7:0] RESULT
);

    [MASKED]
endmodule

// Testbench Module
module alu_testbench;
    reg [7:0] OPERAND1, OPERAND2;
    reg [2:0] ALUSELECT;
    wire [7:0] ALURESULT;

    alu uut (
        .DATA1(OPERAND1),
        .DATA2(OPERAND2),
        .SELECT(ALUSELECT),
        .RESULT(ALURESULT)
    );

    initial begin
        $monitor("Time=%0t OPERAND1=%b OPERAND2=%b SELECT=%b RESULT=%b",
                 $time, OPERAND1, OPERAND2, ALUSELECT, ALURESULT);
        $dumpfile("alu_testbench.vcd");
        $dumpvars(0, alu_testbench);

        OPERAND1 = 8'b10101010;
        OPERAND2 = 8'b01010101;

        ALUSELECT = 3'b000;
        #10 ALUSELECT = 3'b001;
        #10 ALUSELECT = 3'b010;
        #10 ALUSELECT = 3'b011;
        #10 ALUSELECT = 3'b100;
        #10 ALUSELECT = 3'b101;
        #10 ALUSELECT = 3'b110;
        #10 ALUSELECT = 3'b111;
        #10 ALUSELECT = 3'b000;
        #10 ;
    end
endmodule