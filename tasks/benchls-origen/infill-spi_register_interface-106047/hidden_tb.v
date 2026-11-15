// Hidden tests: 5000 cycles of seeded random inputs (seed 1392809320); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 91;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_106047 dut (
    .clk(clk),
    .rst_n(i_0),
    .cpu_if_address(i_1),
    .cpu_if_write_data(i_2),
    .cpu_if_read(i_3),
    .cpu_if_write(i_4),
    .access_complete(i_5),
    .cpu_if_read_data(out_dut[90:59]),
    .cpu_if_access_complete(out_dut[58:58]),
    .command(out_dut[57:50]),
    .read_not_write(out_dut[49:49]),
    .address(out_dut[48:17]),
    .address_bytes(out_dut[16:15]),
    .address_valid(out_dut[14:14]),
    .dummy_cycles(out_dut[13:11]),
    .dummy_valid(out_dut[10:10]),
    .data_bytes(out_dut[9:2]),
    .data_valid(out_dut[1:1]),
    .access_request(out_dut[0:0])
  );
  origen_106047__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .cpu_if_address(i_1),
    .cpu_if_write_data(i_2),
    .cpu_if_read(i_3),
    .cpu_if_write(i_4),
    .access_complete(i_5),
    .cpu_if_read_data(out_ref[90:59]),
    .cpu_if_access_complete(out_ref[58:58]),
    .command(out_ref[57:50]),
    .read_not_write(out_ref[49:49]),
    .address(out_ref[48:17]),
    .address_bytes(out_ref[16:15]),
    .address_valid(out_ref[14:14]),
    .dummy_cycles(out_ref[13:11]),
    .dummy_valid(out_ref[10:10]),
    .data_bytes(out_ref[9:2]),
    .data_valid(out_ref[1:1]),
    .access_request(out_ref[0:0])
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
    seed = 1392809320;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
