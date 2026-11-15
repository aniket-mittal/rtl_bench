module origen_019378 (
    input wire CLK_SMP,
    input wire EN_H,
    input wire EN_V,
    input wire [9:0] PIX_H,
    input wire [8:0] PIX_V,
    input wire [11:0] WAVE_DATA,
    input wire [15:0] ZOOM_CNT,
    input wire [11:0] WAV_COLOR,
    input wire PAUSE,
    output reg [11:0] LAYER_WAV
);

    reg [6:0] WAVE_CACHE [639:0];
    reg [15:0] CNT;
    reg [9:0] SMP_ID;
    reg [8:0] SMP_DISP;

    integer i;
    initial begin
        for (i = 0; i < 640; i = i + 1) begin
            WAVE_CACHE[i] = 7'd0;
        end
        CNT = 16'd0;
        SMP_ID = 10'd0;
    end

    always @(posedge CLK_SMP) begin
        if (!PAUSE) begin
            if (CNT == ZOOM_CNT) begin
                CNT <= 16'd0;
                WAVE_CACHE[SMP_ID] <= WAVE_DATA[11:5];
                if (SMP_ID == 10'd639)
                    SMP_ID <= 10'd0;
                else
                    SMP_ID <= SMP_ID + 10'd1;
            end else begin
                CNT <= CNT + 16'd1;
            end
        end
    end

    always @(*) begin
        SMP_DISP = 9'd479 - 9'd48 - {2'b00, WAVE_CACHE[PIX_H]} * 3;
        if (EN_H && EN_V) begin
            if (PIX_V == SMP_DISP)
                LAYER_WAV = WAV_COLOR;
            else
                LAYER_WAV = 12'd0;
        end else begin
            LAYER_WAV = 12'd0;
        end
    end

endmodule