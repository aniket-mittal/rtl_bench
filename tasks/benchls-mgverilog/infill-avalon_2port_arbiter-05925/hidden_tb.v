// Hidden tests: 5000 cycles of seeded random inputs (seed 3482999262); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 130;
  reg clk;
  reg [0:0] i_0;
  reg [17:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [35:0] i_4;
  reg [17:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [35:0] i_8;
  reg [35:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_05925 dut (
    .clk(clk),
    .reset(i_0),
    .s0_address(i_1),
    .s0_write(i_2),
    .s0_read(i_3),
    .s0_writedata(i_4),
    .s1_address(i_5),
    .s1_write(i_6),
    .s1_read(i_7),
    .s1_writedata(i_8),
    .m_readdata(i_9),
    .m_waitrequest(i_10),
    .s0_readdata(out_dut[129:94]),
    .s0_waitrequest(out_dut[93:93]),
    .s1_readdata(out_dut[92:57]),
    .s1_waitrequest(out_dut[56:56]),
    .m_address(out_dut[55:38]),
    .m_write(out_dut[37:37]),
    .m_read(out_dut[36:36]),
    .m_writedata(out_dut[35:0])
  );
  mg_05925__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .s0_address(i_1),
    .s0_write(i_2),
    .s0_read(i_3),
    .s0_writedata(i_4),
    .s1_address(i_5),
    .s1_write(i_6),
    .s1_read(i_7),
    .s1_writedata(i_8),
    .m_readdata(i_9),
    .m_waitrequest(i_10),
    .s0_readdata(out_ref[129:94]),
    .s0_waitrequest(out_ref[93:93]),
    .s1_readdata(out_ref[92:57]),
    .s1_waitrequest(out_ref[56:56]),
    .m_address(out_ref[55:38]),
    .m_write(out_ref[37:37]),
    .m_read(out_ref[36:36]),
    .m_writedata(out_ref[35:0])
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
    seed = 3482999262;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed), $random(seed)};
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
