// Hidden tests: 5000 cycles of seeded random inputs (seed 3439395767); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 205;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_04644 dut (
    .wb_clk(clk),
    .wb_rst(i_0),
    .equation_enable(i_1),
    .dsp_input0_reg(i_2),
    .dsp_input1_reg(i_3),
    .dsp_input2_reg(i_4),
    .dsp_input3_reg(i_5),
    .dsp_input4_reg(i_6),
    .file_read_data(i_7),
    .file_active(i_8),
    .rd_ptr(i_9),
    .wr_ptr(i_10),
    .interrupt(out_dut[204:204]),
    .error(out_dut[203:203]),
    .file_num(out_dut[202:195]),
    .file_write(out_dut[194:194]),
    .file_read(out_dut[193:193]),
    .file_write_data(out_dut[192:161]),
    .equation_done(out_dut[160:160]),
    .dsp_output0_reg(out_dut[159:128]),
    .dsp_output1_reg(out_dut[127:96]),
    .dsp_output2_reg(out_dut[95:64]),
    .dsp_output3_reg(out_dut[63:32]),
    .dsp_output4_reg(out_dut[31:0])
  );
  rtlpp_04644__ref ref_i (
    .wb_clk(clk),
    .wb_rst(i_0),
    .equation_enable(i_1),
    .dsp_input0_reg(i_2),
    .dsp_input1_reg(i_3),
    .dsp_input2_reg(i_4),
    .dsp_input3_reg(i_5),
    .dsp_input4_reg(i_6),
    .file_read_data(i_7),
    .file_active(i_8),
    .rd_ptr(i_9),
    .wr_ptr(i_10),
    .interrupt(out_ref[204:204]),
    .error(out_ref[203:203]),
    .file_num(out_ref[202:195]),
    .file_write(out_ref[194:194]),
    .file_read(out_ref[193:193]),
    .file_write_data(out_ref[192:161]),
    .equation_done(out_ref[160:160]),
    .dsp_output0_reg(out_ref[159:128]),
    .dsp_output1_reg(out_ref[127:96]),
    .dsp_output2_reg(out_ref[95:64]),
    .dsp_output3_reg(out_ref[63:32]),
    .dsp_output4_reg(out_ref[31:0])
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
    seed = 3439395767;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
