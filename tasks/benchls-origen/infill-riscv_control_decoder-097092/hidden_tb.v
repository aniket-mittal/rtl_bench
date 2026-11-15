// Hidden tests: 5000 cycles of seeded random inputs (seed 3873369583); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [6:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [2:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_097092 dut (
    .opcode(i_0),
    .reset(i_1),
    .invert(i_2),
    .funct(i_3),
    .im_sel(out_dut[16:15]),
    .jump(out_dut[14:14]),
    .branch(out_dut[13:13]),
    .Alusrc1(out_dut[12:12]),
    .Alusrc2(out_dut[11:11]),
    .regWrite(out_dut[10:10]),
    .MemRead(out_dut[9:9]),
    .MemWrite(out_dut[8:8]),
    .jal(out_dut[7:7]),
    .csr(out_dut[6:6]),
    .wr_sel(out_dut[5:4]),
    .ALUop(out_dut[3:1]),
    .fence(out_dut[0:0])
  );
  origen_097092__ref ref_i (
    .opcode(i_0),
    .reset(i_1),
    .invert(i_2),
    .funct(i_3),
    .im_sel(out_ref[16:15]),
    .jump(out_ref[14:14]),
    .branch(out_ref[13:13]),
    .Alusrc1(out_ref[12:12]),
    .Alusrc2(out_ref[11:11]),
    .regWrite(out_ref[10:10]),
    .MemRead(out_ref[9:9]),
    .MemWrite(out_ref[8:8]),
    .jal(out_ref[7:7]),
    .csr(out_ref[6:6]),
    .wr_sel(out_ref[5:4]),
    .ALUop(out_ref[3:1]),
    .fence(out_ref[0:0])
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
    seed = 3873369583;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
