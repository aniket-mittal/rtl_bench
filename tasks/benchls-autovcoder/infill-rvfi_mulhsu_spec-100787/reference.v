module autovcoder_100787 (
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

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2 = rvfi_insn[24:20];
  wire [4:0] insn_rs1 = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd = rvfi_insn[11:7];
  wire [6:0] insn_opcode = rvfi_insn[6:0];

  wire misa_ok = 1;

  // MULHSU instruction
  wire [32-1:0] result = ({{32{rvfi_rs1_rdata[32-1]}}, rvfi_rs1_rdata} *
		{32'b0, rvfi_rs2_rdata}) >> 32;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000001 && insn_funct3 == 3'b 010 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

