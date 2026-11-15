// Hidden tests: 5000 cycles of seeded random inputs (seed 138925305); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [0:0] i_0;
  reg [8:0] i_1;
  reg [1:0] i_2;
  reg [0:0] i_3;
  reg [2:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [4:0] i_9;
  reg [4:0] i_10;
  reg [4:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [4:0] i_14;
  reg [7:0] i_15;
  reg [1:0] i_16;
  reg [0:0] i_17;
  reg [1:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [1:0] i_24;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02409 dut (
    .clk(clk),
    .reset(i_0),
    .vl(i_1),
    .vcsr_quant(i_2),
    .I_clear(i_3),
    .I_id(i_4),
    .proc_addr(i_5),
    .proc_din(i_6),
    .proc_we(i_7),
    .I_start(i_8),
    .I_vs1(i_9),
    .I_vs2(i_10),
    .I_vd(i_11),
    .I_RS1(i_12),
    .I_RS2(i_13),
    .I_uimm5(i_14),
    .I_funct(i_15),
    .I_permute(i_16),
    .I_mask_en(i_17),
    .I_ALUSrc(i_18),
    .I_dmr(i_19),
    .I_dmw(i_20),
    .I_reg_we(i_21),
    .I_mem_reg(i_22),
    .I_Xout(i_23),
    .I_mode_lsu(i_24),
    .ALU_mon(out_dut[72:72]),
    .stall(out_dut[71:71]),
    .DONE(out_dut[70:70]),
    .proc_dout(out_dut[69:38]),
    .XRF_ADDR(out_dut[37:33]),
    .XRF_DATAWR(out_dut[32:1]),
    .XRF_WE(out_dut[0:0])
  );
  rtlpp_02409__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .vl(i_1),
    .vcsr_quant(i_2),
    .I_clear(i_3),
    .I_id(i_4),
    .proc_addr(i_5),
    .proc_din(i_6),
    .proc_we(i_7),
    .I_start(i_8),
    .I_vs1(i_9),
    .I_vs2(i_10),
    .I_vd(i_11),
    .I_RS1(i_12),
    .I_RS2(i_13),
    .I_uimm5(i_14),
    .I_funct(i_15),
    .I_permute(i_16),
    .I_mask_en(i_17),
    .I_ALUSrc(i_18),
    .I_dmr(i_19),
    .I_dmw(i_20),
    .I_reg_we(i_21),
    .I_mem_reg(i_22),
    .I_Xout(i_23),
    .I_mode_lsu(i_24),
    .ALU_mon(out_ref[72:72]),
    .stall(out_ref[71:71]),
    .DONE(out_ref[70:70]),
    .proc_dout(out_ref[69:38]),
    .XRF_ADDR(out_ref[37:33]),
    .XRF_DATAWR(out_ref[32:1]),
    .XRF_WE(out_ref[0:0])
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
    seed = 138925305;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
