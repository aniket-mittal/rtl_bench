module origen_128909 (
    input wire rst,
    input wire clk,
    input wire cpu_stall,
    input wire ex_c_rfw,
    input wire [1:0] ex_c_wbsource,
    input wire [1:0] ex_c_drw,
    input wire [31:0] ex_alu_r,
    input wire [31:0] ex_rfb,
    input wire [4:0] ex_rf_waddr,
    input wire [31:0] ex_jalra,
    input wire [4:0] ex_rt,
    input wire [31:0] wb_wdata,
    input wire [31:0] dmem_in,

    output reg p_c_rfw,
    output reg [1:0] p_c_wbsource,
    output reg [31:0] p_alu_r,
    output reg [31:0] dmem_data,
    output reg [4:0] p_rf_waddr,
    output reg [31:0] p_jalra,
    output reg [31:0] dmem_addr,
    output reg [1:0] dmem_drw,
    output reg [31:0] p_dout
);

    [MASKED]

endmodule