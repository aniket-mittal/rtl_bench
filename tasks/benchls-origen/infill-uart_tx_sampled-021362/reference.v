module origen_021362 (
    input wire sys_clk,
    input wire sam_clk,
    input wire reset,
    input wire [7:0] TX_DATA,
    input wire TX_EN,
    output reg TX_STATUS,
    output reg UART_TX
);

reg enable;
reg [7:0] shift_reg;
reg [7:0] count;

always @(posedge sys_clk or negedge reset) begin
    if (!reset) begin
        enable <= 0;
        TX_STATUS <= 1;
        shift_reg <= 8'b0;
    end else begin
        if (TX_EN && TX_STATUS) begin
            enable <= 1;
            TX_STATUS <= 0;
            shift_reg <= TX_DATA;
        end else if (count == 160) begin
            enable <= 0;
            TX_STATUS <= 1;
        end
    end
end

always @(posedge sam_clk or negedge reset) begin
    if (!reset) begin
        count <= 0;
        UART_TX <= 1;
    end else begin
        if (enable) begin
            count <= (count == 160) ? 0 : count + 1;
            case (count)
                0: UART_TX <= 0;  // Start bit
                16, 32, 48, 64, 80, 96, 112, 128: UART_TX <= shift_reg[count[7:4] - 1];
                144: UART_TX <= 1;  // Stop bit
                default: UART_TX <= UART_TX;
            endcase
        end else begin
            count <= 0;
            UART_TX <= 1;
        end
    end
end

endmodule