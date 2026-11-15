module origen_052169 (
    input wire clk,
    input wire [3:0] row_no,
    input wire input_valid,
    output reg [31:0] out,
    output reg output_valid
);

    reg [31:0] r [0:15];
    reg [3:0] open_row;
    reg row_open;
    reg [1:0] cycle_count;

    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            r[i] = i;
        end
        row_open = 0;
        output_valid = 0;
        cycle_count = 0;
    end

    [MASKED]

endmodule