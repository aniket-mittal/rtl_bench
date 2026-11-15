`ifndef MAX
`define MAX 8'hff
`endif

`ifndef MIN
`define MIN 8'h00
`endif

`ifndef TIK
`define TIK 1
`endif

`ifdef DEBUG_DEBOUNCE
output dclk, dkeyBounce;
`endif

module origen_157439(
    input clk,
    input keyBounce,
    output keyDeBounce
);

reg [7:0] counter = `MIN;
reg lockDeBounce = 1'b1;

assign keyDeBounce = lockDeBounce ? 1'b1 : keyBounce;

`ifdef DEBUG_DEBOUNCE
assign dclk = clk;
assign dkeyBounce = keyBounce;
`endif

[MASKED]

endmodule