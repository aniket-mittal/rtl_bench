module autovcoder_035326 (
    input clk,
    input rst,

    input id_ex_memread,
    input id_ex_memwrite,
    input id_ex_mem_to_reg,
    input id_ex_pc_src,
    input [4:0] id_ex_rd,
    input id_ex_regwrite,
    input id_ex_ins_valid,

    output reg ex_mem_memread,
    output reg ex_mem_memwrite,
    output reg ex_mem_mem_to_reg,
    output reg ex_mem_pc_src,
    output reg [4:0] ex_mem_rd,
    output reg ex_mem_regwrite,
    output reg ex_mem_ins_valid,


    input [4:0] id_ex_rs1,
    input [4:0] id_ex_rs2,

    output reg [4:0] ex_mem_rs1,
    output reg [4:0] ex_mem_rs2
);

  [MASKED]

endmodule

