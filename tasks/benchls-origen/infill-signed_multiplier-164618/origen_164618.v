module origen_164618(
    input [7:0] a,
    input [7:0] b,
    input start,
    input clk,
    output [15:0] r,
    output done
);

reg [7:0] im_a, im_b;
reg [15:0] im_r;
reg isNegA, isNegB, isNegR;
reg im_done, allow_mult;

initial begin
    im_done = 1'b1;
    allow_mult = 1'b0;
    im_a = 8'b0;
    im_b = 8'b0;
    isNegA = 1'b0;
    isNegB = 1'b0;
    isNegR = 1'b0;
end

[MASKED]

assign done = im_done;
assign r = (allow_mult) ? im_r : 16'bX;

endmodule