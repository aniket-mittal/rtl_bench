module origen_207371(
    input RESET,
    input CLK_1M,
    input [3:0] NOTE,
    output reg BUFF
);

reg [31:0] cnt_sound;

always @(posedge CLK_1M) begin
    if (~RESET) begin
        BUFF <= 1'b0;
        cnt_sound <= 32'b0;
    end
    else begin
        case (NOTE)
            4'b0000: begin // C4
                if (cnt_sound == 32'd31250) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b0001: begin // C#4/Db4
                if (cnt_sound == 32'd29493) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b0010: begin // D4
                if (cnt_sound == 32'd27777) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b0011: begin // D#4/Eb4
                if (cnt_sound == 32'd26235) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b0100: begin // E4
                if (cnt_sound == 32'd24790) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b0101: begin // F4
                if (cnt_sound == 32'd23437) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b0110: begin // F#4/Gb4
                if (cnt_sound == 32'd22115) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b0111: begin // G4
                if (cnt_sound == 32'd20833) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b1000: begin // G#4/Ab4
                if (cnt_sound == 32'd19650) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b1001: begin // A4
                if (cnt_sound == 32'd18518) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b1010: begin // A#4/Bb4
                if (cnt_sound == 32'd17471) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b1011: begin // B4
                if (cnt_sound == 32'd16529) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b1100: begin // C5
                if (cnt_sound == 32'd15625) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b1101: begin // C#5/Db5
                if (cnt_sound == 32'd14746) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b1110: begin // D5
                if (cnt_sound == 32'd13888) begin
                    BUFF <= ~BUFF;
                    cnt_sound <= 32'b0;
                end
                else begin
                    cnt_sound <= cnt_sound + 32'b1;
                end
            end
            4'b1111: begin // Mute
                BUFF <= 1'b0;
                cnt_sound <= 32'b0;
            end
        endcase
    end
end

endmodule