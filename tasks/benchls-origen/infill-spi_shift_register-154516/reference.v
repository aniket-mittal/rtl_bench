module origen_154516 (
    input clk,
    input rst,
    input spi_start,
    input spi_clk_in,
    input [31:0] data_in,
    output reg [31:0] spi_data
);

    reg [5:0] bit_ctr;
    reg [31:0] data;
    reg latch_data;
    reg load_data;

    localparam START = 1'b0;
    localparam DATA = 1'b1;
    reg state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= START;
            bit_ctr <= 6'b0;
            spi_data <= 32'b0;
        end else begin
            case (state)
                START: begin
                    if (spi_start) begin
                        state <= DATA;
                        data <= data_in;
                        bit_ctr <= 6'b0;
                    end
                end
                DATA: begin
                    if (bit_ctr == 6'd32) begin
                        state <= START;
                        bit_ctr <= 6'b0;
                    end else begin
                        spi_data <= data[31];
                        data <= {data[30:0], 1'b0};
                        bit_ctr <= bit_ctr + 6'b1;
                    end
                end
            endcase
        end
    end

    always @(posedge spi_clk_in) begin
        latch_data <= 1'b1;
    end

    always @(negedge spi_clk_in) begin
        latch_data <= 1'b0;
        load_data <= 1'b1;
    end

endmodule