module Button_Debounce(Button, clk, output_tick);

input Button, clk;
output reg output_tick;
reg [31:0] counter;

// Assuming 50MHz clock and 20ms debounce time
localparam DEBOUNCE_LIMIT = 32'd1_000_000;

[MASKED]
endmodule