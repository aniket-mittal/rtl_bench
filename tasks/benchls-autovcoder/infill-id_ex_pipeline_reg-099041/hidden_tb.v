// Hidden tests: 5000 cycles of seeded random inputs (seed 4150139637); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 63;
  reg clk;
  reg [15:0] i_0;
  reg [15:0] i_1;
  reg [3:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [7:0] i_6;
  reg [15:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_099041 dut (
    .clk(clk),
    .a_in(i_0),
    .b_in(i_1),
    .destreg_in(i_2),
    .set_regwrite_in(i_3),
    .set_memwrite_in(i_4),
    .set_memread_in(i_5),
    .opcode_in(i_6),
    .imedi_in(i_7),
    .a_out(out_dut[62:47]),
    .b_out(out_dut[46:31]),
    .destreg_out(out_dut[30:27]),
    .set_regwrite_out(out_dut[26:26]),
    .set_memwrite_out(out_dut[25:25]),
    .set_memread_out(out_dut[24:24]),
    .opcode_out(out_dut[23:16]),
    .imedi_out(out_dut[15:0])
  );
  autovcoder_099041__ref ref_i (
    .clk(clk),
    .a_in(i_0),
    .b_in(i_1),
    .destreg_in(i_2),
    .set_regwrite_in(i_3),
    .set_memwrite_in(i_4),
    .set_memread_in(i_5),
    .opcode_in(i_6),
    .imedi_in(i_7),
    .a_out(out_ref[62:47]),
    .b_out(out_ref[46:31]),
    .destreg_out(out_ref[30:27]),
    .set_regwrite_out(out_ref[26:26]),
    .set_memwrite_out(out_ref[25:25]),
    .set_memread_out(out_ref[24:24]),
    .opcode_out(out_ref[23:16]),
    .imedi_out(out_ref[15:0])
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
    seed = 4150139637;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
