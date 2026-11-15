module origen_089881 #(
    parameter bit_size = 10
)(
    input wire clk,
    input wire done,
    input wire signed [bit_size-1:0] input_x,
    output reg signed [bit_size-1:0] output_y
);

    reg signed [bit_size-1:0] x1, x2, x3, b;
    reg [3:0] seg;
    reg signed [bit_size-1:0] constant_b [0:8];

    initial begin
        constant_b[0] = 10'b00001_00000; // 0.5
        constant_b[1] = 10'b00001_01010; // 0.5703125
        constant_b[2] = 10'b00001_10011; // 0.638671875
        constant_b[3] = 10'b00001_11011; // 0.701171875
        constant_b[4] = 10'b00001_11111; // 0.7578125
        constant_b[5] = 10'b00001_11111; // 0.7578125
        constant_b[6] = 10'b00010_00000; // 0.8125
        constant_b[7] = 10'b00010_00000; // 0.8125
        constant_b[8] = 10'b00010_00001; // 0.8203125
    end

    [MASKED]

endmodule