module origen_074521(
    input wire s_clk, clk,
    input wire en, on_sw,
    input wire shift_right, shift_left, shift_down,
    input wire [10:0] orig_x, orig_y,
    input wire [10:0] pixel_x, pixel_y,
    input wire shot_pixel,
    output reg ship_pixel,
    output wire line_crossed
);

    reg [10:0] ship_x, ship_y;
    reg destroyed;

    // Ship movement
    always @(posedge clk) begin
        if (!on_sw) begin
            ship_x <= orig_x;
            ship_y <= orig_y;
        end else if (en) begin
            if (shift_right && ship_x < 11'd638)
                ship_x <= ship_x + 1;
            else if (shift_left && ship_x > 11'd2)
                ship_x <= ship_x - 1;
            
            if (shift_down && ship_y < 11'd478)
                ship_y <= ship_y + 1;
        end
    end

    // Destruction detection
    always @(posedge s_clk) begin
        if (shot_pixel && ship_pixel)
            destroyed <= 1'b1;
        else if (!on_sw)
            destroyed <= 1'b0;
    end

    // Ship rendering
    always @* begin
        if (!destroyed && (pixel_x >= ship_x) && (pixel_x < ship_x + 60) &&
            (pixel_y >= ship_y) && (pixel_y < ship_y + 45)) begin
            if ((pixel_y >= ship_y + 40) ||
                (pixel_x >= ship_x + 5 && pixel_x < ship_x + 55)) begin
                ship_pixel = 1'b1;
            end else begin
                ship_pixel = 1'b0;
            end
        end else begin
            ship_pixel = 1'b0;
        end
    end

    // Line crossing detection
    assign line_crossed = (ship_y > 11'd544) && !destroyed;

endmodule