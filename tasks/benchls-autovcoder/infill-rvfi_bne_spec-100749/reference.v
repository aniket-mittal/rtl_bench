module autovcoder_100749 (
    input                rvfi_valid,
    input [32   - 1 : 0] rvfi_insn,
    input [32   - 1 : 0] rvfi_pc_rdata,
    input [32   - 1 : 0] rvfi_rs1_rdata,
    input [32   - 1 : 0] rvfi_rs2_rdata,
    input [32   - 1 : 0] rvfi_mem_rdata,

    output                spec_valid,
    output                spec_trap,
    output [       4 : 0] spec_rs1_addr,
    output [       4 : 0] spec_rs2_addr,
    output [       4 : 0] spec_rd_addr,
    output [32   - 1 : 0] spec_rd_wdata,
    output [32   - 1 : 0] spec_pc_wdata,
    output [32   - 1 : 0] spec_mem_addr,
    output [32/8 - 1 : 0] spec_mem_rmask,
    output [32/8 - 1 : 0] spec_mem_wmask,
    output [32   - 1 : 0] spec_mem_wdata
);

  // SB-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(
      {rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0}
  );
  wire [4:0] insn_rs2 = rvfi_insn[24:20];
  wire [4:0] insn_rs1 = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[6:0];

  wire misa_ok = 1;
  wire ialign16 = 1;

  // BNE instruction
  wire cond = rvfi_rs1_rdata != rvfi_rs2_rdata;
  wire [32-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 4;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 001 && insn_opcode == 7'b 1100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

