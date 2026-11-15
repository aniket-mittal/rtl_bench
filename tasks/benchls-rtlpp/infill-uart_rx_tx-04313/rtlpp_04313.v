module rtlpp_04313(
    input clk, 
    input rstn, 
    input rx, 
    output reg tx, 
    input transmit, 
    input [7:0] tx_byte, 
    output reg received, 
    output reg [7:0] rx_byte, 
    output reg is_receiving, 
    output reg is_transmitting, 
    output reg recv_error
);

    parameter CLOCK_DIVIDE = 217;

    localparam [6:0]
        RX_IDLE          = 7'b000_0001,
        RX_CHECK_START   = 7'b000_0010,
        RX_READ_BITS     = 7'b000_0100,
        RX_CHECK_STOP    = 7'b000_1000,
        RX_DELAY_RESTART = 7'b001_0000,
        RX_ERROR         = 7'b010_0000,
        RX_RECEIVED      = 7'b100_0000;

    localparam [2:0]
        TX_IDLE          = 3'b001,
        TX_SENDING       = 3'b010,
        TX_DELAY_RESTART = 3'b100;

    reg [10:0] rx_clk_divider;
    reg [10:0] tx_clk_divider;

    reg [6:0] recv_state;
    reg [5:0] rx_countdown;
    reg [3:0] rx_bits_remaining;
    reg [7:0] rx_data;

    reg tx_out;
    reg [2:0] tx_state;
    reg [5:0] tx_countdown;
    reg [3:0] tx_bits_remaining;
    reg [7:0] tx_data;

    [MASKED]

    always @(posedge clk) begin
        tx <= tx_out;
        is_receiving <= (recv_state != RX_IDLE);
    end

endmodule