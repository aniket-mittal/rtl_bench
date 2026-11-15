// Hidden tests: 5000 cycles of seeded random inputs (seed 4290100819); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 162;
  reg clk;
  reg [5:0] i_0;
  reg [5:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [16:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_148357 dut (
    .clk(clk),
    .mwaddr(i_0),
    .mraddr(i_1),
    .win_ready(i_2),
    .win_valid(i_3),
    .mrdata_s(i_4),
    .mrd(out_dut[161:161]),
    .mrvalid(out_dut[160:160]),
    .mrdata(out_dut[159:143]),
    .mdata_0(out_dut[142:126]),
    .mdata_1(out_dut[125:109]),
    .mdata_2(out_dut[108:92]),
    .mdata_3(out_dut[91:75]),
    .mvalid_0(out_dut[74:74]),
    .mvalid_1(out_dut[73:73]),
    .mvalid_2(out_dut[72:72]),
    .mvalid_3(out_dut[71:71]),
    .win_last(out_dut[70:70]),
    .win_data(out_dut[69:2]),
    .adc_ready(out_dut[1:1]),
    .win_valid_out(out_dut[0:0])
  );
  origen_148357__ref ref_i (
    .clk(clk),
    .mwaddr(i_0),
    .mraddr(i_1),
    .win_ready(i_2),
    .win_valid(i_3),
    .mrdata_s(i_4),
    .mrd(out_ref[161:161]),
    .mrvalid(out_ref[160:160]),
    .mrdata(out_ref[159:143]),
    .mdata_0(out_ref[142:126]),
    .mdata_1(out_ref[125:109]),
    .mdata_2(out_ref[108:92]),
    .mdata_3(out_ref[91:75]),
    .mvalid_0(out_ref[74:74]),
    .mvalid_1(out_ref[73:73]),
    .mvalid_2(out_ref[72:72]),
    .mvalid_3(out_ref[71:71]),
    .win_last(out_ref[70:70]),
    .win_data(out_ref[69:2]),
    .adc_ready(out_ref[1:1]),
    .win_valid_out(out_ref[0:0])
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
    seed = 4290100819;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
