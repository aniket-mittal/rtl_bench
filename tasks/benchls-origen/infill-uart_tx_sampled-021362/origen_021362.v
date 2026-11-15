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

[MASKED]

endmodule