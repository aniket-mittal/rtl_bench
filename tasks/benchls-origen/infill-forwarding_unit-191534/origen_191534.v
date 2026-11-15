module origen_191534(
    input [3:0] rf_waddr_exmem,
    input [3:0] rf_waddr_memwb,
    input [3:0] inst_curr_IDEX_7_4_rs,
    input [3:0] inst_curr_IDEX_3_0_rt,
    input [3:0] inst_curr_IDEX_11_8_rd,
    input rf_wen_exmem,
    input rf_wen_memwb,
    input mem2reg_memwb,
    input mem2reg_exmem,
    input dmem_wen_idex,
    output reg [1:0] forwardA,
    output reg [1:0] forwardB,
    output reg [1:0] rdata2_sw_fcontrol
);

[MASKED]

endmodule