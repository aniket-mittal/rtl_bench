// Hidden tests: 5000 cycles of seeded random inputs (seed 2910784362); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 42;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [2:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [2:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_037692 dut (
    .clk(clk),
    .rst_n(i_0),
    .s_axil_awaddr(i_1),
    .s_axil_awprot(i_2),
    .s_axil_awvalid(i_3),
    .s_axil_wdata(i_4),
    .s_axil_wstrb(i_5),
    .s_axil_wvalid(i_6),
    .s_axil_bready(i_7),
    .s_axil_araddr(i_8),
    .s_axil_arprot(i_9),
    .s_axil_arvalid(i_10),
    .s_axil_rready(i_11),
    .s_axil_awready(out_dut[41:41]),
    .s_axil_wready(out_dut[40:40]),
    .s_axil_bresp(out_dut[39:38]),
    .s_axil_bvalid(out_dut[37:37]),
    .s_axil_arready(out_dut[36:36]),
    .s_axil_rdata(out_dut[35:4]),
    .s_axil_rresp(out_dut[3:2]),
    .s_axil_rvalid(out_dut[1:1]),
    .time_intr(out_dut[0:0])
  );
  origen_037692__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .s_axil_awaddr(i_1),
    .s_axil_awprot(i_2),
    .s_axil_awvalid(i_3),
    .s_axil_wdata(i_4),
    .s_axil_wstrb(i_5),
    .s_axil_wvalid(i_6),
    .s_axil_bready(i_7),
    .s_axil_araddr(i_8),
    .s_axil_arprot(i_9),
    .s_axil_arvalid(i_10),
    .s_axil_rready(i_11),
    .s_axil_awready(out_ref[41:41]),
    .s_axil_wready(out_ref[40:40]),
    .s_axil_bresp(out_ref[39:38]),
    .s_axil_bvalid(out_ref[37:37]),
    .s_axil_arready(out_ref[36:36]),
    .s_axil_rdata(out_ref[35:4]),
    .s_axil_rresp(out_ref[3:2]),
    .s_axil_rvalid(out_ref[1:1]),
    .time_intr(out_ref[0:0])
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
    seed = 2910784362;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
