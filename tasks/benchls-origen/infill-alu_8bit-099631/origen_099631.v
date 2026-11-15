module origen_099631 (
    input [7:0] in1, in2,
    input cin, m,
    input [3:0] s,
    output reg [7:0] out,
    output aeb, cout
);

    [MASKED]

    assign aeb = (in1 == in2);
    assign cout = in1[7] & in2[7];

endmodule