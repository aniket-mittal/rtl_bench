module origen_135099 (
    input wire clk,
    input wire rst_n,
    input wire [99:0] a,
    input wire [99:0] b,
    input wire cin,
    output reg [99:0] sum,
    output reg cout
);

    // Pipeline registers
    reg [99:0] a_reg, b_reg;
    reg cin_reg;
    reg [99:0] sum_reg;
    reg cout_reg;

    // Intermediate signals
    wire [99:0] sum_0, sum_1;
    wire [24:0] cout_0, cout_1;

    // Instantiate 25 4-bit carry select adder blocks
    genvar i;
    generate
        for (i = 0; i < 25; i = i + 1) begin : csa_block
            carry_select_adder_4bit csa_0 (
                .a(a_reg[i*4+3:i*4]),
                .b(b_reg[i*4+3:i*4]),
                .cin(i == 0 ? cin_reg : cout_0[i-1]),
                .sum(sum_0[i*4+3:i*4]),
                .cout(cout_0[i])
            );

            carry_select_adder_4bit csa_1 (
                .a(a_reg[i*4+3:i*4]),
                .b(b_reg[i*4+3:i*4]),
                .cin(i == 0 ? 1'b1 : cout_1[i-1]),
                .sum(sum_1[i*4+3:i*4]),
                .cout(cout_1[i])
            );
        end
    endgenerate

    // Pipeline stage 1: Input registration
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg <= 100'b0;
            b_reg <= 100'b0;
            cin_reg <= 1'b0;
        end else begin
            a_reg <= a;
            b_reg <= b;
            cin_reg <= cin;
        end
    end

    // Pipeline stage 2: Computation and output registration
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sum <= 100'b0;
            cout <= 1'b0;
        end else begin
            sum <= cin_reg ? sum_1 : sum_0;
            cout <= cin_reg ? cout_1[24] : cout_0[24];
        end
    end

endmodule

// 4-bit carry select adder
module carry_select_adder_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

    wire [3:0] sum_0, sum_1;
    wire cout_0, cout_1;

    // Adder with cin = 0
    ripple_carry_adder_4bit rca_0 (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum_0),
        .cout(cout_0)
    );

    // Adder with cin = 1
    ripple_carry_adder_4bit rca_1 (
        .a(a),
        .b(b),
        .cin(1'b1),
        .sum(sum_1),
        .cout(cout_1)
    );

    // Multiplexer for sum selection
    assign sum = cin ? sum_1 : sum_0;
    assign cout = cin ? cout_1 : cout_0;

endmodule

// 4-bit ripple carry adder
module ripple_carry_adder_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

    wire [4:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : full_adder
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[4];

endmodule

// Full adder
module full_adder (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule