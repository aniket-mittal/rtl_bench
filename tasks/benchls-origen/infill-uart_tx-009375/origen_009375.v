module origen_009375 (
    input wire clk,
    input wire baud_clk,
    input wire txd_start,
    input wire [7:0] byte_in,
    output reg bit_out,
    output reg done
);

    reg [3:0] state;
    reg [7:0] tx_data;
    reg tx_bit;

    always @(posedge clk) begin
        bit_out <= tx_bit;
    end

    [MASKED]

endmodule