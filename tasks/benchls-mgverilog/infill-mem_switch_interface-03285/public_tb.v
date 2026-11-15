// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 109;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03285 dut (
    .clk(clk),
    .rst(in_vec[108:108]),
    .ie(in_vec[107:107]),
    .de(in_vec[106:106]),
    .iaddr(in_vec[105:74]),
    .daddr(in_vec[73:42]),
    .drw(in_vec[41:40]),
    .din(in_vec[39:8]),
    .switches(in_vec[7:0]),
    .iout(out_vec[63:32]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 109'h137baaa9cc73b4b30fdf02197f06;
    stim[1] = 109'h10947bf91768aa4c8cafc5569443;
    stim[2] = 109'h0ab51fba952fdd0678db2a1a8315;
    stim[3] = 109'h01f748c6f23bc2bc9a05614a5409;
    stim[4] = 109'h0bd765375880cfa93672467bfe87;
    stim[5] = 109'h0732586014a1893c520f3bb9a62d;
    stim[6] = 109'h04f3b78d1f0f37fa9f482cc10e08;
    stim[7] = 109'h02dbe7a14c0f0388aeafbbb5ebf6;
    stim[8] = 109'h04c5c0f2d3fe9110c7b6f1e32e69;
    stim[9] = 109'h0a179fa6d83bbab5db72c8bd0192;
    stim[10] = 109'h0eb96167e655ec7841a3ed302572;
    stim[11] = 109'h0518a80e59628f83550e8da326b3;
    stim[12] = 109'h00f2d76db61a5cc8466bc254ec82;
    stim[13] = 109'h09f08b344060425064e180d76790;
    stim[14] = 109'h0037f01490fc4137b48e49cbceec;
    stim[15] = 109'h036f5acdc0b1d345d9ea87a202ce;
    stim[16] = 109'h07f74259e3bb22b3b11a6880a99a;
    stim[17] = 109'h0b3f347f008db1e8aef2e9c00b70;
    stim[18] = 109'h01a3627cae636a57b5233f5a4bca;
    stim[19] = 109'h172ba43e15df0eee0fa0cccfe11b;
    stim[20] = 109'h0ad1448b52416438fa520bb72495;
    stim[21] = 109'h0be3691e93ec198631b29b1e506e;
    stim[22] = 109'h07693fb5a4b8b1641e23e7ba2d16;
    stim[23] = 109'h0fabe3bd88206420f04d3ac4c421;
    stim[24] = 109'h09bdc664a0c7e1311fd83ef5f693;
    stim[25] = 109'h0cb60d7d54fb8b0e66eb107282e0;
    stim[26] = 109'h04a9e45e7fbfffc55094fb15c545;
    stim[27] = 109'h0828ad69248cc5aabbc9e9cd3415;
    stim[28] = 109'h04b9540ccc0d037d72fb61cb896a;
    stim[29] = 109'h0b83e47ae71f50ad68ae2baaa929;
    stim[30] = 109'h017d0998ed913ab3c1cc1f1e946f;
    stim[31] = 109'h0d915a9ad39f7f4ecd6e5a90580d;
    stim[32] = 109'h0321109cfb29331e20402e55dafa;
    stim[33] = 109'h002f8adb2f7e81ec09348e5d1b6f;
    stim[34] = 109'h07968ce11f8cc6f31ff0352b9fda;
    stim[35] = 109'h00ab5d1cb4be3da17e69004c0913;
    stim[36] = 109'h02bbde279bc64ebd59e6eb7c463a;
    stim[37] = 109'h0ac0ae2ec59031aa446c71705e52;
    stim[38] = 109'h0ddf6ea177c5937ce0edafb664ba;
    stim[39] = 109'h0d9659fe60886c3a858e9c7c6f37;
    stim[40] = 109'h01d60e5cc53147bd9239b8981dc5;
    stim[41] = 109'h10df6093a6811fd38133dc179a91;
    stim[42] = 109'h0fef8adbdce91c8408ebb1e53ed8;
    stim[43] = 109'h045a685729f6a28e109d7c00330e;
    stim[44] = 109'h0b094bf67bb215ff7340caa209f4;
    stim[45] = 109'h05b98cf8165eeacc39e43767a64a;
    stim[46] = 109'h060dc6deff02cf4dae0bf94c5055;
    stim[47] = 109'h0b8ca9aed86c2a5c5c8d3ba622d8;
    stim[48] = 109'h0772311a77d1fd93f01e0c1cb00f;
    stim[49] = 109'h0573c7251b2eb190795df11ed0ef;
    stim[50] = 109'h04c50a229c7ffcdad0a39e59094f;
    stim[51] = 109'h048d7db00732054a18094946e7cb;
    stim[52] = 109'h0f51723b68da3d461360540f864f;
    stim[53] = 109'h08d4306b95ba0f45d619218407a3;
    stim[54] = 109'h006f303f0c812d550b5a609c029b;
    stim[55] = 109'h0e98433af2a6914f8c6731528779;
    stim[56] = 109'h001f958548b0600176659241954f;
    stim[57] = 109'h04256b39cdcfc108751ab6c832ea;
    stim[58] = 109'h00059a43143a8e964ecf66f217ec;
    stim[59] = 109'h071903a8a555bba6464984476aee;
    stim[60] = 109'h0c094705cabf451a5c7f7f82fc30;
    stim[61] = 109'h00ee0d3c93bb5c016dd0b1a99820;
    stim[62] = 109'h071615cc893c0a97049c8f9740e3;
    stim[63] = 109'h0ef23507696b7b0971f19cf5e717;
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
      expv[0] = 64'h0000000000000006;
      expv[1] = 64'h0000000000000043;
      expv[2] = 64'h0000000000000015;
      expv[3] = 64'h0000000000000009;
      expv[4] = 64'h0000000000000087;
      expv[5] = 64'h000000000000002d;
      expv[6] = 64'h0000000000000008;
      expv[7] = 64'h00000000000000f6;
      expv[8] = 64'h0000000000000069;
      expv[9] = 64'h0000000000000092;
      expv[10] = 64'h0000000000000072;
      expv[11] = 64'h00000000000000b3;
      expv[12] = 64'h0000000000000082;
      expv[13] = 64'h0000000000000090;
      expv[14] = 64'h00000000000000ec;
      expv[15] = 64'h00000000000000ce;
      expv[16] = 64'h000000000000009a;
      expv[17] = 64'h0000000000000070;
      expv[18] = 64'h00000000000000ca;
      expv[19] = 64'h000000000000001b;
      expv[20] = 64'h0000000000000095;
      expv[21] = 64'h000000000000006e;
      expv[22] = 64'h0000000000000016;
      expv[23] = 64'h0000000000000021;
      expv[24] = 64'h0000000000000093;
      expv[25] = 64'h00000000000000e0;
      expv[26] = 64'h0000000000000045;
      expv[27] = 64'h0000000000000015;
      expv[28] = 64'h000000000000006a;
      expv[29] = 64'h0000000000000029;
      expv[30] = 64'h000000000000006f;
      expv[31] = 64'h000000000000000d;
      expv[32] = 64'h00000000000000fa;
      expv[33] = 64'h000000000000006f;
      expv[34] = 64'h00000000000000da;
      expv[35] = 64'h0000000000000013;
      expv[36] = 64'h000000000000003a;
      expv[37] = 64'h0000000000000052;
      expv[38] = 64'h00000000000000ba;
      expv[39] = 64'h0000000000000037;
      expv[40] = 64'h00000000000000c5;
      expv[41] = 64'h0000000000000091;
      expv[42] = 64'h00000000000000d8;
      expv[43] = 64'h000000000000000e;
      expv[44] = 64'h00000000000000f4;
      expv[45] = 64'h000000000000004a;
      expv[46] = 64'h0000000000000055;
      expv[47] = 64'h00000000000000d8;
      expv[48] = 64'h000000000000000f;
      expv[49] = 64'h00000000000000ef;
      expv[50] = 64'h000000000000004f;
      expv[51] = 64'h00000000000000cb;
      expv[52] = 64'h000000000000004f;
      expv[53] = 64'h00000000000000a3;
      expv[54] = 64'h000000000000009b;
      expv[55] = 64'h0000000000000079;
      expv[56] = 64'h000000000000004f;
      expv[57] = 64'h00000000000000ea;
      expv[58] = 64'h00000000000000ec;
      expv[59] = 64'h00000000000000ee;
      expv[60] = 64'h0000000000000030;
      expv[61] = 64'h0000000000000020;
      expv[62] = 64'h00000000000000e3;
      expv[63] = 64'h0000000000000017;
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
