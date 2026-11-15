module origen_159032(
    input clk,
    input rst_n,
    input RX,
    input clr_rx_rdy,
    output [7:0] rx_data,
    output reg rx_rdy
);

    // Internal signals
    reg [2:0] state, nxt_state;
    reg [9:0] shift_reg;
    reg [3:0] bit_cnt;
    reg [11:0] baud_cnt;
    reg half_baud;
    reg strt_rcv, receiving, rcv_done;
    reg shift;

    // State definitions
    parameter IDLE = 3'b000, TX = 3'b001;

    // Baud rate generator
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            baud_cnt <= 12'd0;
            half_baud <= 1'b0;
        end else begin
            if (baud_cnt == 12'd2604) begin // Baud rate = 115200 @ 50 MHz
                baud_cnt <= 12'd0;
                half_baud <= ~half_baud;
            end else begin
                baud_cnt <= baud_cnt + 12'd1;
            end
        end
    end

    // Shift register and bit counter
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            shift_reg <= 10'b1111111111;
            bit_cnt <= 4'd0;
        end else begin
            if (shift) begin
                shift_reg <= {RX, shift_reg[9:1]};
                bit_cnt <= bit_cnt + 4'd1;
            end
        end
    end

    // State machine
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
        end else begin
            state <= nxt_state;
        end
    end

    always @(*) begin
        nxt_state = state;
        strt_rcv = 1'b0;
        receiving = 1'b0;
        rcv_done = 1'b0;
        shift = 1'b0;

        case (state)
            IDLE: begin
                if (!RX) begin
                    nxt_state = TX;
                    strt_rcv = 1'b1;
                end
            end
            TX: begin
                if (half_baud) begin
                    receiving = 1'b1;
                    shift = 1'b1;
                    if (bit_cnt == 4'd10) begin
                        nxt_state = IDLE;
                        rcv_done = 1'b1;
                    end
                end
            end
            default: nxt_state = IDLE;
        endcase
    end

    // Output assignments
    assign rx_data = shift_reg[8:1];

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            rx_rdy <= 1'b0;
        end else begin
            if (rcv_done) begin
                rx_rdy <= 1'b1;
            end else if (clr_rx_rdy || strt_rcv) begin
                rx_rdy <= 1'b0;
            end
        end
    end

endmodule