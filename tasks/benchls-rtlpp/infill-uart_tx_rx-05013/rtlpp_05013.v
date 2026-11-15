module rtlpp_05013(
    input wire  clk, 
    input wire resetq, 
    input wire rx, 
    output wire tx, 
    input wire rd, 
    input wire wr, 
    output wire valid, 
    output wire busy, 
    input wire [7:0] tx_data, 
    output wire [7:0] rx_data 
    );

`define CLKFREQ   30000000    
`define BAUD      115200
 
localparam CLOCK_DIVIDE = `CLKFREQ / (`BAUD * 4);

parameter RX_IDLE = 0;
parameter RX_CHECK_START = 1;
parameter RX_READ_BITS = 2;
parameter RX_CHECK_STOP = 3;
parameter RX_DELAY_RESTART = 4;
parameter RX_ERROR = 5;
parameter RX_RECEIVED = 6;
 
parameter TX_IDLE = 0;
parameter TX_SENDING = 1;
parameter TX_DELAY_RESTART = 2;
 
reg [10:0] rx_clk_divider = CLOCK_DIVIDE;
reg [10:0] tx_clk_divider = CLOCK_DIVIDE;
 
reg [2:0] recv_state = RX_IDLE;
reg [5:0] rx_countdown;
reg [3:0] rx_bits_remaining;
reg [7:0] rx_data_;
 
reg tx_out = 1'b1;
reg [1:0] tx_state = TX_IDLE;
reg [5:0] tx_countdown;
reg [3:0] tx_bits_remaining;
reg [7:0] tx_data_;
 
assign valid = (recv_state == RX_RECEIVED);
assign rx_data = rx_data_;
assign tx = tx_out;
assign busy = (tx_state != TX_IDLE);
 
[MASKED]
 
endmodule