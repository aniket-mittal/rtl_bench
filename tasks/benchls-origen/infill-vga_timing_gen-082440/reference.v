module origen_082440 (
    input wire iCLK,
    input wire iRST_N,
    input wire [9:0] iRed,
    input wire [9:0] iGreen,
    input wire [9:0] iBlue,
    output reg [9:0] oVGA_R,
    output reg [9:0] oVGA_G,
    output reg [9:0] oVGA_B,
    output reg oVGA_HS,
    output reg oVGA_VS,
    output wire oVGA_SYNC,
    output wire oVGA_BLANK,
    output wire oVGA_CLOCK,
    output reg [9:0] oCurrent_X,
    output reg [9:0] oCurrent_Y
);

    // VGA timing parameters
    parameter H_ACTIVE = 640;
    parameter H_FRONT_PORCH = 16;
    parameter H_SYNC = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_TOTAL = 800;

    parameter V_ACTIVE = 480;
    parameter V_FRONT_PORCH = 10;
    parameter V_SYNC = 2;
    parameter V_BACK_PORCH = 33;
    parameter V_TOTAL = 525;

    reg [9:0] H_Cont;
    reg [9:0] V_Cont;

    // Horizontal counter
    always @(posedge iCLK or negedge iRST_N) begin
        if (!iRST_N)
            H_Cont <= 10'd0;
        else if (H_Cont == H_TOTAL - 1)
            H_Cont <= 10'd0;
        else
            H_Cont <= H_Cont + 1'b1;
    end

    // Vertical counter
    always @(posedge iCLK or negedge iRST_N) begin
        if (!iRST_N)
            V_Cont <= 10'd0;
        else if (H_Cont == H_TOTAL - 1) begin
            if (V_Cont == V_TOTAL - 1)
                V_Cont <= 10'd0;
            else
                V_Cont <= V_Cont + 1'b1;
        end
    end

    // Horizontal Sync
    always @(posedge iCLK or negedge iRST_N) begin
        if (!iRST_N)
            oVGA_HS <= 1'b1;
        else if (H_Cont == H_ACTIVE + H_FRONT_PORCH - 1)
            oVGA_HS <= 1'b0;
        else if (H_Cont == H_ACTIVE + H_FRONT_PORCH + H_SYNC - 1)
            oVGA_HS <= 1'b1;
    end

    // Vertical Sync
    always @(posedge iCLK or negedge iRST_N) begin
        if (!iRST_N)
            oVGA_VS <= 1'b1;
        else if (V_Cont == V_ACTIVE + V_FRONT_PORCH - 1)
            oVGA_VS <= 1'b0;
        else if (V_Cont == V_ACTIVE + V_FRONT_PORCH + V_SYNC - 1)
            oVGA_VS <= 1'b1;
    end

    // Current pixel coordinates
    always @(posedge iCLK or negedge iRST_N) begin
        if (!iRST_N) begin
            oCurrent_X <= 10'd0;
            oCurrent_Y <= 10'd0;
        end else begin
            oCurrent_X <= (H_Cont < H_ACTIVE) ? H_Cont : 10'd0;
            oCurrent_Y <= (V_Cont < V_ACTIVE) ? V_Cont : 10'd0;
        end
    end

    // RGB output
    always @(posedge iCLK or negedge iRST_N) begin
        if (!iRST_N) begin
            oVGA_R <= 10'd0;
            oVGA_G <= 10'd0;
            oVGA_B <= 10'd0;
        end else if (H_Cont < H_ACTIVE && V_Cont < V_ACTIVE) begin
            oVGA_R <= iRed;
            oVGA_G <= iGreen;
            oVGA_B <= iBlue;
        end else begin
            oVGA_R <= 10'd0;
            oVGA_G <= 10'd0;
            oVGA_B <= 10'd0;
        end
    end

    // Additional VGA signals
    assign oVGA_SYNC = 1'b0;  // For most VGA DACs
    assign oVGA_BLANK = (H_Cont >= H_ACTIVE) || (V_Cont >= V_ACTIVE);
    assign oVGA_CLOCK = iCLK;

endmodule