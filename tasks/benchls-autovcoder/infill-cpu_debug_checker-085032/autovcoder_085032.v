module autovcoder_085032 (
    input [31:0] check_addr,

    input [31:0] pc_in,
    pc_out,
    input [31:0] inst,
    input [4:0] rf_ra0,
    rf_ra1,
    input [31:0] rf_rd0,
    rf_rd1,
    input [4:0] rf_wa,
    input [31:0] rf_wd,
    input rf_we,
    input [31:0] imm,
    input [31:0] alu_sr1,
    alu_sr2,
    input [3:0] alu_func,
    input [31:0] alu_ans,
    input [31:0] pc_jalr,
    input [31:0] dm_addr,
    input [31:0] dm_din,
    input [31:0] dm_dout,
    input dm_we,

    output reg [31:0] check_data
);
  [MASKED]
endmodule

