// Hidden tests: 5000 cycles of seeded random inputs (seed 2367161454); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 41;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [2:0] i_2;
  reg [3:0] i_3;
  reg [2:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [3:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_032859 dut (
    .toplevel_io_axiClk(clk),
    .io_axi_arw_valid(i_0),
    .io_axi_arw_payload_addr(i_1),
    .io_axi_arw_payload_size(i_2),
    .io_axi_arw_payload_cache(i_3),
    .io_axi_arw_payload_prot(i_4),
    .io_axi_arw_payload_write(i_5),
    .io_axi_w_valid(i_6),
    .io_axi_w_payload_data(i_7),
    .io_axi_w_payload_strb(i_8),
    .io_axi_w_payload_last(i_9),
    .io_axi_b_ready(i_10),
    .io_axi_r_ready(i_11),
    .toplevel_resetCtrl_axiReset(i_12),
    .io_axi_arw_ready(out_dut[40:40]),
    .io_axi_w_ready(out_dut[39:39]),
    .io_axi_b_valid(out_dut[38:38]),
    .io_axi_b_payload_resp(out_dut[37:36]),
    .io_axi_r_valid(out_dut[35:35]),
    .io_axi_r_payload_data(out_dut[34:3]),
    .io_axi_r_payload_resp(out_dut[2:1]),
    .io_axi_r_payload_last(out_dut[0:0])
  );
  autovcoder_032859__ref ref_i (
    .toplevel_io_axiClk(clk),
    .io_axi_arw_valid(i_0),
    .io_axi_arw_payload_addr(i_1),
    .io_axi_arw_payload_size(i_2),
    .io_axi_arw_payload_cache(i_3),
    .io_axi_arw_payload_prot(i_4),
    .io_axi_arw_payload_write(i_5),
    .io_axi_w_valid(i_6),
    .io_axi_w_payload_data(i_7),
    .io_axi_w_payload_strb(i_8),
    .io_axi_w_payload_last(i_9),
    .io_axi_b_ready(i_10),
    .io_axi_r_ready(i_11),
    .toplevel_resetCtrl_axiReset(i_12),
    .io_axi_arw_ready(out_ref[40:40]),
    .io_axi_w_ready(out_ref[39:39]),
    .io_axi_b_valid(out_ref[38:38]),
    .io_axi_b_payload_resp(out_ref[37:36]),
    .io_axi_r_valid(out_ref[35:35]),
    .io_axi_r_payload_data(out_ref[34:3]),
    .io_axi_r_payload_resp(out_ref[2:1]),
    .io_axi_r_payload_last(out_ref[0:0])
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
    seed = 2367161454;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
