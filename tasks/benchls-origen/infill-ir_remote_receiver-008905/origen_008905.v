module origen_008905 (
    input wire CLK,
    input wire CLK_10U,
    input wire RESET,
    input wire CS,
    input wire IR,
    output reg READY,
    output reg [15:0] DO
);

    // State definitions
    localparam IDLE = 3'd0;
    localparam LEADER_CODE = 3'd1;
    localparam DATA_RECEPTION = 3'd2;
    localparam DATA_VALIDATION = 3'd3;
    localparam ERROR = 3'd6;
    localparam COOL_DOWN = 3'd7;

    reg [2:0] state, next_state;
    reg [13:0] time_out;
    reg [31:0] shift_reg;
    reg [5:0] bit_count;
    reg ir_prev, ir_edge;
    reg [15:0] data_out;

    // Edge detection
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            ir_prev <= 1'b1;
        else
            ir_prev <= IR;
    end

    assign ir_edge = ir_prev & ~IR;

    // State machine and main logic
    [MASKED]

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:
                if (ir_edge) next_state = LEADER_CODE;

            LEADER_CODE:
                if (time_out > 14'd460) next_state = ERROR;
                else if (ir_edge && (time_out >= 14'd420 && time_out <= 14'd460)) next_state = DATA_RECEPTION;

            DATA_RECEPTION:
                if (time_out > 14'd120) next_state = ERROR;
                else if (bit_count == 6'd32) next_state = DATA_VALIDATION;

            DATA_VALIDATION:
                next_state = COOL_DOWN;

            ERROR:
                if (time_out >= 14'd1000) next_state = IDLE;

            COOL_DOWN:
                if (time_out >= 14'd1000) next_state = IDLE;

            default:
                next_state = IDLE;
        endcase
    end

endmodule