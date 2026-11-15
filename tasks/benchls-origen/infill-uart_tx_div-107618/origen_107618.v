module origen_107618 #(
    parameter DIVISOR = 694
) (
    input wire clk_in,
    input wire rst_in,
    input wire trigger_in,
    input wire [7:0] val_in,
    output reg done,
    output wire data_out
);

    reg [9:0] shift_buffer;
    reg [31:0] count;
    reg [3:0] sent;
    reg transmitting;

    assign data_out = ~shift_buffer[0];

    [MASKED]

endmodule