// Hidden tests: 5000 cycles of seeded random inputs (seed 91931489); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 43;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [1:0] i_3;
  reg [2:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [7:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_172499 dut (
    .HCLK(clk),
    .HRESETn(i_0),
    .HSEL(i_1),
    .HADDR(i_2),
    .HTRANS(i_3),
    .HSIZE(i_4),
    .HPROT(i_5),
    .HWRITE(i_6),
    .HWDATA(i_7),
    .HREADY(i_8),
    .UART_RX(i_9),
    .state(i_10),
    .HREADYOUT(out_dut[42:42]),
    .HRDATA(out_dut[41:10]),
    .HRESP(out_dut[9:9]),
    .tx_en(out_dut[8:8]),
    .UART_TX(out_dut[7:0])
  );
  origen_172499__ref ref_i (
    .HCLK(clk),
    .HRESETn(i_0),
    .HSEL(i_1),
    .HADDR(i_2),
    .HTRANS(i_3),
    .HSIZE(i_4),
    .HPROT(i_5),
    .HWRITE(i_6),
    .HWDATA(i_7),
    .HREADY(i_8),
    .UART_RX(i_9),
    .state(i_10),
    .HREADYOUT(out_ref[42:42]),
    .HRDATA(out_ref[41:10]),
    .HRESP(out_ref[9:9]),
    .tx_en(out_ref[8:8]),
    .UART_TX(out_ref[7:0])
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
    seed = 91931489;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
