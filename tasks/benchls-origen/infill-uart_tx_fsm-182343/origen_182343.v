module origen_182343(
    input clock,
    input reset,
    input [7:0] bytetosend,
    input send,
    output reg tx_led,
    output reg sent,
    output tx
);

parameter baud_rate = 115200;

reg [3:0] state;
parameter IDLE = 4'd0, START_BIT = 4'd1, BIT_ONE = 4'd2, BIT_TWO = 4'd3,
          BIT_THREE = 4'd4, BIT_FOUR = 4'd5, BIT_FIVE = 4'd6, BIT_SIX = 4'd7,
          BIT_SEVEN = 4'd8, BIT_EIGHT = 4'd9, STOP_BIT = 4'd10, STOP_BIT2 = 4'd11;

reg [15:0] fsm_clk_count;
wire fsm_clk;

reg [9:0] tx_reg;

[MASKED]

assign fsm_clk = (fsm_clk_count == (clock / (2 * baud_rate) - 1));
assign tx = tx_reg[0];

`ifdef SIMULATION
    always @(posedge fsm_clk) begin
        if (state == START_BIT) begin
            ;
        end
    end
`endif

endmodule