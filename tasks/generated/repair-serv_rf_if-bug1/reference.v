module dut #
(
  parameter WITH_CSR = 1,
  parameter W = 1,
  parameter B = W - 1
)
(
  input wire i_cnt_en,
  output wire [4+WITH_CSR:0] o_wreg0,
  output wire [4+WITH_CSR:0] o_wreg1,
  output wire o_wen0,
  output wire o_wen1,
  output wire [B:0] o_wdata0,
  output wire [B:0] o_wdata1,
  output wire [4+WITH_CSR:0] o_rreg0,
  output wire [4+WITH_CSR:0] o_rreg1,
  input wire [B:0] i_rdata0,
  input wire [B:0] i_rdata1,
  input wire i_trap,
  input wire i_mret,
  input wire [B:0] i_mepc,
  input wire i_mtval_pc,
  input wire [B:0] i_bufreg_q,
  input wire [B:0] i_bad_pc,
  output wire [B:0] o_csr_pc,
  input wire i_csr_en,
  input wire [1:0] i_csr_addr,
  input wire [B:0] i_csr,
  output wire [B:0] o_csr,
  input wire i_rd_wen,
  input wire [4:0] i_rd_waddr,
  input wire [B:0] i_ctrl_rd,
  input wire [B:0] i_alu_rd,
  input wire i_rd_alu_en,
  input wire [B:0] i_csr_rd,
  input wire i_rd_csr_en,
  input wire [B:0] i_mem_rd,
  input wire i_rd_mem_en,
  input wire [4:0] i_rs1_raddr,
  output wire [B:0] o_rs1,
  input wire [4:0] i_rs2_raddr,
  output wire [B:0] o_rs2
);

  wire rd_wen;
  assign rd_wen = i_rd_wen & &i_rd_waddr;

  generate if(|WITH_CSR) begin : gen_csr
    wire [B:0] rd;
    assign rd = { W{ i_rd_alu_en } } & i_alu_rd | { W{ i_rd_csr_en } } & i_csr_rd | { W{ i_rd_mem_en } } & i_mem_rd | i_ctrl_rd;
    wire [B:0] mtval;
    assign mtval = (i_mtval_pc)? i_bad_pc : i_bufreg_q;
    assign o_wdata0 = (i_trap)? mtval : rd;
    assign o_wdata1 = (i_trap)? i_mepc : i_csr;
    assign o_wreg0 = (i_trap)? { 6'b100011 } : { 1'b0, i_rd_waddr };
    assign o_wreg1 = (i_trap)? { 6'b100010 } : { 4'b1000, i_csr_addr };
    assign o_wen0 = i_cnt_en & (i_trap | rd_wen);
    assign o_wen1 = i_cnt_en & (i_trap | i_csr_en);
    assign o_rreg0 = { 1'b0, i_rs1_raddr };
    wire sel_rs2;
    assign sel_rs2 = !(i_trap | i_mret | i_csr_en);
    assign o_rreg1 = { ~sel_rs2, i_rs2_raddr[4:2] & { 3{ sel_rs2 } }, { 1'b0, i_trap } | { i_mret, 1'b0 } | { 2{ i_csr_en } } & i_csr_addr | { 2{ sel_rs2 } } & i_rs2_raddr[1:0] };
    assign o_rs1 = i_rdata0;
    assign o_rs2 = i_rdata1;
    assign o_csr = i_rdata1 & { W{ i_csr_en } };
    assign o_csr_pc = i_rdata1;
  end else begin : gen_no_csr
    wire [B:0] rd;
    assign rd = i_ctrl_rd | i_alu_rd & { W{ i_rd_alu_en } } | i_mem_rd & { W{ i_rd_mem_en } };
    assign o_wdata0 = rd;
    assign o_wdata1 = { W{ 1'b0 } };
    assign o_wreg0 = i_rd_waddr;
    assign o_wreg1 = 5'd0;
    assign o_wen0 = i_cnt_en & rd_wen;
    assign o_wen1 = 1'b0;
    assign o_rreg0 = i_rs1_raddr;
    assign o_rreg1 = i_rs2_raddr;
    assign o_rs1 = i_rdata0;
    assign o_rs2 = i_rdata1;
    assign o_csr = { W{ 1'b0 } };
    assign o_csr_pc = { W{ 1'b0 } };
  end
  endgenerate


endmodule
