module origen_114728 (
    input wire north_hit_i,
    input wire east_hit_i,
    input wire west_hit_i,
    input wire south_hit_i,
    input wire local_hit_i,
    input wire [4:0] last_dir_i,
    input wire [4:0] is_body_i,
    output reg [4:0] dir_o,
    output reg [4:0] filter_o,
    output reg arb_o
);

    wire [4:0] hit;
    assign hit = {north_hit_i, east_hit_i, west_hit_i, south_hit_i, local_hit_i};

    [MASKED]

endmodule