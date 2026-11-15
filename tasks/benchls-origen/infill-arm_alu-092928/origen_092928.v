// ALU Module
module origen_092928 (
    input [31:0] in1, in2,
    input [3:0] EXE_CMD,
    input c,
    output reg N, Z, C, V,
    output reg [31:0] out
);

    // Operation codes
    localparam ALU_MOV = 4'b0001,
               ALU_MVN = 4'b1001,
               ALU_ADD = 4'b0010,
               ALU_ADC = 4'b0011,
               ALU_SUB = 4'b0100,
               ALU_SBC = 4'b0101,
               ALU_AND = 4'b0110,
               ALU_ORR = 4'b0111,
               ALU_EOR = 4'b1000,
               ALU_CMP = 4'b0100,
               ALU_TST = 4'b0110,
               ALU_LDR = 4'b0010;

    reg [32:0] result;
    
    [MASKED]
endmodule

// Testbench
module ALU_tb;
    reg [31:0] a, b;
    reg [3:0] op;
    reg c;
    wire N, Z, C, V;
    wire [31:0] out;

    ALU dut (
        .in1(a),
        .in2(b),
        .EXE_CMD(op),
        .c(c),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V),
        .out(out)
    );

    initial begin
        // Initialize inputs
        a = -12;
        b = 20;
        op = 0;
        c = 0;

        // Test ALU_MOV
        #10 op = 4'b0001;

        // Test ALU_ADD
        #10 op = 4'b0010;

        // Test ALU_ADC
        #10 op = 4'b0011;
        c = 1;

        // Test ALU_TST
        #10 op = 4'b0110;

        // Test ALU_SBC
        #10 op = 4'b0101;

        #10 ;
    end

    initial begin
        $monitor("Time=%0t a=%0d b=%0d op=%b c=%b out=%0d N=%b Z=%b C=%b V=%b",
                 $time, $signed(a), $signed(b), op, c, $signed(out), N, Z, C, V);
    end
endmodule