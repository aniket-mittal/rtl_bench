module origen_191237 (
    input clk,
    input rst,
    input tx_vld,
    input [7:0] tx_data,
    output reg tx,
    output reg txrdy,
    output reg is_busy
);

    reg [13:0] rx_cnt;
    reg txvld_ok;
    reg [7:0] tx_rdy_data;
    reg rx_en;
    reg tran_vld;
    reg data_change;
    reg start;
    reg [3:0] tran_cnt;
    reg parity;

    [MASKED]

endmodule