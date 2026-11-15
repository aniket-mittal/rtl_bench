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

[MASKED]

endmodule