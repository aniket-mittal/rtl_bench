module origen_028739(
    input wire clk,
    input wire resetn,
    input wire x,
    input wire y,
    output reg f,
    output reg g
);

    // State encoding
    parameter [3:0] STATE_A    = 4'b0000,
                    OUTPUT_F1  = 4'b0001,
                    CHECK_X0   = 4'b0010,
                    CHECK_X1   = 4'b0011,
                    CHECK_X2   = 4'b0100,
                    OUTPUT_G1  = 4'b0101,
                    CHECK_Y    = 4'b0110,
                    DONE_G1    = 4'b0111,
                    DONE_G0    = 4'b1000;

    reg [3:0] current_state, next_state;

    // State register
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            current_state <= STATE_A;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            STATE_A:    next_state = OUTPUT_F1;
            OUTPUT_F1:  next_state = CHECK_X0;
            CHECK_X0:   next_state = x ? CHECK_X1 : STATE_A;
            CHECK_X1:   next_state = x ? CHECK_X2 : STATE_A;
            CHECK_X2:   next_state = x ? OUTPUT_G1 : STATE_A;
            OUTPUT_G1:  next_state = y ? CHECK_Y : DONE_G0;
            CHECK_Y:    next_state = y ? DONE_G1 : DONE_G0;
            DONE_G1:    next_state = DONE_G1;
            DONE_G0:    next_state = DONE_G0;
            default:    next_state = STATE_A;
        endcase
    end

    // Output logic
    always @(*) begin
        f = (current_state == OUTPUT_F1);
        g = (current_state == OUTPUT_G1) || (current_state == CHECK_Y) || (current_state == DONE_G1);
    end

endmodule