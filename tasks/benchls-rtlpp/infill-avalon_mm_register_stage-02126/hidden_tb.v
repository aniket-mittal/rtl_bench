// Hidden tests: 5000 cycles of seeded random inputs (seed 3996563544); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 53;
  reg clk;
  reg [15:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [4:0] i_4;
  reg [3:0] i_5;
  reg [1:0] i_6;
  reg [0:0] i_7;
  reg [3:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [15:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02126 dut (
    .clk(clk),
    .downstream_readdata(i_0),
    .downstream_readdatavalid(i_1),
    .downstream_waitrequest(i_2),
    .reset_n(i_3),
    .upstream_address(i_4),
    .upstream_burstcount(i_5),
    .upstream_byteenable(i_6),
    .upstream_debugaccess(i_7),
    .upstream_nativeaddress(i_8),
    .upstream_read(i_9),
    .upstream_write(i_10),
    .upstream_writedata(i_11),
    .reg_downstream_address(out_dut[52:49]),
    .reg_downstream_arbitrationshare(out_dut[48:44]),
    .reg_downstream_burstcount(out_dut[43:43]),
    .reg_downstream_byteenable(out_dut[42:41]),
    .reg_downstream_debugaccess(out_dut[40:40]),
    .reg_downstream_nativeaddress(out_dut[39:36]),
    .reg_downstream_read(out_dut[35:35]),
    .reg_downstream_write(out_dut[34:34]),
    .reg_downstream_writedata(out_dut[33:18]),
    .upstream_readdata(out_dut[17:2]),
    .upstream_readdatavalid(out_dut[1:1]),
    .upstream_waitrequest(out_dut[0:0])
  );
  rtlpp_02126__ref ref_i (
    .clk(clk),
    .downstream_readdata(i_0),
    .downstream_readdatavalid(i_1),
    .downstream_waitrequest(i_2),
    .reset_n(i_3),
    .upstream_address(i_4),
    .upstream_burstcount(i_5),
    .upstream_byteenable(i_6),
    .upstream_debugaccess(i_7),
    .upstream_nativeaddress(i_8),
    .upstream_read(i_9),
    .upstream_write(i_10),
    .upstream_writedata(i_11),
    .reg_downstream_address(out_ref[52:49]),
    .reg_downstream_arbitrationshare(out_ref[48:44]),
    .reg_downstream_burstcount(out_ref[43:43]),
    .reg_downstream_byteenable(out_ref[42:41]),
    .reg_downstream_debugaccess(out_ref[40:40]),
    .reg_downstream_nativeaddress(out_ref[39:36]),
    .reg_downstream_read(out_ref[35:35]),
    .reg_downstream_write(out_ref[34:34]),
    .reg_downstream_writedata(out_ref[33:18]),
    .upstream_readdata(out_ref[17:2]),
    .upstream_readdatavalid(out_ref[1:1]),
    .upstream_waitrequest(out_ref[0:0])
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
    seed = 3996563544;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
