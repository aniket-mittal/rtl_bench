module origen_155635(
    input clk,
    input rst,
    input [2:0] set_rate,
    output clk_driver
);

reg [19:0] clock_div;
reg clk_5, clk_10, clk_20, clk_25, clk_35, clk_50, clk_75, clk_100;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        clock_div <= 20'b0;
        clk_5 <= 1'b0;
        clk_10 <= 1'b0;
        clk_20 <= 1'b0;
        clk_25 <= 1'b0;
        clk_35 <= 1'b0;
        clk_50 <= 1'b0;
        clk_75 <= 1'b0;
        clk_100 <= 1'b0;
    end
    else begin
        clock_div <= clock_div + 1;
        clk_5 <= (clock_div[19:0] == 20'b00000000000000000001);
        clk_10 <= (clock_div[19:1] == 10'b0000000001);
        clk_20 <= (clock_div[19:2] == 5'b00001);
        clk_25 <= (clock_div[19:2] == 5'b00010);
        clk_35 <= (clock_div[19:3] == 4'b0011);
        clk_50 <= (clock_div[19:4] == 3'b010);
        clk_75 <= (clock_div[19:5] == 2'b01);
        clk_100 <= (clock_div[19:6] == 1'b1);
    end
end

reg [7:0] clk_driver_reg;
always @(*) begin
    case (set_rate)
        3'b000: clk_driver_reg = clk_5;
        3'b001: clk_driver_reg = clk_10;
        3'b010: clk_driver_reg = clk_20;
        3'b011: clk_driver_reg = clk_25;
        3'b100: clk_driver_reg = clk_35;
        3'b101: clk_driver_reg = clk_50;
        3'b110: clk_driver_reg = clk_75;
        3'b111: clk_driver_reg = clk_100;
        default: clk_driver_reg = 8'b0;
    endcase
end

assign clk_driver = clk_driver_reg;

endmodule