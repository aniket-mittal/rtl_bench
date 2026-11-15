// SIPO Module
module origen_115039 (
    input wire clk,
    input wire reset,
    input wire data_in,
    output reg [3:0] data_out
);

always @(posedge clk) begin
    if (reset)
        data_out <= 4'b0000;
    else
        data_out <= {data_in, data_out[3:1]};
end

endmodule

// Testbench Module
