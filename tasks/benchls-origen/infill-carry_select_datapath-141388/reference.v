module origen_141388(
    input [31:0] a,
    input [31:0] b,
    input select,
    output [31:0] result
);

    wire [31:0] adder_out, xor_out, func_out;
    
    carry_select_adder csa(
        .a(a),
        .b(b),
        .sum(adder_out)
    );
    
    xor_gate xor_gate_inst(
        .a(a),
        .b(b),
        .out(xor_out)
    );
    
    functional_module func_mod(
        .adder_in(adder_out),
        .xor_in(xor_out),
        .out(func_out)
    );
    
    control_logic ctrl(
        .adder_in(adder_out),
        .func_in(func_out),
        .select(select),
        .out(result)
    );

endmodule

module carry_select_adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [7:0] carry;
    
    ripple_carry_adder #(4) rca0 (.a(a[3:0]), .b(b[3:0]), .cin(1'b0), .sum(sum[3:0]), .cout(carry[0]));
    
    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : gen_csa
            carry_select_block csb (
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(carry[i-1]),
                .sum(sum[4*i+3:4*i]),
                .cout(carry[i])
            );
        end
    endgenerate
endmodule

module carry_select_block(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [3:0] sum0, sum1;
    wire cout0, cout1;
    
    ripple_carry_adder #(4) rca0 (.a(a), .b(b), .cin(1'b0), .sum(sum0), .cout(cout0));
    ripple_carry_adder #(4) rca1 (.a(a), .b(b), .cin(1'b1), .sum(sum1), .cout(cout1));
    
    assign sum = cin ? sum1 : sum0;
    assign cout = cin ? cout1 : cout0;
endmodule

module ripple_carry_adder #(parameter WIDTH = 4)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input cin,
    output [WIDTH-1:0] sum,
    output cout
);
    wire [WIDTH:0] carry;
    assign carry[0] = cin;
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_fa
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
    
    assign cout = carry[WIDTH];
endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module xor_gate(
    input [31:0] a,
    input [31:0] b,
    output [31:0] out
);
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : gen_xor
            wire nand1_out, nand2_out;
            nand(nand1_out, a[i], b[i]);
            nand(nand2_out, a[i], nand1_out);
            nand(out[i], b[i], nand1_out);
        end
    endgenerate
endmodule

module functional_module(
    input [31:0] adder_in,
    input [31:0] xor_in,
    output [31:0] out
);
    assign out = adder_in ^ xor_in;
endmodule

module control_logic(
    input [31:0] adder_in,
    input [31:0] func_in,
    input select,
    output [31:0] out
);
    assign out = select ? func_in : adder_in;
endmodule