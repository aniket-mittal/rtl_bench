// Hidden tests: 5000 cycles of seeded random inputs (seed 3680768279); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 170;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_009187 dut (
    .no_dcache(i_0),
    .cpu_req(i_1),
    .cpu_we(i_2),
    .cpu_size(i_3),
    .cpu_addr(i_4),
    .cpu_wdata(i_5),
    .ram_rdata(i_6),
    .ram_addr_ack(i_7),
    .ram_data_ack(i_8),
    .cfg_rdata(i_9),
    .cfg_addr_ack(i_10),
    .cfg_data_ack(i_11),
    .cpu_rdata(out_dut[169:138]),
    .cpu_addr_ack(out_dut[137:137]),
    .cpu_data_ack(out_dut[136:136]),
    .ram_req(out_dut[135:135]),
    .ram_we(out_dut[134:134]),
    .ram_size(out_dut[133:132]),
    .ram_addr(out_dut[131:100]),
    .ram_wdata(out_dut[99:68]),
    .cfg_req(out_dut[67:67]),
    .cfg_we(out_dut[66:66]),
    .cfg_size(out_dut[65:64]),
    .cfg_addr(out_dut[63:32]),
    .cfg_wdata(out_dut[31:0])
  );
  origen_009187__ref ref_i (
    .no_dcache(i_0),
    .cpu_req(i_1),
    .cpu_we(i_2),
    .cpu_size(i_3),
    .cpu_addr(i_4),
    .cpu_wdata(i_5),
    .ram_rdata(i_6),
    .ram_addr_ack(i_7),
    .ram_data_ack(i_8),
    .cfg_rdata(i_9),
    .cfg_addr_ack(i_10),
    .cfg_data_ack(i_11),
    .cpu_rdata(out_ref[169:138]),
    .cpu_addr_ack(out_ref[137:137]),
    .cpu_data_ack(out_ref[136:136]),
    .ram_req(out_ref[135:135]),
    .ram_we(out_ref[134:134]),
    .ram_size(out_ref[133:132]),
    .ram_addr(out_ref[131:100]),
    .ram_wdata(out_ref[99:68]),
    .cfg_req(out_ref[67:67]),
    .cfg_we(out_ref[66:66]),
    .cfg_size(out_ref[65:64]),
    .cfg_addr(out_ref[63:32]),
    .cfg_wdata(out_ref[31:0])
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
    seed = 3680768279;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
