// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03106 dut (
    .clk(clk),
    .rst(in_vec[1:1]),
    .SW2(in_vec[0:0]),
    .clkdiv(out_vec[32:1]),
    .Clk_CPU(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h2;
    stim[1] = 2'h3;
    stim[2] = 2'h1;
    stim[3] = 2'h1;
    stim[4] = 2'h0;
    stim[5] = 2'h0;
    stim[6] = 2'h1;
    stim[7] = 2'h1;
    stim[8] = 2'h1;
    stim[9] = 2'h1;
    stim[10] = 2'h1;
    stim[11] = 2'h0;
    stim[12] = 2'h1;
    stim[13] = 2'h0;
    stim[14] = 2'h1;
    stim[15] = 2'h1;
    stim[16] = 2'h1;
    stim[17] = 2'h0;
    stim[18] = 2'h0;
    stim[19] = 2'h0;
    stim[20] = 2'h1;
    stim[21] = 2'h0;
    stim[22] = 2'h1;
    stim[23] = 2'h0;
    stim[24] = 2'h0;
    stim[25] = 2'h1;
    stim[26] = 2'h0;
    stim[27] = 2'h1;
    stim[28] = 2'h0;
    stim[29] = 2'h0;
    stim[30] = 2'h1;
    stim[31] = 2'h1;
    stim[32] = 2'h0;
    stim[33] = 2'h1;
    stim[34] = 2'h1;
    stim[35] = 2'h1;
    stim[36] = 2'h0;
    stim[37] = 2'h2;
    stim[38] = 2'h0;
    stim[39] = 2'h1;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h0;
    stim[43] = 2'h1;
    stim[44] = 2'h1;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h1;
    stim[48] = 2'h1;
    stim[49] = 2'h1;
    stim[50] = 2'h0;
    stim[51] = 2'h0;
    stim[52] = 2'h0;
    stim[53] = 2'h0;
    stim[54] = 2'h1;
    stim[55] = 2'h1;
    stim[56] = 2'h0;
    stim[57] = 2'h0;
    stim[58] = 2'h0;
    stim[59] = 2'h1;
    stim[60] = 2'h0;
    stim[61] = 2'h0;
    stim[62] = 2'h0;
    stim[63] = 2'h1;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000002;
      expv[4] = 33'h000000005;
      expv[5] = 33'h000000007;
      expv[6] = 33'h000000008;
      expv[7] = 33'h00000000a;
      expv[8] = 33'h00000000c;
      expv[9] = 33'h00000000e;
      expv[10] = 33'h000000010;
      expv[11] = 33'h000000012;
      expv[12] = 33'h000000014;
      expv[13] = 33'h000000017;
      expv[14] = 33'h000000018;
      expv[15] = 33'h00000001a;
      expv[16] = 33'h00000001c;
      expv[17] = 33'h00000001f;
      expv[18] = 33'h000000020;
      expv[19] = 33'h000000022;
      expv[20] = 33'h000000024;
      expv[21] = 33'h000000027;
      expv[22] = 33'h000000028;
      expv[23] = 33'h00000002a;
      expv[24] = 33'h00000002d;
      expv[25] = 33'h00000002e;
      expv[26] = 33'h000000030;
      expv[27] = 33'h000000032;
      expv[28] = 33'h000000035;
      expv[29] = 33'h000000037;
      expv[30] = 33'h000000038;
      expv[31] = 33'h00000003a;
      expv[32] = 33'h00000003d;
      expv[33] = 33'h00000003e;
      expv[34] = 33'h000000040;
      expv[35] = 33'h000000042;
      expv[36] = 33'h000000045;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000002;
      expv[40] = 33'h000000005;
      expv[41] = 33'h000000007;
      expv[42] = 33'h000000008;
      expv[43] = 33'h00000000a;
      expv[44] = 33'h00000000c;
      expv[45] = 33'h00000000f;
      expv[46] = 33'h000000010;
      expv[47] = 33'h000000012;
      expv[48] = 33'h000000014;
      expv[49] = 33'h000000016;
      expv[50] = 33'h000000018;
      expv[51] = 33'h00000001a;
      expv[52] = 33'h00000001d;
      expv[53] = 33'h00000001f;
      expv[54] = 33'h000000020;
      expv[55] = 33'h000000022;
      expv[56] = 33'h000000025;
      expv[57] = 33'h000000027;
      expv[58] = 33'h000000028;
      expv[59] = 33'h00000002a;
      expv[60] = 33'h00000002d;
      expv[61] = 33'h00000002f;
      expv[62] = 33'h000000030;
      expv[63] = 33'h000000032;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
