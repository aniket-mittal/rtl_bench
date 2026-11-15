module origen_052259 #(
    parameter CPU_BIT_WIDTH = 32,
    parameter stack_addr_bits = 4,
    parameter stack_addr_max = (1 << stack_addr_bits) - 1
)(
    input wire [CPU_BIT_WIDTH-1:0] data_in,
    input wire reset,
    input wire clk,
    input wire push,
    input wire pop,
    output reg [CPU_BIT_WIDTH-1:0] data_out,
    output reg [stack_addr_bits:0] sp,
    output reg full
);

    reg [CPU_BIT_WIDTH-1:0] mem [0:stack_addr_max];
    integer i;

    [MASKED]

endmodule