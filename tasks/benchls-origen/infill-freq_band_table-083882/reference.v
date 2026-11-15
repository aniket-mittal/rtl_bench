module origen_083882 (
    input [3:0] channels,
    output reg [23:0] freq_upper_bound,
    output reg [23:0] freq_lower_bound,
    output reg [23:0] freq_center
);

    always @(*) begin
        case (channels)
            4'b0000: begin
                freq_lower_bound = 24'd7880000;
                freq_center      = 24'd7880328;
                freq_upper_bound = 24'd7880656;
            end
            4'b0001: begin
                freq_lower_bound = 24'd7896384;
                freq_center      = 24'd7896712;
                freq_upper_bound = 24'd7897040;
            end
            4'b0010: begin
                freq_lower_bound = 24'd7912768;
                freq_center      = 24'd7913096;
                freq_upper_bound = 24'd7913424;
            end
            4'b0011: begin
                freq_lower_bound = 24'd7929152;
                freq_center      = 24'd7929480;
                freq_upper_bound = 24'd7929808;
            end
            4'b0100: begin
                freq_lower_bound = 24'd7945536;
                freq_center      = 24'd7945864;
                freq_upper_bound = 24'd7946192;
            end
            4'b0101: begin
                freq_lower_bound = 24'd7961920;
                freq_center      = 24'd7962248;
                freq_upper_bound = 24'd7962576;
            end
            4'b0110: begin
                freq_lower_bound = 24'd7978304;
                freq_center      = 24'd7978632;
                freq_upper_bound = 24'd7978960;
            end
            4'b0111: begin
                freq_lower_bound = 24'd7994688;
                freq_center      = 24'd7995016;
                freq_upper_bound = 24'd7995344;
            end
            4'b1000: begin
                freq_lower_bound = 24'd8011072;
                freq_center      = 24'd8011400;
                freq_upper_bound = 24'd8011728;
            end
            4'b1001: begin
                freq_lower_bound = 24'd8027456;
                freq_center      = 24'd8027784;
                freq_upper_bound = 24'd8028112;
            end
            4'b1010: begin
                freq_lower_bound = 24'd8043840;
                freq_center      = 24'd8044168;
                freq_upper_bound = 24'd8044496;
            end
            4'b1011: begin
                freq_lower_bound = 24'd8060224;
                freq_center      = 24'd8060552;
                freq_upper_bound = 24'd8060880;
            end
            4'b1100: begin
                freq_lower_bound = 24'd8076608;
                freq_center      = 24'd8076936;
                freq_upper_bound = 24'd8077264;
            end
            4'b1101: begin
                freq_lower_bound = 24'd8092992;
                freq_center      = 24'd8093320;
                freq_upper_bound = 24'd8093648;
            end
            4'b1110: begin
                freq_lower_bound = 24'd8109376;
                freq_center      = 24'd8109704;
                freq_upper_bound = 24'd8110032;
            end
            4'b1111: begin
                freq_lower_bound = 24'd8125760;
                freq_center      = 24'd8126088;
                freq_upper_bound = 24'd8126416;
            end
            default: begin
                freq_lower_bound = 24'd0;
                freq_center      = 24'd0;
                freq_upper_bound = 24'd0;
            end
        endcase
    end

endmodule