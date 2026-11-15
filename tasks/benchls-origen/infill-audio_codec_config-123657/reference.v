module origen_123657 (
    input wire clock,
    input wire reset,
    input wire ready,
    input wire [4:0] volume,
    input wire [2:0] source,
    output reg [7:0] command_address,
    output reg [15:0] command_data,
    output reg command_valid
);

    // State machine states
    localparam IDLE = 4'd0;
    localparam READ_ID = 4'd1;
    localparam SET_HEADPHONE_VOL = 4'd2;
    localparam SET_PCM_VOL = 4'd3;
    localparam SET_RECORD_SOURCE = 4'd4;
    localparam SET_RECORD_GAIN = 4'd5;
    localparam SET_MIC_GAIN = 4'd6;
    localparam SET_BEEP_VOL = 4'd7;
    localparam SET_PCM_BYPASS = 4'd8;
    localparam DONE = 4'd9;

    reg [3:0] state;
    reg [3:0] next_state;

    // Command addresses
    localparam RESET_REG = 8'h00;
    localparam HEADPHONE_VOL_REG = 8'h04;
    localparam PCM_OUT_VOL_REG = 8'h18;
    localparam RECORD_SELECT_REG = 8'h1A;
    localparam RECORD_GAIN_REG = 8'h1C;
    localparam MIC_VOL_REG = 8'h0E;
    localparam BEEP_VOL_REG = 8'h0A;
    localparam PC_BEEP_VOL_REG = 8'h1E;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        command_valid = 1'b0;
        command_address = 8'h00;
        command_data = 16'h0000;

        case (state)
            IDLE: begin
                if (ready) next_state = READ_ID;
            end

            READ_ID: begin
                command_valid = 1'b1;
                command_address = RESET_REG;
                command_data = 16'h0000;
                if (ready) next_state = SET_HEADPHONE_VOL;
            end

            SET_HEADPHONE_VOL: begin
                command_valid = 1'b1;
                command_address = HEADPHONE_VOL_REG;
                command_data = {volume, volume, 6'b0};
                if (ready) next_state = SET_PCM_VOL;
            end

            SET_PCM_VOL: begin
                command_valid = 1'b1;
                command_address = PCM_OUT_VOL_REG;
                command_data = 16'h0808; // Fixed PCM volume
                if (ready) next_state = SET_RECORD_SOURCE;
            end

            SET_RECORD_SOURCE: begin
                command_valid = 1'b1;
                command_address = RECORD_SELECT_REG;
                command_data = {source, source};
                if (ready) next_state = SET_RECORD_GAIN;
            end

            SET_RECORD_GAIN: begin
                command_valid = 1'b1;
                command_address = RECORD_GAIN_REG;
                command_data = 16'h0F0F; // Maximum gain
                if (ready) next_state = SET_MIC_GAIN;
            end

            SET_MIC_GAIN: begin
                command_valid = 1'b1;
                command_address = MIC_VOL_REG;
                command_data = 16'h0808; // Fixed mic gain
                if (ready) next_state = SET_BEEP_VOL;
            end

            SET_BEEP_VOL: begin
                command_valid = 1'b1;
                command_address = BEEP_VOL_REG;
                command_data = 16'h0000; // Mute beep
                if (ready) next_state = SET_PCM_BYPASS;
            end

            SET_PCM_BYPASS: begin
                command_valid = 1'b1;
                command_address = PC_BEEP_VOL_REG;
                command_data = 16'h8000; // PCM out to bypass mix1
                if (ready) next_state = DONE;
            end

            DONE: begin
                // All commands sent, stay in DONE state
            end

            default: next_state = IDLE;
        endcase
    end

endmodule