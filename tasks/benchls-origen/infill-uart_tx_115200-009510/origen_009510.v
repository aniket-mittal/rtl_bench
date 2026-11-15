module origen_009510 (
    input wire clock115200,
    input wire resetn,
    input wire [7:0] data,
    input wire send,
    output reg ready,
    output reg UART_TX
);

    reg [3:0] state;
    reg [7:0] buffer;

    [MASKED]
endmodule

module uartrx (
    input wire clock115200,
    input wire resetn,
    input wire UART_RX,
    output reg [7:0] data,
    output reg recv
);

    reg [3:0] state;
    reg [7:0] buffer;

    always @(posedge clock115200 or negedge resetn) begin
        if (!resetn) begin
            state <= 4'd0;
            data <= 8'd0;
            buffer <= 8'd0;
            recv <= 1'b0;
        end else begin
            case (state)
                4'd0: begin // Idle state
                    recv <= 1'b0;
                    if (UART_RX == 1'b0) begin // Start bit detected
                        state <= 4'd1;
                    end
                end
                4'd1: begin // Confirm start bit
                    if (UART_RX == 1'b0) begin
                        state <= 4'd2;
                    end else begin
                        state <= 4'd0;
                    end
                end
                4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd9: begin // Data bits
                    buffer[state - 4'd2] <= UART_RX;
                    state <= state + 4'd1;
                end
                default: begin // Process received data
                    data <= buffer;
                    recv <= 1'b1;
                    state <= 4'd0;
                end
            endcase
        end
    end
endmodule