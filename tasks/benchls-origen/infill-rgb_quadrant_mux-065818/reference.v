module origen_065818 (
    input wire clk,
    input wire [2:0] quadrant,
    input wire [9:0] radius,
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
);

always @(posedge clk) begin
    case (quadrant)
        3'd0: begin // Pure red
            red <= radius[7:4];
            green <= 4'b0000;
            blue <= 4'b0000;
        end
        3'd1: begin // Yellow (red + green)
            red <= radius[6:3];
            green <= radius[6:3];
            blue <= 4'b0000;
        end
        3'd2: begin // Pure green
            red <= 4'b0000;
            green <= radius[5:2];
            blue <= 4'b0000;
        end
        3'd3: begin // Cyan (green + blue)
            red <= 4'b0000;
            green <= radius[4:1];
            blue <= radius[4:1];
        end
        3'd4: begin // Pure blue
            red <= 4'b0000;
            green <= 4'b0000;
            blue <= radius[3:0];
        end
        3'd5: begin // Magenta (red + blue)
            red <= radius[8:5];
            green <= 4'b0000;
            blue <= radius[8:5];
        end
        default: begin // Black
            red <= 4'b0000;
            green <= 4'b0000;
            blue <= 4'b0000;
        end
    endcase
end

endmodule