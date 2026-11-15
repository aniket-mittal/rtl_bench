// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01478 dut (
    .dataa(in_vec[63:32]),
    .datab(in_vec[31:0]),
    .overflow(out_vec[32:32]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'he50fd8f829aaa098;
    stim[1] = 64'h172bd4b9e3a3860d;
    stim[2] = 64'h4afd655d136b5180;
    stim[3] = 64'h447490a8209ca4e6;
    stim[4] = 64'h778d76205266cafe;
    stim[5] = 64'h0ae04a5c8afe429f;
    stim[6] = 64'h493e77db85b7a255;
    stim[7] = 64'hee2a98fe617a7d2a;
    stim[8] = 64'hb5441eae50039b26;
    stim[9] = 64'he4a2cece25d96e4b;
    stim[10] = 64'h0e69f5146d166987;
    stim[11] = 64'h3e2e95209c5090d7;
    stim[12] = 64'ha181cc85c5517c06;
    stim[13] = 64'had10e787724375d3;
    stim[14] = 64'h218d61d7adcb320b;
    stim[15] = 64'h95fa855fb42b1aad;
    stim[16] = 64'h7b7efe3c534111eb;
    stim[17] = 64'h56f8afb8ceccc352;
    stim[18] = 64'h7f56d916c4d4ffa7;
    stim[19] = 64'h7a1dbbaaaf389fdc;
    stim[20] = 64'h40b81c7a2221fcb4;
    stim[21] = 64'hb32bf5475ec915bc;
    stim[22] = 64'h782e53ce8af94947;
    stim[23] = 64'hc882762eda695c90;
    stim[24] = 64'h55f4e124b716d287;
    stim[25] = 64'h9a0a73a09c40cd8b;
    stim[26] = 64'h37e9639adc500244;
    stim[27] = 64'h71e57a72ecfc2e8d;
    stim[28] = 64'ha293a8becaf23366;
    stim[29] = 64'h04c9e6c3dace13fd;
    stim[30] = 64'h724084d5dde71607;
    stim[31] = 64'h1d92fccf9ee4eabd;
    stim[32] = 64'h8334c8da79b2223f;
    stim[33] = 64'h90c7303dcd16e555;
    stim[34] = 64'h4ba7fac3ae61e6ae;
    stim[35] = 64'hf36ef836f19429cb;
    stim[36] = 64'hd44a04bf7cce16cd;
    stim[37] = 64'he3398ab4f9306281;
    stim[38] = 64'hc77e93c707b69654;
    stim[39] = 64'h9b041124052fb358;
    stim[40] = 64'hc03c160fc4332e09;
    stim[41] = 64'h9a6e6e1c73880803;
    stim[42] = 64'h341f54166c50df8b;
    stim[43] = 64'haf399f094a8bedba;
    stim[44] = 64'hfd28c4cfc409dfbc;
    stim[45] = 64'h0b7410f944803332;
    stim[46] = 64'ha65a0f66a238b522;
    stim[47] = 64'h0e5f17bde4023a55;
    stim[48] = 64'h3697af25ff2c0634;
    stim[49] = 64'hf76b00e668506304;
    stim[50] = 64'h3c75cdd5c6ccb570;
    stim[51] = 64'h8b6479b5abe5ce74;
    stim[52] = 64'hd39a08a0bef1ce5b;
    stim[53] = 64'h5f1510171e79b0e2;
    stim[54] = 64'h2e40ebecc671adda;
    stim[55] = 64'h80bb6a154797e431;
    stim[56] = 64'h19f21133e703e4b8;
    stim[57] = 64'hfb8904332819b5fe;
    stim[58] = 64'h26c0336b8395cd38;
    stim[59] = 64'h0d304d3fd17a293e;
    stim[60] = 64'h1de70bc4c637851f;
    stim[61] = 64'hbd86db58a01d21db;
    stim[62] = 64'h2604c1900d088aa2;
    stim[63] = 64'h56381a99a205aba5;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h10eba7990;
      expv[1] = 33'h0facf5ac6;
      expv[2] = 33'h05e68b6dd;
      expv[3] = 33'h06511358e;
      expv[4] = 33'h0c9f4411e;
      expv[5] = 33'h095de8cfb;
      expv[6] = 33'h0cef61a30;
      expv[7] = 33'h14fa51628;
      expv[8] = 33'h10547b9d4;
      expv[9] = 33'h10a7c3d19;
      expv[10] = 33'h07b805e9b;
      expv[11] = 33'h0da7f25f7;
      expv[12] = 33'h166d3488b;
      expv[13] = 33'h11f545d5a;
      expv[14] = 33'h0cf5893e2;
      expv[15] = 33'h14a25a00c;
      expv[16] = 33'h0cec01027;
      expv[17] = 33'h125c5730a;
      expv[18] = 33'h1442bd8bd;
      expv[19] = 33'h129565b86;
      expv[20] = 33'h062da192e;
      expv[21] = 33'h111f50b03;
      expv[22] = 33'h103279d15;
      expv[23] = 33'h1a2ebd2be;
      expv[24] = 33'h10d0bb3ab;
      expv[25] = 33'h1364b412b;
      expv[26] = 33'h1143965de;
      expv[27] = 33'h15ee1a8ff;
      expv[28] = 33'h16d85dc24;
      expv[29] = 33'h0df97fac0;
      expv[30] = 33'h150279adc;
      expv[31] = 33'h0bc77e78c;
      expv[32] = 33'h0fce6eb19;
      expv[33] = 33'h15dde1592;
      expv[34] = 33'h0fa09e171;
      expv[35] = 33'h1e5032201;
      expv[36] = 33'h151181b8c;
      expv[37] = 33'h1dc69ed35;
      expv[38] = 33'h0cf352a1b;
      expv[39] = 33'h0a033c47c;
      expv[40] = 33'h1846f4418;
      expv[41] = 33'h10df6761f;
      expv[42] = 33'h0a07033a1;
      expv[43] = 33'h0f9c58cc3;
      expv[44] = 33'h1c132a48b;
      expv[45] = 33'h04ff4442b;
      expv[46] = 33'h14892c488;
      expv[47] = 33'h0f2615212;
      expv[48] = 33'h135c3b559;
      expv[49] = 33'h15fbb63ea;
      expv[50] = 33'h103428345;
      expv[51] = 33'h1374a4829;
      expv[52] = 33'h1928bd6fb;
      expv[53] = 33'h07d8ec0f9;
      expv[54] = 33'h0f4b299c6;
      expv[55] = 33'h0c8534e46;
      expv[56] = 33'h100f5f5eb;
      expv[57] = 33'h123a2ba31;
      expv[58] = 33'h0aa5600a3;
      expv[59] = 33'h0deaa767d;
      expv[60] = 33'h0e41e90e3;
      expv[61] = 33'h15da3fd33;
      expv[62] = 33'h0330d4c32;
      expv[63] = 33'h0f83dc63e;
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
