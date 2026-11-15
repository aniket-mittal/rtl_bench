// Hidden tests: 5000 cycles of seeded random inputs (seed 561981447); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 154;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [9:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [9:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02220 dut (
    .rcfg_clk(clk),
    .rcfg_reset_n(i_0),
    .rcfg_in_read_0(i_1),
    .rcfg_in_write_0(i_2),
    .rcfg_in_address_0(i_3),
    .rcfg_in_writedata_0(i_4),
    .rcfg_in_read_1(i_5),
    .rcfg_in_write_1(i_6),
    .rcfg_in_address_1(i_7),
    .rcfg_in_writedata_1(i_8),
    .rcfg_out_readdata_0(i_9),
    .rcfg_out_waitrequest_0(i_10),
    .rcfg_out_readdata_1(i_11),
    .rcfg_out_waitrequest_1(i_12),
    .rcfg_in_readdata_0(out_dut[153:122]),
    .rcfg_in_waitrequest_0(out_dut[121:121]),
    .rcfg_in_readdata_1(out_dut[120:89]),
    .rcfg_in_waitrequest_1(out_dut[88:88]),
    .rcfg_out_read_0(out_dut[87:87]),
    .rcfg_out_write_0(out_dut[86:86]),
    .rcfg_out_address_0(out_dut[85:76]),
    .rcfg_out_writedata_0(out_dut[75:44]),
    .rcfg_out_read_1(out_dut[43:43]),
    .rcfg_out_write_1(out_dut[42:42]),
    .rcfg_out_address_1(out_dut[41:32]),
    .rcfg_out_writedata_1(out_dut[31:0])
  );
  rtlpp_02220__ref ref_i (
    .rcfg_clk(clk),
    .rcfg_reset_n(i_0),
    .rcfg_in_read_0(i_1),
    .rcfg_in_write_0(i_2),
    .rcfg_in_address_0(i_3),
    .rcfg_in_writedata_0(i_4),
    .rcfg_in_read_1(i_5),
    .rcfg_in_write_1(i_6),
    .rcfg_in_address_1(i_7),
    .rcfg_in_writedata_1(i_8),
    .rcfg_out_readdata_0(i_9),
    .rcfg_out_waitrequest_0(i_10),
    .rcfg_out_readdata_1(i_11),
    .rcfg_out_waitrequest_1(i_12),
    .rcfg_in_readdata_0(out_ref[153:122]),
    .rcfg_in_waitrequest_0(out_ref[121:121]),
    .rcfg_in_readdata_1(out_ref[120:89]),
    .rcfg_in_waitrequest_1(out_ref[88:88]),
    .rcfg_out_read_0(out_ref[87:87]),
    .rcfg_out_write_0(out_ref[86:86]),
    .rcfg_out_address_0(out_ref[85:76]),
    .rcfg_out_writedata_0(out_ref[75:44]),
    .rcfg_out_read_1(out_ref[43:43]),
    .rcfg_out_write_1(out_ref[42:42]),
    .rcfg_out_address_1(out_ref[41:32]),
    .rcfg_out_writedata_1(out_ref[31:0])
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
    seed = 561981447;
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
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
