module origen_068464 (
    input wire clock,
    input wire reset,
    input wire is_ringing,
    input wire is_playing,
    output reg music
);

    // State encoding
    localparam [1:0] Q0_Init = 2'b00,
                     Q1_MusicOff = 2'b01,
                     Q2_MusicResume = 2'b10;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clock or posedge reset) begin
        if (reset)
            current_state <= Q0_Init;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            Q0_Init: begin
                if (is_playing && is_ringing)
                    next_state = Q1_MusicOff;
                else
                    next_state = Q0_Init;
            end
            Q1_MusicOff: begin
                if (!is_ringing)
                    next_state = Q2_MusicResume;
                else
                    next_state = Q1_MusicOff;
            end
            Q2_MusicResume: next_state = Q0_Init;
            default: next_state = Q0_Init;
        endcase
    end

    // Output logic
    always @(*) begin
        case (current_state)
            Q0_Init: music = 1'b1;
            Q1_MusicOff: music = 1'b0;
            Q2_MusicResume: music = 1'b1;
            default: music = 1'b1;
        endcase
    end

endmodule