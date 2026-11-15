// Hidden tests: 5000 cycles of seeded random inputs (seed 2064980750); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 154;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_192399 dut (
    .clk(clk),
    .rst(i_0),
    .DSI_ID(i_1),
    .IRWrite(i_2),
    .PC_buffer(i_3),
    .PC_AdEL(i_4),
    .PC_abnormal(i_5),
    .inst_sram_rdata(i_6),
    .do_load(i_7),
    .data_req(i_8),
    .decode_allowin(i_9),
    .fetch_axi_ar_ready(i_10),
    .fetch_axi_r_valid(i_11),
    .fetch_axi_r_data(i_12),
    .fetch_axi_r_last(i_13),
    .PC_IF_ID(out_dut[153:122]),
    .PC_add_4_IF_ID(out_dut[121:90]),
    .IR_IF_ID(out_dut[89:58]),
    .PC_AdEL_IF_ID(out_dut[57:57]),
    .DSI_IF_ID(out_dut[56:56]),
    .PC_fresh(out_dut[55:55]),
    .fetch_axi_ar_valid(out_dut[54:54]),
    .fetch_axi_ar_addr(out_dut[53:22]),
    .fetch_axi_ar_len(out_dut[21:14]),
    .fetch_axi_ar_size(out_dut[13:11]),
    .fetch_axi_ar_burst(out_dut[10:9]),
    .fetch_axi_ar_cache(out_dut[8:5]),
    .fetch_axi_ar_prot(out_dut[4:2]),
    .fetch_axi_r_ready(out_dut[1:1]),
    .data_rdata_ok(out_dut[0:0])
  );
  origen_192399__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .DSI_ID(i_1),
    .IRWrite(i_2),
    .PC_buffer(i_3),
    .PC_AdEL(i_4),
    .PC_abnormal(i_5),
    .inst_sram_rdata(i_6),
    .do_load(i_7),
    .data_req(i_8),
    .decode_allowin(i_9),
    .fetch_axi_ar_ready(i_10),
    .fetch_axi_r_valid(i_11),
    .fetch_axi_r_data(i_12),
    .fetch_axi_r_last(i_13),
    .PC_IF_ID(out_ref[153:122]),
    .PC_add_4_IF_ID(out_ref[121:90]),
    .IR_IF_ID(out_ref[89:58]),
    .PC_AdEL_IF_ID(out_ref[57:57]),
    .DSI_IF_ID(out_ref[56:56]),
    .PC_fresh(out_ref[55:55]),
    .fetch_axi_ar_valid(out_ref[54:54]),
    .fetch_axi_ar_addr(out_ref[53:22]),
    .fetch_axi_ar_len(out_ref[21:14]),
    .fetch_axi_ar_size(out_ref[13:11]),
    .fetch_axi_ar_burst(out_ref[10:9]),
    .fetch_axi_ar_cache(out_ref[8:5]),
    .fetch_axi_ar_prot(out_ref[4:2]),
    .fetch_axi_r_ready(out_ref[1:1]),
    .data_rdata_ok(out_ref[0:0])
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
    seed = 2064980750;
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
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
