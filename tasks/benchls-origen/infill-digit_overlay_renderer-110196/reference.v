module origen_110196 (
    input wire clk,
    input wire resetN,
    input wire [10:0] pixelX,
    input wire [10:0] pixelY,
    input wire [3:0] digit1,
    input wire [3:0] digit2,
    input wire [3:0] digit3,
    output reg [10:0] offsetX,
    output reg [10:0] offsetY,
    output reg drawingRequest,
    output reg [3:0] current_digit
);

    parameter OBJECT_WIDTH_X = 32;
    parameter OBJECT_HEIGHT_Y = 32;
    parameter OBJECT_COLOR = 8'h5b;
    parameter TRANSPARENT_ENCODING = 8'hFF;

    wire [1:0] current_number;
    wire insideBracket;

    assign current_number = pixelX / OBJECT_WIDTH_X;
    assign insideBracket = (pixelX < OBJECT_WIDTH_X * 4) && (pixelY < OBJECT_HEIGHT_Y);

    always @(posedge clk or negedge resetN) begin
        if (!resetN) begin
            drawingRequest <= 1'b0;
            current_digit <= 4'b0;
            offsetX <= 11'b0;
            offsetY <= 11'b0;
        end
        else begin
            if (insideBracket) begin
                drawingRequest <= 1'b1;
                offsetX <= pixelX % OBJECT_WIDTH_X;
                offsetY <= pixelY;
                case (current_number)
                    2'b00: current_digit <= digit1;
                    2'b01: current_digit <= 4'hA;
                    2'b10: current_digit <= digit2;
                    2'b11: current_digit <= digit3;
                endcase
            end
            else begin
                drawingRequest <= 1'b0;
                offsetX <= 11'b0;
                offsetY <= 11'b0;
            end
        end
    end

endmodule