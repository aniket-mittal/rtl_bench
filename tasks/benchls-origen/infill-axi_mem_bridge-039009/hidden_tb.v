// Hidden tests: 5000 cycles of seeded random inputs (seed 651771895); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 145;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [3:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_039009 dut (
    .g_clk(clk),
    .g_resetn(i_0),
    .mem_axi_awready(i_1),
    .mem_axi_wready(i_2),
    .mem_axi_bvalid(i_3),
    .mem_axi_arready(i_4),
    .mem_axi_rvalid(i_5),
    .mem_axi_rdata(i_6),
    .mem_instr(i_7),
    .mem_cen(i_8),
    .mem_addr(i_9),
    .mem_wdata(i_10),
    .mem_wstrb(i_11),
    .mem_axi_awvalid(out_dut[144:144]),
    .mem_axi_awaddr(out_dut[143:112]),
    .mem_axi_awprot(out_dut[111:109]),
    .mem_axi_wvalid(out_dut[108:108]),
    .mem_axi_wdata(out_dut[107:76]),
    .mem_axi_wstrb(out_dut[75:72]),
    .mem_axi_bready(out_dut[71:71]),
    .mem_axi_arvalid(out_dut[70:70]),
    .mem_axi_araddr(out_dut[69:38]),
    .mem_axi_arprot(out_dut[37:35]),
    .mem_axi_rready(out_dut[34:34]),
    .mem_stall(out_dut[33:33]),
    .mem_error(out_dut[32:32]),
    .mem_rdata(out_dut[31:0])
  );
  origen_039009__ref ref_i (
    .g_clk(clk),
    .g_resetn(i_0),
    .mem_axi_awready(i_1),
    .mem_axi_wready(i_2),
    .mem_axi_bvalid(i_3),
    .mem_axi_arready(i_4),
    .mem_axi_rvalid(i_5),
    .mem_axi_rdata(i_6),
    .mem_instr(i_7),
    .mem_cen(i_8),
    .mem_addr(i_9),
    .mem_wdata(i_10),
    .mem_wstrb(i_11),
    .mem_axi_awvalid(out_ref[144:144]),
    .mem_axi_awaddr(out_ref[143:112]),
    .mem_axi_awprot(out_ref[111:109]),
    .mem_axi_wvalid(out_ref[108:108]),
    .mem_axi_wdata(out_ref[107:76]),
    .mem_axi_wstrb(out_ref[75:72]),
    .mem_axi_bready(out_ref[71:71]),
    .mem_axi_arvalid(out_ref[70:70]),
    .mem_axi_araddr(out_ref[69:38]),
    .mem_axi_arprot(out_ref[37:35]),
    .mem_axi_rready(out_ref[34:34]),
    .mem_stall(out_ref[33:33]),
    .mem_error(out_ref[32:32]),
    .mem_rdata(out_ref[31:0])
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
    seed = 651771895;
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
