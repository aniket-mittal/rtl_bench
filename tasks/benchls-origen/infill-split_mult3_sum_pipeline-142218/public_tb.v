// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142218 dut (
    .clk(clk),
    .rst_n(in_vec[16:16]),
    .in(in_vec[15:0]),
    .out(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0a53f;
    stim[1] = 17'h0be90;
    stim[2] = 17'h1b411;
    stim[3] = 17'h176b9;
    stim[4] = 17'h1c388;
    stim[5] = 17'h1cf30;
    stim[6] = 17'h128e2;
    stim[7] = 17'h129bc;
    stim[8] = 17'h1e429;
    stim[9] = 17'h13667;
    stim[10] = 17'h179a5;
    stim[11] = 17'h11b8e;
    stim[12] = 17'h1b95c;
    stim[13] = 17'h106d6;
    stim[14] = 17'h17b1d;
    stim[15] = 17'h13b1f;
    stim[16] = 17'h1e6b6;
    stim[17] = 17'h1b80f;
    stim[18] = 17'h1984b;
    stim[19] = 17'h17e55;
    stim[20] = 17'h19eef;
    stim[21] = 17'h179b7;
    stim[22] = 17'h18949;
    stim[23] = 17'h1b798;
    stim[24] = 17'h13da7;
    stim[25] = 17'h1430e;
    stim[26] = 17'h1e385;
    stim[27] = 17'h1640a;
    stim[28] = 17'h110d7;
    stim[29] = 17'h12942;
    stim[30] = 17'h14902;
    stim[31] = 17'h1fda5;
    stim[32] = 17'h15803;
    stim[33] = 17'h15a83;
    stim[34] = 17'h1ba44;
    stim[35] = 17'h1247f;
    stim[36] = 17'h19c4e;
    stim[37] = 17'h13a50;
    stim[38] = 17'h19bfd;
    stim[39] = 17'h1062b;
    stim[40] = 17'h10a46;
    stim[41] = 17'h1ec26;
    stim[42] = 17'h1889e;
    stim[43] = 17'h1afdd;
    stim[44] = 17'h17c0f;
    stim[45] = 17'h19852;
    stim[46] = 17'h10b16;
    stim[47] = 17'h18ea4;
    stim[48] = 17'h1539e;
    stim[49] = 17'h03a52;
    stim[50] = 17'h0c859;
    stim[51] = 17'h1d989;
    stim[52] = 17'h18167;
    stim[53] = 17'h1bcad;
    stim[54] = 17'h1e06f;
    stim[55] = 17'h12c21;
    stim[56] = 17'h14dbe;
    stim[57] = 17'h1e150;
    stim[58] = 17'h10b8d;
    stim[59] = 17'h1bc04;
    stim[60] = 17'h1d9d9;
    stim[61] = 17'h1a0a9;
    stim[62] = 17'h10d54;
    stim[63] = 17'h1f813;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h01c33;
      expv[7] = 18'h1642b;
      expv[8] = 18'h04a98;
      expv[9] = 18'h06d90;
      expv[10] = 18'h07aa6;
      expv[11] = 18'h07d34;
      expv[12] = 18'h0ac7b;
      expv[13] = 18'h0a335;
      expv[14] = 18'h16cef;
      expv[15] = 18'h052aa;
      expv[16] = 18'h02c14;
      expv[17] = 18'h01482;
      expv[18] = 18'h17157;
      expv[19] = 18'h0b15d;
      expv[20] = 18'h0b422;
      expv[21] = 18'h0282d;
      expv[22] = 18'h1c8e1;
      expv[23] = 18'h17aff;
      expv[24] = 18'h1dccd;
      expv[25] = 18'h16d25;
      expv[26] = 18'h19bdb;
      expv[27] = 18'h026c8;
      expv[28] = 18'h0b8f5;
      expv[29] = 18'h0c92a;
      expv[30] = 18'h0aa8f;
      expv[31] = 18'h12c1e;
      expv[32] = 18'h03285;
      expv[33] = 18'h07bc6;
      expv[34] = 18'h0db06;
      expv[35] = 18'h0f8ef;
      expv[36] = 18'h10809;
      expv[37] = 18'h10f89;
      expv[38] = 18'h02ecc;
      expv[39] = 18'h06d7d;
      expv[40] = 18'h1d4ea;
      expv[41] = 18'h0aef0;
      expv[42] = 18'h1d3f7;
      expv[43] = 18'h01281;
      expv[44] = 18'h01ed2;
      expv[45] = 18'h0c472;
      expv[46] = 18'h199da;
      expv[47] = 18'h00f97;
      expv[48] = 18'h1742d;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h08c9b;
      expv[56] = 18'h18435;
      expv[57] = 18'h03607;
      expv[58] = 18'h0a14d;
      expv[59] = 18'h08463;
      expv[60] = 18'h0e93a;
      expv[61] = 18'h0a3f0;
      expv[62] = 18'h022a7;
      expv[63] = 18'h0340c;
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
