module origen_061805 (
    input wire clk,
    input wire rst,
    input wire inReady,
    input wire lastAdd,
    input wire sinAddFin,
    output wire startAdd,
    output wire allAddsFin
);

    // State encoding
    localparam [1:0] IDLE = 2'b00,
                     ADDING = 2'b01,
                     LAST_ADD_COMPLETE = 2'b10,
                     FINISHED = 2'b11;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (lastAdd)
                    next_state = LAST_ADD_COMPLETE;
                else if (inReady)
                    next_state = ADDING;
                else
                    next_state = IDLE;
            end
            ADDING: begin
                if (sinAddFin)
                    next_state = IDLE;
                else
                    next_state = ADDING;
            end
            LAST_ADD_COMPLETE: next_state = FINISHED;
            FINISHED: next_state = FINISHED;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    assign startAdd = (current_state == IDLE) && inReady;
    assign allAddsFin = (current_state == LAST_ADD_COMPLETE);

endmodule