module origen_039500 #(
    parameter N = 16
)(
    input [N-1:0] binary,
    output reg [N-1:0] bcd
);

integer i, j;
reg [N-1:0] temp;

[MASKED]

endmodule

module bcd_to_ascii #(
    parameter BCD_BITS = 16,
    parameter BUF_BITS = 16
)(
    input [BCD_BITS-1:0] bcd,
    output reg [BUF_BITS-1:0] ascii
);

integer i;
reg [3:0] digit;
reg non_zero_found;

always @(*) begin
    ascii = 0;
    non_zero_found = 0;
    for (i = BCD_BITS-1; i >= 0; i = i - 4) begin
        digit = bcd[i-:4];
        if (digit != 0 || non_zero_found || i == 3) begin
            ascii = {ascii[BUF_BITS-5:0], 4'h3, digit};
            non_zero_found = 1;
        end else begin
            ascii = {ascii[BUF_BITS-5:0], 8'h5F};
        end
    end
end

endmodule

module bcd_to_ascii_tb;

parameter BCD_BITS = 16;
parameter BUF_BITS = 16;

reg [BCD_BITS-1:0] bcd;
wire [BUF_BITS-1:0] ascii;

bcd_to_ascii #(BCD_BITS, BUF_BITS) uut (
    .bcd(bcd),
    .ascii(ascii)
);

integer i;

initial begin
    // Test case 1: 0
    bcd = 16'h0000;
    #10 $display("Input: %h, ASCII: %h", bcd, ascii);

    // Test case 2: 1
    bcd = 16'h0001;
    #10 $display("Input: %h, ASCII: %h", bcd, ascii);

    // Test case 3: 0x2000
    bcd = 16'h2000;
    #10 $display("Input: %h, ASCII: %h", bcd, ascii);

    // Test cases 4-13: Increment through 10 values starting from 0
    for (i = 0; i < 10; i = i + 1) begin
        bcd = i;
        #10 $display("Input: %h, ASCII: %h", bcd, ascii);
    end

    // Test cases 14-23: Increment through 10 values starting from 0x10
    for (i = 16; i < 26; i = i + 1) begin
        bcd = i;
        #10 $display("Input: %h, ASCII: %h", bcd, ascii);
    end

    // Test cases 24-33: Increment through 10 values starting from 0x1000
    for (i = 4096; i < 4106; i = i + 1) begin
        bcd = i;
        #10 $display("Input: %h, ASCII: %h", bcd, ascii);
    end

    ;
end

endmodule