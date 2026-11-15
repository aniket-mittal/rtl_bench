module origen_066710 #(
    parameter CLK_FREQ = 50_000_000
) (
    input wire i_clk,
    input wire i_reset_n,
    input wire i_pop,
    input wire i_parity,
    input wire i_serial,
    input wire i_enable,
    input wire [15:0] i_baud,
    output wire o_tx_enable,
    output wire o_rx_enable
);

    localparam TX_CYCLES = 10;
    localparam RX_CYCLES = 9;

    reg r_tx_enable, r_rx_enable;
    reg [3:0] r_tx_cycle, r_rx_cycle;
    reg [15:0] r_tx_baud_counter, r_rx_baud_counter;
    reg [1:0] r_rx_state;

    localparam START = 2'b00, HALF_PERIOD = 2'b01, COUNT = 2'b10;

    always @(posedge i_clk or negedge i_reset_n) begin
        if (!i_reset_n) begin
            r_tx_enable <= 1'b0;
            r_rx_enable <= 1'b0;
            r_tx_cycle <= 4'd0;
            r_rx_cycle <= 4'd0;
            r_tx_baud_counter <= 16'd0;
            r_rx_baud_counter <= 16'd0;
            r_rx_state <= START;
        end else if (i_enable) begin
            // TX logic
            if (i_pop && r_tx_cycle == 4'd0) begin
                r_tx_cycle <= i_parity ? TX_CYCLES : (TX_CYCLES - 1);
            end

            if (r_tx_cycle > 4'd0) begin
                if (r_tx_baud_counter == i_baud - 1) begin
                    r_tx_baud_counter <= 16'd0;
                    r_tx_enable <= 1'b1;
                    r_tx_cycle <= r_tx_cycle - 1;
                end else begin
                    r_tx_baud_counter <= r_tx_baud_counter + 1;
                    r_tx_enable <= 1'b0;
                end
            end else begin
                r_tx_enable <= 1'b0;
            end

            // RX logic
            case (r_rx_state)
                START: begin
                    if (!i_serial) begin
                        r_rx_state <= HALF_PERIOD;
                        r_rx_baud_counter <= {1'b0, i_baud[15:1]} - 1;
                    end
                end
                HALF_PERIOD: begin
                    if (r_rx_baud_counter == 16'd0) begin
                        r_rx_state <= COUNT;
                        r_rx_cycle <= i_parity ? RX_CYCLES : (RX_CYCLES - 1);
                        r_rx_baud_counter <= i_baud - 1;
                    end else begin
                        r_rx_baud_counter <= r_rx_baud_counter - 1;
                    end
                end
                COUNT: begin
                    if (r_rx_baud_counter == 16'd0) begin
                        r_rx_enable <= 1'b1;
                        r_rx_baud_counter <= i_baud - 1;
                        if (r_rx_cycle == 4'd0) begin
                            r_rx_state <= START;
                        end else begin
                            r_rx_cycle <= r_rx_cycle - 1;
                        end
                    end else begin
                        r_rx_baud_counter <= r_rx_baud_counter - 1;
                        r_rx_enable <= 1'b0;
                    end
                end
            endcase
        end else begin
            r_tx_enable <= 1'b0;
            r_rx_enable <= 1'b0;
        end
    end

    assign o_tx_enable = r_tx_enable;
    assign o_rx_enable = r_rx_enable;

endmodule