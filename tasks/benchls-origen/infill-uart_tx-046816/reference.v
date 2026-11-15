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

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            div <= 0;
            data <= 10'b1111111111;
            bitCnt <= 0;
            txempty <= 1'b1;
        end else begin
            if (start) begin
                div <= DIV_CNT - 1;
                data <= {1'b1, i_data, 1'b0};
                bitCnt <= 0;
                txempty <= 1'b0;
            end else if (!txempty) begin
                if (div == 0) begin
                    div <= DIV_CNT - 1;
                    data <= {1'b1, data[9:1]};
                    bitCnt <= bitCnt + 1;
                end else begin
                    div <= div - 1;
                end

                if (fin) begin
                    txempty <= 1'b1;
                end
            end
        end
    end

endmodule