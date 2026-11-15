module origen_051824 (
    input wire clk,
    input wire rst_n,
    input wire [3:0] key,
    output reg [3:0] led
);

reg [23:0] cnt;
reg [1:0] led_ctrl;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 24'd0;
        led_ctrl <= 2'd0;
    end else begin
        if (cnt == 24'd9_999_999) begin
            cnt <= 24'd0;
            led_ctrl <= led_ctrl + 2'd1;
        end else begin
            cnt <= cnt + 24'd1;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        led <= 4'b0000;
    end else begin
        case (1'b1)
            key[3]: led <= 4'b1111;
            key[2]: led <= (led_ctrl[1]) ? 4'b1111 : 4'b0000;
            key[1]: begin
                case (led_ctrl)
                    2'd0: led <= 4'b0001;
                    2'd1: led <= 4'b0010;
                    2'd2: led <= 4'b0100;
                    2'd3: led <= 4'b1000;
                endcase
            end
            key[0]: begin
                case (led_ctrl)
                    2'd0: led <= 4'b1000;
                    2'd1: led <= 4'b0100;
                    2'd2: led <= 4'b0010;
                    2'd3: led <= 4'b0001;
                endcase
            end
            default: led <= 4'b0000;
        endcase
    end
end

endmodule