module origen_085107 (
    input wire clock,
    input wire reset,
    input wire ce_16,
    input wire [7:0] tx_data,
    input wire new_tx_data,
    output reg ser_out,
    output reg tx_busy
);

    reg ce_1;
    reg [3:0] count16;
    reg [3:0] bit_count;
    reg [8:0] data_buf;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            ce_1 <= 1'b0;
            count16 <= 4'b0000;
            bit_count <= 4'b0000;
            data_buf <= 9'b111111111;
            ser_out <= 1'b1;
            tx_busy <= 1'b0;
        end else if (ce_16) begin
            if (count16 == 4'b1111) begin
                ce_1 <= 1'b1;
                count16 <= 4'b0000;
            end else begin
                ce_1 <= 1'b0;
                count16 <= count16 + 1'b1;
            end

            if (ce_1) begin
                if (!tx_busy && new_tx_data) begin
                    tx_busy <= 1'b1;
                    data_buf <= {tx_data, 1'b0};
                    bit_count <= 4'b0000;
                end else if (tx_busy) begin
                    if (bit_count == 4'b1001) begin
                        tx_busy <= 1'b0;
                        ser_out <= 1'b1;
                    end else begin
                        ser_out <= data_buf[0];
                        data_buf <= {1'b1, data_buf[8:1]};
                        bit_count <= bit_count + 1'b1;
                    end
                end
            end
        end
    end

endmodule