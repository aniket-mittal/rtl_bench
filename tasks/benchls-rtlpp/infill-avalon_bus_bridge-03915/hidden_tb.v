// Hidden tests: 5000 cycles of seeded random inputs (seed 4009341119); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 110;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [17:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [15:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03915 dut (
    .clk(clk),
    .downstream_readdata(i_0),
    .downstream_readdatavalid(i_1),
    .downstream_waitrequest(i_2),
    .reset_n(i_3),
    .upstream_address(i_4),
    .upstream_byteenable(i_5),
    .upstream_debugaccess(i_6),
    .upstream_nativeaddress(i_7),
    .upstream_read(i_8),
    .upstream_write(i_9),
    .upstream_writedata(i_10),
    .reg_downstream_address(out_dut[109:94]),
    .reg_downstream_arbitrationshare(out_dut[93:90]),
    .reg_downstream_burstcount(out_dut[89:89]),
    .reg_downstream_byteenable(out_dut[88:85]),
    .reg_downstream_debugaccess(out_dut[84:84]),
    .reg_downstream_nativeaddress(out_dut[83:68]),
    .reg_downstream_read(out_dut[67:67]),
    .reg_downstream_write(out_dut[66:66]),
    .reg_downstream_writedata(out_dut[65:34]),
    .upstream_readdata(out_dut[33:2]),
    .upstream_readdatavalid(out_dut[1:1]),
    .upstream_waitrequest(out_dut[0:0])
  );
  rtlpp_03915__ref ref_i (
    .clk(clk),
    .downstream_readdata(i_0),
    .downstream_readdatavalid(i_1),
    .downstream_waitrequest(i_2),
    .reset_n(i_3),
    .upstream_address(i_4),
    .upstream_byteenable(i_5),
    .upstream_debugaccess(i_6),
    .upstream_nativeaddress(i_7),
    .upstream_read(i_8),
    .upstream_write(i_9),
    .upstream_writedata(i_10),
    .reg_downstream_address(out_ref[109:94]),
    .reg_downstream_arbitrationshare(out_ref[93:90]),
    .reg_downstream_burstcount(out_ref[89:89]),
    .reg_downstream_byteenable(out_ref[88:85]),
    .reg_downstream_debugaccess(out_ref[84:84]),
    .reg_downstream_nativeaddress(out_ref[83:68]),
    .reg_downstream_read(out_ref[67:67]),
    .reg_downstream_write(out_ref[66:66]),
    .reg_downstream_writedata(out_ref[65:34]),
    .upstream_readdata(out_ref[33:2]),
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
    seed = 4009341119;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
