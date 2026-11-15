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

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            data <= 10'b1111111111;
            bitCnt <= 4'd0;
            div <= DIV_CNT;
            o_uart_miso <= 1'b1;
            o_txempty <= 1'b1;
            txActive <= 1'b0;
        end else begin
            if (o_txempty && i_txen) begin
                data <= {1'b1, i_data, 1'b0};
                o_txempty <= 1'b0;
                txActive <= 1'b1;
                bitCnt <= 4'd0;
                div <= DIV_CNT;
            end

            if (txActive) begin
                if (div == 0) begin
                    div <= DIV_CNT;
                    if (bitCnt == 4'd10) begin
                        txActive <= 1'b0;
                        o_txempty <= 1'b1;
                    end else begin
                        data <= {1'b1, data[9:1]};
                        o_uart_miso <= data[0];
                        bitCnt <= bitCnt + 1'b1;
                    end
                end else begin
                    div <= div - 1'b1;
                end
            end
        end
    end

endmodule