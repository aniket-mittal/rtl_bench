module origen_151488 #(
    parameter DBIT = 8,
    parameter SB_TICK = 16
)(
    input clk,
    input rst,
    input tx_start,
    input s_tick,
    input [7:0] din,
    output reg tx_done_tick,
    output reg tx
);

    // States
    localparam IDLE = 2'b00, START = 2'b01, DATA = 2'b10, STOP = 2'b11;

    // Registers
    reg [1:0] current_state, next_state;
    reg [3:0] s_reg, s_next;
    reg [2:0] n_reg, n_next;
    reg [7:0] b_reg, b_next;
    reg tx_reg, tx_next;

    // Next State Logic
    always @* begin
        next_state = current_state;
        s_next = s_reg;
        n_next = n_reg;
        b_next = b_reg;
        tx_next = tx_reg;
        tx_done_tick = 1'b0;

        case (current_state)
            IDLE: begin
                tx = 1'b1;
                if (tx_start) begin
                    next_state = START;
                    b_next = din;
                end
            end
            START: begin
                tx = 1'b0;
                if (s_tick) begin
                    if (s_reg == (DBIT-1)) begin
                        next_state = DATA;
                        s_next = 0;
                        n_next = 0;
                    end else begin
                        s_next = s_reg + 1;
                    end
                end
            end
            DATA: begin
                tx = b_reg[0];
                b_next = {1'b0, b_reg[7:1]};
                if (s_tick) begin
                    if (n_reg == (DBIT-1)) begin
                        next_state = STOP;
                        s_next = 0;
                    end else begin
                        s_next = 0;
                        n_next = n_reg + 1;
                    end
                end
            end
            STOP: begin
                tx = 1'b1;
                if (s_tick) begin
                    if (s_reg == (SB_TICK-1)) begin
                        next_state = IDLE;
                        tx_done_tick = 1'b1;
                    end else begin
                        s_next = s_reg + 1;
                    end
                end
            end
        endcase
    end

    // Register Updates
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            current_state <= IDLE;
            s_reg <= 0;
            n_reg <= 0;
            b_reg <= 0;
            tx_reg <= 1'b1;
        end else begin
            current_state <= next_state;
            s_reg <= s_next;
            n_reg <= n_next;
            b_reg <= b_next;
            tx_reg <= tx_next;
        end
    end

endmodule