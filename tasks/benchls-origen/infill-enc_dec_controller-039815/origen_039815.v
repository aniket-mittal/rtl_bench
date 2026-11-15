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

    [MASKED]

    always @(*) begin
        O_clk = I_clk;
    end

endmodule