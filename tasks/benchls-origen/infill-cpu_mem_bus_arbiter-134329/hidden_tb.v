// Hidden tests: 5000 cycles of seeded random inputs (seed 3362914797); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 139;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [8:0] i_6;
  reg [3:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_134329 dut (
    .clk(clk),
    .reset_n(i_0),
    .d_readdata(i_1),
    .d_waitrequest(i_2),
    .i_readdata(i_3),
    .i_waitrequest(i_4),
    .irq(i_5),
    .debug_mem_slave_address(i_6),
    .debug_mem_slave_byteenable(i_7),
    .debug_mem_slave_debugaccess(i_8),
    .debug_mem_slave_read(i_9),
    .debug_mem_slave_write(i_10),
    .debug_mem_slave_writedata(i_11),
    .d_address(out_dut[138:107]),
    .d_byteenable(out_dut[106:103]),
    .d_read(out_dut[102:102]),
    .d_write(out_dut[101:101]),
    .d_writedata(out_dut[100:69]),
    .debug_mem_slave_readdata(out_dut[68:37]),
    .debug_mem_slave_waitrequest(out_dut[36:36]),
    .i_address(out_dut[35:4]),
    .i_read(out_dut[3:3]),
    .debug_mem_slave_debugaccess_to_roms(out_dut[2:2]),
    .debug_reset_request(out_dut[1:1]),
    .dummy_ci_port(out_dut[0:0])
  );
  origen_134329__ref ref_i (
    .clk(clk),
    .reset_n(i_0),
    .d_readdata(i_1),
    .d_waitrequest(i_2),
    .i_readdata(i_3),
    .i_waitrequest(i_4),
    .irq(i_5),
    .debug_mem_slave_address(i_6),
    .debug_mem_slave_byteenable(i_7),
    .debug_mem_slave_debugaccess(i_8),
    .debug_mem_slave_read(i_9),
    .debug_mem_slave_write(i_10),
    .debug_mem_slave_writedata(i_11),
    .d_address(out_ref[138:107]),
    .d_byteenable(out_ref[106:103]),
    .d_read(out_ref[102:102]),
    .d_write(out_ref[101:101]),
    .d_writedata(out_ref[100:69]),
    .debug_mem_slave_readdata(out_ref[68:37]),
    .debug_mem_slave_waitrequest(out_ref[36:36]),
    .i_address(out_ref[35:4]),
    .i_read(out_ref[3:3]),
    .debug_mem_slave_debugaccess_to_roms(out_ref[2:2]),
    .debug_reset_request(out_ref[1:1]),
    .dummy_ci_port(out_ref[0:0])
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
    seed = 3362914797;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
