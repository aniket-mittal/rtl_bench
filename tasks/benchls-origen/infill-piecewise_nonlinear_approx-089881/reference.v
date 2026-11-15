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

    always @(posedge done) begin
        x1 = (input_x[bit_size-1]) ? -input_x : input_x;

        if (x1 < 10'b00001_00000)      seg = 4'd0; // 0.5
        else if (x1 < 10'b00010_00000) seg = 4'd1; // 1.0
        else if (x1 < 10'b00011_00000) seg = 4'd2; // 1.5
        else if (x1 < 10'b00100_00000) seg = 4'd3; // 2.0
        else if (x1 < 10'b00101_00000) seg = 4'd4; // 2.5
        else if (x1 < 10'b00110_00000) seg = 4'd5; // 3.0
        else if (x1 < 10'b00111_00000) seg = 4'd6; // 3.5
        else if (x1 < 10'b01000_00000) seg = 4'd7; // 4.0
        else                           seg = 4'd8; // > 4.0

        case (seg)
            4'd0: x2 = x1;
            4'd1: x2 = x1 >> 1;
            4'd2: x2 = x1 >> 2;
            4'd3: x2 = x1 >> 3;
            4'd4: x2 = x1 >> 4;
            4'd5: x2 = x1 >> 5;
            4'd6: x2 = x1 >> 6;
            4'd7: x2 = x1 >> 7;
            4'd8: x2 = x1 >> 8;
        endcase

        b = constant_b[seg];
        x3 = x2 + b;

        output_y = (input_x[bit_size-1]) ? 10'b00001_00000 - x3 : x3;
    end

endmodule