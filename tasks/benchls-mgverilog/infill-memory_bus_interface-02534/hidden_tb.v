// Hidden tests: 5000 cycles of seeded random inputs (seed 4253518950); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 57;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [7:0] i_2;
  reg [17:0] i_3;
  reg [15:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [15:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02534 dut (
    .clk(clk),
    .c1(i_0),
    .c3(i_1),
    .bank(i_2),
    .address_in(i_3),
    .data_in(i_4),
    .rd(i_5),
    .hwr(i_6),
    .lwr(i_7),
    .ramdata_in(i_8),
    .data_out(out_dut[56:41]),
    ._bhe(out_dut[40:40]),
    ._ble(out_dut[39:39]),
    ._we(out_dut[38:38]),
    ._oe(out_dut[37:37]),
    .address(out_dut[36:16]),
    .data(out_dut[15:0])
  );
  mg_02534__ref ref_i (
    .clk(clk),
    .c1(i_0),
    .c3(i_1),
    .bank(i_2),
    .address_in(i_3),
    .data_in(i_4),
    .rd(i_5),
    .hwr(i_6),
    .lwr(i_7),
    .ramdata_in(i_8),
    .data_out(out_ref[56:41]),
    ._bhe(out_ref[40:40]),
    ._ble(out_ref[39:39]),
    ._we(out_ref[38:38]),
    ._oe(out_ref[37:37]),
    .address(out_ref[36:16]),
    .data(out_ref[15:0])
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
    seed = 4253518950;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
