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

    [MASKED]

    always @(posedge spi_clk_in) begin
        latch_data <= 1'b1;
    end

    always @(negedge spi_clk_in) begin
        latch_data <= 1'b0;
        load_data <= 1'b1;
    end

endmodule