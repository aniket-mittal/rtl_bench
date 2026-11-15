// Hidden tests: 5000 cycles of seeded random inputs (seed 3953691634); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 70;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [5:0] i_2;
  reg [63:0] i_3;
  reg [1:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_052303 dut (
    .aclk(clk),
    .aresetn(i_0),
    .arready(i_1),
    .rid(i_2),
    .rdata(i_3),
    .rresp(i_4),
    .rlast(i_5),
    .ruser(i_6),
    .rvalid(i_7),
    .arid(out_dut[69:64]),
    .araddr(out_dut[63:32]),
    .arlen(out_dut[31:24]),
    .arsize(out_dut[23:21]),
    .arburst(out_dut[20:19]),
    .arlock(out_dut[18:18]),
    .arcache(out_dut[17:14]),
    .arprot(out_dut[13:11]),
    .arqos(out_dut[10:7]),
    .arregion(out_dut[6:3]),
    .aruser(out_dut[2:2]),
    .arvalid(out_dut[1:1]),
    .rready(out_dut[0:0])
  );
  origen_052303__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .arready(i_1),
    .rid(i_2),
    .rdata(i_3),
    .rresp(i_4),
    .rlast(i_5),
    .ruser(i_6),
    .rvalid(i_7),
    .arid(out_ref[69:64]),
    .araddr(out_ref[63:32]),
    .arlen(out_ref[31:24]),
    .arsize(out_ref[23:21]),
    .arburst(out_ref[20:19]),
    .arlock(out_ref[18:18]),
    .arcache(out_ref[17:14]),
    .arprot(out_ref[13:11]),
    .arqos(out_ref[10:7]),
    .arregion(out_ref[6:3]),
    .aruser(out_ref[2:2]),
    .arvalid(out_ref[1:1]),
    .rready(out_ref[0:0])
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
    seed = 3953691634;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
