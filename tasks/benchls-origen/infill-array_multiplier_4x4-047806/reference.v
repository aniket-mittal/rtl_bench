module origen_047806(
    input a, b, c_in,
    output s, c_out
);
    assign s = a ^ b ^ c_in;
    assign c_out = (a ^ b) ? c_in : b;
endmodule

module array_multiplier_4x4(
    input [3:0] a, b,
    output [8:0] p
);
    wire [15:0] pp;
    wire [11:0] s;
    wire [11:0] c;

    // Generate partial products
    genvar i, j;
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_pp_i
            for (j = 0; j < 4; j = j + 1) begin : gen_pp_j
                assign pp[i*4 + j] = a[i] & b[j];
            end
        end
    endgenerate

    // First row of full adders
    full_adder fa00(pp[1], pp[4], 1'b0, s[0], c[0]);
    full_adder fa01(pp[2], pp[5], pp[8], s[1], c[1]);
    full_adder fa02(pp[3], pp[6], pp[9], s[2], c[2]);
    full_adder fa03(pp[7], pp[10], pp[13], s[3], c[3]);

    // Second row of full adders
    full_adder fa10(s[1], c[0], pp[8], s[4], c[4]);
    full_adder fa11(s[2], c[1], pp[11], s[5], c[5]);
    full_adder fa12(s[3], c[2], pp[14], s[6], c[6]);
    full_adder fa13(c[3], pp[11], pp[15], s[7], c[7]);

    // Third row of full adders
    full_adder fa20(s[5], c[4], pp[12], s[8], c[8]);
    full_adder fa21(s[6], c[5], pp[15], s[9], c[9]);
    full_adder fa22(s[7], c[6], 1'b0, s[10], c[10]);
    full_adder fa23(c[7], c[9], c[10], s[11], c[11]);

    // Assign product bits
    assign p[0] = pp[0];
    assign p[1] = s[0];
    assign p[2] = s[4];
    assign p[3] = s[8];
    assign p[4] = s[9];
    assign p[5] = s[10];
    assign p[6] = s[11];
    assign p[7] = c[8];
    assign p[8] = c[11];

endmodule