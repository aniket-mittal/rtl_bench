// Hidden tests: 5000 cycles of seeded random inputs (seed 1980943055); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 98;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [1:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03950 dut (
    .clk(clk),
    .dbusWire1(i_0),
    .DselectWire2(i_1),
    .bbusWire2(i_2),
    .lwSwFlag2(i_3),
    .dbusWire2(out_dut[97:66]),
    .DselectWire3(out_dut[65:34]),
    .bbusWire3(out_dut[33:2]),
    .lwSwFlag3(out_dut[1:0])
  );
  mg_03950__ref ref_i (
    .clk(clk),
    .dbusWire1(i_0),
    .DselectWire2(i_1),
    .bbusWire2(i_2),
    .lwSwFlag2(i_3),
    .dbusWire2(out_ref[97:66]),
    .DselectWire3(out_ref[65:34]),
    .bbusWire3(out_ref[33:2]),
    .lwSwFlag3(out_ref[1:0])
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
    seed = 1980943055;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
