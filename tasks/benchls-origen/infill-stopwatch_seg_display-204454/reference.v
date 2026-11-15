module origen_204454(
    input clk,
    input clk2,
    input clk3,
    input [4:0] key,
    input [1:0] state_now,
    output [3:0] wei3,
    output [7:0] duan3
);

reg [6:0] ms_10, s, m, h;
reg [31:0] count, count0, count1, count2, count3, count4;
reg duan_7, duan3_7, stop_state;
reg [3:0] data, wei_ctrl;
reg [1:0] dis_state;

always @(posedge clk) begin
    if (state_now == 2'b11) begin
        if (key[0]) begin
            if (~stop_state) begin
                stop_state <= 1'b1;
            end
            else begin
                stop_state <= 1'b0;
            end
        end

        if (key[3]) begin
            ms_10 <= 7'd0;
            s <= 7'd0;
            m <= 7'd0;
            h <= 7'd0;
        end

        if (~stop_state) begin
            count <= count + 1;
            if (count >= 100000) begin
                count <= 0;
                ms_10 <= ms_10 + 1;
                if (ms_10 >= 99) begin
                    ms_10 <= 0;
                    s <= s + 1;
                    if (s >= 59) begin
                        s <= 0;
                        m <= m + 1;
                        if (m >= 59) begin
                            m <= 0;
                            h <= h + 1;
                        end
                    end
                end
            end
        end
    end
end

always @(posedge clk2) begin
    if (state_now == 2'b11) begin
        dis_state <= dis_state + 1;
        if (dis_state == 2'b00) begin
            data <= ms_10[3:0];
            wei_ctrl <= 4'b0001;
        end
        if (dis_state == 2'b01) begin
            data <= ms_10[6:4];
            wei_ctrl <= 4'b0010;
        end
        if (dis_state == 2'b10) begin
            data <= s[3:0];
            wei_ctrl <= 4'b0100;
        end
        if (dis_state == 2'b11) begin
            data <= s[6:4];
            wei_ctrl <= 4'b1000;
        end
    end
end

always @(posedge clk3) begin
    if (state_now == 2'b11) begin
        duan3_7 <= 1'b1;
        case (data)
            4'b0000: duan_7 <= 8'b11000000;
            4'b0001: duan_7 <= 8'b11111001;
            4'b0010: duan_7 <= 8'b10100100;
            4'b0011: duan_7 <= 8'b10110000;
            4'b0100: duan_7 <= 8'b10011001;
            4'b0101: duan_7 <= 8'b10010010;
            4'b0110: duan_7 <= 8'b10000010;
            4'b0111: duan_7 <= 8'b11111000;
            4'b1000: duan_7 <= 8'b10000000;
            4'b1001: duan_7 <= 8'b10011000;
            default: duan_7 <= 8'b11111111;
        endcase
    end
end

assign wei3 = wei_ctrl;
assign duan3 = (stop_state) ? 8'b11111111 : duan_7;

endmodule