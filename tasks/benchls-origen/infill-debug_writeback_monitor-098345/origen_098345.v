module origen_098345 (
    input wire clk_i,
    input wire rst_i,
    input wire [31:0] debug_pc_i,
    input wire debug_wena_i,
    input wire [4:0] debug_wd_i,
    input wire [31:0] debug_wdata_i,
    
    output reg [31:0] debug_wb_pc_o,
    output reg [3:0] debug_wb_rf_wen_o,
    output reg [4:0] debug_wb_rf_wnum_o,
    output reg [31:0] debug_wb_rf_wdata_o
);

reg pre_write;
reg [31:0] pre_pc;

[MASKED]

endmodule