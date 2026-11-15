module origen_129389 (
    input wire clk_i,
    input wire rst_i,
    input wire [31:0] alu_i,
    input wire control_load_i,
    input wire control_store_i,
    input wire control_take_branch_i,
    input wire do_wb_i,
    input wire [4:0] wb_reg_i,
    
    output reg stall_o,
    output reg do_wb_o,
    output reg [4:0] wb_reg_o,
    output reg [31:0] wb_val_o
);

    // Internal registers
    reg [31:0] mem_data;

    [MASKED]

endmodule