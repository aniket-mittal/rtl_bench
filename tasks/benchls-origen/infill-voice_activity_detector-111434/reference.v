module origen_111434 (
    input wire clock_i,
    input wire enable_i,
    input wire [15:0] Data_i,
    output reg done_o,
    output reg pwm_audio_o,
    output wire pwm_sdaudio_o,
    output reg voice_indicator
);

    parameter THRESHOLD = 56;
    
    reg [15:0] shift_reg;
    reg [6:0] bit_count;
    reg [6:0] cycle_count;
    reg [6:0] pwm_high_count;

    assign pwm_sdaudio_o = 1'b1;

    always @(posedge clock_i) begin
        if (!enable_i) begin
            shift_reg <= 16'b0;
            bit_count <= 7'b0;
            done_o <= 1'b0;
            pwm_audio_o <= 1'b0;
            cycle_count <= 7'b0;
            pwm_high_count <= 7'b0;
            voice_indicator <= 1'b0;
        end else begin
            // Serialization
            if (bit_count < 16) begin
                pwm_audio_o <= shift_reg[0];
                shift_reg <= {Data_i[bit_count], shift_reg[15:1]};
                bit_count <= bit_count + 1;
                done_o <= (bit_count == 15);
            end else begin
                bit_count <= 7'b0;
                done_o <= 1'b0;
            end

            // Voice Activity Detection
            if (cycle_count < 101) begin
                cycle_count <= cycle_count + 1;
                if (pwm_audio_o)
                    pwm_high_count <= pwm_high_count + 1;
            end else begin
                voice_indicator <= (pwm_high_count >= THRESHOLD);
                cycle_count <= 7'b0;
                pwm_high_count <= 7'b0;
            end
        end
    end

endmodule