module origen_115855 (
    input wire clk,
    input wire sent,
    input wire [7:0] data,
    output reg ready,
    output reg match
);

    reg [7:0] latchedData;
    parameter [7:0] DIGITS = 8'b01010111;

    reg [3:0] state, next_state;
    parameter [3:0] BIT1 = 4'd0, BIT2 = 4'd1, BIT3 = 4'd2, BIT4 = 4'd3,
                    BIT5 = 4'd4, BIT6 = 4'd5, BIT7 = 4'd6, BIT8 = 4'd7,
                    MATCH = 4'd8;

    [MASKED]

    always @(*) begin
        next_state = state;
        ready = 1'b0;
        match = 1'b0;

        case (state)
            BIT1: begin
                ready = 1'b1;
                if (sent && latchedData[0] == DIGITS[0]) next_state = BIT2;
                else if (sent) next_state = BIT1;
            end
            BIT2: if (latchedData[1] == DIGITS[1]) next_state = BIT3; else next_state = BIT1;
            BIT3: if (latchedData[2] == DIGITS[2]) next_state = BIT4; else next_state = BIT1;
            BIT4: if (latchedData[3] == DIGITS[3]) next_state = BIT5; else next_state = BIT1;
            BIT5: if (latchedData[4] == DIGITS[4]) next_state = BIT6; else next_state = BIT1;
            BIT6: if (latchedData[5] == DIGITS[5]) next_state = BIT7; else next_state = BIT1;
            BIT7: if (latchedData[6] == DIGITS[6]) next_state = BIT8; else next_state = BIT1;
            BIT8: if (latchedData[7] == DIGITS[7]) next_state = MATCH; else next_state = BIT1;
            MATCH: begin
                match = 1'b1;
                ready = 1'b1;
                next_state = BIT1;
            end
        endcase
    end

    always @(posedge clk) begin
        if (state == MATCH) ;
        else if (next_state == BIT1 && state != BIT1) ;
    end

endmodule