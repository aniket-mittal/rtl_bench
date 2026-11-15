`timescale 1ns / 1ps

// Basic Logic Gates
module origen_072012(output out, input a, b);
    nand #10 (out, a, b);
endmodule

module And(output out, input a, b);
    wire w;
    nAnd nand1(w, a, b);
    not #1 not1(out, w);
endmodule

module nOr(output out, input a, b);
    nor #10 (out, a, b);
endmodule

module Or(output out, input a, b);
    wire w;
    nOr nor1(w, a, b);
    not #1 not1(out, w);
endmodule

module xOr(output out, input a, b);
    wire w1, w2, w3;
    nAnd nand1(w1, a, b);
    Or or1(w2, a, b);
    And and1(out, w1, w2);
endmodule

// Multi-bit Modules
module NANDmod #(parameter n = 31) (
    output [n-1:0] out,
    output carryout, zero, overflow,
    input [n-1:0] a, b,
    input subtract
);
    assign carryout = 0;
    assign zero = 0;
    assign overflow = 0;

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : nand_gen
            nAnd nand_inst(out[i], a[i], b[i]);
        end
    endgenerate
endmodule

module ANDmod #(parameter n = 31) (
    output [n-1:0] out,
    output carryout, zero, overflow,
    input [n-1:0] a, b,
    input subtract
);
    assign carryout = 0;
    assign zero = 0;
    assign overflow = 0;

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : and_gen
            And and_inst(out[i], a[i], b[i]);
        end
    endgenerate
endmodule

module NORmod #(parameter n = 31) (
    output [n-1:0] out,
    output carryout, zero, overflow,
    input [n-1:0] a, b,
    input subtract
);
    assign carryout = 0;
    assign zero = 0;
    assign overflow = 0;

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : nor_gen
            nOr nor_inst(out[i], a[i], b[i]);
        end
    endgenerate
endmodule

module ORmod #(parameter n = 31) (
    output [n-1:0] out,
    output carryout, zero, overflow,
    input [n-1:0] a, b,
    input subtract
);
    assign carryout = 0;
    assign zero = 0;
    assign overflow = 0;

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : or_gen
            Or or_inst(out[i], a[i], b[i]);
        end
    endgenerate
endmodule

module XORmod #(parameter n = 31) (
    output [n-1:0] out,
    output carryout, zero, overflow,
    input [n-1:0] a, b,
    input subtract
);
    assign carryout = 0;
    assign zero = 0;
    assign overflow = 0;

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : xor_gen
            xOr xor_inst(out[i], a[i], b[i]);
        end
    endgenerate
endmodule