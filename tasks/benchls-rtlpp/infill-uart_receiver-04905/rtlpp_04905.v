module rtlpp_04905(clk, nrst, rx_data, rx_busy, rx_done, rx_err, rxd);

parameter CLK_HZ = 200_000_000;
parameter BAUD = 9600;
parameter BAUD_DIVISOR_2 = CLK_HZ / BAUD / 2;

input wire clk;
input wire nrst;

output reg [7:0] rx_data = 0;
reg rx_data_9th_bit = 0;	

output reg rx_busy = 0;
output wire rx_done;		
output wire rx_err;
input wire rxd;

// Embedded StaticDelay equivalent logic
reg [1:0] shift_reg = 2'b11;
always @(posedge clk or negedge nrst) begin
    if (!nrst) begin
        shift_reg <= 2'b11;
    end else begin
        shift_reg <= {shift_reg[0], rxd};
    end
end

wire s_rxd = shift_reg[1];

reg rxd_prev = 0;
always @(posedge clk) begin
	if (~nrst) begin
		rxd_prev <= 0;
	end else begin
		rxd_prev <= s_rxd;
	end
end
wire start_bit_strobe = ~s_rxd & rxd_prev;

reg [15:0] rx_sample_cntr = (BAUD_DIVISOR_2 - 1);
wire rx_do_sample = (rx_sample_cntr[15:0] == 0);
[MASKED]

assign
	rx_done = rx_data_9th_bit && rx_do_sample && s_rxd,		
	rx_err = rx_data_9th_bit && rx_do_sample && ~s_rxd;

endmodule