module origen_208881(
    input  signed [31:0] A,
    input  signed [31:0] B,
    input  [4:0] Op,
    output signed [31:0] C,
    output Over
);

    reg signed [31:0] result;
    reg over_flag;

    [MASKED]

    assign C = result;
    assign Over = over_flag;

endmodule