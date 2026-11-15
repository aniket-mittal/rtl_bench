module origen_010752(
    input wire clk,
    input wire clr,
    output wire dclk,
    output wire segclk,
    output reg clk_player,
    output reg clk_moving_obs
);

    reg [16:0] q;
    reg [31:0] a, b;

    // Fast clock divider
    always @(posedge clk or posedge clr) begin
        if (clr)
            q <= 17'b0;
        else
            q <= q + 1'b1;
    end

    assign dclk = q[1];
    assign segclk = q[16];

    // Player clock divider (1 Hz)
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            a <= 32'b0;
            clk_player <= 1'b0;
        end
        else if (a == 32'd49_999_999) begin
            a <= 32'b0;
            clk_player <= 1'b1;
        end
        else begin
            a <= a + 1'b1;
            clk_player <= 1'b0;
        end
    end

    // Moving obstacle clock divider (0.2 Hz)
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            b <= 32'b0;
            clk_moving_obs <= 1'b0;
        end
        else if (b == 32'd249_999_999) begin
            b <= 32'b0;
            clk_moving_obs <= 1'b1;
        end
        else begin
            b <= b + 1'b1;
            clk_moving_obs <= 1'b0;
        end
    end

endmodule