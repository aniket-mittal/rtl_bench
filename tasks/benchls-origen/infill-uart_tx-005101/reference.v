module origen_005101
#(
    parameter DBIT = 8,     // Data bits
    parameter SB_TICK = 16  // Stop bit ticks
)
(
    input wire clk, rst_n,
    input wire s_tick, tx_start,
    input wire [7:0] din,
    output reg tx_done_tick,
    output wire tx
);

// State definitions
localparam [1:0]
    IDLE  = 2'b00,
    START = 2'b01,
    DATA  = 2'b10,
    STOP  = 2'b11;

reg [1:0] state_reg, state_next;
reg [3:0] s_reg, s_next;
reg [2:0] n_reg, n_next;
reg [7:0] din_reg, din_next;
reg tx_reg, tx_next;

// State and data registers
always @(posedge clk, negedge rst_n)
    if (!rst_n) begin
        state_reg <= IDLE;
        s_reg <= 0;
        n_reg <= 0;
        din_reg <= 0;
        tx_reg <= 1'b1;
    end
    else begin
        state_reg <= state_next;
        s_reg <= s_next;
        n_reg <= n_next;
        din_reg <= din_next;
        tx_reg <= tx_next;
    end

// Next-state logic and output logic
always @* begin
    state_next = state_reg;
    s_next = s_reg;
    n_next = n_reg;
    din_next = din_reg;
    tx_next = tx_reg;
    tx_done_tick = 1'b0;

    case (state_reg)
        IDLE: begin
            tx_next = 1'b1;
            if (tx_start) begin
                state_next = START;
                s_next = 0;
                din_next = din;
            end
        end
        START: begin
            tx_next = 1'b0;
            if (s_tick)
                if (s_reg == 15) begin
                    state_next = DATA;
                    s_next = 0;
                    n_next = 0;
                end
                else
                    s_next = s_reg + 1;
        end
        DATA: begin
            tx_next = din_reg[0];
            if (s_tick)
                if (s_reg == 15) begin
                    s_next = 0;
                    din_next = din_reg >> 1;
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
            if (s_tick)
                if (s_reg == (SB_TICK-1)) begin
                    state_next = IDLE;
                    tx_done_tick = 1'b1;
                end
                else
                    s_next = s_reg + 1;
        end
    endcase
end

assign tx = tx_reg;

endmodule