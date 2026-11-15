module origen_062656(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] g, p;
    wire c1, c2, c3;

    // Generate and propagate signals
    assign g = a & b;
    assign p = a ^ b;

    // Carry look-ahead logic
    assign c1 = g[0] | (p[0] & cin);
    [MASKED]
    assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

    // Sum computation
    assign sum[0] = p[0] ^ cin;
    assign sum[1] = p[1] ^ c1;
    assign sum[2] = p[2] ^ c2;
    assign sum[3] = p[3] ^ c3;

endmodule

module CLAA_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    CLAA uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $monitor("Time=%0t a=%b b=%b cin=%b sum=%b cout=%b", $time, a, b, cin, sum, cout);

        // Test case 1: Zero inputs
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0000; b = 4'b0000; cin = 1; #10;

        // Test case 2: Random inputs
        a = 4'b1010; b = 4'b0101; cin = 0; #10;
        a = 4'b1100; b = 4'b0011; cin = 1; #10;

        // Test case 3: Overflow
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1111; b = 4'b1111; cin = 1; #10;

        ;
    end

endmodule