module origen_128875 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] data_in,
    input wire in_valid,
    output wire in_ready,
    output wire [9:0] data_out,
    output wire out_valid,
    input wire out_ready
);

    reg [9:0] accumulator;
    reg [1:0] counter;
    reg [7:0] input_reg;
    reg out_valid_reg;
    reg in_ready_reg;

    wire accumulate;
    wire output_data;

    assign accumulate = in_valid && in_ready;
    assign output_data = (counter == 2'b11) && accumulate;
    assign in_ready = in_ready_reg;
    assign out_valid = out_valid_reg;
    assign data_out = accumulator;

    [MASKED]

endmodule