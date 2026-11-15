module origen_185285(
    input clk_100,
    input switch,
    input rst,
    input [3:0] distance_flag,
    output reg [2:0] dir,
    output reg [1:0] speed,
    output reg [1:0] choose
);

reg [3:0] state;
parameter s0 = 4'b0000, s11 = 4'b0001, s12 = 4'b0010, s13 = 4'b0011, s14 = 4'b0100,
          s21 = 4'b0101, s22 = 4'b0110, s23 = 4'b0111, s24 = 4'b1000;

reg [7:0] count_l, count_r, count_q;

always @(posedge clk_100 or negedge rst) begin
    if (!rst) begin
        state <= s0;
        dir <= 3'b000;
        speed <= 2'b00;
        choose <= 2'b00;
        count_l <= 8'b0;
        count_r <= 8'b0;
        count_q <= 8'b0;
    end
    else begin
        case(state)
            s0: begin
                dir <= 3'b000;
                speed <= 2'b00;
                choose <= 2'b00;
                count_q <= count_q + 1;
                if (count_q == 8'd50) begin
                    if (distance_flag[1:0] == 2'b00)
                        state <= s21;
                    else
                        state <= s11;
                end
            end
            s11: begin
                dir <= 3'b001;
                speed <= 2'b01;
                choose <= 2'b01;
                if (distance_flag[0] == 1'b1)
                    state <= s12;
                else
                    state <= s11;
            end
            s12: begin
                dir <= 3'b001;
                speed <= 2'b01;
                choose <= 2'b01;
                if (distance_flag[2] == 1'b0)
                    state <= s13;
                else
                    state <= s12;
            end
            s13: begin
                dir <= 3'b001;
                speed <= 2'b01;
                choose <= 2'b01;
                if (distance_flag[2] == 1'b1)
                    state <= s14;
                else
                    state <= s13;
            end
            s14: begin
                dir <= 3'b001;
                speed <= 2'b01;
                choose <= 2'b01;
                count_l <= count_l + 1;
                if (count_l == 8'd50)
                    state <= s0;
                else
                    state <= s14;
            end
            s21: begin
                dir <= 3'b010;
                speed <= 2'b01;
                choose <= 2'b10;
                if (distance_flag[1] == 1'b1)
                    state <= s22;
                else
                    state <= s21;
            end
            s22: begin
                dir <= 3'b010;
                speed <= 2'b01;
                choose <= 2'b10;
                if (distance_flag[3] == 1'b0)
                    state <= s23;
                else
                    state <= s22;
            end
            s23: begin
                dir <= 3'b010;
                speed <= 2'b01;
                choose <= 2'b10;
                if (distance_flag[3] == 1'b1)
                    state <= s24;
                else
                    state <= s23;
            end
            s24: begin
                dir <= 3'b010;
                speed <= 2'b01;
                choose <= 2'b10;
                count_r <= count_r + 1;
                if (count_r == 8'd50)
                    state <= s0;
                else
                    state <= s24;
            end
        endcase
    end
end

endmodule