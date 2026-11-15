module origen_207352(
    input rst,
    input clk,
    input enable,
    output reg piezo
);

    reg [15:0] buff;
    reg [31:0] cnt_sound;
    reg [15:0] tone;
    reg [31:0] tone_cnt;
    reg [31:0] clk_cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            buff <= 0;
            cnt_sound <= 0;
            tone_cnt <= 0;
            clk_cnt <= 0;
        end
        else begin
            if (enable) begin
                clk_cnt <= clk_cnt + 1;
                cnt_sound <= cnt_sound + 1;

                if (cnt_sound == tone) begin
                    buff <= ~buff;
                    cnt_sound <= 0;
                end

                if (clk_cnt == 200_000) begin
                    tone_cnt <= tone_cnt + 1;
                    clk_cnt <= 0;
                end

                case (tone_cnt)
                    0: tone <= 16'd100;
                    1: tone <= 16'd200;
                    2: tone <= 16'd300;
                    3: tone <= 16'd400;
                    default: tone_cnt <= 0;
                endcase
            end
            else begin
                buff <= 0;
                cnt_sound <= 0;
                tone_cnt <= 0;
                clk_cnt <= 0;
            end
        end
    end

    always @(*) begin
        piezo = buff;
    end

endmodule