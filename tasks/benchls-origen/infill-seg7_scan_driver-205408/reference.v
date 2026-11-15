module origen_205408(
    input rst,
    input clk,
    input dispen,
    input [15:0] cntr,
    output reg [7:0] seg,
    output reg [3:0] an
);

    reg [1:0] sel;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sel <= 2'b00;
        end else if (dispen) begin
            sel <= sel + 2'b01;
        end
    end

    wire [3:0] seg_dig;
    assign seg_dig = (sel == 2'b00) ? cntr[3:0] :
                     (sel == 2'b01) ? cntr[7:4] :
                     (sel == 2'b10) ? cntr[11:8] :
                                     cntr[15:12];

    always @(*) begin
        case (seg_dig)
            4'b0000: seg = 8'b11000000; // 0
            4'b0001: seg = 8'b11111001; // 1
            4'b0010: seg = 8'b10100100; // 2
            4'b0011: seg = 8'b10110000; // 3
            4'b0100: seg = 8'b10011001; // 4
            4'b0101: seg = 8'b10010010; // 5
            4'b0110: seg = 8'b10000010; // 6
            4'b0111: seg = 8'b11111000; // 7
            4'b1000: seg = 8'b10000000; // 8
            4'b1001: seg = 8'b10010000; // 9
            4'b1010: seg = 8'b10001000; // A
            4'b1011: seg = 8'b10000011; // b
            4'b1100: seg = 8'b11000110; // C
            4'b1101: seg = 8'b10100001; // d
            4'b1110: seg = 8'b10000110; // E
            4'b1111: seg = 8'b10001110; // F
        endcase

        case (sel)
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b0111;
        endcase
    end

endmodule