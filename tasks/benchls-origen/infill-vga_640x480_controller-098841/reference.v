module origen_098841 (
    input wire [9:0] iRed, iGreen, iBlue,
    input wire iCLK_50M,
    input wire iRST_N,
    output reg [10:0] oCurrent_X, oCurrent_Y,
    output reg [21:0] oAddress,
    output reg oRequest,
    output reg [9:0] oVGA_R, oVGA_G, oVGA_B,
    output reg oVGA_HS, oVGA_VS,
    output reg oVGA_BLANK,
    output wire oVGA_CLOCK
);

    // VGA Timing Parameters
    parameter H_FRONT_PORCH = 16;
    parameter H_SYNC = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_ACTIVE = 640;
    parameter H_TOTAL = H_FRONT_PORCH + H_SYNC + H_BACK_PORCH + H_ACTIVE;

    parameter V_FRONT_PORCH = 10;
    parameter V_SYNC = 2;
    parameter V_BACK_PORCH = 33;
    parameter V_ACTIVE = 480;
    parameter V_TOTAL = V_FRONT_PORCH + V_SYNC + V_BACK_PORCH + V_ACTIVE;

    reg [10:0] H_Cont, V_Cont;
    reg VGA_CLK;

    // Clock division
    always @(posedge iCLK_50M or negedge iRST_N) begin
        if (!iRST_N)
            VGA_CLK <= 1'b0;
        else
            VGA_CLK <= ~VGA_CLK;
    end

    assign oVGA_CLOCK = ~VGA_CLK;

    // Horizontal counter
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N)
            H_Cont <= 11'd0;
        else if (H_Cont < H_TOTAL - 1)
            H_Cont <= H_Cont + 1'b1;
        else
            H_Cont <= 11'd0;
    end

    // Vertical counter
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N)
            V_Cont <= 11'd0;
        else if (H_Cont == H_TOTAL - 1) begin
            if (V_Cont < V_TOTAL - 1)
                V_Cont <= V_Cont + 1'b1;
            else
                V_Cont <= 11'd0;
        end
    end

    // Horizontal Sync
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N)
            oVGA_HS <= 1'b1;
        else if (H_Cont == H_FRONT_PORCH - 1)
            oVGA_HS <= 1'b0;
        else if (H_Cont == H_FRONT_PORCH + H_SYNC - 1)
            oVGA_HS <= 1'b1;
    end

    // Vertical Sync
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N)
            oVGA_VS <= 1'b1;
        else if (V_Cont == V_FRONT_PORCH - 1)
            oVGA_VS <= 1'b0;
        else if (V_Cont == V_FRONT_PORCH + V_SYNC - 1)
            oVGA_VS <= 1'b1;
    end

    // Current X and Y
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N) begin
            oCurrent_X <= 11'd0;
            oCurrent_Y <= 11'd0;
        end else begin
            if (H_Cont >= H_FRONT_PORCH + H_SYNC + H_BACK_PORCH)
                oCurrent_X <= H_Cont - (H_FRONT_PORCH + H_SYNC + H_BACK_PORCH);
            else
                oCurrent_X <= 11'd0;

            if (V_Cont >= V_FRONT_PORCH + V_SYNC + V_BACK_PORCH)
                oCurrent_Y <= V_Cont - (V_FRONT_PORCH + V_SYNC + V_BACK_PORCH);
            else
                oCurrent_Y <= 11'd0;
        end
    end

    // Address generation
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N)
            oAddress <= 22'd0;
        else
            oAddress <= oCurrent_Y * H_ACTIVE + oCurrent_X;
    end

    // Blanking signal
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N)
            oVGA_BLANK <= 1'b0;
        else
            oVGA_BLANK <= (H_Cont < H_FRONT_PORCH + H_SYNC + H_BACK_PORCH) ||
                          (V_Cont < V_FRONT_PORCH + V_SYNC + V_BACK_PORCH);
    end

    // Data request signal
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N)
            oRequest <= 1'b0;
        else
            oRequest <= (H_Cont >= H_FRONT_PORCH + H_SYNC + H_BACK_PORCH - 1) &&
                        (H_Cont < H_TOTAL - 1) &&
                        (V_Cont >= V_FRONT_PORCH + V_SYNC + V_BACK_PORCH) &&
                        (V_Cont < V_TOTAL);
    end

    // Color output
    always @(posedge VGA_CLK or negedge iRST_N) begin
        if (!iRST_N) begin
            oVGA_R <= 10'd0;
            oVGA_G <= 10'd0;
            oVGA_B <= 10'd0;
        end else if (!oVGA_BLANK) begin
            oVGA_R <= iRed;
            oVGA_G <= iGreen;
            oVGA_B <= iBlue;
        end else begin
            oVGA_R <= 10'd0;
            oVGA_G <= 10'd0;
            oVGA_B <= 10'd0;
        end
    end

endmodule