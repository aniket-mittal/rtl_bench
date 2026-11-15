module origen_188052(
    input go,
    input [7:0] x_lane0, x_lane1, x_lane2, x_lane3, x_lane4,
    input [6:0] y_lane0, y_lane1, y_lane2, y_lane3, y_lane4,
    input [7:0] x_dot,
    input [6:0] y_dot,
    input CLK,
    output reg resetn
);

[MASKED]

initial begin
    resetn = 1'b1;
end

endmodule