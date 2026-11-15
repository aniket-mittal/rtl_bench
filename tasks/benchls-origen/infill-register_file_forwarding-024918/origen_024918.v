module origen_024918 (
    input wire clk,
    input wire reset,
    input wire [4:0] rs1_sel,
    input wire [4:0] rs2_sel,
    input wire [4:0] rd_sel,
    input wire dest_enable,
    input wire dest_long_enable,
    input wire [63:0] dest,
    output reg [63:0] rs1_data,
    output reg [63:0] rs2_data
);

    reg [63:0] rf [31:0];
    reg [4:0] reset_counter;

    [MASKED]

endmodule