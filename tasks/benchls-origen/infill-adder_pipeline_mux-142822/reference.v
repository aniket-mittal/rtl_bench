module origen_142822 (
    input wire clk,
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [8:0] sum
);

    reg [7:0] shift_reg;
    wire [7:0] half_adder_sum;
    wire half_adder_carry;
    wire [8:0] mux_out;
    reg [8:0] final_sum;

    // Shift Register
    always @(posedge clk) begin
        shift_reg <= a;
    end

    // Half Adder
    half_adder ha (
        .a(shift_reg[0]),
        .b(b[0]),
        .sum(half_adder_sum[0]),
        .carry(half_adder_carry)
    );

    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : gen_half_adders
            half_adder ha_i (
                .a(shift_reg[i]),
                .b(b[i]),
                .sum(half_adder_sum[i]),
                .carry()
            );
        end
    endgenerate

    // 2-to-1 Multiplexer
    assign mux_out = (clk) ? {1'b0, shift_reg} : {half_adder_carry, half_adder_sum};

    // Additional Functional Module
    always @(negedge clk) begin
        final_sum <= mux_out + {1'b0, shift_reg};
    end

    assign sum = final_sum;

endmodule

module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);

    assign sum = a ^ b;
    assign carry = a & b;

endmodule