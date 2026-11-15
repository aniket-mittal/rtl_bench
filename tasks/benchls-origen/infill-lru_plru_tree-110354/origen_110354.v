module origen_110354 #(
    parameter NUM_WAYS = 4
) (
    input [NUM_WAYS-1:0] hit_way,
    input [2:0] lru_curstate,
    output reg [2:0] lru_updstate,
    output reg [NUM_WAYS-1:0] rep_dec
);

    reg [3:0] lru_hitway;
    reg [1:0] lru_repdec;

    [MASKED]

endmodule