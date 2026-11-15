module rtlpp_06624(clk, nrst, tx_data, tx_start, tx_busy, txd);

parameter CLK_HZ = 200_000_000;
parameter BAUD = 9600;
parameter BAUD_DIVISOR = CLK_HZ / BAUD;

input wire clk;
input wire nrst;
input wire [7:0] tx_data;
input wire tx_start;
output reg tx_busy;
output reg txd;

reg [9:0] tx_shifter;
reg [15:0] tx_sample_cntr;

initial begin
    tx_busy = 0;
    txd = 1;
    tx_shifter = 0;
    tx_sample_cntr = 0;
end

always @ (posedge clk or negedge nrst) begin
    if (~nrst) begin
        tx_sample_cntr <= BAUD_DIVISOR - 1;
    end else if (tx_sample_cntr == 0) begin
        tx_sample_cntr <= BAUD_DIVISOR - 1;
    end else begin
        tx_sample_cntr <= tx_sample_cntr - 1;
    end
end

wire tx_do_sample = (tx_sample_cntr == 0);

[MASKED]

endmodule