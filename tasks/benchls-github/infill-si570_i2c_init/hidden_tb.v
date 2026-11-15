// Hidden tests: 5000 cycles of seeded random inputs (seed 3205400799); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 24;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  si570_i2c_init dut (
    .clk(clk),
    .rst(i_0),
    .cmd_ready(i_1),
    .data_out_ready(i_2),
    .start(i_3),
    .cmd_address(out_dut[23:17]),
    .cmd_start(out_dut[16:16]),
    .cmd_read(out_dut[15:15]),
    .cmd_write(out_dut[14:14]),
    .cmd_write_multiple(out_dut[13:13]),
    .cmd_stop(out_dut[12:12]),
    .cmd_valid(out_dut[11:11]),
    .data_out(out_dut[10:3]),
    .data_out_valid(out_dut[2:2]),
    .data_out_last(out_dut[1:1]),
    .busy(out_dut[0:0])
  );
  si570_i2c_init__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .cmd_ready(i_1),
    .data_out_ready(i_2),
    .start(i_3),
    .cmd_address(out_ref[23:17]),
    .cmd_start(out_ref[16:16]),
    .cmd_read(out_ref[15:15]),
    .cmd_write(out_ref[14:14]),
    .cmd_write_multiple(out_ref[13:13]),
    .cmd_stop(out_ref[12:12]),
    .cmd_valid(out_ref[11:11]),
    .data_out(out_ref[10:3]),
    .data_out_valid(out_ref[2:2]),
    .data_out_last(out_ref[1:1]),
    .busy(out_ref[0:0])
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
    seed = 3205400799;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
