// Hidden tests: 5000 cycles of seeded random inputs (seed 3343623757); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 60;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [3:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_136844 dut (
    .OPB_Clk(clk),
    .rst(i_0),
    .opb_abus(i_1),
    .opb_be(i_2),
    .opb_dbus(i_3),
    .opb_rnw(i_4),
    .opb_select(i_5),
    .opb_seqaddr(i_6),
    .sl_dbus(out_dut[59:28]),
    .sl_errack(out_dut[27:27]),
    .sl_retry(out_dut[26:26]),
    .sl_toutsup(out_dut[25:25]),
    .sl_xferack(out_dut[24:24]),
    .radio1_sclk(out_dut[23:23]),
    .radio1_dout(out_dut[22:22]),
    .radio1_cs(out_dut[21:21]),
    .radio2_sclk(out_dut[20:20]),
    .radio2_dout(out_dut[19:19]),
    .radio2_cs(out_dut[18:18]),
    .radio3_sclk(out_dut[17:17]),
    .radio3_dout(out_dut[16:16]),
    .radio3_cs(out_dut[15:15]),
    .radio4_sclk(out_dut[14:14]),
    .radio4_dout(out_dut[13:13]),
    .radio4_cs(out_dut[12:12]),
    .dac1_sclk(out_dut[11:11]),
    .dac1_dout(out_dut[10:10]),
    .dac1_cs(out_dut[9:9]),
    .dac2_sclk(out_dut[8:8]),
    .dac2_dout(out_dut[7:7]),
    .dac2_cs(out_dut[6:6]),
    .dac3_sclk(out_dut[5:5]),
    .dac3_dout(out_dut[4:4]),
    .dac3_cs(out_dut[3:3]),
    .dac4_sclk(out_dut[2:2]),
    .dac4_dout(out_dut[1:1]),
    .dac4_cs(out_dut[0:0])
  );
  origen_136844__ref ref_i (
    .OPB_Clk(clk),
    .rst(i_0),
    .opb_abus(i_1),
    .opb_be(i_2),
    .opb_dbus(i_3),
    .opb_rnw(i_4),
    .opb_select(i_5),
    .opb_seqaddr(i_6),
    .sl_dbus(out_ref[59:28]),
    .sl_errack(out_ref[27:27]),
    .sl_retry(out_ref[26:26]),
    .sl_toutsup(out_ref[25:25]),
    .sl_xferack(out_ref[24:24]),
    .radio1_sclk(out_ref[23:23]),
    .radio1_dout(out_ref[22:22]),
    .radio1_cs(out_ref[21:21]),
    .radio2_sclk(out_ref[20:20]),
    .radio2_dout(out_ref[19:19]),
    .radio2_cs(out_ref[18:18]),
    .radio3_sclk(out_ref[17:17]),
    .radio3_dout(out_ref[16:16]),
    .radio3_cs(out_ref[15:15]),
    .radio4_sclk(out_ref[14:14]),
    .radio4_dout(out_ref[13:13]),
    .radio4_cs(out_ref[12:12]),
    .dac1_sclk(out_ref[11:11]),
    .dac1_dout(out_ref[10:10]),
    .dac1_cs(out_ref[9:9]),
    .dac2_sclk(out_ref[8:8]),
    .dac2_dout(out_ref[7:7]),
    .dac2_cs(out_ref[6:6]),
    .dac3_sclk(out_ref[5:5]),
    .dac3_dout(out_ref[4:4]),
    .dac3_cs(out_ref[3:3]),
    .dac4_sclk(out_ref[2:2]),
    .dac4_dout(out_ref[1:1]),
    .dac4_cs(out_ref[0:0])
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
    seed = 3343623757;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
