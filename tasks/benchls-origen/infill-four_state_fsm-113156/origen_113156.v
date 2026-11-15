module origen_113156(
    input wire clk,
    input wire reset,
    input wire i1,
    input wire i0,
    output reg out2,
    output reg out1,
    output reg out0
);

    // State encoding
    localparam A = 3'b101;
    localparam B = 3'b010;
    localparam C = 3'b001;
    localparam D = 3'b100;

    reg [2:0] ps, ns;

    // Next state logic
    [MASKED]

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            ps <= A;
        else
            ps <= ns;
    end

    // Output logic
    always @(*) begin
        {out2, out1, out0} = ps;
    end

endmodule

// Testbench
module light_tb;
    reg clk, reset, i1, i0;
    wire out2, out1, out0;

    light dut (
        .clk(clk),
        .reset(reset),
        .i1(i1),
        .i0(i0),
        .out2(out2),
        .out1(out1),
        .out0(out0)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #50 clk = ~clk;
    end

    // Test sequence
    initial begin
        reset = 1;
        i1 = 0; i0 = 0;
        #100 reset = 0;

        #100 i1 = 0; i0 = 1;
        #100 i1 = 1; i0 = 0;
        #100 i1 = 1; i0 = 1;
        #100 i1 = 0; i0 = 0;
        #100 i1 = 1; i0 = 1;
        #100 i1 = 0; i0 = 1;

        #500 ;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t, Reset=%b, I1=%b, I0=%b, Out={%b%b%b}", 
                 $time, reset, i1, i0, out2, out1, out0);
    end

endmodule