// Hidden tests: 5000 cycles of seeded random inputs (seed 606311671); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 72;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [63:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [63:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [63:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [63:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_070141 dut (
    .clk(clk),
    .rstn(i_0),
    .tx_val(i_1),
    .tx_req_0(i_2),
    .tx_din_0(i_3),
    .tx_sop_0(i_4),
    .tx_eop_0(i_5),
    .tx_dwen_0(i_6),
    .tx_req_1(i_7),
    .tx_din_1(i_8),
    .tx_sop_1(i_9),
    .tx_eop_1(i_10),
    .tx_dwen_1(i_11),
    .tx_req_2(i_12),
    .tx_din_2(i_13),
    .tx_sop_2(i_14),
    .tx_eop_2(i_15),
    .tx_dwen_2(i_16),
    .tx_req_3(i_17),
    .tx_din_3(i_18),
    .tx_sop_3(i_19),
    .tx_eop_3(i_20),
    .tx_dwen_3(i_21),
    .tx_rdy(i_22),
    .tx_rdy_0(out_dut[71:71]),
    .tx_rdy_1(out_dut[70:70]),
    .tx_rdy_2(out_dut[69:69]),
    .tx_rdy_3(out_dut[68:68]),
    .tx_req(out_dut[67:67]),
    .tx_dout(out_dut[66:3]),
    .tx_sop(out_dut[2:2]),
    .tx_eop(out_dut[1:1]),
    .tx_dwen(out_dut[0:0])
  );
  autovcoder_070141__ref ref_i (
    .clk(clk),
    .rstn(i_0),
    .tx_val(i_1),
    .tx_req_0(i_2),
    .tx_din_0(i_3),
    .tx_sop_0(i_4),
    .tx_eop_0(i_5),
    .tx_dwen_0(i_6),
    .tx_req_1(i_7),
    .tx_din_1(i_8),
    .tx_sop_1(i_9),
    .tx_eop_1(i_10),
    .tx_dwen_1(i_11),
    .tx_req_2(i_12),
    .tx_din_2(i_13),
    .tx_sop_2(i_14),
    .tx_eop_2(i_15),
    .tx_dwen_2(i_16),
    .tx_req_3(i_17),
    .tx_din_3(i_18),
    .tx_sop_3(i_19),
    .tx_eop_3(i_20),
    .tx_dwen_3(i_21),
    .tx_rdy(i_22),
    .tx_rdy_0(out_ref[71:71]),
    .tx_rdy_1(out_ref[70:70]),
    .tx_rdy_2(out_ref[69:69]),
    .tx_rdy_3(out_ref[68:68]),
    .tx_req(out_ref[67:67]),
    .tx_dout(out_ref[66:3]),
    .tx_sop(out_ref[2:2]),
    .tx_eop(out_ref[1:1]),
    .tx_dwen(out_ref[0:0])
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
    seed = 606311671;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed), $random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed), $random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
