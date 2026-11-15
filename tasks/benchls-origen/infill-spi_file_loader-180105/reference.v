module origen_180105 (
    input         clk,
    input         reset,

    input         SPI_SCK,
    input         SPI_SS2,
    input         SPI_DI,
    output reg    SPI_DO,

    output reg    ioctl_download,
    output reg [7:0] ioctl_index,
    output reg    ioctl_we,
    output reg [24:0] ioctl_addr,
    output reg [7:0] ioctl_dout
);

reg [2:0] state;
reg [7:0] command;
reg [7:0] data_buffer;
reg [24:0] addr_buffer;
reg [3:0] bit_count;
reg rclk;

localparam
    IDLE          = 3'd0,
    CMD_RX        = 3'd1,
    ADDR_RX       = 3'd2,
    DATA_RX       = 3'd3,
    FILE_TX       = 3'd4;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        command <= 8'h00;
        data_buffer <= 8'h00;
        addr_buffer <= 25'h0000000;
        bit_count <= 4'h0;
        ioctl_download <= 1'b0;
        ioctl_index <= 8'h00;
        ioctl_we <= 1'b0;
        ioctl_addr <= 25'h0000000;
        ioctl_dout <= 8'h00;
        SPI_DO <= 1'b0;
        rclk <= 1'b0;
    end else begin
        rclk <= ~rclk;

        case (state)
            IDLE: begin
                if (!SPI_SS2) begin
                    state <= CMD_RX;
                    bit_count <= 4'h0;
                end
            end

            CMD_RX: begin
                if (rclk) begin
                    command[bit_count] <= SPI_DI;
                    bit_count <= bit_count + 1'b1;
                    if (bit_count == 4'h7) begin
                        state <= ADDR_RX;
                        bit_count <= 4'h0;
                    end
                end
            end

            ADDR_RX: begin
                if (rclk) begin
                    addr_buffer[bit_count] <= SPI_DI;
                    bit_count <= bit_count + 1'b1;
                    if (bit_count == 4'h4) begin
                        state <= DATA_RX;
                        bit_count <= 4'h0;
                    end
                end
            end

            DATA_RX: begin
                if (rclk) begin
                    data_buffer[bit_count] <= SPI_DI;
                    bit_count <= bit_count + 1'b1;
                    if (bit_count == 4'h7) begin
                        case (command)
                            8'h54: begin // UIO_FILE_TX
                                ioctl_download <= 1'b1;
                                ioctl_index <= data_buffer;
                                ioctl_addr <= 25'h0000000;
                            end
                            8'h55: begin // UIO_FILE_TX_DAT
                                ioctl_we <= 1'b1;
                                ioctl_dout <= data_buffer;
                                ioctl_addr <= addr_buffer;
                                addr_buffer <= addr_buffer + 1'b1;
                            end
                            8'h56: begin // UIO_FILE_INDEX
                                ioctl_index <= data_buffer;
                            end
                        endcase
                        state <= FILE_TX;
                        bit_count <= 4'h0;
                    end
                end
            end

            FILE_TX: begin
                ioctl_we <= 1'b0;
                ioctl_download <= 1'b0;
                if (SPI_SS2) begin
                    state <= IDLE;
                end
            end

        endcase
    end
end

endmodule