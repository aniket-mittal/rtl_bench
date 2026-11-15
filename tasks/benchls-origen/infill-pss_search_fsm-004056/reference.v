module origen_004056 (
    input wire clk,
    input wire resetn,
    input wire pss_search_start,
    input wire pss_ref_time,
    input wire pss_search_done,
    output reg [1:0] pss_state
);

    // State encoding
    localparam [1:0] IDLE = 2'b00,
                     REFERENCE_TIME_WAIT = 2'b01,
                     SEARCH = 2'b10;

    reg [1:0] STATE, NEXT_STATE;

    // State register
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            STATE <= IDLE;
        else
            STATE <= NEXT_STATE;
    end

    // Next state logic
    always @(*) begin
        case (STATE)
            IDLE: begin
                if (pss_search_start)
                    NEXT_STATE = REFERENCE_TIME_WAIT;
                else
                    NEXT_STATE = IDLE;
            end
            REFERENCE_TIME_WAIT: begin
                if (pss_ref_time)
                    NEXT_STATE = SEARCH;
                else
                    NEXT_STATE = REFERENCE_TIME_WAIT;
            end
            SEARCH: begin
                if (pss_search_done)
                    NEXT_STATE = IDLE;
                else
                    NEXT_STATE = SEARCH;
            end
            default: NEXT_STATE = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        pss_state = STATE;
    end

endmodule