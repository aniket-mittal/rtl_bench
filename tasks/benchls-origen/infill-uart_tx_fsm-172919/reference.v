module origen_172919 #(
    parameter DBIT = 8,
    parameter SB_TICK = 16
) (
    input clk,
    input reset,
    input tx_start,
    input s_tick,
    input [DBIT-1:0] din,
    output reg tx_done_tick,
    output reg tx
);

localparam [1:0] 
    IDLE = 2'b00,
    START = 2'b01,
    DATA = 2'b10,
    STOP = 2'b11;

reg [1:0] state_reg, state_next;
reg [3:0] s_reg, s_next;
reg [2:0] n_reg, n_next;
reg [DBIT-1:0] b_reg, b_next;

always @(posedge clk, posedge reset) begin
    if (reset) begin
        state_reg <= IDLE;
        s_reg <= 0;
        n_reg <= 0;
        b_reg <= 0;
    end
    else begin
        state_reg <= state_next;
        s_reg <= s_next;
        n_reg <= n_next;
        b_reg <= b_next;
    end
end

always @* begin
    state_next = state_reg;
    s_next = s_reg;
    n_next = n_reg;
    b_next = b_reg;
    tx_done_tick = 1'b0;
    tx = 1'b1;

    case (state_reg)
        IDLE: begin
            tx = 1'b1;
            if (tx_start) begin
                state_next = START;
                s_next = 0;
                n_next = 0;
                b_next = din;
            end
        end
        START: begin
            tx = 1'b0;
            if (s_tick) begin
                if (s_reg == 15) begin
                    state_next = DATA;
                    s_next = 0;
                end
                else
                    s_next = s_reg + 1;
            end
        end
        DATA: begin
            tx = b_reg[0];
            if (s_tick) begin
                if (s_reg == 15) begin
                    s_next = 0;
                    b_next = {1'b0, b_reg[DBIT-1:1]};
                    if (n_reg == DBIT-1)
                        state_next = STOP;
                    else
                        n_next = n_reg + 1;
                end
                else
                    s_next = s_reg + 1;
            end
        end
        STOP: begin
            if (s_tick) begin
                if (s_reg == SB_TICK-1) begin
                    state_next = IDLE;
                    tx_done_tick = 1'b1;
                end
                else
                    s_next = s_reg + 1;
            end
        end
    endcase
end

endmodule