module origen_107197 (
    input wire i_clk,
    input wire i_rst,
    input wire i_start,
    input wire [31:0] i_rs1,
    input wire [31:0] i_rs2,
    output reg [31:0] o_res,
    output reg [31:0] o_rem,
    output wire ok
);

    reg active;
    reg [4:0] cycle;
    reg [31:0] result;
    reg [63:0] work;
    wire [32:0] sub = work[63:31] - {1'b0, i_rs2};

    assign ok = ~active;

    [MASKED]

endmodule