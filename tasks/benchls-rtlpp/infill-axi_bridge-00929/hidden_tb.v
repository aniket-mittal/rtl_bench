// Hidden tests: 5000 cycles of seeded random inputs (seed 3918329914); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 163;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [2:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [15:0] i_8;
  reg [2:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [1:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [31:0] i_17;
  reg [1:0] i_18;
  reg [0:0] i_19;
  reg [11:0] i_20;
  reg [0:0] i_21;
  reg [31:0] i_22;
  reg [3:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [11:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00929 dut (
    .aclk(clk),
    .aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awprot(i_2),
    .s_axi_awvalid(i_3),
    .s_axi_wdata(i_4),
    .s_axi_wstrb(i_5),
    .s_axi_wvalid(i_6),
    .s_axi_bready(i_7),
    .s_axi_araddr(i_8),
    .s_axi_arprot(i_9),
    .s_axi_arvalid(i_10),
    .s_axi_rready(i_11),
    .m_axi_awready(i_12),
    .m_axi_wready(i_13),
    .m_axi_bresp(i_14),
    .m_axi_bvalid(i_15),
    .m_axi_arready(i_16),
    .m_axi_rdata(i_17),
    .m_axi_rresp(i_18),
    .m_axi_rvalid(i_19),
    .s_axi_ctl_awaddr(i_20),
    .s_axi_ctl_awvalid(i_21),
    .s_axi_ctl_wdata(i_22),
    .s_axi_ctl_wstrb(i_23),
    .s_axi_ctl_wvalid(i_24),
    .s_axi_ctl_bready(i_25),
    .s_axi_ctl_araddr(i_26),
    .s_axi_ctl_arvalid(i_27),
    .s_axi_ctl_rready(i_28),
    .s_axi_awready(out_dut[162:162]),
    .s_axi_wready(out_dut[161:161]),
    .s_axi_bresp(out_dut[160:159]),
    .s_axi_bvalid(out_dut[158:158]),
    .s_axi_arready(out_dut[157:157]),
    .s_axi_rdata(out_dut[156:125]),
    .s_axi_rresp(out_dut[124:123]),
    .s_axi_rvalid(out_dut[122:122]),
    .m_axi_awaddr(out_dut[121:106]),
    .m_axi_awprot(out_dut[105:103]),
    .m_axi_awvalid(out_dut[102:102]),
    .m_axi_wdata(out_dut[101:70]),
    .m_axi_wstrb(out_dut[69:66]),
    .m_axi_wvalid(out_dut[65:65]),
    .m_axi_bready(out_dut[64:64]),
    .m_axi_araddr(out_dut[63:48]),
    .m_axi_arprot(out_dut[47:45]),
    .m_axi_arvalid(out_dut[44:44]),
    .m_axi_rready(out_dut[43:43]),
    .s_axi_ctl_awready(out_dut[42:42]),
    .s_axi_ctl_wready(out_dut[41:41]),
    .s_axi_ctl_bresp(out_dut[40:39]),
    .s_axi_ctl_bvalid(out_dut[38:38]),
    .s_axi_ctl_arready(out_dut[37:37]),
    .s_axi_ctl_rdata(out_dut[36:5]),
    .s_axi_ctl_rresp(out_dut[4:3]),
    .s_axi_ctl_rvalid(out_dut[2:2]),
    .mi_w_error(out_dut[1:1]),
    .mi_r_error(out_dut[0:0])
  );
  rtlpp_00929__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awprot(i_2),
    .s_axi_awvalid(i_3),
    .s_axi_wdata(i_4),
    .s_axi_wstrb(i_5),
    .s_axi_wvalid(i_6),
    .s_axi_bready(i_7),
    .s_axi_araddr(i_8),
    .s_axi_arprot(i_9),
    .s_axi_arvalid(i_10),
    .s_axi_rready(i_11),
    .m_axi_awready(i_12),
    .m_axi_wready(i_13),
    .m_axi_bresp(i_14),
    .m_axi_bvalid(i_15),
    .m_axi_arready(i_16),
    .m_axi_rdata(i_17),
    .m_axi_rresp(i_18),
    .m_axi_rvalid(i_19),
    .s_axi_ctl_awaddr(i_20),
    .s_axi_ctl_awvalid(i_21),
    .s_axi_ctl_wdata(i_22),
    .s_axi_ctl_wstrb(i_23),
    .s_axi_ctl_wvalid(i_24),
    .s_axi_ctl_bready(i_25),
    .s_axi_ctl_araddr(i_26),
    .s_axi_ctl_arvalid(i_27),
    .s_axi_ctl_rready(i_28),
    .s_axi_awready(out_ref[162:162]),
    .s_axi_wready(out_ref[161:161]),
    .s_axi_bresp(out_ref[160:159]),
    .s_axi_bvalid(out_ref[158:158]),
    .s_axi_arready(out_ref[157:157]),
    .s_axi_rdata(out_ref[156:125]),
    .s_axi_rresp(out_ref[124:123]),
    .s_axi_rvalid(out_ref[122:122]),
    .m_axi_awaddr(out_ref[121:106]),
    .m_axi_awprot(out_ref[105:103]),
    .m_axi_awvalid(out_ref[102:102]),
    .m_axi_wdata(out_ref[101:70]),
    .m_axi_wstrb(out_ref[69:66]),
    .m_axi_wvalid(out_ref[65:65]),
    .m_axi_bready(out_ref[64:64]),
    .m_axi_araddr(out_ref[63:48]),
    .m_axi_arprot(out_ref[47:45]),
    .m_axi_arvalid(out_ref[44:44]),
    .m_axi_rready(out_ref[43:43]),
    .s_axi_ctl_awready(out_ref[42:42]),
    .s_axi_ctl_wready(out_ref[41:41]),
    .s_axi_ctl_bresp(out_ref[40:39]),
    .s_axi_ctl_bvalid(out_ref[38:38]),
    .s_axi_ctl_arready(out_ref[37:37]),
    .s_axi_ctl_rdata(out_ref[36:5]),
    .s_axi_ctl_rresp(out_ref[4:3]),
    .s_axi_ctl_rvalid(out_ref[2:2]),
    .mi_w_error(out_ref[1:1]),
    .mi_r_error(out_ref[0:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 3918329914;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
