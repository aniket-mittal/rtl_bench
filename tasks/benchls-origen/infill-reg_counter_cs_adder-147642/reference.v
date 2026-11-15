module origen_147642(
    input wire clk,
    input wire rst,
    input wire [7:0] reg_in,
    input wire select,
    output wire [11:0] final_out,
    output wire carry_out
);

    wire [7:0] reg_out;
    wire [3:0] counter_out;
    wire [11:0] adder_out;

    // 8-bit register with active high synchronous reset
    register reg_inst (
        .clk(clk),
        .rst(rst),
        .in(reg_in),
        .out(reg_out)
    );

    // 4-bit binary counter with synchronous reset
    counter counter_inst (
        .clk(clk),
        .rst(rst),
        .out(counter_out)
    );

    // Carry-select adder
    carry_select_adder adder_inst (
        .a({4'b0000, reg_out}),
        .b({8'b00000000, counter_out}),
        .sum(adder_out),
        .cout(carry_out)
    );

    // Output multiplexer
    assign final_out = select ? {4'b0000, reg_out} : {8'b00000000, counter_out};

endmodule

module register(
    input wire clk,
    input wire rst,
    input wire [7:0] in,
    output reg [7:0] out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 8'h34;
        else
            out <= in;
    end

endmodule

module counter(
    input wire clk,
    input wire rst,
    output reg [3:0] out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 4'b0000;
        else
            out <= out + 1'b1;
    end

endmodule

module carry_select_adder(
    input wire [11:0] a,
    input wire [11:0] b,
    output wire [11:0] sum,
    output wire cout
);

    wire [2:0] c;
    wire [11:0] sum0, sum1;

    // 4-bit ripple carry adders
    ripple_carry_adder rca0(.a(a[3:0]), .b(b[3:0]), .cin(1'b0), .sum(sum[3:0]), .cout(c[0]));
    ripple_carry_adder rca1(.a(a[7:4]), .b(b[7:4]), .cin(c[0]), .sum(sum[7:4]), .cout(c[1]));
    ripple_carry_adder rca2_0(.a(a[11:8]), .b(b[11:8]), .cin(1'b0), .sum(sum0[11:8]), .cout());
    ripple_carry_adder rca2_1(.a(a[11:8]), .b(b[11:8]), .cin(1'b1), .sum(sum1[11:8]), .cout());

    // Multiplexer for final 4 bits
    assign sum[11:8] = c[1] ? sum1[11:8] : sum0[11:8];
    assign cout = c[1] ? 1'b1 : 1'b0;

endmodule

module ripple_carry_adder(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

    wire [3:0] c;

    full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[0]));
    full_adder fa1(.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
    full_adder fa2(.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
    full_adder fa3(.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .cout(cout));

endmodule

module full_adder(
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule