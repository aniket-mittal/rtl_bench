module origen_186199 #(
    parameter BAUD_END = 5207,   // Baud rate generator end count (non-simulation mode)
    parameter BIT_END   = 8      // Number of bits in the data frame
) (
    input  wire        s_clk,
    input  wire        s_rst_n,
    input  wire [7:0]  tx_data,
    input  wire        tx_trig,
    output reg         rs232_tx
);

    reg [7:0]  tx_data_r;
    reg        tx_flag;
    reg [13:0] baud_cnt;
    reg        bit_flag;
    reg [2:0]  bit_cnt;

    always @(posedge s_clk or negedge s_rst_n) begin
        if (~s_rst_n) begin
            tx_data_r <= 8'b0;
            tx_flag   <= 1'b0;
            baud_cnt  <= 14'b0;
            bit_flag  <= 1'b0;
            bit_cnt   <= 3'b0;
            rs232_tx  <= 1'b1;
        end else begin
            if (tx_trig) begin
                tx_data_r <= tx_data;
                tx_flag   <= 1'b1;
            end

            if (tx_flag) begin
                if (baud_cnt == BAUD_END - 1) begin
                    baud_cnt <= 14'b0;
                    bit_flag <= 1'b1;

                    if (bit_cnt == BIT_END - 1) begin
                        tx_flag  <= 1'b0;
                        bit_cnt  <= 3'b0;
                        rs232_tx <= 1'b1;
                    end else begin
                        bit_cnt <= bit_cnt + 1'b1;
                        rs232_tx <= tx_data_r[bit_cnt];
                    end
                end else begin
                    baud_cnt <= baud_cnt + 1'b1;
                    bit_flag <= 1'b0;
                end
            end else begin
                rs232_tx <= 1'b1;
            end
        end
    end

endmodule