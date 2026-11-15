module simplified_altera_std_synchronizer (
    clk,
    din,
    dout,
    reset_n
);

input clk, din, reset_n;
output dout;
reg [1:0] sync_reg;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        sync_reg <= 2'b00;
    else
        sync_reg <= {sync_reg[0], din};
end

assign dout = sync_reg[1];

endmodule