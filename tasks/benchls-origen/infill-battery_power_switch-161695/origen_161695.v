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

    [MASKED]

    always @* begin
        if (killswitch_active) begin
            PWR_OUT_EN[0] = 1'b0;
        end else begin
            PWR_OUT_EN[0] = MCU_IN_EN[0];
        end
    end

endmodule