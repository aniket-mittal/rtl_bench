// Hidden tests: 5000 cycles of seeded random inputs (seed 4233900503); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 38;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_158815 dut (
    .AxiAClk(clk),
    .AxiAResetN(i_0),
    .ARaddr(i_1),
    .Rready(i_2),
    .ARvalid(i_3),
    .AWaddr(i_4),
    .Wdata(i_5),
    .AWvalid(i_6),
    .Wvalid(i_7),
    .Rdata(out_dut[37:6]),
    .Rvalid(out_dut[5:5]),
    .ARready(out_dut[4:4]),
    .WriteEN(out_dut[3:3]),
    .AWready(out_dut[2:2]),
    .Wready(out_dut[1:1]),
    .Bvalid(out_dut[0:0])
  );
  origen_158815__ref ref_i (
    .AxiAClk(clk),
    .AxiAResetN(i_0),
    .ARaddr(i_1),
    .Rready(i_2),
    .ARvalid(i_3),
    .AWaddr(i_4),
    .Wdata(i_5),
    .AWvalid(i_6),
    .Wvalid(i_7),
    .Rdata(out_ref[37:6]),
    .Rvalid(out_ref[5:5]),
    .ARready(out_ref[4:4]),
    .WriteEN(out_ref[3:3]),
    .AWready(out_ref[2:2]),
    .Wready(out_ref[1:1]),
    .Bvalid(out_ref[0:0])
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
    seed = 4233900503;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
