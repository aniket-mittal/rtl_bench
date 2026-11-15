module origen_053315(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    input z,
    output reg [3:0] d,
    output reg c_out,
    output [4:0] x
);

    [MASKED]

    assign x = {c_out, d};

endmodule

module test_adder;
    reg [3:0] inp1, inp2;
    reg c_in, z;
    wire [3:0] sum;
    wire c_out;
    wire [4:0] x;

    adder uut (
        .a(inp1),
        .b(inp2),
        .c_in(c_in),
        .z(z),
        .d(sum),
        .c_out(c_out),
        .x(x)
    );

    initial begin
        inp1 = 4'b1011;
        inp2 = 4'b0110;
        c_in = 1;
        z = 0;

        $dumpfile("adder_test.vcd");
        $dumpvars(0, test_adder);

        $monitor("Time=%0t z=%b inp1=%b inp2=%b c_in=%b sum=%b c_out=%b x=%b",
                 $time, z, inp1, inp2, c_in, sum, c_out, x);

        repeat(5) begin
            #10 z = ~z;
        end

        #10 ;
    end
endmodule