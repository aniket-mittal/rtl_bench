// Hidden tests: 5000 cycles of seeded random inputs (seed 4196682155); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 199;
  reg clk;
  reg [19:0] i_0;
  reg [2:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00040 dut (
    .io_mainClk(clk),
    .io_input_PADDR(i_0),
    .io_input_PSEL(i_1),
    .io_input_PENABLE(i_2),
    .io_input_PWRITE(i_3),
    .io_input_PWDATA(i_4),
    .io_outputs_0_PREADY(i_5),
    .io_outputs_0_PRDATA(i_6),
    .io_outputs_0_PSLVERROR(i_7),
    .io_outputs_1_PREADY(i_8),
    .io_outputs_1_PRDATA(i_9),
    .io_outputs_1_PSLVERROR(i_10),
    .io_outputs_2_PREADY(i_11),
    .io_outputs_2_PRDATA(i_12),
    .io_outputs_2_PSLVERROR(i_13),
    .resetCtrl_systemReset(i_14),
    .io_input_PREADY(out_dut[198:198]),
    .io_input_PRDATA(out_dut[197:166]),
    .io_input_PSLVERROR(out_dut[165:165]),
    .io_outputs_0_PADDR(out_dut[164:145]),
    .io_outputs_0_PSEL(out_dut[144:144]),
    .io_outputs_0_PENABLE(out_dut[143:143]),
    .io_outputs_0_PWRITE(out_dut[142:142]),
    .io_outputs_0_PWDATA(out_dut[141:110]),
    .io_outputs_1_PADDR(out_dut[109:90]),
    .io_outputs_1_PSEL(out_dut[89:89]),
    .io_outputs_1_PENABLE(out_dut[88:88]),
    .io_outputs_1_PWRITE(out_dut[87:87]),
    .io_outputs_1_PWDATA(out_dut[86:55]),
    .io_outputs_2_PADDR(out_dut[54:35]),
    .io_outputs_2_PSEL(out_dut[34:34]),
    .io_outputs_2_PENABLE(out_dut[33:33]),
    .io_outputs_2_PWRITE(out_dut[32:32]),
    .io_outputs_2_PWDATA(out_dut[31:0])
  );
  mg_00040__ref ref_i (
    .io_mainClk(clk),
    .io_input_PADDR(i_0),
    .io_input_PSEL(i_1),
    .io_input_PENABLE(i_2),
    .io_input_PWRITE(i_3),
    .io_input_PWDATA(i_4),
    .io_outputs_0_PREADY(i_5),
    .io_outputs_0_PRDATA(i_6),
    .io_outputs_0_PSLVERROR(i_7),
    .io_outputs_1_PREADY(i_8),
    .io_outputs_1_PRDATA(i_9),
    .io_outputs_1_PSLVERROR(i_10),
    .io_outputs_2_PREADY(i_11),
    .io_outputs_2_PRDATA(i_12),
    .io_outputs_2_PSLVERROR(i_13),
    .resetCtrl_systemReset(i_14),
    .io_input_PREADY(out_ref[198:198]),
    .io_input_PRDATA(out_ref[197:166]),
    .io_input_PSLVERROR(out_ref[165:165]),
    .io_outputs_0_PADDR(out_ref[164:145]),
    .io_outputs_0_PSEL(out_ref[144:144]),
    .io_outputs_0_PENABLE(out_ref[143:143]),
    .io_outputs_0_PWRITE(out_ref[142:142]),
    .io_outputs_0_PWDATA(out_ref[141:110]),
    .io_outputs_1_PADDR(out_ref[109:90]),
    .io_outputs_1_PSEL(out_ref[89:89]),
    .io_outputs_1_PENABLE(out_ref[88:88]),
    .io_outputs_1_PWRITE(out_ref[87:87]),
    .io_outputs_1_PWDATA(out_ref[86:55]),
    .io_outputs_2_PADDR(out_ref[54:35]),
    .io_outputs_2_PSEL(out_ref[34:34]),
    .io_outputs_2_PENABLE(out_ref[33:33]),
    .io_outputs_2_PWRITE(out_ref[32:32]),
    .io_outputs_2_PWDATA(out_ref[31:0])
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
    seed = 4196682155;
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
      i_14 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
