// Hidden tests: 5000 cycles of seeded random inputs (seed 4106838428); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 69;
  reg clk;
  reg [2:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_08380 dut (
    .clk(clk),
    .slave_address(i_0),
    .slave_read(i_1),
    .slave_write(i_2),
    .slave_writedata(i_3),
    .reset(i_4),
    .i2c_hs_readdata(i_5),
    .slave_readdata(out_dut[68:37]),
    .i2c_hs_read(out_dut[36:36]),
    .i2c_hs_write(out_dut[35:35]),
    .i2c_hs_addr(out_dut[34:32]),
    .i2c_hs_writedata(out_dut[31:0])
  );
  mg_08380__ref ref_i (
    .clk(clk),
    .slave_address(i_0),
    .slave_read(i_1),
    .slave_write(i_2),
    .slave_writedata(i_3),
    .reset(i_4),
    .i2c_hs_readdata(i_5),
    .slave_readdata(out_ref[68:37]),
    .i2c_hs_read(out_ref[36:36]),
    .i2c_hs_write(out_ref[35:35]),
    .i2c_hs_addr(out_ref[34:32]),
    .i2c_hs_writedata(out_ref[31:0])
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
    seed = 4106838428;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
