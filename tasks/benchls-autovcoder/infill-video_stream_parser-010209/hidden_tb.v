// Hidden tests: 5000 cycles of seeded random inputs (seed 1616099567); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 64;
  reg clk;
  reg [0:0] i_0;
  reg [23:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_010209 dut (
    .clk(clk),
    .rst_n(i_0),
    .din_data(i_1),
    .din_valid(i_2),
    .din_startofpacket(i_3),
    .din_endofpacket(i_4),
    .dout_ready(i_5),
    .din_ready(out_dut[63:63]),
    .im_width(out_dut[62:47]),
    .im_height(out_dut[46:31]),
    .im_interlaced(out_dut[30:27]),
    .dout_data(out_dut[26:3]),
    .dout_valid(out_dut[2:2]),
    .dout_startofpacket(out_dut[1:1]),
    .dout_endofpacket(out_dut[0:0])
  );
  autovcoder_010209__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .din_data(i_1),
    .din_valid(i_2),
    .din_startofpacket(i_3),
    .din_endofpacket(i_4),
    .dout_ready(i_5),
    .din_ready(out_ref[63:63]),
    .im_width(out_ref[62:47]),
    .im_height(out_ref[46:31]),
    .im_interlaced(out_ref[30:27]),
    .dout_data(out_ref[26:3]),
    .dout_valid(out_ref[2:2]),
    .dout_startofpacket(out_ref[1:1]),
    .dout_endofpacket(out_ref[0:0])
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
    seed = 1616099567;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
