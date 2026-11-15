// Hidden tests: 5000 cycles of seeded random inputs (seed 2695710427); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 138;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [4:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [63:0] i_5;
  reg [31:0] i_6;
  reg [1:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_156844 dut (
    .aluout(i_0),
    .Memdata(i_1),
    .WritetoRFaddrin(i_2),
    .MemtoRegW(i_3),
    .RegWriteW(i_4),
    .HILO_data(i_5),
    .PCin(i_6),
    .MemReadTypeW(i_7),
    .EPCD(i_8),
    .HI_LO_writeenablein(i_9),
    .exception_in(i_10),
    .MemWriteW(i_11),
    .is_ds_in(i_12),
    .WriteinRF_HI_LO_data(out_dut[137:74]),
    .WritetoRFaddrout(out_dut[73:69]),
    .HI_LO_writeenableout(out_dut[68:68]),
    .WritetoRFdata(out_dut[67:36]),
    .RegWrite(out_dut[35:35]),
    .PCout(out_dut[34:3]),
    .exception_out(out_dut[2:2]),
    .MemWrite(out_dut[1:1]),
    .is_ds_out(out_dut[0:0])
  );
  origen_156844__ref ref_i (
    .aluout(i_0),
    .Memdata(i_1),
    .WritetoRFaddrin(i_2),
    .MemtoRegW(i_3),
    .RegWriteW(i_4),
    .HILO_data(i_5),
    .PCin(i_6),
    .MemReadTypeW(i_7),
    .EPCD(i_8),
    .HI_LO_writeenablein(i_9),
    .exception_in(i_10),
    .MemWriteW(i_11),
    .is_ds_in(i_12),
    .WriteinRF_HI_LO_data(out_ref[137:74]),
    .WritetoRFaddrout(out_ref[73:69]),
    .HI_LO_writeenableout(out_ref[68:68]),
    .WritetoRFdata(out_ref[67:36]),
    .RegWrite(out_ref[35:35]),
    .PCout(out_ref[34:3]),
    .exception_out(out_ref[2:2]),
    .MemWrite(out_ref[1:1]),
    .is_ds_out(out_ref[0:0])
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
    seed = 2695710427;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed), $random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
