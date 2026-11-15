// Hidden tests: 5000 cycles of seeded random inputs (seed 2076936240); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 112;
  reg clk;
  reg [3:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02931 dut (
    .clk(clk),
    .vjtag_byteenable(i_0),
    .vjtag_writedata(i_1),
    .vjtag_address(i_2),
    .sdram_readdatavalid(i_3),
    .sdram_waitrequest(i_4),
    .sdram_readdata(i_5),
    .vjtag_write(i_6),
    .vjtag_read(i_7),
    .rst(i_8),
    .leds(out_dut[111:104]),
    .vjtag_readdata(out_dut[103:72]),
    .vjtag_waitrequest(out_dut[71:71]),
    .vjtag_readdatavalid(out_dut[70:70]),
    .sdram_address(out_dut[69:38]),
    .sdram_read(out_dut[37:37]),
    .sdram_write(out_dut[36:36]),
    .sdram_writedata(out_dut[35:4]),
    .sdram_byteenable(out_dut[3:0])
  );
  mg_02931__ref ref_i (
    .clk(clk),
    .vjtag_byteenable(i_0),
    .vjtag_writedata(i_1),
    .vjtag_address(i_2),
    .sdram_readdatavalid(i_3),
    .sdram_waitrequest(i_4),
    .sdram_readdata(i_5),
    .vjtag_write(i_6),
    .vjtag_read(i_7),
    .rst(i_8),
    .leds(out_ref[111:104]),
    .vjtag_readdata(out_ref[103:72]),
    .vjtag_waitrequest(out_ref[71:71]),
    .vjtag_readdatavalid(out_ref[70:70]),
    .sdram_address(out_ref[69:38]),
    .sdram_read(out_ref[37:37]),
    .sdram_write(out_ref[36:36]),
    .sdram_writedata(out_ref[35:4]),
    .sdram_byteenable(out_ref[3:0])
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
    seed = 2076936240;
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
      i_8 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
