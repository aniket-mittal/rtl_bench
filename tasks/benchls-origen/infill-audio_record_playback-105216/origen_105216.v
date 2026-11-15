module origen_105216 (
    input wire i_clk,
    input wire i_rst,
    
    // ADC interface
    input wire [15:0] adc_left_data,
    input wire adc_left_valid,
    output reg adc_left_ready,
    input wire [15:0] adc_right_data,
    input wire adc_right_valid,
    output reg adc_right_ready,
    
    // DAC interface
    output reg [15:0] dac_left_data,
    output reg dac_left_valid,
    input wire dac_left_ready,
    output reg [15:0] dac_right_data,
    output reg dac_right_valid,
    input wire dac_right_ready,
    
    // Record interface
    output reg [31:0] record_audio_data,
    output reg record_audio_valid,
    input wire record_audio_ready,
    
    // Playback interface
    input wire [31:0] play_audio_data,
    input wire play_audio_valid,
    output reg play_audio_ready,
    
    // Debug output
    output reg [1:0] debug_state
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam PLAY = 2'b01;
    localparam REC  = 2'b10;

    reg [1:0] state, next_state;
    reg left_channel_done, right_channel_done;

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (play_audio_valid) next_state = PLAY;
                else if (record_audio_ready) next_state = REC;
            end
            PLAY: begin
                if (!play_audio_valid || (left_channel_done && right_channel_done)) next_state = IDLE;
            end
            REC: begin
                if (!record_audio_ready || (left_channel_done && right_channel_done)) next_state = IDLE;
            end
        endcase
    end

    [MASKED]

    // Debug output
    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            debug_state <= IDLE;
        end else begin
            debug_state <= state;
        end
    end

endmodule