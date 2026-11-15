module origen_023188(
    input wire clock,
    input wire resetn,
    input wire [19199:0] image,
    input wire [2:0] color_background,
    input wire [2:0] color_foreground,
    output wire [7:0] x,
    output wire [6:0] y,
    output wire [2:0] color
);

    painter paint_inst (
        .clock(clock),
        .resetn(resetn),
        .image(image),
        .color_background(color_background),
        .color_foreground(color_foreground),
        .x(x),
        .y(y),
        .color(color)
    );

endmodule

module painter(
    input wire clock,
    input wire resetn,
    input wire [19199:0] image,
    input wire [2:0] color_background,
    input wire [2:0] color_foreground,
    output reg [7:0] x,
    output reg [6:0] y,
    output reg [2:0] color
);

    reg [14:0] count;

    always @(posedge clock or negedge resetn) begin
        if (!resetn) begin
            count <= 15'd0;
            x <= 8'd0;
            y <= 7'd119;
            color <= color_background;
        end else begin
            if (count == 15'd19199) begin
                count <= 15'd0;
            end else begin
                count <= count + 1'b1;
            end

            x <= count % 8'd160;
            y <= 7'd119 - (count / 8'd160);
            color <= image[19199 - count] ? color_foreground : color_background;
        end
    end

endmodule