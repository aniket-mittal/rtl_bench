module origen_186267(
    input clk,
    input clr,
    output reg hSync,
    output reg vSync,
    output reg [9:0] x,
    output reg [9:0] y,
    output reg bright
);

reg [2:0] count;
reg [9:0] hCount;
reg [9:0] vCount;

always @(posedge clk or posedge clr) begin
    if (clr) begin
        count <= 3'b000;
        hCount <= 10'b0000000000;
        vCount <= 10'b0000000000;
    end
    else begin
        count <= count + 1'b1;
        if (count == 3'b100) begin
            count <= 3'b000;
            hCount <= hCount + 1'b1;
            if (hCount == 10'd800) begin
                hCount <= 10'b0000000000;
                vCount <= vCount + 1'b1;
                if (vCount == 10'd525) begin
                    vCount <= 10'b0000000000;
                end
            end
        end
    end
end

always @* begin
    if (hCount >= 10'd96)
        hSync = 1'b1;
    else
        hSync = 1'b0;

    if (vCount >= 10'd2)
        vSync = 1'b1;
    else
        vSync = 1'b0;

    x = hCount;
    y = vCount + 10'd35;

    if ((144 <= hCount) && (hCount <= 783) && (0 <= vCount) && (vCount <= 479))
        bright = 1'b1;
    else
        bright = 1'b0;
end

endmodule