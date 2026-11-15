module origen_045281 (
    input wire uart_rx,
    input wire smp_clk,
    input wire reset,
    output reg rx_status,
    output reg [7:0] rx_data
);

    reg section;
    reg [7:0] sect_cnt;
    reg [2:0] bit_cnt;
    parameter sect_lim = 8'h9F;

    always @(posedge smp_clk or negedge reset) begin
        if (!reset) begin
            section <= 0;
            sect_cnt <= 0;
            bit_cnt <= 0;
            rx_status <= 0;
            rx_data <= 0;
        end else begin
            case (section)
                0: begin // Idle state
                    if (uart_rx == 0) begin
                        section <= 1;
                        sect_cnt <= 0;
                        bit_cnt <= 0;
                        rx_status <= 0;
                    end
                end
                1: begin // Receiving state
                    if (sect_cnt == sect_lim) begin
                        sect_cnt <= 0;
                        if (bit_cnt == 3'b111) begin
                            section <= 0;
                            rx_status <= uart_rx;
                        end else begin
                            bit_cnt <= bit_cnt + 1;
                        end
                    end else begin
                        sect_cnt <= sect_cnt + 1;
                        case (sect_cnt)
                            8'd24, 8'd48, 8'd72, 8'd96, 8'd120, 8'd144, 8'd168, 8'd192:
                                rx_data <= {uart_rx, rx_data[7:1]};
                        endcase
                    end
                end
            endcase
        end
    end

endmodule