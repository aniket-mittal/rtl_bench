module origen_143867(
    input wire [3:0] binary_in,
    input wire reset,
    output reg [6:0] seg_out_0,
    output reg [6:0] seg_out_1,
    output reg [6:0] seg_out_2,
    output reg [6:0] seg_out_3
);

reg [3:0] bcd_0, bcd_1, bcd_2, bcd_3;

[MASKED]

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
module tb_binary_to_bcd;
    reg [3:0] binary_in;
    reg reset;
    wire [6:0] seg_out_0, seg_out_1, seg_out_2, seg_out_3;

    binary_to_bcd uut (
        .binary_in(binary_in),
        .reset(reset),
        .seg_out_0(seg_out_0),
        .seg_out_1(seg_out_1),
        .seg_out_2(seg_out_2),
        .seg_out_3(seg_out_3)
    );

    initial begin
        reset = 1;
        binary_in = 4'b0000;
        #10 reset = 0;

        for (int i = 0; i < 16; i = i + 1) begin
            binary_in = i;
            #10;
        end

        ;
    end

    initial begin
        $monitor("Time=%0t binary_in=%b reset=%b seg_out_0=%b seg_out_1=%b seg_out_2=%b seg_out_3=%b",
                 $time, binary_in, reset, seg_out_0, seg_out_1, seg_out_2, seg_out_3);
    end
endmodule