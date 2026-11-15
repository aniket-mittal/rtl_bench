module origen_143867(
    input wire [3:0] binary_in,
    input wire reset,
    output reg [6:0] seg_out_0,
    output reg [6:0] seg_out_1,
    output reg [6:0] seg_out_2,
    output reg [6:0] seg_out_3
);

reg [3:0] bcd_0, bcd_1, bcd_2, bcd_3;

always @(*) begin
    if (reset) begin
        bcd_0 = 4'b0000;
        bcd_1 = 4'b0000;
        bcd_2 = 4'b0000;
        bcd_3 = 4'b0000;
    end else begin
        bcd_0 = binary_in % 10;
        bcd_1 = (binary_in / 10) % 10;
        bcd_2 = (binary_in / 100) % 10;
        bcd_3 = binary_in / 1000;
    end
end

always @(*) begin
    case(bcd_0)
        4'b0000: seg_out_0 = 7'b1000000;
        4'b0001: seg_out_0 = 7'b1111001;
        4'b0010: seg_out_0 = 7'b0100100;
        4'b0011: seg_out_0 = 7'b0110000;
        4'b0100: seg_out_0 = 7'b0011001;
        4'b0101: seg_out_0 = 7'b0010010;
        4'b0110: seg_out_0 = 7'b0000010;
        4'b0111: seg_out_0 = 7'b1111000;
        4'b1000: seg_out_0 = 7'b0000000;
        4'b1001: seg_out_0 = 7'b0010000;
        default: seg_out_0 = 7'b1111111;
    endcase
end

always @(*) begin
    case(bcd_1)
        4'b0000: seg_out_1 = 7'b1000000;
        4'b0001: seg_out_1 = 7'b1111001;
        4'b0010: seg_out_1 = 7'b0100100;
        4'b0011: seg_out_1 = 7'b0110000;
        4'b0100: seg_out_1 = 7'b0011001;
        4'b0101: seg_out_1 = 7'b0010010;
        4'b0110: seg_out_1 = 7'b0000010;
        4'b0111: seg_out_1 = 7'b1111000;
        4'b1000: seg_out_1 = 7'b0000000;
        4'b1001: seg_out_1 = 7'b0010000;
        default: seg_out_1 = 7'b1111111;
    endcase
end

always @(*) begin
    case(bcd_2)
        4'b0000: seg_out_2 = 7'b1000000;
        4'b0001: seg_out_2 = 7'b1111001;
        default: seg_out_2 = 7'b1111111;
    endcase
end

always @(*) begin
    seg_out_3 = 7'b1000000; // Always 0 for 4-bit input
end

endmodule

// Testbench
