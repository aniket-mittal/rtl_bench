module FULL_ADDER(output sum, carry, input a, b, cin);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (cin & a);
endmodule