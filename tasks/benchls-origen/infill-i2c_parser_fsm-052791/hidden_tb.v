// Hidden tests: 5000 cycles of seeded random inputs (seed 2868277174); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 12;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [3:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_052791 dut (
    .CLK(clk),
    .RST(i_0),
    .I2C_START(i_1),
    .MT(i_2),
    .N_BYTES(i_3),
    .READ(i_4),
    .READY(i_5),
    .CLR_START(out_dut[11:11]),
    .EXECUTE(out_dut[10:10]),
    .LD_ADDR(out_dut[9:9]),
    .LD_DEV(out_dut[8:8]),
    .LD_N_BYTE(out_dut[7:7]),
    .NVIO_ENA(out_dut[6:6]),
    .READ_FF(out_dut[5:5]),
    .WRT_ENA(out_dut[4:4]),
    .I2C_PARSER_STATE(out_dut[3:0])
  );
  origen_052791__ref ref_i (
    .CLK(clk),
    .RST(i_0),
    .I2C_START(i_1),
    .MT(i_2),
    .N_BYTES(i_3),
    .READ(i_4),
    .READY(i_5),
    .CLR_START(out_ref[11:11]),
    .EXECUTE(out_ref[10:10]),
    .LD_ADDR(out_ref[9:9]),
    .LD_DEV(out_ref[8:8]),
    .LD_N_BYTE(out_ref[7:7]),
    .NVIO_ENA(out_ref[6:6]),
    .READ_FF(out_ref[5:5]),
    .WRT_ENA(out_ref[4:4]),
    .I2C_PARSER_STATE(out_ref[3:0])
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
    seed = 2868277174;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
