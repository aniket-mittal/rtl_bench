module origen_118320 #(
    parameter N = 128
) (
    input wire clk,
    input wire rst,
    input wire is_branch_ex,
    input wire cmp_out_ex,
    input wire loc_predict_taken_if,
    input wire glob_predict_taken_if,
    input wire loc_predict_taken_ex,
    input wire glob_predict_taken_ex,
    input wire [31:0] pc_if,
    input wire [31:0] pc_ex,
    output wire valid_branch,
    output wire predict_taken
);

    localparam INDEX_BITS = $clog2(N);
    localparam TAG_BITS = 32 - INDEX_BITS;

    reg [1:0] pred_table [N-1:0];
    reg [TAG_BITS-1:0] tag_table [N-1:0];
    reg [N-1:0] valid;

    wire [INDEX_BITS-1:0] index_if = pc_if[INDEX_BITS-1:0];
    wire [INDEX_BITS-1:0] index_ex = pc_ex[INDEX_BITS-1:0];
    wire [TAG_BITS-1:0] tag_if = pc_if[31:INDEX_BITS];
    wire [TAG_BITS-1:0] tag_ex = pc_ex[31:INDEX_BITS];

    wire tag_match = (tag_table[index_if] == tag_if);
    assign valid_branch = valid[index_if] & tag_match;
    assign predict_taken = pred_table[index_if][1] ? glob_predict_taken_if : loc_predict_taken_if;

    [MASKED]

endmodule