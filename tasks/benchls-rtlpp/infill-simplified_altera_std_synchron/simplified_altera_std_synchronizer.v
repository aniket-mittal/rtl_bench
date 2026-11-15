module simplified_altera_std_synchronizer (
    clk,
    din,
    dout,
    reset_n
);

input clk, din, reset_n;
output dout;
reg [1:0] sync_reg;

[MASKED]

assign dout = sync_reg[1];

endmodule