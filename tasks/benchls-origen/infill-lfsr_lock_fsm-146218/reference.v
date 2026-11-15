module origen_146218 (
    input wire ck,
    input wire rst,
    input wire i_req,
    input wire i_din,
    output reg o_lck,
    output reg o_err,
    output reg o_vld
);

    // LFSR parameters
    localparam LFSR_WIDTH = 31;
    localparam LFSR_TAPS = 31'b1000000000000000000000000000100;

    // LFSR registers
    reg [LFSR_WIDTH-1:0] lfsr_reg;
    reg [LFSR_WIDTH-1:0] lfsr_next;

    // State machine states
    localparam IDLE = 2'b00;
    localparam UNLOCKED = 2'b01;
    localparam LOCKED = 2'b10;

    // State registers
    reg [1:0] state, next_state;
    reg [LFSR_WIDTH-1:0] lock_counter;
    reg [5:0] error_counter;

    // LFSR update function
    function [LFSR_WIDTH-1:0] lfsr_update;
        input [LFSR_WIDTH-1:0] lfsr;
        begin
            lfsr_update = {lfsr[LFSR_WIDTH-2:0], ^(lfsr & LFSR_TAPS)};
        end
    endfunction

    // State machine and LFSR update
    always @(posedge ck or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            lfsr_reg <= {LFSR_WIDTH{1'b1}};
            lock_counter <= 0;
            error_counter <= 0;
            o_lck <= 1'b0;
            o_err <= 1'b0;
            o_vld <= 1'b0;
        end else begin
            state <= next_state;
            lfsr_reg <= lfsr_next;

            case (state)
                IDLE: begin
                    if (i_req) begin
                        o_vld <= 1'b1;
                    end else begin
                        o_vld <= 1'b0;
                    end
                end

                UNLOCKED: begin
                    if (i_req) begin
                        o_vld <= 1'b1;
                        if (i_din != lfsr_reg[LFSR_WIDTH-1]) begin
                            error_counter <= error_counter + 1;
                            if (error_counter == 6'b111111) begin
                                o_err <= 1'b1;
                            end
                        end else begin
                            error_counter <= 0;
                            o_err <= 1'b0;
                        end

                        lock_counter <= (i_din == lfsr_reg[LFSR_WIDTH-1]) ? lock_counter + 1 : 0;
                        if (lock_counter == {LFSR_WIDTH{1'b1}}) begin
                            o_lck <= 1'b1;
                        end
                    end else begin
                        o_vld <= 1'b0;
                    end
                end

                LOCKED: begin
                    if (i_req) begin
                        o_vld <= 1'b1;
                        if (i_din != lfsr_reg[LFSR_WIDTH-1]) begin
                            o_lck <= 1'b0;
                            lock_counter <= 0;
                        end
                    end else begin
                        o_vld <= 1'b0;
                    end
                end
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        lfsr_next = lfsr_reg;

        case (state)
            IDLE: begin
                if (i_req) begin
                    next_state = UNLOCKED;
                    lfsr_next = lfsr_update(lfsr_reg);
                end
            end

            UNLOCKED: begin
                if (i_req) begin
                    lfsr_next = lfsr_update(lfsr_reg);
                    if (lock_counter == {LFSR_WIDTH{1'b1}}) begin
                        next_state = LOCKED;
                    end
                end
            end

            LOCKED: begin
                if (i_req) begin
                    lfsr_next = lfsr_update(lfsr_reg);
                    if (i_din != lfsr_reg[LFSR_WIDTH-1]) begin
                        next_state = UNLOCKED;
                    end
                end
            end
        endcase
    end

endmodule