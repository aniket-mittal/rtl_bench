module origen_206443 (
    input        clk,
    input        rst_n,
    input        rs232_rx,
    input        clk_bps,
    output       bps_start,
    output [7:0] rx_data
);

    reg [3:0] rs232_rx0, rs232_rx1, rs232_rx2, rs232_rx3;
    reg [7:0] rx_temp_data;
    reg [3:0] num;
    reg       rx_int;

    wire neg_rs232_rx = ~(rs232_rx0[3] & rs232_rx1[3] & rs232_rx2[3] & rs232_rx3[3]);

    [MASKED]

    assign bps_start = (num == 4'd1);
    assign rx_data = rx_temp_data;

endmodule