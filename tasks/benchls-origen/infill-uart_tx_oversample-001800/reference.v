module origen_001800
#(
    parameter DBIT = 8,
    parameter SB_TICK = 16
)
(
    input wire i_clk, i_reset,
    input wire i_tx_start, i_s_tick,
    input wire [7:0] i_din,
    output reg o_tx_done_tick,
    output wire o_tx
);

// State definitions
localparam [1:0] 
    IDLE  = 2'b00,
    START = 2'b01,
    DATA  = 2'b10,
    STOP  = 2'b11;

// Signal declarations
reg [1:0] state_reg, state_next;
reg [3:0] s_reg, s_next;
reg [2:0] n_reg, n_next;
reg [7:0] b_reg, b_next;
reg tx_reg, tx_next;

// State and data registers
always @(posedge i_clk, posedge i_reset)
    if (i_reset) begin
        state_reg <= IDLE;
        s_reg <= 0;
        n_reg <= 0;
        b_reg <= 0;
        tx_reg <= 1'b1;
    end
    else begin
        state_reg <= state_next;
        s_reg <= s_next;
        n_reg <= n_next;
        b_reg <= b_next;
        tx_reg <= tx_next;
    end

// Next-state logic and data path
always @* begin
    state_next = state_reg;
    s_next = s_reg;
    n_next = n_reg;
    b_next = b_reg;
    tx_next = tx_reg;
    o_tx_done_tick = 1'b0;

    case (state_reg)
        IDLE: begin
            tx_next = 1'b1;
            if (i_tx_start) begin
                state_next = START;
                s_next = 0;
                b_next = i_din;
            end
        end

        START: begin
            tx_next = 1'b0;
            if (i_s_tick)
                if (s_reg == 15) begin
                    state_next = DATA;
                    s_next = 0;
                    n_next = 0;
                end
                else
                    s_next = s_reg + 1;
        end

        DATA: begin
            tx_next = b_reg[0];
            if (i_s_tick)
                if (s_reg == 15) begin
                    s_next = 0;
                    b_next = b_reg >> 1;
                    if (n_reg == (DBIT-1))
                        state_next = STOP;
                    else
                        n_next = n_reg + 1;
                end
                else
                    s_next = s_reg + 1;
        end

        STOP: begin
            tx_next = 1'b1;
            if (i_s_tick)
                if (s_reg == (SB_TICK-1)) begin
                    state_next = IDLE;
                    o_tx_done_tick = 1'b1;
                end
                else
                    s_next = s_reg + 1;
        end
    endcase
end

// Output
assign o_tx = tx_reg;

endmodule