module origen_046816 #(
    parameter DIV_WID = 10,
    parameter DIV_CNT = 520
) (
    input wire i_clk,
    input wire i_rst_n,
    input wire [7:0] i_data,
    input wire i_txen,
    output wire o_uart_miso,
    output wire o_txempty
);

    reg [DIV_WID-1:0] div;
    reg [9:0] data;
    reg [3:0] bitCnt;
    reg txempty;

    wire start;
    wire fin;
    wire dt_txpls;

    assign o_uart_miso = data[0];
    assign o_txempty = txempty;
    assign start = txempty & i_txen;
    assign fin = (bitCnt == 4'd10) & dt_txpls;
    assign dt_txpls = (div == 0);

    [MASKED]

endmodule