module origen_037848(
    input wire RESET,
    input wire CLK_1M,
    input wire [3:0] NOTE,
    output reg BUFF
);

reg [10:0] cnt_sound;

always @(negedge RESET or posedge CLK_1M) begin
    if (!RESET) begin
        BUFF <= 1'b0;
        cnt_sound <= 11'd0;
    end else begin
        case (NOTE)
            4'd0: begin
                if (cnt_sound == 11'd1911) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd1: begin
                if (cnt_sound == 11'd1703) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd2: begin
                if (cnt_sound == 11'd1517) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd3: begin
                if (cnt_sound == 11'd1276) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd4: begin
                if (cnt_sound == 11'd1136) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd5: begin
                if (cnt_sound == 11'd956) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd6: begin
                if (cnt_sound == 11'd851) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd7: begin
                if (cnt_sound == 11'd758) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd8: begin
                if (cnt_sound == 11'd716) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd9: begin
                if (cnt_sound == 11'd638) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd10: begin
                if (cnt_sound == 11'd568) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd11: begin
                if (cnt_sound == 11'd506) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd12: begin
                if (cnt_sound == 11'd478) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd13: begin
                if (cnt_sound == 11'd451) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            4'd14: begin
                if (cnt_sound == 11'd426) begin
                    cnt_sound <= 11'd0;
                    BUFF <= ~BUFF;
                end else begin
                    cnt_sound <= cnt_sound + 1'b1;
                end
            end
            default: begin
                BUFF <= 1'b0;
                cnt_sound <= 11'd0;
            end
        endcase
    end
end

endmodule