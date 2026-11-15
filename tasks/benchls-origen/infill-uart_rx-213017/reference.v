module origen_213017(
    input UART_RX,
    input reset,
    input baud_clk,
    output reg RX_STATUS,
    output reg [7:0] RX_DATA
);

reg RX_EN;
reg sample;
reg [2:0] state;
reg [2:0] state1;

always @(posedge baud_clk or posedge reset) begin
    if (reset) begin
        RX_EN <= 0;
        RX_STATUS <= 0;
        state <= 0;
        state1 <= 0;
        RX_DATA <= 0;
    end
    else begin
        case (state)
            3'b000: begin
                if (UART_RX == 1'b1) begin
                    RX_EN <= 1;
                    state <= 3'b001;
                    state1 <= 3'b000;
                end
            end
            3'b001: begin
                sample <= 1;
                state1 <= state1 + 1;
                if (state1 == 3'b100) begin
                    RX_DATA[0] <= UART_RX;
                    state1 <= 3'b000;
                    state <= 3'b010;
                end
            end
            3'b010: begin
                sample <= 1;
                state1 <= state1 + 1;
                if (state1 == 3'b100) begin
                    RX_DATA[1] <= UART_RX;
                    state1 <= 3'b000;
                    state <= 3'b011;
                end
            end
            3'b011: begin
                sample <= 1;
                state1 <= state1 + 1;
                if (state1 == 3'b100) begin
                    RX_DATA[2] <= UART_RX;
                    state1 <= 3'b000;
                    state <= 3'b100;
                end
            end
            3'b100: begin
                sample <= 1;
                state1 <= state1 + 1;
                if (state1 == 3'b100) begin
                    RX_DATA[3] <= UART_RX;
                    state1 <= 3'b000;
                    state <= 3'b101;
                end
            end
            3'b101: begin
                sample <= 1;
                state1 <= state1 + 1;
                if (state1 == 3'b100) begin
                    RX_DATA[4] <= UART_RX;
                    state1 <= 3'b000;
                    state <= 3'b110;
                end
            end
            3'b110: begin
                sample <= 1;
                state1 <= state1 + 1;
                if (state1 == 3'b100) begin
                    RX_DATA[5] <= UART_RX;
                    state1 <= 3'b000;
                    state <= 3'b111;
                end
            end
            3'b111: begin
                sample <= 1;
                state1 <= state1 + 1;
                if (state1 == 3'b100) begin
                    RX_DATA[6] <= UART_RX;
                    state1 <= 3'b000;
                    state <= 3'b000;
                    RX_DATA[7] <= UART_RX;
                    RX_STATUS <= 1;
                    RX_EN <= 0;
                end
            end
        endcase
    end
end

endmodule