// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_204454 dut (
    .clk(clk),
    .clk2(in_vec[8:8]),
    .clk3(in_vec[7:7]),
    .key(in_vec[6:2]),
    .state_now(in_vec[1:0]),
    .wei3(out_vec[11:8]),
    .duan3(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h04e;
    stim[1] = 9'h0a0;
    stim[2] = 9'h178;
    stim[3] = 9'h069;
    stim[4] = 9'h17b;
    stim[5] = 9'h0dc;
    stim[6] = 9'h0bb;
    stim[7] = 9'h1a4;
    stim[8] = 9'h084;
    stim[9] = 9'h040;
    stim[10] = 9'h093;
    stim[11] = 9'h00f;
    stim[12] = 9'h12b;
    stim[13] = 9'h0df;
    stim[14] = 9'h128;
    stim[15] = 9'h113;
    stim[16] = 9'h0ce;
    stim[17] = 9'h187;
    stim[18] = 9'h015;
    stim[19] = 9'h0da;
    stim[20] = 9'h05a;
    stim[21] = 9'h17c;
    stim[22] = 9'h153;
    stim[23] = 9'h0ef;
    stim[24] = 9'h0a3;
    stim[25] = 9'h077;
    stim[26] = 9'h1d5;
    stim[27] = 9'h022;
    stim[28] = 9'h1f2;
    stim[29] = 9'h081;
    stim[30] = 9'h101;
    stim[31] = 9'h082;
    stim[32] = 9'h07e;
    stim[33] = 9'h143;
    stim[34] = 9'h14d;
    stim[35] = 9'h044;
    stim[36] = 9'h05d;
    stim[37] = 9'h11f;
    stim[38] = 9'h026;
    stim[39] = 9'h103;
    stim[40] = 9'h01d;
    stim[41] = 9'h02b;
    stim[42] = 9'h027;
    stim[43] = 9'h061;
    stim[44] = 9'h13d;
    stim[45] = 9'h005;
    stim[46] = 9'h067;
    stim[47] = 9'h0da;
    stim[48] = 9'h090;
    stim[49] = 9'h036;
    stim[50] = 9'h0ca;
    stim[51] = 9'h034;
    stim[52] = 9'h129;
    stim[53] = 9'h06f;
    stim[54] = 9'h05d;
    stim[55] = 9'h199;
    stim[56] = 9'h116;
    stim[57] = 9'h08b;
    stim[58] = 9'h10a;
    stim[59] = 9'h1d3;
    stim[60] = 9'h122;
    stim[61] = 9'h0a0;
    stim[62] = 9'h107;
    stim[63] = 9'h1ca;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'hxxx;
      expv[7] = 12'hxxx;
      expv[8] = 12'hxxx;
      expv[9] = 12'hxxx;
      expv[10] = 12'hxxx;
      expv[11] = 12'hxxx;
      expv[12] = 12'hx01;
      expv[13] = 12'hx01;
      expv[14] = 12'hxff;
      expv[15] = 12'hxff;
      expv[16] = 12'hxff;
      expv[17] = 12'hxff;
      expv[18] = 12'hx01;
      expv[19] = 12'hx01;
      expv[20] = 12'hx01;
      expv[21] = 12'hx01;
      expv[22] = 12'hx01;
      expv[23] = 12'hx01;
      expv[24] = 12'hxff;
      expv[25] = 12'hxff;
      expv[26] = 12'hx01;
      expv[27] = 12'hx01;
      expv[28] = 12'hx01;
      expv[29] = 12'hx01;
      expv[30] = 12'hx01;
      expv[31] = 12'hx01;
      expv[32] = 12'hx01;
      expv[33] = 12'hx01;
      expv[34] = 12'hx01;
      expv[35] = 12'hx01;
      expv[36] = 12'hx01;
      expv[37] = 12'hx01;
      expv[38] = 12'hxff;
      expv[39] = 12'hxff;
      expv[40] = 12'hxff;
      expv[41] = 12'hxff;
      expv[42] = 12'hxff;
      expv[43] = 12'hx01;
      expv[44] = 12'hx01;
      expv[45] = 12'hx01;
      expv[46] = 12'hx01;
      expv[47] = 12'hxff;
      expv[48] = 12'hxff;
      expv[49] = 12'hxff;
      expv[50] = 12'hxff;
      expv[51] = 12'hxff;
      expv[52] = 12'hxff;
      expv[53] = 12'hxff;
      expv[54] = 12'hx01;
      expv[55] = 12'hx01;
      expv[56] = 12'hx01;
      expv[57] = 12'hx01;
      expv[58] = 12'hx01;
      expv[59] = 12'hx01;
      expv[60] = 12'hx01;
      expv[61] = 12'hx01;
      expv[62] = 12'hx01;
      expv[63] = 12'hxff;
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
