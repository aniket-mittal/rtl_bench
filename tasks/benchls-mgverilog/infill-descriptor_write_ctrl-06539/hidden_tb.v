// Hidden tests: 5000 cycles of seeded random inputs (seed 3624099304); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 71;
  reg clk;
  reg [6:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [23:0] i_6;
  reg [0:0] i_7;
  reg [23:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06539 dut (
    .clk(clk),
    .controlbitsfifo_q(i_0),
    .desc_address_fifo_empty(i_1),
    .desc_address_fifo_q(i_2),
    .descriptor_write_waitrequest(i_3),
    .park(i_4),
    .reset_n(i_5),
    .status_token_fifo_data(i_6),
    .status_token_fifo_empty(i_7),
    .status_token_fifo_q(i_8),
    .atlantic_error(out_dut[70:70]),
    .controlbitsfifo_rdreq(out_dut[69:69]),
    .desc_address_fifo_rdreq(out_dut[68:68]),
    .descriptor_write_address(out_dut[67:36]),
    .descriptor_write_busy(out_dut[35:35]),
    .descriptor_write_write(out_dut[34:34]),
    .descriptor_write_writedata(out_dut[33:2]),
    .status_token_fifo_rdreq(out_dut[1:1]),
    .t_eop(out_dut[0:0])
  );
  mg_06539__ref ref_i (
    .clk(clk),
    .controlbitsfifo_q(i_0),
    .desc_address_fifo_empty(i_1),
    .desc_address_fifo_q(i_2),
    .descriptor_write_waitrequest(i_3),
    .park(i_4),
    .reset_n(i_5),
    .status_token_fifo_data(i_6),
    .status_token_fifo_empty(i_7),
    .status_token_fifo_q(i_8),
    .atlantic_error(out_ref[70:70]),
    .controlbitsfifo_rdreq(out_ref[69:69]),
    .desc_address_fifo_rdreq(out_ref[68:68]),
    .descriptor_write_address(out_ref[67:36]),
    .descriptor_write_busy(out_ref[35:35]),
    .descriptor_write_write(out_ref[34:34]),
    .descriptor_write_writedata(out_ref[33:2]),
    .status_token_fifo_rdreq(out_ref[1:1]),
    .t_eop(out_ref[0:0])
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
    seed = 3624099304;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
