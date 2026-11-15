module origen_058508 (
    input wire clock,
    input wire reset,
    input wire c_pad,
    input wire d_pad,
    input wire e_pad,
    input wire f_pad,
    input wire g_pad,
    output reg reset_sync,
    output reg c_pad_sync,
    output reg d_pad_sync,
    output reg e_pad_sync,
    output reg f_pad_sync,
    output reg g_pad_sync,
    output wire pad_touched
);

    reg reset_meta;
    reg c_pad_meta, d_pad_meta, e_pad_meta, f_pad_meta, g_pad_meta;

    [MASKED]

    assign pad_touched = c_pad_sync | d_pad_sync | e_pad_sync | f_pad_sync | g_pad_sync;

endmodule