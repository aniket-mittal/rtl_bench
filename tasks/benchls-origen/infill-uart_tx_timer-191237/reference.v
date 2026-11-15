module origen_191237 (
    input clk,
    input rst,
    input tx_vld,
    input [7:0] tx_data,
    output reg tx,
    output reg txrdy,
    output reg is_busy
);

    reg [13:0] rx_cnt;
    reg txvld_ok;
    reg [7:0] tx_rdy_data;
    reg rx_en;
    reg tran_vld;
    reg data_change;
    reg start;
    reg [3:0] tran_cnt;
    reg parity;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rx_cnt <= 0;
            txvld_ok <= 0;
            tx_rdy_data <= 0;
            rx_en <= 0;
            tran_vld <= 0;
            data_change <= 0;
            start <= 0;
            tran_cnt <= 0;
            tx <= 1;
            txrdy <= 1;
            is_busy <= 0;
            parity <= 0;
        end else begin
            rx_cnt <= rx_cnt + 1;
            if (rx_cnt == 2603) begin
                rx_cnt <= 0;
            end

            txvld_ok <= tx_vld;
            if (txvld_ok) begin
                tx_rdy_data <= tx_data;
                data_change <= 1;
            end

            if (rx_cnt == 1301) begin
                rx_en <= 1;
            end else begin
                rx_en <= 0;
            end

            if (txvld_ok) begin
                tran_vld <= 1;
            end else if (tran_cnt == 11) begin
                tran_vld <= 0;
            end

            if (data_change) begin
                start <= 1;
                data_change <= 0;
            end else if (tran_cnt == 11) begin
                start <= 0;
            end

            if (start) begin
                tran_cnt <= tran_cnt + 1;
            end else begin
                tran_cnt <= 0;
            end

            if (rx_en) begin
                case (tran_cnt)
                    0: tx <= 0; // Start bit
                    1: tx <= tx_rdy_data[0];
                    2: tx <= tx_rdy_data[1];
                    3: tx <= tx_rdy_data[2];
                    4: tx <= tx_rdy_data[3];
                    5: tx <= tx_rdy_data[4];
                    6: tx <= tx_rdy_data[5];
                    7: tx <= tx_rdy_data[6];
                    8: tx <= tx_rdy_data[7];
                    9: tx <= parity;
                    10: tx <= 1; // Stop bit
                    default: tx <= 1;
                endcase
            end else begin
                tx <= 1;
            end

            if (tran_cnt == 0) begin
                parity <= ^tx_rdy_data;
            end

            is_busy <= tran_vld;
            txrdy <= ~tran_vld;
        end
    end

endmodule