module origen_157672(
    input clk,
    input [15:0] value,
    output reg [7:0] segment,
    output reg [3:0] digit
);

reg [3:0] delay = 0;
reg [1:0] currentSegment = 0;
reg [3:0] currentValue;

always @(posedge clk) begin
    delay <= delay + 1;
    if (delay == 4'b1111) begin
        delay <= 0;
        currentSegment <= currentSegment + 1;
        if (currentSegment == 2'b11)
            currentSegment <= 0;
    end

    case (currentSegment)
        0: begin
            digit <= 4'b1110;
            currentValue <= value[3:0];
        end
        1: begin
            digit <= 4'b1101;
            currentValue <= value[7:4];
        end
        2: begin
            digit <= 4'b1011;
            currentValue <= value[11:8];
        end
        3: begin
            digit <= 4'b0111;
            currentValue <= value[15:12];
        end
    endcase

    case (currentValue)
        0: segment <= 8'b00000011;
        1: segment <= 8'b10011111;
        2: segment <= 8'b00100101;
        3: segment <= 8'b00001101;
        4: segment <= 8'b10011001;
        5: segment <= 8'b01001001;
        6: segment <= 8'b01000001;
        7: segment <= 8'b00011111;
        8: segment <= 8'b00000001;
        9: segment <= 8'b00001001;
        default: segment <= 8'b11111111;
    endcase
end

endmodule