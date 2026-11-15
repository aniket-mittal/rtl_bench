module origen_212282 (
    input clk,
    input rst,
    input [31:0] pass_data,
    input aes_en,
    input [3:0] div_bits,
    output reg [7:0] out_data,
    output reg out_valid
);

    reg [1:0] pass_count;
    reg [7:0] out;
    reg valid;
    reg [127:0] out_mem;
    reg [3:0] clk_count;

    [MASKED]

    always @(*) begin
        out_data = out;
        out_valid = valid;
    end

endmodule