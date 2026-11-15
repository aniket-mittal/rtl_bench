// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024128 dut (
    .sys_clk(clk),
    .sys_nrst(in_vec[129:129]),
    .init_done(in_vec[128:128]),
    .dac_din_l0(in_vec[127:112]),
    .dac_din_r0(in_vec[111:96]),
    .dac_din_l1(in_vec[95:80]),
    .dac_din_r1(in_vec[79:64]),
    .dac_din_l2(in_vec[63:48]),
    .dac_din_r2(in_vec[47:32]),
    .dac_din_l3(in_vec[31:16]),
    .dac_din_r3(in_vec[15:0]),
    .DAC_SDOUT_CH0(out_vec[5:5]),
    .DAC_SDOUT_CH1(out_vec[4:4]),
    .DAC_SDOUT_CH2(out_vec[3:3]),
    .DAC_SDOUT_CH3(out_vec[2:2]),
    .DAC_SCLK(out_vec[1:1]),
    .DAC_LRCK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h3181bc6ac17ebb9552052e3da6298f082;
    stim[1] = 130'h2350d81fe6d8195a83fbcee29571236a0;
    stim[2] = 130'h189df2275e6a9916afbffb0f417527cb4;
    stim[3] = 130'h128432de3ba20739975de9832f72eaa75;
    stim[4] = 130'h1dedb95d4d428cbad6ff1c29e040a83a7;
    stim[5] = 130'h0e7a0248fd2604be18f7caf1439f214a2;
    stim[6] = 130'h15f3397a1d47c4276402d6f7106877aca;
    stim[7] = 130'h16501d840fb1870b208b7da2fa504c934;
    stim[8] = 130'h13c5b2c23a3abf06b8579ddcaba482782;
    stim[9] = 130'h03227328068befa0d79a1bf481e825c94;
    stim[10] = 130'h0b4690725d1be75ae6e9a0a1c9171ec32;
    stim[11] = 130'h0e6002288e96c16867e47e2058a00bb0c;
    stim[12] = 130'h1395a0133547e86e53e5a645190f92027;
    stim[13] = 130'h0657837f0811d533c0cc5192735f06e79;
    stim[14] = 130'h0613019cf15136e9c61235f29e6b5462a;
    stim[15] = 130'h09927b77d35b6fb1f36d7d1ea28bb9eee;
    stim[16] = 130'h0bcf08490fb88ed388ec8b789468974ed;
    stim[17] = 130'h196f1a078b0d5db0d3ea37ce982924d11;
    stim[18] = 130'h0a6df1254962cab25ec23e198429725c9;
    stim[19] = 130'h07d74d6dc668ddfbf34b99a1da4614d1b;
    stim[20] = 130'h1e107f1fe806f6738e2eb4315daf77380;
    stim[21] = 130'h0098e26b2e65110b14e22b61611433395;
    stim[22] = 130'h06c8111ac405d5c049cb7d7d6ecb55332;
    stim[23] = 130'h0e03d838fbec14d60924c092a2873d1ae;
    stim[24] = 130'h1bed5ae5aa7e34f0eece25043761006e2;
    stim[25] = 130'h1741d6209778ac3930d02ec91d14fda88;
    stim[26] = 130'h1858a53b307a545da17cba643c47b7158;
    stim[27] = 130'h05298955e5bafe98f640b193f3e227f10;
    stim[28] = 130'h009a666d4b7151cad7f49cba951ad8a19;
    stim[29] = 130'h1ffabc6793e33722208e24592d4326477;
    stim[30] = 130'h138b5a1d5733d25b408db7ac124acce56;
    stim[31] = 130'h017fd170ccb7211ffb2b8a1595f6273c2;
    stim[32] = 130'h047413e130538aad2d79b00f629dc066e;
    stim[33] = 130'h1da4bad46fc8fd5192ef644889c1de005;
    stim[34] = 130'h0ef165d57f98b80c5889317f21f49993a;
    stim[35] = 130'h02b545939c56f8e0044455321625c6e1b;
    stim[36] = 130'h0f4b9d6461fedaae84a8e654219e76ce0;
    stim[37] = 130'h0fafbf461f39269d8cc42385797dab960;
    stim[38] = 130'h1501bd1b11a91d4a28e1ae2876f528275;
    stim[39] = 130'h10c43f1433f456847834c7749c79d33de;
    stim[40] = 130'h12fc116460c0fb76f8ebcddf8b60487c7;
    stim[41] = 130'h1199b9cfe6e7385720f6361909fdc5fb5;
    stim[42] = 130'h107acec089c7f28374ac1485a678c0a90;
    stim[43] = 130'h0bb2f1ac51d46b21776ac15526769d788;
    stim[44] = 130'h04e4fc80e28dad46868bb3ddc5106a038;
    stim[45] = 130'h0e46489d5929485dc3064fcb2e1fd2c3a;
    stim[46] = 130'h151200f471f5e9edbba0db2c6dc96ef7b;
    stim[47] = 130'h0e7cfd3b20728a5c31380b5685075f864;
    stim[48] = 130'h123bff112ec9cb6286d0e2be53746074b;
    stim[49] = 130'h1fee389d08d97656b7709cabdca668e48;
    stim[50] = 130'h09a1b9e1734ac4de65e6e98cc0af9ef21;
    stim[51] = 130'h1e65fa505c4c69a57e1ef8194f8b40ba8;
    stim[52] = 130'h1cc01585ec78ffccdd27f15e196f42748;
    stim[53] = 130'h113bf0d02e979eeba3483c0585ed911fd;
    stim[54] = 130'h0a7377c33d497fa71110d9d9aabe4b59c;
    stim[55] = 130'h04694d20ca65fc3705b7682a28fe56f49;
    stim[56] = 130'h17d12e557151d6b9eaa6a04c1e95a5252;
    stim[57] = 130'h1b1799b0412abd0b5ade8bb2cef34e6b7;
    stim[58] = 130'h03427ef30999658eed1a5c142192f3c25;
    stim[59] = 130'h026ac7c45936cb511def45efc7e12ae33;
    stim[60] = 130'h0261eaee58114012b4a038a8fe595edc7;
    stim[61] = 130'h19abc8d837def55cc3981796908b26910;
    stim[62] = 130'h1b0bd7147d13213248bf79da1f1d8cfff;
    stim[63] = 130'h16f2733add10cb4acf27b4e2c94d920e8;
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
      expv[0] = 6'hxx;
      expv[1] = 6'hxx;
      expv[2] = 6'hxx;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
