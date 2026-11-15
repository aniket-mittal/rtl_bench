// Hidden tests: 5000 cycles of seeded random inputs (seed 3818022753); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 135;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [31:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_06951 dut (
    .clk(clk),
    .clk__enable(i_0),
    .apb_response__prdata(i_1),
    .apb_response__pready(i_2),
    .apb_response__perr(i_3),
    .apb_request_1__paddr(i_4),
    .apb_request_1__penable(i_5),
    .apb_request_1__psel(i_6),
    .apb_request_1__pwrite(i_7),
    .apb_request_1__pwdata(i_8),
    .apb_request_0__paddr(i_9),
    .apb_request_0__penable(i_10),
    .apb_request_0__psel(i_11),
    .apb_request_0__pwrite(i_12),
    .apb_request_0__pwdata(i_13),
    .reset_n(i_14),
    .apb_request__paddr(out_dut[134:103]),
    .apb_request__penable(out_dut[102:102]),
    .apb_request__psel(out_dut[101:101]),
    .apb_request__pwrite(out_dut[100:100]),
    .apb_request__pwdata(out_dut[99:68]),
    .apb_response_1__prdata(out_dut[67:36]),
    .apb_response_1__pready(out_dut[35:35]),
    .apb_response_1__perr(out_dut[34:34]),
    .apb_response_0__prdata(out_dut[33:2]),
    .apb_response_0__pready(out_dut[1:1]),
    .apb_response_0__perr(out_dut[0:0])
  );
  rtlpp_06951__ref ref_i (
    .clk(clk),
    .clk__enable(i_0),
    .apb_response__prdata(i_1),
    .apb_response__pready(i_2),
    .apb_response__perr(i_3),
    .apb_request_1__paddr(i_4),
    .apb_request_1__penable(i_5),
    .apb_request_1__psel(i_6),
    .apb_request_1__pwrite(i_7),
    .apb_request_1__pwdata(i_8),
    .apb_request_0__paddr(i_9),
    .apb_request_0__penable(i_10),
    .apb_request_0__psel(i_11),
    .apb_request_0__pwrite(i_12),
    .apb_request_0__pwdata(i_13),
    .reset_n(i_14),
    .apb_request__paddr(out_ref[134:103]),
    .apb_request__penable(out_ref[102:102]),
    .apb_request__psel(out_ref[101:101]),
    .apb_request__pwrite(out_ref[100:100]),
    .apb_request__pwdata(out_ref[99:68]),
    .apb_response_1__prdata(out_ref[67:36]),
    .apb_response_1__pready(out_ref[35:35]),
    .apb_response_1__perr(out_ref[34:34]),
    .apb_response_0__prdata(out_ref[33:2]),
    .apb_response_0__pready(out_ref[1:1]),
    .apb_response_0__perr(out_ref[0:0])
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
    seed = 3818022753;
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
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
