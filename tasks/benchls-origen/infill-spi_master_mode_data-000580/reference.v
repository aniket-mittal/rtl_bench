module origen_000580 (
    input wire spi_clk,
    input wire spi_cs,
    input wire reset,
    output reg spi_mosi,
    input wire spi_miso,
    input wire [7:0] spi_data,
    input wire [7:0] spi_mode,
    output reg [7:0] read_data,
    input wire sig_R0W1
);

    reg [2:0] counter1, counter2;
    reg mode_done, data_done;

    always @(posedge spi_clk or posedge reset) begin
        if (reset) begin
            counter1 <= 3'b000;
            counter2 <= 3'b000;
            spi_mosi <= 1'b0;
            mode_done <= 1'b0;
            data_done <= 1'b0;
        end else if (!spi_cs) begin
            if (!mode_done) begin
                spi_mosi <= spi_mode[7-counter1];
                counter1 <= counter1 + 1;
                if (counter1 == 3'b111) begin
                    mode_done <= 1'b1;
                end
            end else if (!data_done && sig_R0W1) begin
                spi_mosi <= spi_data[7-counter2];
                counter2 <= counter2 + 1;
                if (counter2 == 3'b111) begin
                    data_done <= 1'b1;
                end
            end
        end else begin
            counter1 <= 3'b000;
            counter2 <= 3'b000;
            spi_mosi <= 1'b0;
            mode_done <= 1'b0;
            data_done <= 1'b0;
        end
    end

    always @(negedge spi_clk or posedge reset) begin
        if (reset) begin
            read_data <= 8'b0;
        end else if (!spi_cs && mode_done && !sig_R0W1) begin
            read_data[7-counter2] <= spi_miso;
        end
    end

endmodule