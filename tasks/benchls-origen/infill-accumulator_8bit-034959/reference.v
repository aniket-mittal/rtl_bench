module origen_034959(
    input [7:0] accin,
    input cin,
    input clk,
    input clear,
    output [7:0] accout,
    output cout
);

    wire [7:0] sum;
    wire carry;

    add8 adder (
        .a(accout),
        .b(accin),
        .cin(cin),
        .sum(sum),
        .cout(carry)
    );

    reg8 accumulator (
        .d(sum),
        .clk(clk),
        .clear(clear),
        .q(accout)
    );

    assign cout = carry;

endmodule

module add8(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);

    assign {cout, sum} = a + b + cin;

endmodule

module reg8(
    input [7:0] d,
    input clk,
    input clear,
    output reg [7:0] q
);

    always @(posedge clk or posedge clear) begin
        if (clear)
            q <= 8'b0;
        else
            q <= d;
    end

endmodule