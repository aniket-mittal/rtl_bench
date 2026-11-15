module origen_161695 (
    input  wire        MCU_CLK_IN,
    input  wire        nRST,
    input  wire        MCU_IN_BATT_1_EN,
    input  wire        MCU_IN_BATT_2_EN,
    input  wire        MCU_IN_BATT_BOTH_EN,
    input  wire [8:0]  MCU_IN_EN,
    input  wire        KILLSWITCH_RED,
    output reg         BATT_1_EN,
    output reg         BATT_2_EN,
    output reg         nBATT_BOTH_EN,
    output reg [6:0]   PWR_OUT_EN,
    output reg         nPWR_OUT_EN_8,
    output reg         nPWR_OUT_EN_9,
    output reg         MCU_OUT_KILLSWITCH_ACTIVE
);

    reg rst;
    reg killswitch_active;

    always @(posedge MCU_CLK_IN or negedge nRST) begin
        if (~nRST) begin
            rst <= 1'b1;
            BATT_1_EN <= 1'b0;
            BATT_2_EN <= 1'b0;
            nBATT_BOTH_EN <= 1'b1;
            PWR_OUT_EN <= 7'b0;
            nPWR_OUT_EN_8 <= 1'b1;
            nPWR_OUT_EN_9 <= 1'b1;
            killswitch_active <= 1'b0;
            MCU_OUT_KILLSWITCH_ACTIVE <= 1'b0;
        end else begin
            rst <= 1'b0;
            BATT_1_EN <= MCU_IN_BATT_1_EN;
            BATT_2_EN <= MCU_IN_BATT_2_EN;
            nBATT_BOTH_EN <= ~MCU_IN_BATT_BOTH_EN;
            PWR_OUT_EN <= MCU_IN_EN[6:0];
            nPWR_OUT_EN_8 <= ~MCU_IN_EN[7];
            nPWR_OUT_EN_9 <= ~MCU_IN_EN[8];
            killswitch_active <= KILLSWITCH_RED;
            MCU_OUT_KILLSWITCH_ACTIVE <= KILLSWITCH_RED;
        end
    end

    always @* begin
        if (killswitch_active) begin
            PWR_OUT_EN[0] = 1'b0;
        end else begin
            PWR_OUT_EN[0] = MCU_IN_EN[0];
        end
    end

endmodule