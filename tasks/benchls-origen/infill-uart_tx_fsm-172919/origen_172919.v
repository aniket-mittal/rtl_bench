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

[MASKED]

endmodule