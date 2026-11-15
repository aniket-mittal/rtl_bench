module origen_089141(
    input wire [31:0] instruction,
    input wire clk,
    output reg [2:0] INaddr,
    output reg [2:0] OUT1addr,
    output reg [2:0] OUT2addr,
    output reg [2:0] select,
    output reg out1mux,
    output reg out2mux,
    output reg immediatemux
);

    reg [5:0] opcode;
    reg [4:0] dest, src1, src2;

    [MASKED]
endmodule

module testbench;
    reg [31:0] instruction;
    reg clk;
    wire [2:0] INaddr, OUT1addr, OUT2addr, select;
    wire out1mux, out2mux, immediatemux;

    CU dut(
        .instruction(instruction),
        .clk(clk),
        .INaddr(INaddr),
        .OUT1addr(OUT1addr),
        .OUT2addr(OUT2addr),
        .select(select),
        .out1mux(out1mux),
        .out2mux(out2mux),
        .immediatemux(immediatemux)
    );

    initial begin
        clk = 0;
        instruction = 32'h12345678;
        #50 ;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t clk=%b instruction=%h INaddr=%b OUT1addr=%b OUT2addr=%b select=%b out1mux=%b out2mux=%b immediatemux=%b",
                 $time, clk, instruction, INaddr, OUT1addr, OUT2addr, select, out1mux, out2mux, immediatemux);
    end
endmodule