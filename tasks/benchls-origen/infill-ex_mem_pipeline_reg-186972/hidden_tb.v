// Hidden tests: 5000 cycles of seeded random inputs (seed 2218317649); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [4:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_186972 dut (
    .clk(clk),
    .rst_n(i_0),
    .idexregwrite(i_1),
    .idexmemtoreg(i_2),
    .idexbranch(i_3),
    .idexmemwrite(i_4),
    .addout(i_5),
    .aluresult(i_6),
    .idrd(i_7),
    .zero(i_8),
    .exr2_dout(i_9),
    .flush(i_10),
    .exmemregwrite(out_dut[72:72]),
    .exmemmemtoreg(out_dut[71:71]),
    .exmembranch(out_dut[70:70]),
    .exmemmemwrite(out_dut[69:69]),
    .memaddr(out_dut[68:37]),
    .memdata(out_dut[36:5]),
    .memrd(out_dut[4:0])
  );
  origen_186972__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .idexregwrite(i_1),
    .idexmemtoreg(i_2),
    .idexbranch(i_3),
    .idexmemwrite(i_4),
    .addout(i_5),
    .aluresult(i_6),
    .idrd(i_7),
    .zero(i_8),
    .exr2_dout(i_9),
    .flush(i_10),
    .exmemregwrite(out_ref[72:72]),
    .exmemmemtoreg(out_ref[71:71]),
    .exmembranch(out_ref[70:70]),
    .exmemmemwrite(out_ref[69:69]),
    .memaddr(out_ref[68:37]),
    .memdata(out_ref[36:5]),
    .memrd(out_ref[4:0])
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
    seed = 2218317649;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
