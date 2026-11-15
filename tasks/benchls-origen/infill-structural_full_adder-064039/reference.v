module origen_064039(
    input a, b, carryin,
    output out, carryout
);
    assign {carryout, out} = a + b + carryin;
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

