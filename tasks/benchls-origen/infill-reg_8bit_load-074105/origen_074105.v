module origen_074105 (
    input wire clk,
    input wire rst,
    input wire ld,
    input wire [7:0] in,
    output reg [7:0] out
);

[MASKED]

endmodule

module test_register_8bit;
    reg clk;
    reg rst;
    reg ld;
    reg [7:0] in;
    wire [7:0] out;

    register_8bit dut (
        .clk(clk),
        .rst(rst),
        .ld(ld),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Stimulus
    initial begin
        rst = 1;
        ld = 0;
        in = 8'b0;
        #15 rst = 0;
        
        #20 in = 8'b10101010;
        ld = 1;
        
        #20 in = 8'b00100101;
        ld = 0;
        
        #40 ld = 1;
        
        #20 ;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t rst=%b ld=%b in=%b out=%b", $time, rst, ld, in, out);
    end

endmodule