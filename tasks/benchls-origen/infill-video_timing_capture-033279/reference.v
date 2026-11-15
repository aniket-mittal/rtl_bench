module origen_033279 (
    input wire rx0_pclk,
    input wire rstbtn_n,
    input wire rx0_hsync,
    input wire rx0_vsync,
    output reg video_en,
    output reg [11:0] index,
    output reg [10:0] video_hcnt,
    output reg [10:0] video_vcnt
);

reg [10:0] vcounter, hcounter;
reg vactive, hactive;
reg hsync_buf;

always @(posedge rx0_pclk or negedge rstbtn_n) begin
    if (!rstbtn_n) begin
        vcounter <= 11'd0;
        hcounter <= 11'd0;
        vactive <= 1'b0;
        hactive <= 1'b0;
        video_en <= 1'b0;
        index <= 12'd0;
        video_hcnt <= 11'd0;
        video_vcnt <= 11'd0;
        hsync_buf <= 1'b0;
    end else begin
        hsync_buf <= rx0_hsync;

        if (rx0_hsync && !hsync_buf) begin
            hcounter <= 11'd0;
            if (vcounter == 11'd749) begin
                vcounter <= 11'd0;
            end else begin
                vcounter <= vcounter + 1'b1;
            end
        end else begin
            hcounter <= hcounter + 1'b1;
        end

        vactive <= (vcounter >= 11'd20) && (vcounter < 11'd740);
        hactive <= (hcounter >= 11'd220) && (hcounter < 11'd1500);

        video_en <= vactive && hactive;

        if (vactive && hactive) begin
            video_hcnt <= hcounter - 11'd220;
            video_vcnt <= vcounter - 11'd20;
        end

        if ((hcounter == 11'd219) || (hcounter == 11'd859)) begin
            index <= index + 1'b1;
        end
    end
end

endmodule