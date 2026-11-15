module origen_060168 #(
    parameter Gap = 4'd12
) (
    input wire sys_rst,
    input wire [63:0] global_counter,
    input wire gmii_rx_clk,
    input wire gmii_rx_dv,
    input wire [7:0] gmii_rxd,
    output reg [17:0] data_din,
    output reg data_wr_en,
    output reg [17:0] len_din,
    output reg len_wr_en,
    output wire wr_clk,
    input wire data_full,
    input wire len_full
);

    localparam STATE_SFD = 1'b0;
    localparam STATE_DATA = 1'b1;

    reg state;
    reg [63:0] timestamp;
    reg [15:0] frame_length;
    reg [3:0] byte_count;
    reg odd_byte;
    reg [3:0] gap_counter;

    assign wr_clk = gmii_rx_clk;

    always @(posedge gmii_rx_clk or posedge sys_rst) begin
        if (sys_rst) begin
            state <= STATE_SFD;
            data_din <= 18'b0;
            data_wr_en <= 1'b0;
            len_din <= 18'b0;
            len_wr_en <= 1'b0;
            timestamp <= 64'b0;
            frame_length <= 16'b0;
            byte_count <= 4'b0;
            odd_byte <= 1'b0;
            gap_counter <= 4'b0;
        end else begin
            case (state)
                STATE_SFD: begin
                    if (gmii_rx_dv && gmii_rxd == 8'hD5) begin
                        timestamp <= global_counter;
                        byte_count <= 4'b0;
                        frame_length <= 16'b0;
                        state <= STATE_DATA;
                    end
                end

                STATE_DATA: begin
                    if (gmii_rx_dv) begin
                        frame_length <= frame_length + 1'b1;
                        if (byte_count < 8) begin
                            data_din <= {2'b11, timestamp[63:48]};
                            data_wr_en <= 1'b1;
                            timestamp <= {timestamp[47:0], 16'b0};
                            byte_count <= byte_count + 1'b1;
                        end else begin
                            if (odd_byte) begin
                                data_din <= {2'b10, gmii_rxd, data_din[7:0]};
                                data_wr_en <= 1'b1;
                            end else begin
                                data_din[7:0] <= gmii_rxd;
                                data_wr_en <= 1'b0;
                            end
                            odd_byte <= ~odd_byte;
                        end
                    end else begin
                        if (odd_byte) begin
                            data_din <= {2'b10, 8'b0, data_din[7:0]};
                            data_wr_en <= 1'b1;
                        end
                        len_din <= {2'b00, frame_length};
                        len_wr_en <= 1'b1;
                        state <= STATE_SFD;
                        gap_counter <= Gap;
                        odd_byte <= 1'b0;
                    end
                end
            endcase

            if (gap_counter > 0) begin
                data_din <= 18'b0;
                data_wr_en <= 1'b1;
                gap_counter <= gap_counter - 1'b1;
            end

            if (data_full) data_wr_en <= 1'b0;
            if (len_full) len_wr_en <= 1'b0;
        end
    end

endmodule