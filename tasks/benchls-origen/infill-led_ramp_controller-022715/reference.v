module origen_022715(
    input wire clk,
    input wire rst,
    output reg [7:0] led_time_out
);

    reg [1:0] count;
    reg [31:0] cnt;
    reg clk_div;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 32'd0;
            clk_div <= 1'b0;
        end else begin
            if (cnt == 32'd15625000) begin
                cnt <= 32'd0;
                clk_div <= ~clk_div;
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end

    always @(posedge clk_div or posedge rst) begin
        if (rst) begin
            count <= 2'b00;
            led_time_out <= 8'd0;
        end else begin
            case (count)
                2'b00: begin
                    led_time_out <= 8'd0;
                    count <= 2'b01;
                end
                2'b01: begin
                    if (led_time_out < 8'd150) begin
                        led_time_out <= led_time_out + 8'd10;
                    end else begin
                        count <= 2'b10;
                    end
                end
                2'b10: begin
                    if (led_time_out > 8'd11) begin
                        led_time_out <= led_time_out - 8'd10;
                    end else begin
                        count <= 2'b00;
                    end
                end
                default: count <= 2'b00;
            endcase
        end
    end

endmodule