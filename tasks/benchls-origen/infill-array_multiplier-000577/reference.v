module origen_000577 #(
    parameter input_width = 4,
    parameter output_width = 8
) (
    input [input_width-1:0] in1,
    input [input_width-1:0] in2,
    output [output_width-1:0] out
);

    wire [input_width-1:0][input_width-1:0] bit_mult_res;
    wire [input_width-2:0][input_width-1:0] sum;
    wire [input_width-2:0][input_width:0] carry;

    // Generate partial products
    genvar i, j;
    generate
        for (i = 0; i < input_width; i = i + 1) begin : gen_row
            for (j = 0; j < input_width; j = j + 1) begin : gen_col
                assign bit_mult_res[i][j] = in1[j] & in2[i];
            end
        end
    endgenerate

    // First row of half adders
    generate
        for (j = 0; j < input_width - 1; j = j + 1) begin : gen_first_row
            half_adder ha (
                .a(bit_mult_res[0][j+1]),
                .b(bit_mult_res[1][j]),
                .sum(sum[0][j]),
                .carry(carry[0][j+1])
            );
        end
    endgenerate
    assign carry[0][0] = 1'b0;

    // Subsequent rows of full adders
    generate
        for (i = 1; i < input_width - 1; i = i + 1) begin : gen_fa_rows
            for (j = 0; j < input_width - 1; j = j + 1) begin : gen_fa_cols
                full_adder fa (
                    .a(bit_mult_res[i+1][j]),
                    .b(sum[i-1][j+1]),
                    .cin(carry[i-1][j]),
                    .sum(sum[i][j]),
                    .cout(carry[i][j+1])
                );
            end
            assign sum[i][input_width-1] = carry[i-1][input_width-1];
        end
    endgenerate

    // Final row for carry propagation
    wire [input_width-1:0] final_sum;
    wire [input_width:0] final_carry;
    assign final_carry[0] = 1'b0;

    generate
        for (j = 0; j < input_width; j = j + 1) begin : gen_final_row
            full_adder fa_final (
                .a(sum[input_width-2][j]),
                .b(carry[input_width-2][j]),
                .cin(final_carry[j]),
                .sum(final_sum[j]),
                .cout(final_carry[j+1])
            );
        end
    endgenerate

    // Assign output
    assign out[0] = bit_mult_res[0][0];
    assign out[input_width-1:1] = final_sum[input_width-2:0];
    assign out[output_width-1:input_width] = {final_carry[input_width], final_sum[input_width-1]};

endmodule

module half_adder (
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule