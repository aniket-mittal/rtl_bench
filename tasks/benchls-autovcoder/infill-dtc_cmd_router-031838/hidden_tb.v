// Hidden tests: 5000 cycles of seeded random inputs (seed 2931506812); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 134;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [19:0] i_3;
  reg [19:0] i_4;
  reg [15:0] i_5;
  reg [0:0] i_6;
  reg [19:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_031838 dut (
    .rdoclk(clk),
    .dtc_cmd_rnw(i_0),
    .dtc_cmd_exec(i_1),
    .dtc_cmd_feenal(i_2),
    .dtc_cmd_data(i_3),
    .dtc_cmd_addr(i_4),
    .dtc_fpga_cmd_rdata(i_5),
    .fpga_cmd_ack(i_6),
    .acmd_tx(i_7),
    .acmd_ack(i_8),
    .frame_st(i_9),
    .reset(i_10),
    .dtc_cmd_ack(out_dut[133:133]),
    .dtc_fpga_cmd_exec(out_dut[132:132]),
    .dtc_fpga_cmd_rnw(out_dut[131:131]),
    .dtc_fpga_cmd_addr(out_dut[130:123]),
    .dtc_fpga_cmd_wdata(out_dut[122:107]),
    .acmd_exec(out_dut[106:106]),
    .acmd_rw(out_dut[105:105]),
    .acmd_addr(out_dut[104:85]),
    .acmd_rx(out_dut[84:65]),
    .reply_addr(out_dut[64:33]),
    .reply_data(out_dut[32:1]),
    .reply_rdy(out_dut[0:0])
  );
  autovcoder_031838__ref ref_i (
    .rdoclk(clk),
    .dtc_cmd_rnw(i_0),
    .dtc_cmd_exec(i_1),
    .dtc_cmd_feenal(i_2),
    .dtc_cmd_data(i_3),
    .dtc_cmd_addr(i_4),
    .dtc_fpga_cmd_rdata(i_5),
    .fpga_cmd_ack(i_6),
    .acmd_tx(i_7),
    .acmd_ack(i_8),
    .frame_st(i_9),
    .reset(i_10),
    .dtc_cmd_ack(out_ref[133:133]),
    .dtc_fpga_cmd_exec(out_ref[132:132]),
    .dtc_fpga_cmd_rnw(out_ref[131:131]),
    .dtc_fpga_cmd_addr(out_ref[130:123]),
    .dtc_fpga_cmd_wdata(out_ref[122:107]),
    .acmd_exec(out_ref[106:106]),
    .acmd_rw(out_ref[105:105]),
    .acmd_addr(out_ref[104:85]),
    .acmd_rx(out_ref[84:65]),
    .reply_addr(out_ref[64:33]),
    .reply_data(out_ref[32:1]),
    .reply_rdy(out_ref[0:0])
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
    seed = 2931506812;
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
