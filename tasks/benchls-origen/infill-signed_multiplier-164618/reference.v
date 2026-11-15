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

always @(posedge clk) begin
    if (start) begin
        im_a = (a[7]) ? -a : a;
        im_b = (b[7]) ? -b : b;
        isNegA = a[7];
        isNegB = b[7];
        im_r = im_a * im_b;
        isNegR = (im_a[7] ^ im_b[7]);
        if (isNegR) begin
            im_r = -im_r;
        end
        im_done = 1'b0;
        allow_mult = 1'b0;
    end
    else begin
        if (!im_done) begin
            if (allow_mult) begin
                im_done = 1'b1;
            end
            else begin
                allow_mult = 1'b1;
            end
        end
    end
end

assign done = im_done;
assign r = (allow_mult) ? im_r : 16'bX;

endmodule