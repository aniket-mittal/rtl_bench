// Hidden tests: 5000 cycles of seeded random inputs (seed 318150687); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 35;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [2:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [2:0] i_15;
  reg [2:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [3:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03531 dut (
    .CLK(clk),
    .One_A_IN(i_0),
    .One_B_IN(i_1),
    .Two_A_IN(i_2),
    .Two_B_IN(i_3),
    .MW_One_IN(i_4),
    .MW_Two_IN(i_5),
    .input_IN(i_6),
    .wren_IN(i_7),
    .writeAd_IN(i_8),
    .ADR_MUX_IN(i_9),
    .write_IN(i_10),
    .PC_load_IN(i_11),
    .SPR_w_IN(i_12),
    .SPR_i_IN(i_13),
    .SPR_d_IN(i_14),
    .cond_IN(i_15),
    .op2_IN(i_16),
    .SW_IN(i_17),
    .MAD_MUX_IN(i_18),
    .FLAG_WRITE_IN(i_19),
    .AR_IN(i_20),
    .BR_IN(i_21),
    .ALU_IN(i_22),
    .SPC_MUX_IN(i_23),
    .MX_MUX_IN(i_24),
    .AB_MUX_IN(i_25),
    .One_A_OUT(out_dut[34:34]),
    .One_B_OUT(out_dut[33:33]),
    .Two_A_OUT(out_dut[32:32]),
    .Two_B_OUT(out_dut[31:31]),
    .MW_One_OUT(out_dut[30:30]),
    .MW_Two_OUT(out_dut[29:29]),
    .input_OUT(out_dut[28:28]),
    .wren_OUT(out_dut[27:27]),
    .writeAd_OUT(out_dut[26:24]),
    .ADR_MUX_OUT(out_dut[23:23]),
    .write_OUT(out_dut[22:22]),
    .PC_load_OUT(out_dut[21:21]),
    .SPR_w_OUT(out_dut[20:20]),
    .SPR_i_OUT(out_dut[19:19]),
    .SPR_d_OUT(out_dut[18:18]),
    .cond_OUT(out_dut[17:15]),
    .op2_OUT(out_dut[14:12]),
    .SW_OUT(out_dut[11:11]),
    .MAD_MUX_OUT(out_dut[10:10]),
    .FLAG_WRITE_OUT(out_dut[9:9]),
    .AR_OUT(out_dut[8:8]),
    .BR_OUT(out_dut[7:7]),
    .ALU_OUT(out_dut[6:3]),
    .SPC_MUX_OUT(out_dut[2:2]),
    .MX_MUX_OUT(out_dut[1:1]),
    .AB_MUX_OUT(out_dut[0:0])
  );
  mg_03531__ref ref_i (
    .CLK(clk),
    .One_A_IN(i_0),
    .One_B_IN(i_1),
    .Two_A_IN(i_2),
    .Two_B_IN(i_3),
    .MW_One_IN(i_4),
    .MW_Two_IN(i_5),
    .input_IN(i_6),
    .wren_IN(i_7),
    .writeAd_IN(i_8),
    .ADR_MUX_IN(i_9),
    .write_IN(i_10),
    .PC_load_IN(i_11),
    .SPR_w_IN(i_12),
    .SPR_i_IN(i_13),
    .SPR_d_IN(i_14),
    .cond_IN(i_15),
    .op2_IN(i_16),
    .SW_IN(i_17),
    .MAD_MUX_IN(i_18),
    .FLAG_WRITE_IN(i_19),
    .AR_IN(i_20),
    .BR_IN(i_21),
    .ALU_IN(i_22),
    .SPC_MUX_IN(i_23),
    .MX_MUX_IN(i_24),
    .AB_MUX_IN(i_25),
    .One_A_OUT(out_ref[34:34]),
    .One_B_OUT(out_ref[33:33]),
    .Two_A_OUT(out_ref[32:32]),
    .Two_B_OUT(out_ref[31:31]),
    .MW_One_OUT(out_ref[30:30]),
    .MW_Two_OUT(out_ref[29:29]),
    .input_OUT(out_ref[28:28]),
    .wren_OUT(out_ref[27:27]),
    .writeAd_OUT(out_ref[26:24]),
    .ADR_MUX_OUT(out_ref[23:23]),
    .write_OUT(out_ref[22:22]),
    .PC_load_OUT(out_ref[21:21]),
    .SPR_w_OUT(out_ref[20:20]),
    .SPR_i_OUT(out_ref[19:19]),
    .SPR_d_OUT(out_ref[18:18]),
    .cond_OUT(out_ref[17:15]),
    .op2_OUT(out_ref[14:12]),
    .SW_OUT(out_ref[11:11]),
    .MAD_MUX_OUT(out_ref[10:10]),
    .FLAG_WRITE_OUT(out_ref[9:9]),
    .AR_OUT(out_ref[8:8]),
    .BR_OUT(out_ref[7:7]),
    .ALU_OUT(out_ref[6:3]),
    .SPC_MUX_OUT(out_ref[2:2]),
    .MX_MUX_OUT(out_ref[1:1]),
    .AB_MUX_OUT(out_ref[0:0])
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
    seed = 318150687;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
