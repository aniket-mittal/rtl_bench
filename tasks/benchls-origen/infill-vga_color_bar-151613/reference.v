module origen_151613(
    input wire clk_20M,
    output wire VGA_HS,
    output wire VGA_VS,
    output wire [2:0] VGA_R,
    output wire [2:0] VGA_G,
    output wire [2:0] VGA_B
);

reg [10:0] x_counter;
reg [9:0] y_counter;
reg [2:0] GRBX;

always @(posedge clk_20M) begin
    if (x_counter < 800) begin
        x_counter <= x_counter + 1;
    end else begin
        x_counter <= 0;
        if (y_counter < 525) begin
            y_counter <= y_counter + 1;
        end else begin
            y_counter <= 0;
        end
    end
end

assign VGA_HS = (x_counter >= 656 && x_counter < 752);
assign VGA_VS = (y_counter >= 490 && y_counter < 492);

always @(*) begin
    if (x_counter < 100) begin
        GRBX = 3'b111;
    end else if (x_counter >= 100 && x_counter < 200) begin
        GRBX = 3'b110;
    end else if (x_counter >= 200 && x_counter < 300) begin
        GRBX = 3'b101;
    end else if (x_counter >= 300 && x_counter < 400) begin
        GRBX = 3'b100;
    end else if (x_counter >= 400 && x_counter < 500) begin
        GRBX = 3'b011;
    end else if (x_counter >= 500 && x_counter < 600) begin
        GRBX = 3'b010;
    end else if (x_counter >= 600 && x_counter < 700) begin
        GRBX = 3'b001;
    end else begin
        GRBX = 3'b000;
    end
end

assign VGA_R = GRBX[2:0];
assign VGA_G = GRBX[2:0];
assign VGA_B = GRBX[2:0];

endmodule