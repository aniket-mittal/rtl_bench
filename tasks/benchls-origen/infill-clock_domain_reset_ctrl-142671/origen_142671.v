module origen_142671 (
    input wire clk,
    input wire resetn,
    input wire ctrl_pause,
    input wire ctrl_enable,
    input wire req_enable,
    output reg req_enabled,
    input wire dest_clk,
    input wire dest_ext_resetn,
    input wire dest_enable,
    output reg dest_enabled,
    input wire src_clk,
    input wire src_ext_resetn,
    input wire src_enable,
    output reg src_enabled,
    output reg req_resetn,
    output reg dest_resetn,
    output reg src_resetn
);

    reg [3:0] req_counter;
    reg [3:0] dest_counter;
    reg [3:0] src_counter;
    
    reg req_reset_active;
    reg dest_reset_active;
    reg src_reset_active;

    [MASKED]

endmodule