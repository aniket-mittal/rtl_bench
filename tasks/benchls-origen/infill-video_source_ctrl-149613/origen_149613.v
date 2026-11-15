module origen_149613 #(
    parameter WID = 1920,
    parameter HEI = 1080,
    parameter INT = 0
) (
    input wire [2:0] slave_addr,
    input wire slave_write,
    input wire [31:0] slave_writedata,
    input wire slave_read,
    output reg [31:0] slave_readdata,
    output wire [23:0] source_data,
    output wire source_sop,
    output wire source_valid,
    input wire source_ready,
    output wire source_eop,
    input wire clk,
    input wire rst,
    output wire [15:0] width,
    output wire [15:0] height,
    output wire go
);

    reg [15:0] width_reg;
    reg [15:0] height_reg;
    reg interlacing_reg;
    reg [31:0] slave_read_reg;
    reg go_reg;
    reg initial_reg;
    reg control_out_valid;
    reg [5:0] control_out_cnt;

    assign width = width_reg;
    assign height = height_reg;
    assign go = go_reg;
    assign source_data = {8'b0, 8'b0, 8'b0};
    assign source_sop = control_out_valid && control_out_cnt == 0;
    assign source_valid = control_out_valid;
    assign source_eop = control_out_valid && control_out_cnt == (interlacing_reg ? (height_reg / 2) : height_reg) - 1;

    [MASKED]
endmodule