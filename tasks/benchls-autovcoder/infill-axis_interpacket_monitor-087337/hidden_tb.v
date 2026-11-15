// Hidden tests: 5000 cycles of seeded random inputs (seed 2355265525); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 128;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [63:0] i_2;
  reg [7:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [24:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_087337 dut (
    .clk156(clk),
    .rstn156(i_0),
    .rst_sw156(i_1),
    .s_axis_tdata(i_2),
    .s_axis_tkeep(i_3),
    .s_axis_tvalid(i_4),
    .s_axis_tlast(i_5),
    .s_axis_tuser(i_6),
    .m_axis_tready(i_7),
    .s_axis_tready(out_dut[127:127]),
    .m_axis_tdata(out_dut[126:63]),
    .m_axis_tkeep(out_dut[62:55]),
    .m_axis_tvalid(out_dut[54:54]),
    .m_axis_tlast(out_dut[53:53]),
    .m_axis_tuser(out_dut[52:0])
  );
  autovcoder_087337__ref ref_i (
    .clk156(clk),
    .rstn156(i_0),
    .rst_sw156(i_1),
    .s_axis_tdata(i_2),
    .s_axis_tkeep(i_3),
    .s_axis_tvalid(i_4),
    .s_axis_tlast(i_5),
    .s_axis_tuser(i_6),
    .m_axis_tready(i_7),
    .s_axis_tready(out_ref[127:127]),
    .m_axis_tdata(out_ref[126:63]),
    .m_axis_tkeep(out_ref[62:55]),
    .m_axis_tvalid(out_ref[54:54]),
    .m_axis_tlast(out_ref[53:53]),
    .m_axis_tuser(out_ref[52:0])
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
    seed = 2355265525;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed)};
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
