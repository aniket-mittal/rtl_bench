// Hidden tests: 5000 cycles of seeded random inputs (seed 2619243836); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 90;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [31:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_101482 dut (
    .avmm_clk(clk),
    .avmm_rst_n(i_0),
    .i_avmm_write(i_1),
    .i_avmm_read(i_2),
    .i_avmm_addr(i_3),
    .i_avmm_wdata(i_4),
    .i_avmm_byte_en(i_5),
    .readdata(i_6),
    .o_avmm_rdata(out_dut[89:58]),
    .o_avmm_rdatavalid(out_dut[57:57]),
    .o_avmm_waitrequest(out_dut[56:56]),
    .clk(out_dut[55:55]),
    .reset(out_dut[54:54]),
    .writedata(out_dut[53:22]),
    .read(out_dut[21:21]),
    .write(out_dut[20:20]),
    .byteenable(out_dut[19:16]),
    .address(out_dut[15:0])
  );
  origen_101482__ref ref_i (
    .avmm_clk(clk),
    .avmm_rst_n(i_0),
    .i_avmm_write(i_1),
    .i_avmm_read(i_2),
    .i_avmm_addr(i_3),
    .i_avmm_wdata(i_4),
    .i_avmm_byte_en(i_5),
    .readdata(i_6),
    .o_avmm_rdata(out_ref[89:58]),
    .o_avmm_rdatavalid(out_ref[57:57]),
    .o_avmm_waitrequest(out_ref[56:56]),
    .clk(out_ref[55:55]),
    .reset(out_ref[54:54]),
    .writedata(out_ref[53:22]),
    .read(out_ref[21:21]),
    .write(out_ref[20:20]),
    .byteenable(out_ref[19:16]),
    .address(out_ref[15:0])
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
    seed = 2619243836;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
