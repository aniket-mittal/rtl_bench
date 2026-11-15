module origen_079000(
    input CLOCK_50,
    input RST,
    output reg [7:0] VGA_R,
    output reg [7:0] VGA_G,
    output reg [7:0] VGA_B,
    output reg VGA_HS,
    output reg VGA_VS,
    output VGA_CLK
);

    // Parameters for VGA timing
    parameter H_VISIBLE = 640;
    parameter H_FRONT_PORCH = 16;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_TOTAL = 800;

    parameter V_VISIBLE = 480;
    parameter V_FRONT_PORCH = 10;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 29;
    parameter V_TOTAL = 521;

    // Internal signals
    reg [9:0] HCNT;
    reg [9:0] VCNT;
    reg PCLK;

    // Generate pixel clock
    always @(posedge CLOCK_50 or posedge RST) begin
        if (RST)
            PCLK <= 1'b0;
        else
            PCLK <= ~PCLK;
    end

    assign VGA_CLK = PCLK;

    // Horizontal counter
    always @(posedge PCLK or posedge RST) begin
        if (RST)
            HCNT <= 10'd0;
        else if (HCNT == H_TOTAL - 1)
            HCNT <= 10'd0;
        else
            HCNT <= HCNT + 1'b1;
    end

    // Vertical counter
    always @(posedge PCLK or posedge RST) begin
        if (RST)
            VCNT <= 10'd0;
        else if (HCNT == H_TOTAL - 1) begin
            if (VCNT == V_TOTAL - 1)
                VCNT <= 10'd0;
            else
                VCNT <= VCNT + 1'b1;
        end
    end

    // Generate sync signals
    always @(posedge PCLK or posedge RST) begin
        if (RST) begin
            VGA_HS <= 1'b1;
            VGA_VS <= 1'b1;
        end else begin
            VGA_HS <= ~(HCNT >= H_VISIBLE + H_FRONT_PORCH && HCNT < H_VISIBLE + H_FRONT_PORCH + H_SYNC_PULSE);
            VGA_VS <= ~(VCNT >= V_VISIBLE + V_FRONT_PORCH && VCNT < V_VISIBLE + V_FRONT_PORCH + V_SYNC_PULSE);
        end
    end

    // Generate color pattern
    always @(posedge PCLK or posedge RST) begin
        if (RST) begin
            VGA_R <= 8'd0;
            VGA_G <= 8'd0;
            VGA_B <= 8'd0;
        end else if (HCNT < H_VISIBLE && VCNT < V_VISIBLE) begin
            if (HCNT < 210) begin
                VGA_R <= 8'd0;
                VGA_G <= 8'd0;
                VGA_B <= 8'd255;
            end else if (HCNT < 420) begin
                VGA_R <= 8'd255;
                VGA_G <= 8'd255;
                VGA_B <= 8'd255;
            end else begin
                VGA_R <= 8'd255;
                VGA_G <= 8'd0;
                VGA_B <= 8'd0;
            end
        end else begin
            VGA_R <= 8'd0;
            VGA_G <= 8'd0;
            VGA_B <= 8'd0;
        end
    end

endmodule