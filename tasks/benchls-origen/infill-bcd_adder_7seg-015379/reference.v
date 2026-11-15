module origen_015379(
    input [3:0] a,
    input [3:0] b,
    output [6:0] seg1,
    output [6:0] seg2
);
    wire [3:0] sum;
    wire [3:0] cout;
    
    bcdadd adder(.a(a), .b(b), .Sum(sum), .Cout(cout));
    BCD_to_7SEG decoder1(.D(sum), .seg(seg1));
    BCD_to_7SEG decoder2(.D(cout), .seg(seg2));
endmodule

module BCD_to_7SEG(
    input [3:0] D,
    output reg [6:0] seg
);
    always @(*) begin
        case(D)
            4'b0000: seg = 7'b1000000; // 0
            4'b0001: seg = 7'b1111001; // 1
            4'b0010: seg = 7'b0100100; // 2
            4'b0011: seg = 7'b0110000; // 3
            4'b0100: seg = 7'b0011001; // 4
            4'b0101: seg = 7'b0010010; // 5
            4'b0110: seg = 7'b0000010; // 6
            4'b0111: seg = 7'b1111000; // 7
            4'b1000: seg = 7'b0000000; // 8
            4'b1001: seg = 7'b0010000; // 9
            default: seg = 7'b1111111; // off
        endcase
    end
endmodule

module bcdadd(
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] Sum,
    output reg [3:0] Cout
);
    reg [4:0] temp;
    
    always @(*) begin
        temp = a + b;
        if(temp > 9) begin
            Sum = temp + 6;
            Cout = 4'b0001;
        end else begin
            Sum = temp[3:0];
            Cout = 4'b0000;
        end
    end
endmodule