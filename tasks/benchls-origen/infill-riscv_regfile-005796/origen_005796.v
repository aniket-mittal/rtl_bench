module origen_005796 (
    input wire clk,
    input wire reset,
    input wire [4:0] reg1,
    input wire [4:0] reg2,
    input wire [4:0] write_reg,
    input wire [31:0] write_data,
    input wire write,
    input wire load,
    input wire store,
    input wire [2:0] funct3,
    output reg [31:0] read1,
    output reg [31:0] read2
);

    reg [31:0] registers [31:0];
    integer i;

    [MASKED]

endmodule