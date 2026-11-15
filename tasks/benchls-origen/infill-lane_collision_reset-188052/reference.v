module origen_188052(
    input go,
    input [7:0] x_lane0, x_lane1, x_lane2, x_lane3, x_lane4,
    input [6:0] y_lane0, y_lane1, y_lane2, y_lane3, y_lane4,
    input [7:0] x_dot,
    input [6:0] y_dot,
    input CLK,
    output reg resetn
);

always @(posedge CLK) begin
    if (resetn) begin
        case (y_dot)
            y_lane0[6:0]: begin
                if (x_lane0 <= x_dot && x_dot <= x_lane1) begin
                    resetn <= 1'b0;
                end
            end
            y_lane1[6:0]: begin
                if (x_lane1 <= x_dot && x_dot <= x_lane2) begin
                    resetn <= 1'b0;
                end
            end
            y_lane2[6:0]: begin
                if (x_lane2 <= x_dot && x_dot <= x_lane3) begin
                    resetn <= 1'b0;
                end
            end
            y_lane3[6:0]: begin
                if (x_lane3 <= x_dot && x_dot <= x_lane4) begin
                    resetn <= 1'b0;
                end
            end
            y_lane4[6:0]: begin
                if (x_lane4 <= x_dot) begin
                    resetn <= 1'b0;
                end
            end
        endcase
    end else begin
        if (go) begin
            resetn <= 1'b1;
        end
    end
end

initial begin
    resetn = 1'b1;
end

endmodule