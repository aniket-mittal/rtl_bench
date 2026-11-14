// Hidden tests: 5000 cycles of seeded random inputs (seed 3027899337); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 154;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [7:0] i_3;
  reg [2:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
  reg [0:0] i_8;
  reg [63:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [1:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_134248 dut (
    .m_axi_aclk(clk),
    .m_axi_aresetn(i_0),
    .req_valid(i_1),
    .req_address(i_2),
    .req_last_burst_length(i_3),
    .req_last_beat_bytes(i_4),
    .enable(i_5),
    .pause(i_6),
    .sync_id(i_7),
    .fifo_valid(i_8),
    .fifo_data(i_9),
    .response_ready(i_10),
    .m_axi_awready(i_11),
    .m_axi_wready(i_12),
    .m_axi_bvalid(i_13),
    .m_axi_bresp(i_14),
    .req_ready(out_dut[153:153]),
    .enabled(out_dut[152:152]),
    .sync_id_ret(out_dut[151:148]),
    .response_valid(out_dut[147:147]),
    .response_resp(out_dut[146:145]),
    .response_resp_eot(out_dut[144:144]),
    .request_id(out_dut[143:140]),
    .response_id(out_dut[139:136]),
    .data_id(out_dut[135:132]),
    .address_id(out_dut[131:128]),
    .m_axi_awvalid(out_dut[127:127]),
    .m_axi_awaddr(out_dut[126:95]),
    .m_axi_awlen(out_dut[94:87]),
    .m_axi_awsize(out_dut[86:84]),
    .m_axi_awburst(out_dut[83:82]),
    .m_axi_awprot(out_dut[81:79]),
    .m_axi_awcache(out_dut[78:75]),
    .m_axi_wvalid(out_dut[74:74]),
    .m_axi_wdata(out_dut[73:10]),
    .m_axi_wstrb(out_dut[9:2]),
    .m_axi_wlast(out_dut[1:1]),
    .m_axi_bready(out_dut[0:0])
  );
  origen_134248__ref ref_i (
    .m_axi_aclk(clk),
    .m_axi_aresetn(i_0),
    .req_valid(i_1),
    .req_address(i_2),
    .req_last_burst_length(i_3),
    .req_last_beat_bytes(i_4),
    .enable(i_5),
    .pause(i_6),
    .sync_id(i_7),
    .fifo_valid(i_8),
    .fifo_data(i_9),
    .response_ready(i_10),
    .m_axi_awready(i_11),
    .m_axi_wready(i_12),
    .m_axi_bvalid(i_13),
    .m_axi_bresp(i_14),
    .req_ready(out_ref[153:153]),
    .enabled(out_ref[152:152]),
    .sync_id_ret(out_ref[151:148]),
    .response_valid(out_ref[147:147]),
    .response_resp(out_ref[146:145]),
    .response_resp_eot(out_ref[144:144]),
    .request_id(out_ref[143:140]),
    .response_id(out_ref[139:136]),
    .data_id(out_ref[135:132]),
    .address_id(out_ref[131:128]),
    .m_axi_awvalid(out_ref[127:127]),
    .m_axi_awaddr(out_ref[126:95]),
    .m_axi_awlen(out_ref[94:87]),
    .m_axi_awsize(out_ref[86:84]),
    .m_axi_awburst(out_ref[83:82]),
    .m_axi_awprot(out_ref[81:79]),
    .m_axi_awcache(out_ref[78:75]),
    .m_axi_wvalid(out_ref[74:74]),
    .m_axi_wdata(out_ref[73:10]),
    .m_axi_wstrb(out_ref[9:2]),
    .m_axi_wlast(out_ref[1:1]),
    .m_axi_bready(out_ref[0:0])
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
    seed = 3027899337;
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
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed), $random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
