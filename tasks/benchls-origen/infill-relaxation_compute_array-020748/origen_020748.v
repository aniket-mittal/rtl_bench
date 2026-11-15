module origen_020748(
    input [28:0] mem_w0, mem_w1, mem_w2, mem_w3,
    output [17:0] out0, out1, out2, out3
);

    compute comp0 (.A_in(mem_w0), .A_out(out0));
    compute comp1 (.A_in(mem_w1), .A_out(out1));
    compute comp2 (.A_in(mem_w2), .A_out(out2));
    compute comp3 (.A_in(mem_w3), .A_out(out3));

endmodule

module compute(
    input [28:0] A_in,
    output reg [17:0] A_out
);

    reg [6:0] relaxation;

    [MASKED]

endmodule

module tb_compute;
    reg [28:0] A_in;
    wire [17:0] A_out;

    compute dut (.A_in(A_in), .A_out(A_out));

    initial begin
        A_in = 29'h1FFFFFFF; #20;
        A_in = 29'h10000000; #20;
        A_in = 29'h00000000; #20;
        A_in = 29'h15A5A5A5; #20;
        ;
    end

    initial begin
        $monitor("Time=%0t A_in=%h A_out=%h", $time, A_in, A_out);
    end
endmodule