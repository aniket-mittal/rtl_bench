module origen_035113(
    input reset,
    input fpga_clk,
    input vga_clk,
    input display_area,
    input shifter_output,
    input Rin,
    input Gin,
    input Bin,
    output reg [2:0] Redout,
    output reg [2:0] Greenout,
    output reg [2:0] Blueout
);

reg [2:0] red_value, green_value, blue_value;
reg red_up, green_up, blue_up;

always @(posedge fpga_clk or posedge reset) begin
    if (reset) begin
        red_value <= 3'b000;
        green_value <= 3'b000;
        blue_value <= 3'b000;
        red_up <= 1'b1;
        green_up <= 1'b1;
        blue_up <= 1'b1;
    end else begin
        // Red color logic
        if (Rin) begin
            if (red_up) begin
                if (red_value == 3'b111)
                    red_up <= 1'b0;
                else
                    red_value <= red_value + 1'b1;
            end else begin
                if (red_value == 3'b000)
                    red_up <= 1'b1;
                else
                    red_value <= red_value - 1'b1;
            end
        end

        // Green color logic
        if (Gin) begin
            if (green_up) begin
                if (green_value == 3'b111)
                    green_up <= 1'b0;
                else
                    green_value <= green_value + 1'b1;
            end else begin
                if (green_value == 3'b000)
                    green_up <= 1'b1;
                else
                    green_value <= green_value - 1'b1;
            end
        end

        // Blue color logic
        if (Bin) begin
            if (blue_up) begin
                if (blue_value == 3'b111)
                    blue_up <= 1'b0;
                else
                    blue_value <= blue_value + 1'b1;
            end else begin
                if (blue_value == 3'b000)
                    blue_up <= 1'b1;
                else
                    blue_value <= blue_value - 1'b1;
            end
        end
    end
end

always @(posedge vga_clk or posedge reset) begin
    if (reset) begin
        Redout <= 3'b000;
        Greenout <= 3'b000;
        Blueout <= 3'b000;
    end else begin
        if (display_area && shifter_output) begin
            Redout <= red_value;
            Greenout <= green_value;
            Blueout <= blue_value;
        end else begin
            Redout <= 3'b000;
            Greenout <= 3'b000;
            Blueout <= 3'b000;
        end
    end
end

endmodule