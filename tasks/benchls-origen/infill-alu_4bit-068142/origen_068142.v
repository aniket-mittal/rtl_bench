// ALU Module
module origen_068142(
    input [3:0] a,
    input [3:0] b,
    input [2:0] code,
    output reg [7:0] aluout
);

    wire [7:0] x, y;
    assign x = {4'b0000, a};
    assign y = {4'b0000, b};

    [MASKED]
endmodule

// Testbench Module
module alu_tb;
    reg [3:0] a, b;
    reg [2:0] code;
    wire [7:0] aluout;

    alu dut(
        .a(a),
        .b(b),
        .code(code),
        .aluout(aluout)
    );

    initial begin
        a = 4;
        b = 5;
        code = 0;

        repeat(8) begin
            #10 code = code + 1;
        end

        #10 a = 4;
        #10 b = 5;
    end

    initial begin
        $monitor("Time=%0t a=%b b=%b code=%b aluout=%b", $time, a, b, code, aluout);
    end
endmodule