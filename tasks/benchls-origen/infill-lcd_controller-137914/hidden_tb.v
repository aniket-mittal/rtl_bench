// Hidden tests: 5000 cycles of seeded random inputs (seed 931597194); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 21;
  reg clk;
  reg [0:0] i_0;
  reg [2047:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [7:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_137914 dut (
    .CCLK(clk),
    .debpbo(i_0),
    .strdata(i_1),
    .reset_in(i_2),
    .clear_in(i_3),
    .home_in(i_4),
    .write_in(i_5),
    .address_in(i_6),
    .resetlcd(out_dut[20:20]),
    .clearlcd(out_dut[19:19]),
    .homelcd(out_dut[18:18]),
    .datalcd(out_dut[17:17]),
    .addrlcd(out_dut[16:9]),
    .initlcd(out_dut[8:8]),
    .lcddatin(out_dut[7:0])
  );
  origen_137914__ref ref_i (
    .CCLK(clk),
    .debpbo(i_0),
    .strdata(i_1),
    .reset_in(i_2),
    .clear_in(i_3),
    .home_in(i_4),
    .write_in(i_5),
    .address_in(i_6),
    .resetlcd(out_ref[20:20]),
    .clearlcd(out_ref[19:19]),
    .homelcd(out_ref[18:18]),
    .datalcd(out_ref[17:17]),
    .addrlcd(out_ref[16:9]),
    .initlcd(out_ref[8:8]),
    .lcddatin(out_ref[7:0])
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
    seed = 931597194;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
