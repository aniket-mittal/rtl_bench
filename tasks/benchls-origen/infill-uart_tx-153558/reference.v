module origen_153558 #(
    parameter DBIT = 8,
    parameter SB_TICK = 16
)(
    input clk,
    input reset,
    input tx_start,
    input s_tick,
    input [7:0] din,
    output reg TX_Done,
    output reg tx
);

localparam [1:0] IDLE = 2'b00, START = 2'b01, DATA = 2'b10, STOP = 2'b11;

reg [1:0] state_reg, state_next;
reg [3:0] s_reg, s_next;
reg [2:0] n_reg, n_next;
reg [7:0] b_reg, b_next;
reg [7:0] tx_reg, tx_next;

always @(posedge clk, posedge reset)
begin
    if (reset)
    begin
        state_reg <= IDLE;
        s_reg <= 0;
        n_reg <= 0;
        b_reg <= 0;
        tx_reg <= 0;
    end
    else
    begin
        state_reg <= state_next;
        s_reg <= s_next;
        n_reg <= n_next;
        b_reg <= b_next;
        tx_reg <= tx_next;
    end
end

always @*
begin
    state_next = state_reg;
    s_next = s_reg;
    n_next = n_reg;
    b_next = b_reg;
    tx_next = tx_reg;
    TX_Done = 1'b0;
    tx = tx_reg[0];

    case (state_reg)
        IDLE:
        begin
            tx_next = 1'b1;
            if (tx_start)
            begin
                state_next = START;
                s_next = 0;
                b_next = din;
            end
        end
        START:
        begin
            tx_next = 1'b0;
            if (s_reg == DBIT)
            begin
                state_next = DATA;
                s_next = 0;
                n_next = 0;
            end
            else
                s_next = s_reg + 1;
        end
        DATA:
        begin
            tx_next = b_reg[0];
            b_next = b_reg >> 1;
            if (s_reg == SB_TICK - 1)
            begin
                s_next = 0;
                if (n_reg == DBIT - 1)
                    state_next = STOP;
                else
                    n_next = n_reg + 1;
            end
            else
                s_next = s_reg + 1;
        end
        STOP:
        begin
            tx_next = 1'b1;
            if (s_reg == SB_TICK * 1 - 1)
            begin
                state_next = IDLE;
                TX_Done = 1'b1;
            end
            else
                s_next = s_reg + 1;
        end
    endcase
end

endmodule