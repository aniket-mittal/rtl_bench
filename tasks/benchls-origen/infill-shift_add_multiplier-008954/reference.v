module origen_008954 (
    input wire CLK, rst, start,
    output reg done, left_right, ppgen_en, add_en, shift_en,
    output reg [3:0] wr_en, rd_enA, rd_enB
);

    // State encoding
    localparam [3:0]
        LATCH_MCAND_IDLE = 4'b0000,
        LATCH_MPLIER     = 4'b0001,
        ZERO_R4          = 4'b0010,
        INIT_R5          = 4'b0011,
        PPGEN            = 4'b0100,
        ACCUM            = 4'b0101,
        SHIFT_MCAND      = 4'b0110,
        SHIFT_MPLIER     = 4'b0111,
        DONE             = 4'b1000;

    reg [3:0] current_state, next_state;
    reg count16_inc, count16_init;
    wire [3:0] count16_out;

    // 16-bit Counter
    count16 counter (
        .clk(CLK),
        .rst(rst),
        .count16_inc(count16_inc),
        .count16_init(count16_init),
        .count16_out(count16_out)
    );

    // State register
    always @(posedge CLK or posedge rst) begin
        if (rst)
            current_state <= LATCH_MCAND_IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = current_state;
        case (current_state)
            LATCH_MCAND_IDLE: if (start) next_state = LATCH_MPLIER;
            LATCH_MPLIER:     next_state = ZERO_R4;
            ZERO_R4:          next_state = INIT_R5;
            INIT_R5:          next_state = PPGEN;
            PPGEN:            next_state = ACCUM;
            ACCUM:            next_state = SHIFT_MCAND;
            SHIFT_MCAND:      next_state = SHIFT_MPLIER;
            SHIFT_MPLIER:     next_state = (count16_out == 4'b1111) ? DONE : PPGEN;
            DONE:             if (start) next_state = LATCH_MPLIER;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default values
        done = 0;
        left_right = 0;
        ppgen_en = 0;
        add_en = 0;
        shift_en = 0;
        wr_en = 4'b0000;
        rd_enA = 4'b0000;
        rd_enB = 4'b0000;
        count16_inc = 0;
        count16_init = 0;

        case (current_state)
            LATCH_MCAND_IDLE: begin
                wr_en[0] = 1;
                rd_enA[0] = 1;
            end
            LATCH_MPLIER: begin
                wr_en[1] = 1;
                rd_enA[1] = 1;
            end
            ZERO_R4: begin
                wr_en[2] = 1;
            end
            INIT_R5: begin
                count16_init = 1;
            end
            PPGEN: begin
                ppgen_en = 1;
                rd_enA[1] = 1;
                rd_enB[0] = 1;
            end
            ACCUM: begin
                add_en = 1;
                rd_enA[2] = 1;
                rd_enB[3] = 1;
                wr_en[2] = 1;
            end
            SHIFT_MCAND: begin
                shift_en = 1;
                left_right = 1;
                rd_enA[0] = 1;
                wr_en[0] = 1;
            end
            SHIFT_MPLIER: begin
                shift_en = 1;
                left_right = 0;
                rd_enA[1] = 1;
                wr_en[1] = 1;
                count16_inc = 1;
            end
            DONE: begin
                done = 1;
            end
        endcase
    end

endmodule

module count16 (
    input wire clk, rst, count16_inc, count16_init,
    output reg [3:0] count16_out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count16_out <= 4'b0000;
        else if (count16_init)
            count16_out <= 4'b0000;
        else if (count16_inc)
            count16_out <= count16_out + 1;
    end

endmodule