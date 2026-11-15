// Hidden tests: 5000 cycles of seeded random inputs (seed 19661835); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 19;
  reg clk;
  reg [5:0] i_0;
  reg [5:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_161642 dut (
    .opcode(i_0),
    .funct(i_1),
    .npc_sel(out_dut[18:17]),
    .regwr(out_dut[16:16]),
    .regdst(out_dut[15:15]),
    .extop(out_dut[14:14]),
    .alusrc(out_dut[13:13]),
    .aluctr(out_dut[12:11]),
    .memwr(out_dut[10:10]),
    .memtoreg(out_dut[9:9]),
    .addu(out_dut[8:8]),
    .subu(out_dut[7:7]),
    .ori(out_dut[6:6]),
    .lw(out_dut[5:5]),
    .sw(out_dut[4:4]),
    .beq(out_dut[3:3]),
    .lui(out_dut[2:2]),
    .j(out_dut[1:1]),
    .jal(out_dut[0:0])
  );
  origen_161642__ref ref_i (
    .opcode(i_0),
    .funct(i_1),
    .npc_sel(out_ref[18:17]),
    .regwr(out_ref[16:16]),
    .regdst(out_ref[15:15]),
    .extop(out_ref[14:14]),
    .alusrc(out_ref[13:13]),
    .aluctr(out_ref[12:11]),
    .memwr(out_ref[10:10]),
    .memtoreg(out_ref[9:9]),
    .addu(out_ref[8:8]),
    .subu(out_ref[7:7]),
    .ori(out_ref[6:6]),
    .lw(out_ref[5:5]),
    .sw(out_ref[4:4]),
    .beq(out_ref[3:3]),
    .lui(out_ref[2:2]),
    .j(out_ref[1:1]),
    .jal(out_ref[0:0])
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
    seed = 19661835;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
