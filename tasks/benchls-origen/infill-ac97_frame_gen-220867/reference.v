module origen_220867(
    input  wire        BIT_CLK,
    input  wire [19:0] slots0,
    input  wire [19:0] slots1,
    input  wire [19:0] slots2,
    input  wire [19:0] slots3,
    input  wire [19:0] slots4,
    output reg         SYNC,
    output reg         SDATA_OUT,
    output reg         RESET,
    output reg [7:0]   frameCount
);

reg [8:0] bit_count;
reg [8:0] reset_count;

initial begin
    bit_count = 0;
    reset_count = 0;
    frameCount = 0;
    RESET = 0;
end

always @(posedge BIT_CLK) begin
    if (reset_count == 255) begin
        RESET = 0;
        bit_count = 0;
        reset_count = 0;
        frameCount = frameCount + 1;
    end else begin
        reset_count = reset_count + 1;
    end

    if (bit_count == 254)
        SYNC = 1;
    else if (bit_count == 15)
        SYNC = 0;

    case (bit_count)
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15:
            SDATA_OUT = slots0[bit_count];
        16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35:
            SDATA_OUT = slots1[bit_count - 16];
        36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55:
            SDATA_OUT = slots2[bit_count - 36];
        56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75:
            SDATA_OUT = slots3[bit_count - 56];
        76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95:
            SDATA_OUT = slots4[bit_count - 76];
        default:
            SDATA_OUT = 0;
    endcase

    bit_count = bit_count + 1;
end

endmodule