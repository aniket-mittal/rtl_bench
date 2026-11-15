module origen_143170(
    input [31:0] a,
    input [31:0] b,
    input cin,
    input [5:0] sel,
    input [23:0] data,
    output [31:0] final_out
);

    wire [31:0] adder_out;
    wire cout;
    wire [3:0] mux_out;

    // Carry-select adder
    carry_select_adder csa (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(adder_out),
        .cout(cout)
    );

    // 6-to-1 priority encoder-based multiplexer
    priority_mux pmux (
        .sel(sel),
        .data(data),
        .out(mux_out)
    );

    // Bitwise XOR operation
    assign final_out = adder_out ^ {28'b0, mux_out};

endmodule

module carry_select_adder(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);

    wire [15:0] sum_l, sum_h0, sum_h1;
    wire cout_l, cout_h0, cout_h1;

    // Lower 16 bits
    ripple_carry_adder #(16) rca_l (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(cin),
        .sum(sum_l),
        .cout(cout_l)
    );

    // Upper 16 bits with cin = 0
    ripple_carry_adder #(16) rca_h0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_h0),
        .cout(cout_h0)
    );

    // Upper 16 bits with cin = 1
    ripple_carry_adder #(16) rca_h1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_h1),
        .cout(cout_h1)
    );

    // Mux for selecting the correct upper 16 bits
    assign sum[15:0] = sum_l;
    assign sum[31:16] = cout_l ? sum_h1 : sum_h0;
    assign cout = cout_l ? cout_h1 : cout_h0;

endmodule

module ripple_carry_adder #(
    parameter WIDTH = 16
)(
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
        for (i = 0; i < WIDTH; i = i + 1) begin : fa_loop
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

module priority_mux(
    input [5:0] sel,
    input [23:0] data,
    output reg [3:0] out
);

    always @(*) begin
        case (sel)
            6'b000001: out = data[3:0];
            6'b00001x: out = data[7:4];
            6'b0001xx: out = data[11:8];
            6'b001xxx: out = data[15:12];
            6'b01xxxx: out = data[19:16];
            6'b1xxxxx: out = data[23:20];
            default: out = 4'b0000;
        endcase
    end

endmodule