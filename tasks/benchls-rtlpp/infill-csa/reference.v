module csa(input a, b, c, output s, cout);
    assign {cout, s} = a + b + c;
endmodule