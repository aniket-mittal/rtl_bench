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

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            reset_meta <= 1'b0;
            reset_sync <= 1'b0;
            c_pad_meta <= 1'b0;
            d_pad_meta <= 1'b0;
            e_pad_meta <= 1'b0;
            f_pad_meta <= 1'b0;
            g_pad_meta <= 1'b0;
            c_pad_sync <= 1'b0;
            d_pad_sync <= 1'b0;
            e_pad_sync <= 1'b0;
            f_pad_sync <= 1'b0;
            g_pad_sync <= 1'b0;
        end else begin
            reset_meta <= reset;
            reset_sync <= reset_meta;
            c_pad_meta <= c_pad;
            d_pad_meta <= d_pad;
            e_pad_meta <= e_pad;
            f_pad_meta <= f_pad;
            g_pad_meta <= g_pad;
            c_pad_sync <= c_pad_meta;
            d_pad_sync <= d_pad_meta;
            e_pad_sync <= e_pad_meta;
            f_pad_sync <= f_pad_meta;
            g_pad_sync <= g_pad_meta;
        end
    end

    assign pad_touched = c_pad_sync | d_pad_sync | e_pad_sync | f_pad_sync | g_pad_sync;

endmodule