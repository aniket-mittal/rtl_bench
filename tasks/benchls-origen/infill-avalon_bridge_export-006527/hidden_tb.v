// Hidden tests: 5000 cycles of seeded random inputs (seed 961024219); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 110;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [3:0] i_4;
  reg [0:0] i_5;
  reg [3:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_006527 dut (
    .clk(clk),
    .reset(i_0),
    .address(i_1),
    .read(i_2),
    .write(i_3),
    .burstcount(i_4),
    .burstbegin(i_5),
    .byteenable(i_6),
    .writedata(i_7),
    .irq(i_8),
    .export_readdata(i_9),
    .export_waitrequest(i_10),
    .export_readdatavalid(i_11),
    .readdata(out_dut[109:78]),
    .waitrequest(out_dut[77:77]),
    .readdatavalid(out_dut[76:76]),
    .export_address(out_dut[75:44]),
    .export_read(out_dut[43:43]),
    .export_write(out_dut[42:42]),
    .export_burstcount(out_dut[41:38]),
    .export_burstbegin(out_dut[37:37]),
    .export_byteenable(out_dut[36:33]),
    .export_writedata(out_dut[32:1]),
    .export_irq(out_dut[0:0])
  );
  origen_006527__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .address(i_1),
    .read(i_2),
    .write(i_3),
    .burstcount(i_4),
    .burstbegin(i_5),
    .byteenable(i_6),
    .writedata(i_7),
    .irq(i_8),
    .export_readdata(i_9),
    .export_waitrequest(i_10),
    .export_readdatavalid(i_11),
    .readdata(out_ref[109:78]),
    .waitrequest(out_ref[77:77]),
    .readdatavalid(out_ref[76:76]),
    .export_address(out_ref[75:44]),
    .export_read(out_ref[43:43]),
    .export_write(out_ref[42:42]),
    .export_burstcount(out_ref[41:38]),
    .export_burstbegin(out_ref[37:37]),
    .export_byteenable(out_ref[36:33]),
    .export_writedata(out_ref[32:1]),
    .export_irq(out_ref[0:0])
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
    seed = 961024219;
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
