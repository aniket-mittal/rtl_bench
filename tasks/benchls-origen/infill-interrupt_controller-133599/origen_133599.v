module origen_133599 #(
    parameter n = 8
)(
    input wire clk,
    input wire rst,
    input wire [n-1:0] int_signals,
    input wire [n-1:0] int_enables,
    input wire [n-1:0][2:0] pri,
    input wire ack,
    output reg intout
);

    reg [2:0] highest_pri;
    reg [n-1:0] active_ints;
    reg [n-1:0] serviced_ints;
    integer i;

    [MASKED]

endmodule