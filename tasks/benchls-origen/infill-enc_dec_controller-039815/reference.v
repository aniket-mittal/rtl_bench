module origen_039815 #(
    parameter MODE_BITS = 2,
    parameter MEAS_COUNT = 8
) (
    input wire I_clk,
    input wire [MODE_BITS-1:0] I_mode,
    input wire I_start,
    input wire I_en,
    input wire I_meas_v,
    input wire I_enc_ready,
    input wire I_dec_ready,
    output reg O_clk,
    output reg O_meas_rst,
    output reg O_enc_en,
    output reg O_enc_start,
    output reg O_dec_en,
    output reg O_dec_start,
    output reg O_ready
);

    localparam ENCODE = 1;
    localparam DECODE = 2;

    localparam IDLE = 3'b000;
    localparam MEAS_RESET = 3'b001;
    localparam MEASURE = 3'b010;
    localparam ENCODE_STATE = 3'b011;
    localparam DECODE_STATE = 3'b100;
    localparam READY = 3'b101;

    reg [2:0] state, next_state;
    reg [3:0] meas_counter;
    reg start_detected;
    reg meas_complete;

    always @(posedge I_clk or negedge I_en) begin
        if (!I_en) begin
            state <= IDLE;
            meas_counter <= 0;
            start_detected <= 0;
            meas_complete <= 0;
        end else begin
            state <= next_state;
            if (state == MEAS_RESET) begin
                meas_counter <= (meas_counter < MEAS_COUNT - 1) ? meas_counter + 1 : 0;
            end
            start_detected <= I_start & ~start_detected;
            if (state == MEASURE && I_meas_v) begin
                meas_complete <= 1;
            end else if (state == IDLE) begin
                meas_complete <= 0;
            end
        end
    end

    always @(*) begin
        next_state = state;
        O_meas_rst = 0;
        O_enc_en = 0;
        O_enc_start = 0;
        O_dec_en = 0;
        O_dec_start = 0;
        O_ready = 0;

        case (state)
            IDLE: begin
                if (start_detected) next_state = MEAS_RESET;
            end
            MEAS_RESET: begin
                O_meas_rst = 1;
                if (meas_counter == MEAS_COUNT - 1 || start_detected) next_state = MEASURE;
            end
            MEASURE: begin
                if (meas_complete) begin
                    case (I_mode)
                        ENCODE: next_state = ENCODE_STATE;
                        DECODE: next_state = DECODE_STATE;
                        default: next_state = IDLE;
                    endcase
                end
            end
            ENCODE_STATE: begin
                O_enc_en = 1;
                O_enc_start = 1;
                if (I_enc_ready) next_state = READY;
            end
            DECODE_STATE: begin
                O_dec_en = 1;
                O_dec_start = 1;
                if (I_dec_ready) next_state = READY;
            end
            READY: begin
                O_ready = 1;
                if (start_detected) next_state = MEAS_RESET;
            end
        endcase
    end

    always @(*) begin
        O_clk = I_clk;
    end

endmodule