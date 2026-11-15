module origen_048381(
    input game_clk,
    input reset,
    input [2:0] KEY,
    input [9:0] apx,
    input [9:0] apy,
    output reg [9:0] mpx,
    output reg [9:0] mpy,
    output reg hit,
    output reg mstate
);

parameter block_size = 100;
parameter S0 = 1'b0;
parameter S1 = 1'b1;

reg state;

[MASKED]

endmodule