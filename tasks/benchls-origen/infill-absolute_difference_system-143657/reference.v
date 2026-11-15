module origen_143657 (
    input [7:0] in,
    output [7:0] out
);
    assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
endmodule

module subtractor (
    input [7:0] a,
    input [7:0] b,
    output [7:0] diff
);
    assign diff = a - b;
endmodule

module abs_diff (
    input [7:0] sub_result,
    input [7:0] rev_result,
    output [7:0] abs_diff
);
    assign abs_diff = (sub_result[7]) ? (~sub_result + 1'b1) : sub_result;
endmodule

module control_logic (
    input select,
    input [7:0] a,
    input [7:0] b,
    output [7:0] result
);
    wire [7:0] rev_out, sub_out;
    
    bit_reverser br (.in(a), .out(rev_out));
    subtractor sub (.a(a), .b(b), .diff(sub_out));
    
    assign result = select ? rev_out : sub_out;
endmodule

module absolute_difference_system (
    input [7:0] a,
    input [7:0] b,
    input select,
    output [7:0] result
);
    wire [7:0] control_out;
    
    control_logic ctrl (
        .select(select),
        .a(a),
        .b(b),
        .result(control_out)
    );
    
    abs_diff abs (
        .sub_result(control_out),
        .rev_result(control_out),
        .abs_diff(result)
    );
endmodule