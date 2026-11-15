module origen_134175(
    input wire clk,
    input wire reset,
    input wire [3:0] binary_in,
    output wire [3:0] gray_out
);

wire [3:0] binary_reg;
wire [3:0] xor_out;

// 8-bit D flip-flop module (4 bits used)
shift_register_8bit sr(
    .clk(clk),
    .reset(reset),
    .d(binary_in),
    .q(binary_reg)
);

// XOR operations using AND and NOR gates
and_nor_2input xor0 (.a(binary_reg[3]), .b(binary_reg[2]), .y(xor_out[3]));
and_nor_2input xor1 (.a(binary_reg[2]), .b(binary_reg[1]), .y(xor_out[2]));
and_nor_2input xor2 (.a(binary_reg[1]), .b(binary_reg[0]), .y(xor_out[1]));

assign gray_out[3] = binary_reg[3];
assign gray_out[2:0] = xor_out[3:1];

endmodule

// 2-input AND gate using only NOR gates
module and_nor_2input(
    input wire a,
    input wire b,
    output wire y
);

wire nor1_out, nor2_out, nor3_out;

nor(nor1_out, a, a);
nor(nor2_out, b, b);
nor(nor3_out, nor1_out, nor2_out);
nor(y, nor3_out, nor3_out);

endmodule

// 8-bit D flip-flop using shift register architecture
module shift_register_8bit(
    input wire clk,
    input wire reset,
    input wire [7:0] d,
    output reg [7:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 8'b0;
    end else begin
        q <= d;
    end
end

endmodule