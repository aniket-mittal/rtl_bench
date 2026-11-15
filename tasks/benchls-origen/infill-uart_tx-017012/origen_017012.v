module origen_017012 #(
    parameter DIV_WID = 9,
    parameter DIV_CNT = 433
) (
    input wire i_clk,
    input wire i_rst_n,
    input wire [7:0] i_data,
    input wire i_txen,
    output reg o_uart_miso,
    output reg o_txempty
);

    reg [9:0] data;
    reg [3:0] bitCnt;
    reg [DIV_WID-1:0] div;
    reg txActive;

    [MASKED]

endmodule