module origen_064039(
    input a, b, carryin,
    output out, carryout
);
    [MASKED]
endmodule

module structuralFullAdder(
    input a, b, carryin,
    output out, carryout
);
    wire axorb, ab, nanb, two;

    xor #50 (axorb, a, b);
    and #50 (ab, a, b);
    not #50 (nanb, ab);
    and #50 (two, carryin, axorb);
    or  #50 (carryout, two, ab);
    xor #50 (out, axorb, carryin);
endmodule

module testFullAdder;
    reg a, b, carryin;
    wire out, carryout;

    structuralFullAdder uut(
        .a(a),
        .b(b),
        .carryin(carryin),
        .out(out),
        .carryout(carryout)
    );

    initial begin
        $display("a b cin | sum cout | Expected");
        $display("--------|---------|----------");

        {a, b, carryin} = 3'b000; #1000;
        $display("%b %b  %b  |  %b   %b   | 0 + 0 + 0 = 00", a, b, carryin, out, carryout);

        {a, b, carryin} = 3'b001; #1000;
        $display("%b %b  %b  |  %b   %b   | 0 + 0 + 1 = 01", a, b, carryin, out, carryout);

        {a, b, carryin} = 3'b010; #1000;
        $display("%b %b  %b  |  %b   %b   | 0 + 1 + 0 = 01", a, b, carryin, out, carryout);

        {a, b, carryin} = 3'b011; #1000;
        $display("%b %b  %b  |  %b   %b   | 0 + 1 + 1 = 10", a, b, carryin, out, carryout);

        {a, b, carryin} = 3'b100; #1000;
        $display("%b %b  %b  |  %b   %b   | 1 + 0 + 0 = 01", a, b, carryin, out, carryout);

        {a, b, carryin} = 3'b101; #1000;
        $display("%b %b  %b  |  %b   %b   | 1 + 0 + 1 = 10", a, b, carryin, out, carryout);

        {a, b, carryin} = 3'b110; #1000;
        $display("%b %b  %b  |  %b   %b   | 1 + 1 + 0 = 10", a, b, carryin, out, carryout);

        {a, b, carryin} = 3'b111; #1000;
        $display("%b %b  %b  |  %b   %b   | 1 + 1 + 1 = 11", a, b, carryin, out, carryout);

        ;
    end
endmodule