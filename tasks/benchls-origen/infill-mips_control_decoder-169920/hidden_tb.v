// Hidden tests: 5000 cycles of seeded random inputs (seed 3927088075); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 23;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [5:0] i_2;
  reg [5:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_169920 dut (
    .clk(clk),
    .rst(i_0),
    .beqout(i_1),
    .op(i_2),
    .funct(i_3),
    .DMWrite(out_dut[22:22]),
    .npc_sel(out_dut[21:20]),
    .RegWrt(out_dut[19:19]),
    .ExtOp(out_dut[18:17]),
    .mux4_5sel(out_dut[16:16]),
    .mux2sel(out_dut[15:15]),
    .mux4_32sel(out_dut[14:13]),
    .ALUctr(out_dut[12:10]),
    .Rtype(out_dut[9:9]),
    .add(out_dut[8:8]),
    .sub(out_dut[7:7]),
    .lw(out_dut[6:6]),
    .sw(out_dut[5:5]),
    .beq(out_dut[4:4]),
    .lui(out_dut[3:3]),
    .addiu(out_dut[2:2]),
    .j(out_dut[1:1]),
    .bgtz(out_dut[0:0])
  );
  origen_169920__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .beqout(i_1),
    .op(i_2),
    .funct(i_3),
    .DMWrite(out_ref[22:22]),
    .npc_sel(out_ref[21:20]),
    .RegWrt(out_ref[19:19]),
    .ExtOp(out_ref[18:17]),
    .mux4_5sel(out_ref[16:16]),
    .mux2sel(out_ref[15:15]),
    .mux4_32sel(out_ref[14:13]),
    .ALUctr(out_ref[12:10]),
    .Rtype(out_ref[9:9]),
    .add(out_ref[8:8]),
    .sub(out_ref[7:7]),
    .lw(out_ref[6:6]),
    .sw(out_ref[5:5]),
    .beq(out_ref[4:4]),
    .lui(out_ref[3:3]),
    .addiu(out_ref[2:2]),
    .j(out_ref[1:1]),
    .bgtz(out_ref[0:0])
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
    seed = 3927088075;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
