// Hidden tests: 5000 cycles of seeded random inputs (seed 1140999323); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 27;
  reg clk;
  reg [37:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_066883 dut (
    .flit_in(i_0),
    .flit_in_we(i_1),
    .src_e_addr_o(out_dut[26:24]),
    .dest_e_addr_o(out_dut[23:21]),
    .destport_o(out_dut[20:17]),
    .class_o(out_dut[16:15]),
    .weight_o(out_dut[14:11]),
    .data_o(out_dut[10:10]),
    .tail_flg_o(out_dut[9:9]),
    .hdr_flg_o(out_dut[8:8]),
    .vc_num_o(out_dut[7:4]),
    .hdr_flit_wr_o(out_dut[3:0])
  );
  autovcoder_066883__ref ref_i (
    .flit_in(i_0),
    .flit_in_we(i_1),
    .src_e_addr_o(out_ref[26:24]),
    .dest_e_addr_o(out_ref[23:21]),
    .destport_o(out_ref[20:17]),
    .class_o(out_ref[16:15]),
    .weight_o(out_ref[14:11]),
    .data_o(out_ref[10:10]),
    .tail_flg_o(out_ref[9:9]),
    .hdr_flg_o(out_ref[8:8]),
    .vc_num_o(out_ref[7:4]),
    .hdr_flit_wr_o(out_ref[3:0])
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
    seed = 1140999323;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
