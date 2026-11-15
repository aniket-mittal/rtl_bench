module origen_096471 (
    input wire clk,
    input wire rst,
    
    // Control signals
    input wire mem_to_reg_in,
    input wire mem_write_in,
    input wire mem_read_in,
    input wire reg_write_in,
    input wire reg_dst_in,
    input wire alu_src_in,
    input wire [2:0] alu_op_in,
    input wire Rtype_in,
    input wire lw_in,
    input wire sw_in,
    input wire j_in,
    input wire beq_in,
    input wire bne_in,
    input wire nop_in,
    
    // Data signals
    input wire [31:0] pc_plus4_in,
    input wire [31:0] read_data1_in,
    input wire [31:0] read_data2_in,
    input wire [31:0] address_in,
    
    // Register addresses
    input wire [4:0] rs_in,
    input wire [4:0] rt_in,
    input wire [4:0] rd_in,
    
    // Output signals
    output reg mem_to_reg_out,
    output reg mem_write_out,
    output reg mem_read_out,
    output reg reg_write_out,
    output reg reg_dst_out,
    output reg alu_src_out,
    output reg [2:0] alu_op_out,
    output reg Rtype_out,
    output reg lw_out,
    output reg sw_out,
    output reg j_out,
    output reg beq_out,
    output reg bne_out,
    output reg nop_out,
    output reg [31:0] pc_plus4_out,
    output reg [31:0] read_data1_out,
    output reg [31:0] read_data2_out,
    output reg [31:0] address_out,
    output reg [4:0] rs_out,
    output reg [4:0] rt_out,
    output reg [4:0] rd_out
);

    [MASKED]

endmodule