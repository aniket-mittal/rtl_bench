// Hidden tests: 5000 cycles of seeded random inputs (seed 3802369989); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 77;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [3:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01126 dut (
    .i_clk(clk),
    .i_a_cyc(i_0),
    .i_a_stb(i_1),
    .i_a_we(i_2),
    .i_a_adr(i_3),
    .i_a_dat(i_4),
    .i_a_sel(i_5),
    .i_b_cyc(i_6),
    .i_b_stb(i_7),
    .i_b_we(i_8),
    .i_b_adr(i_9),
    .i_b_dat(i_10),
    .i_b_sel(i_11),
    .i_ack(i_12),
    .i_stall(i_13),
    .i_err(i_14),
    .o_a_ack(out_dut[76:76]),
    .o_a_stall(out_dut[75:75]),
    .o_a_err(out_dut[74:74]),
    .o_b_ack(out_dut[73:73]),
    .o_b_stall(out_dut[72:72]),
    .o_b_err(out_dut[71:71]),
    .o_cyc(out_dut[70:70]),
    .o_stb(out_dut[69:69]),
    .o_we(out_dut[68:68]),
    .o_adr(out_dut[67:36]),
    .o_dat(out_dut[35:4]),
    .o_sel(out_dut[3:0])
  );
  mg_01126__ref ref_i (
    .i_clk(clk),
    .i_a_cyc(i_0),
    .i_a_stb(i_1),
    .i_a_we(i_2),
    .i_a_adr(i_3),
    .i_a_dat(i_4),
    .i_a_sel(i_5),
    .i_b_cyc(i_6),
    .i_b_stb(i_7),
    .i_b_we(i_8),
    .i_b_adr(i_9),
    .i_b_dat(i_10),
    .i_b_sel(i_11),
    .i_ack(i_12),
    .i_stall(i_13),
    .i_err(i_14),
    .o_a_ack(out_ref[76:76]),
    .o_a_stall(out_ref[75:75]),
    .o_a_err(out_ref[74:74]),
    .o_b_ack(out_ref[73:73]),
    .o_b_stall(out_ref[72:72]),
    .o_b_err(out_ref[71:71]),
    .o_cyc(out_ref[70:70]),
    .o_stb(out_ref[69:69]),
    .o_we(out_ref[68:68]),
    .o_adr(out_ref[67:36]),
    .o_dat(out_ref[35:4]),
    .o_sel(out_ref[3:0])
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
    seed = 3802369989;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
