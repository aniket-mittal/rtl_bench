module origen_126816(
    input wire clk,
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [7:0] ctrl,
    output reg [15:0] out,
    output reg n,
    output reg z,
    output reg c,
    output reg v
);

    wire [16:0] add_result;
    wire [16:0] sub_result;

    assign add_result = a + b;
    assign sub_result = a - b;

    [MASKED]
endmodule

module alu_16_tb;
    reg clk;
    reg [15:0] a, b;
    reg [7:0] ctrl;
    wire [15:0] out;
    wire n, z, c, v;

    alu_16 dut (
        .clk(clk),
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .out(out),
        .n(n),
        .z(z),
        .c(c),
        .v(v)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Test AND
        a = 16'hAAAA; b = 16'h5555; ctrl = 8'h00;
        #10;
        if (out !== 16'h0000) $display("AND test failed");

        // Test OR
        ctrl = 8'h01;
        #10;
        if (out !== 16'hFFFF) $display("OR test failed");

        // Test ADD
        a = 16'h7FFF; b = 16'h0001; ctrl = 8'h02;
        #10;
        if (out !== 16'h8000 || !v || !n) $display("ADD test failed");

        // Test SUB
        a = 16'h8000; b = 16'h0001; ctrl = 8'h03;
        #10;
        if (out !== 16'h7FFF || v || n) $display("SUB test failed");

        // Test SLT
        a = 16'hFFFF; b = 16'h0001; ctrl = 8'h04;
        #10;
        if (out !== 16'h0001) $display("SLT test failed");

        // Test SLL
        a = 16'h0001; b = 16'h0004; ctrl = 8'h05;
        #10;
        if (out !== 16'h0010) $display("SLL test failed");

        // Test SRL
        a = 16'h8000; b = 16'h0001; ctrl = 8'h06;
        #10;
        if (out !== 16'h4000) $display("SRL test failed");

        // Test SRA
        a = 16'h8000; b = 16'h0001; ctrl = 8'h07;
        #10;
        if (out !== 16'hC000) $display("SRA test failed");

        $display("All tests completed");
        ;
    end
endmodule