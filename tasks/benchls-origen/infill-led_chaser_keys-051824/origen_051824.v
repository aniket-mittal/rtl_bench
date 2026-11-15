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

[MASKED]

endmodule