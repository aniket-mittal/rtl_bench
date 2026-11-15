module origen_063092 (
    input wire i_Start, i_Stop, i_Inc, i_RST, i_CLK1KHZ,
    output reg o_ENABLE
);

    // State encoding
    localparam [1:0] 
        RESET = 2'b00,
        START = 2'b01,
        STOP = 2'b10,
        INCREMENT = 2'b11;

    reg [1:0] current_state, next_state;

    // Combinational logic for next state and output
    always @(*) begin
        next_state = current_state;
        o_ENABLE = 1'b0;

        case (current_state)
            RESET: begin
                if (i_Start)
                    next_state = START;
                else if (i_Inc)
                    next_state = INCREMENT;
            end
            START: begin
                o_ENABLE = i_CLK1KHZ;
                if (i_Stop)
                    next_state = STOP;
            end
            STOP: begin
                if (i_Start)
                    next_state = START;
                else if (i_Inc)
                    next_state = INCREMENT;
            end
            INCREMENT: begin
                o_ENABLE = 1'b1;
                if (!i_Inc)
                    next_state = STOP;
            end
        endcase
    end

    // Sequential logic for state transitions
    always @(posedge i_CLK1KHZ or posedge i_RST) begin
        if (i_RST)
            current_state <= RESET;
        else
            current_state <= next_state;
    end

endmodule