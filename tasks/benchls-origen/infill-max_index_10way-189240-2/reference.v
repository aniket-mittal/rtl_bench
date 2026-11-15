module origen_189240(
    input signed [25:0] out1,
    input signed [25:0] out2,
    input signed [25:0] out3,
    input signed [25:0] out4,
    input signed [25:0] out5,
    input signed [25:0] out6,
    input signed [25:0] out7,
    input signed [25:0] out8,
    input signed [25:0] out9,
    input signed [25:0] out10,
    output reg [3:0] max
);

always @(*) begin
    if (out1 >= out2 && out1 >= out3 && out1 >= out4 && out1 >= out5 && out1 >= out6 && out1 >= out7 && out1 >= out8 && out1 >= out9 && out1 >= out10) begin
        max = 4'b0000;
    end
    else if (out2 >= out1 && out2 >= out3 && out2 >= out4 && out2 >= out5 && out2 >= out6 && out2 >= out7 && out2 >= out8 && out2 >= out9 && out2 >= out10) begin
        max = 4'b0001;
    end
    else if (out3 >= out1 && out3 >= out2 && out3 >= out4 && out3 >= out5 && out3 >= out6 && out3 >= out7 && out3 >= out8 && out3 >= out9 && out3 >= out10) begin
        max = 4'b0010;
    end
    else if (out4 >= out1 && out4 >= out2 && out4 >= out3 && out4 >= out5 && out4 >= out6 && out4 >= out7 && out4 >= out8 && out4 >= out9 && out4 >= out10) begin
        max = 4'b0011;
    end
    else if (out5 >= out1 && out5 >= out2 && out5 >= out3 && out5 >= out4 && out5 >= out6 && out5 >= out7 && out5 >= out8 && out5 >= out9 && out5 >= out10) begin
        max = 4'b0100;
    end
    else if (out6 >= out1 && out6 >= out2 && out6 >= out3 && out6 >= out4 && out6 >= out5 && out6 >= out7 && out6 >= out8 && out6 >= out9 && out6 >= out10) begin
        max = 4'b0101;
    end
    else if (out7 >= out1 && out7 >= out2 && out7 >= out3 && out7 >= out4 && out7 >= out5 && out7 >= out6 && out7 >= out8 && out7 >= out9 && out7 >= out10) begin
        max = 4'b0110;
    end
    else if (out8 >= out1 && out8 >= out2 && out8 >= out3 && out8 >= out4 && out8 >= out5 && out8 >= out6 && out8 >= out7 && out8 >= out9 && out8 >= out10) begin
        max = 4'b0111;
    end
    else if (out9 >= out1 && out9 >= out2 && out9 >= out3 && out9 >= out4 && out9 >= out5 && out9 >= out6 && out9 >= out7 && out9 >= out8 && out9 >= out10) begin
        max = 4'b1000;
    end
    else if (out10 >= out1 && out10 >= out2 && out10 >= out3 && out10 >= out4 && out10 >= out5 && out10 >= out6 && out10 >= out7 && out10 >= out8 && out10 >= out9) begin
        max = 4'b1001;
    end
    else begin
        max = 4'b0000;
    end
end

endmodule