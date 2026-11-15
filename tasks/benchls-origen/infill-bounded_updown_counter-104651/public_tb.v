// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_104651 dut (
    .clk(clk),
    .en(in_vec[28:28]),
    .rst(in_vec[27:27]),
    .cnt_mode(in_vec[26:26]),
    .free(in_vec[25:25]),
    .init_cnt(in_vec[24:24]),
    .min(in_vec[23:16]),
    .max(in_vec[15:8]),
    .init(in_vec[7:0]),
    .value(out_vec[8:1]),
    .overflow_set(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h087cf509;
    stim[1] = 29'h08394be4;
    stim[2] = 29'h04badcaa;
    stim[3] = 29'h1036a31e;
    stim[4] = 29'h03a3cb8e;
    stim[5] = 29'h06e8bb4e;
    stim[6] = 29'h172a0cc5;
    stim[7] = 29'h0496e3f0;
    stim[8] = 29'h15bca477;
    stim[9] = 29'h0341a971;
    stim[10] = 29'h07417bea;
    stim[11] = 29'h013c8897;
    stim[12] = 29'h1166e83d;
    stim[13] = 29'h025a664c;
    stim[14] = 29'h060af14d;
    stim[15] = 29'h118e7ef1;
    stim[16] = 29'h11b152da;
    stim[17] = 29'h061fe7e3;
    stim[18] = 29'h01dde851;
    stim[19] = 29'h0246fb10;
    stim[20] = 29'h1694f2c1;
    stim[21] = 29'h11e5e985;
    stim[22] = 29'h1689cbb5;
    stim[23] = 29'h17e459ec;
    stim[24] = 29'h17ccbbce;
    stim[25] = 29'h1266b260;
    stim[26] = 29'h07b3569d;
    stim[27] = 29'h1505a935;
    stim[28] = 29'h01e6f441;
    stim[29] = 29'h05b26270;
    stim[30] = 29'h10af87e4;
    stim[31] = 29'h11077d38;
    stim[32] = 29'h05ebcbe1;
    stim[33] = 29'h157a5c77;
    stim[34] = 29'h07aeb320;
    stim[35] = 29'h1134950a;
    stim[36] = 29'h11bade42;
    stim[37] = 29'h1269cfbf;
    stim[38] = 29'h04a2b4f4;
    stim[39] = 29'h071d4811;
    stim[40] = 29'h16055a06;
    stim[41] = 29'h073a3ce5;
    stim[42] = 29'h00ef0bee;
    stim[43] = 29'h0700fdc2;
    stim[44] = 29'h12bacd4f;
    stim[45] = 29'h1242b73d;
    stim[46] = 29'h1a970f58;
    stim[47] = 29'h040b044d;
    stim[48] = 29'h033982ab;
    stim[49] = 29'h1144f1fd;
    stim[50] = 29'h02bb93dc;
    stim[51] = 29'h10926c10;
    stim[52] = 29'h13b79cb3;
    stim[53] = 29'h032919b1;
    stim[54] = 29'h12d9cc6e;
    stim[55] = 29'h1169ec86;
    stim[56] = 29'h1023bb7e;
    stim[57] = 29'h1762a540;
    stim[58] = 29'h067a2d04;
    stim[59] = 29'h15c24492;
    stim[60] = 29'h137631f9;
    stim[61] = 29'h124c358b;
    stim[62] = 29'h16dd9a65;
    stim[63] = 29'h12374527;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h147;
      expv[5] = 9'h11c;
      expv[6] = 9'h11c;
      expv[7] = 9'h18a;
      expv[8] = 9'h18a;
      expv[9] = 9'h0ee;
      expv[10] = 9'h0e2;
      expv[11] = 9'h1d4;
      expv[12] = 9'h12e;
      expv[13] = 9'h07a;
      expv[14] = 9'h07a;
      expv[15] = 9'h07a;
      expv[16] = 9'h1e2;
      expv[17] = 9'h1b4;
      expv[18] = 9'h1b4;
      expv[19] = 9'h0a2;
      expv[20] = 9'h0a2;
      expv[21] = 9'h0a4;
      expv[22] = 9'h10a;
      expv[23] = 9'h10c;
      expv[24] = 9'h1d8;
      expv[25] = 9'h19c;
      expv[26] = 9'h19a;
      expv[27] = 9'h13a;
      expv[28] = 9'h06a;
      expv[29] = 9'h082;
      expv[30] = 9'h0e0;
      expv[31] = 9'h10e;
      expv[32] = 9'h070;
      expv[33] = 9'h1c2;
      expv[34] = 9'h0ee;
      expv[35] = 9'h040;
      expv[36] = 9'h014;
      expv[37] = 9'h084;
      expv[38] = 9'h082;
      expv[39] = 9'h082;
      expv[40] = 9'h022;
      expv[41] = 9'h024;
      expv[42] = 9'h1ca;
      expv[43] = 9'h1ca;
      expv[44] = 9'h184;
      expv[45] = 9'h182;
      expv[46] = 9'h180;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h156;
      expv[50] = 9'h1fa;
      expv[51] = 9'h1fa;
      expv[52] = 9'h1f8;
      expv[53] = 9'h166;
      expv[54] = 9'h162;
      expv[55] = 9'h160;
      expv[56] = 9'h10c;
      expv[57] = 9'h10a;
      expv[58] = 9'h080;
      expv[59] = 9'h080;
      expv[60] = 9'h124;
      expv[61] = 9'h1f2;
      expv[62] = 9'h1f0;
      expv[63] = 9'h1f2;
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
