// Hidden tests: 5000 cycles of seeded random inputs (seed 1710616411); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 140;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [1:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_083975 dut (
    .io_mainClk(clk),
    .io_iBus_cmd_valid(i_0),
    .io_iBus_cmd_payload_pc(i_1),
    .io_dBus_cmd_valid(i_2),
    .io_dBus_cmd_payload_wr(i_3),
    .io_dBus_cmd_payload_address(i_4),
    .io_dBus_cmd_payload_data(i_5),
    .io_dBus_cmd_payload_size(i_6),
    .io_masterBus_cmd_ready(i_7),
    .io_masterBus_rsp_valid(i_8),
    .io_masterBus_rsp_payload_data(i_9),
    .resetCtrl_systemReset(i_10),
    .io_iBus_cmd_ready(out_dut[139:139]),
    .io_iBus_rsp_valid(out_dut[138:138]),
    .io_iBus_rsp_payload_error(out_dut[137:137]),
    .io_iBus_rsp_payload_inst(out_dut[136:105]),
    .io_dBus_cmd_ready(out_dut[104:104]),
    .io_dBus_rsp_ready(out_dut[103:103]),
    .io_dBus_rsp_error(out_dut[102:102]),
    .io_dBus_rsp_data(out_dut[101:70]),
    .io_masterBus_cmd_valid(out_dut[69:69]),
    .io_masterBus_cmd_payload_write(out_dut[68:68]),
    .io_masterBus_cmd_payload_address(out_dut[67:36]),
    .io_masterBus_cmd_payload_data(out_dut[35:4]),
    .io_masterBus_cmd_payload_mask(out_dut[3:0])
  );
  autovcoder_083975__ref ref_i (
    .io_mainClk(clk),
    .io_iBus_cmd_valid(i_0),
    .io_iBus_cmd_payload_pc(i_1),
    .io_dBus_cmd_valid(i_2),
    .io_dBus_cmd_payload_wr(i_3),
    .io_dBus_cmd_payload_address(i_4),
    .io_dBus_cmd_payload_data(i_5),
    .io_dBus_cmd_payload_size(i_6),
    .io_masterBus_cmd_ready(i_7),
    .io_masterBus_rsp_valid(i_8),
    .io_masterBus_rsp_payload_data(i_9),
    .resetCtrl_systemReset(i_10),
    .io_iBus_cmd_ready(out_ref[139:139]),
    .io_iBus_rsp_valid(out_ref[138:138]),
    .io_iBus_rsp_payload_error(out_ref[137:137]),
    .io_iBus_rsp_payload_inst(out_ref[136:105]),
    .io_dBus_cmd_ready(out_ref[104:104]),
    .io_dBus_rsp_ready(out_ref[103:103]),
    .io_dBus_rsp_error(out_ref[102:102]),
    .io_dBus_rsp_data(out_ref[101:70]),
    .io_masterBus_cmd_valid(out_ref[69:69]),
    .io_masterBus_cmd_payload_write(out_ref[68:68]),
    .io_masterBus_cmd_payload_address(out_ref[67:36]),
    .io_masterBus_cmd_payload_data(out_ref[35:4]),
    .io_masterBus_cmd_payload_mask(out_ref[3:0])
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
    seed = 1710616411;
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
      i_10 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
