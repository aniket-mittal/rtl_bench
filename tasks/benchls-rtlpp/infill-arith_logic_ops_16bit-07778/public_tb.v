// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 145;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07778 dut (
    .CLK(clk),
    .A(in_vec[33:18]),
    .AVALID(in_vec[17:17]),
    .B(in_vec[16:1]),
    .BVALID(in_vec[0:0]),
    .AND_OUT(out_vec[144:129]),
    .OR_OUT(out_vec[128:113]),
    .XOR_OUT(out_vec[112:97]),
    .D(out_vec[96:81]),
    .S(out_vec[80:65]),
    .P(out_vec[64:33]),
    .Q(out_vec[32:1]),
    .QVALID(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3a5ccd3af;
    stim[1] = 34'h100f8795e;
    stim[2] = 34'h2c764f031;
    stim[3] = 34'h2426d425a;
    stim[4] = 34'h0ba13fda7;
    stim[5] = 34'h1e503e214;
    stim[6] = 34'h318df67dd;
    stim[7] = 34'h3f1aa0e63;
    stim[8] = 34'h146ce06e8;
    stim[9] = 34'h2b2395794;
    stim[10] = 34'h287477efc;
    stim[11] = 34'h3c48a5b02;
    stim[12] = 34'h03bd84d8c;
    stim[13] = 34'h20a1f84e0;
    stim[14] = 34'h3018ab07f;
    stim[15] = 34'h38b66848b;
    stim[16] = 34'h24415c91b;
    stim[17] = 34'h179cf03b9;
    stim[18] = 34'h258fd43fc;
    stim[19] = 34'h17e00d4a0;
    stim[20] = 34'h3e8bcd8a7;
    stim[21] = 34'h11db1ccb6;
    stim[22] = 34'h1df7bb67e;
    stim[23] = 34'h1cde705e4;
    stim[24] = 34'h1ba599532;
    stim[25] = 34'h1efc47795;
    stim[26] = 34'h19f942d0c;
    stim[27] = 34'h0adee0b85;
    stim[28] = 34'h0faca85d3;
    stim[29] = 34'h0c72384c3;
    stim[30] = 34'h25ac0662c;
    stim[31] = 34'h2e336aff5;
    stim[32] = 34'h0cc9f1e4f;
    stim[33] = 34'h1c13628cc;
    stim[34] = 34'h3c987c29b;
    stim[35] = 34'h048cf7ff2;
    stim[36] = 34'h2dfb1c2ce;
    stim[37] = 34'h33597545d;
    stim[38] = 34'h0e2b17f8b;
    stim[39] = 34'h270ca4ad7;
    stim[40] = 34'h2669d33a7;
    stim[41] = 34'h37058e93e;
    stim[42] = 34'h032fa0d1f;
    stim[43] = 34'h1076da218;
    stim[44] = 34'h05165cda4;
    stim[45] = 34'h01d16ed16;
    stim[46] = 34'h166cb4a01;
    stim[47] = 34'h3f158c41e;
    stim[48] = 34'h3551740e5;
    stim[49] = 34'h14f45f453;
    stim[50] = 34'h189f4c839;
    stim[51] = 34'h1b28ace8e;
    stim[52] = 34'h00c81966f;
    stim[53] = 34'h22663e683;
    stim[54] = 34'h1e6011a4f;
    stim[55] = 34'h3a616120a;
    stim[56] = 34'h3f4398aa1;
    stim[57] = 34'h04b4e6877;
    stim[58] = 34'h15e35e50e;
    stim[59] = 34'h212f34b5f;
    stim[60] = 34'h146bdf32c;
    stim[61] = 34'h38155e614;
    stim[62] = 34'h29f482dbb;
    stim[63] = 34'h372c8a6b4;
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
      expv[0] = 145'h0d2a7d3ef0148a694a69xxxxxxxxxxxxxxxxx;
      expv[1] = 145'h0005cf97ef922f9daf9dac108752a00000005;
      expv[2] = 145'h06031f3b3938253e253e21e74e4c400000000;
      expv[3] = 145'h10013637e636c63906390a6dcc8b000000003;
      expv[4] = 145'h05d01fdafa0ae5aae5aaeb615cc7e00000000;
      expv[5] = 145'h0e201f2951094d494d4945c9a9d9800000001;
      expv[6] = 145'h1044deffeebb2f44af44ae453f90000000000;
      expv[7] = 145'h00841fef7f6b60736073716a1784400000003;
      expv[8] = 145'h00260a7eea58eaa4eaa4e0e2e6c9400000047;
      expv[9] = 145'h151155f9c0e88b0b0b0b002343c3800000000;
      expv[10] = 145'h142a17ffe3d5ec29ec29ee796041800000000;
      expv[11] = 145'h04201fb47b9463d463d46f21527bc00000000;
      expv[12] = 145'h00d8c5dec50606b786b7855b8f84400000000;
      expv[13] = 145'h1040185ee81ee89ee89ee04882c8800000000;
      expv[14] = 145'h08045b0ff30ba31423142c646d22000000000;
      expv[15] = 145'h08483c5bb41384a3c4a3c84a2103c00000005;
      expv[16] = 145'h1000beb1aeb10eb24eb2475722cfa00000007;
      expv[17] = 145'h000a1bfffbf5fc09fc09f02f0a78200000001;
      expv[18] = 145'h1007d6ffe6f82707a707a5fd23ba800000001;
      expv[19] = 145'h09400ffa06ba193a193a0be25630400000000;
      expv[20] = 145'h0d007fcff2cf8cd04cd044f51b00000000000;
      expv[21] = 145'h08c91ceff426e5b8e5b8ed3b9e27a00000005;
      expv[22] = 145'h0a63dffff59c2a63aa63a8088d6c800000000;
      expv[23] = 145'h004e1e7f7e317ecd7ecd6cd50d34400000000;
      expv[24] = 145'h09521dd3f481e725e725e762134c400000000;
      expv[25] = 145'h07780f7f680776f776f76af08e74c00000000;
      expv[26] = 145'h00d08efcee2c6fcd6fcd639e4ae5400000005;
      expv[27] = 145'h002845ff65d72627a627a12481fbc00000000;
      expv[28] = 145'h00540fdf6f8b70337033601f4b46c0000000f;
      expv[29] = 145'h00081e7d3e753e853e85220c5e80400000001;
      expv[30] = 145'h024216f6d4b4d938d938c4b98d99000000001;
      expv[31] = 145'h02191ffffde6e218e218e3c24064000000000;
      expv[32] = 145'h0064f7e4f7801849d849c7f04466400000005;
      expv[33] = 145'h02088e8dec85709670966393527e200000001;
      expv[34] = 145'h1c083e6da2659a75da75c11e5855c00000000;
      expv[35] = 145'h024637ff75b95a459a459aaa0505a00000003;
      expv[36] = 145'h142c9efdead1732a732a61b4b813600000000;
      expv[37] = 145'h11049dedece96ef26ef2743e0d7e800000000;
      expv[38] = 145'h071097fdb0ed3f0e3f0e31113f44c00000003;
      expv[39] = 145'h008457af772b3833b833a54e7e0b800000001;
      expv[40] = 145'h1330733ee00e866f466f42da905cc00000009;
      expv[41] = 145'h0a82df93f5112a16aa16ab8a6e74a00000001;
      expv[42] = 145'h0091c1d7e1462269a269ac885535400000000;
      expv[43] = 145'h08211a3bf21ae25ce25ce00a7244400000003;
      expv[44] = 145'h008a1edb7e517f657f6566b8dc28800000000;
      expv[45] = 145'h00c02ef9ee39cfba0fba024b14e0400000000;
      expv[46] = 145'h00201fb65f965fd65fd6406bb80ee00000000;
      expv[47] = 145'h0c00dfcbf3cb2bccabcca739f740000000001;
      expv[48] = 145'h10081eaeeea6eeb6eeb6ec14f6a1400000000;
      expv[49] = 145'h0a403f7f353f09bf49bf50b54317400000003;
      expv[50] = 145'h0c038ccfa0cc38d338d32a3cf0cf200000001;
      expv[51] = 145'h0c804dfce17cba7d3a7d24d07335800000001;
      expv[52] = 145'h00641966f902f9caf9cae57a69ddc00000000;
      expv[53] = 145'h10201f7b2f5b2f9b2f9b204f617c000000001;
      expv[54] = 145'h01201fb4fe94e0d4e0d4f057c6f3000000001;
      expv[55] = 145'h0120bd30bc101e515e51485fc050000000001;
      expv[56] = 145'h18a01fabc70bd84bd84bc1074793200000000;
      expv[57] = 145'h020266df64dd08e1c8e1d8615b4c000000003;
      expv[58] = 145'h0a50bef1f4a149428942807ae654200000001;
      expv[59] = 145'h109594b7e422654d654d6a5e2eab600000000;
      expv[60] = 145'h0a30df37f5072968a968aabcfd10800000001;
      expv[61] = 145'h1c001e6be26bfa6bfa6be9f46271400000000;
      expv[62] = 145'h00da16fbf621f7d5f7d5fa9f2e4a400000000;
      expv[63] = 145'h0a025bff51fd0601860181df9d8940000000f;
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
