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
    [MASKED]

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