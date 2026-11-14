// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 138;
  localparam OW = 136;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05942 dut (
    .clk(clk),
    .rst(in_vec[137:137]),
    .stall(in_vec[136:136]),
    .ex_aluresult(in_vec[135:104]),
    .ex_td(in_vec[103:99]),
    .ex_d2(in_vec[98:67]),
    .ex_WREG(in_vec[66:66]),
    .ex_WMEM(in_vec[65:65]),
    .ex_LW(in_vec[64:64]),
    .ex_instr(in_vec[63:32]),
    .ex_pc(in_vec[31:0]),
    .me_aluresult(out_vec[135:104]),
    .me_td(out_vec[103:99]),
    .me_d2(out_vec[98:67]),
    .me_WREG(out_vec[66:66]),
    .me_WMEM(out_vec[65:65]),
    .me_LW(out_vec[64:64]),
    .me_instr(out_vec[63:32]),
    .me_pc(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 138'h2ed33db84117b33bf17c4a67be0f1613804;
    stim[1] = 138'h38372ce9b806a9074489c8a8dc94da00bb4;
    stim[2] = 138'h1d041f3fabb1f7095420ed0f95fa98b7c3b;
    stim[3] = 138'h07f15660f3791605a9576e8899187541627;
    stim[4] = 138'h09dbcfaa9c85ea3187afa26238024fb6a61;
    stim[5] = 138'h04a67b1bf20656f0f8767af3d3f1008078f;
    stim[6] = 138'h0262ce11630a1bfbf8703a318af1ee0e6a1;
    stim[7] = 138'h0e85b5cdafd762163dd9e0db286cbf20501;
    stim[8] = 138'h0031c9a025911cb5369230581ebc40e33d4;
    stim[9] = 138'h03633ca38e67bda56fcde00bc1c40b6ea53;
    stim[10] = 138'h15c6c90d77420284be90165661d5d6d7561;
    stim[11] = 138'h1413d2a76aee16c3a45026a071093bf9ccc;
    stim[12] = 138'h16b0eecbeb3804c6144229706878ab63dd6;
    stim[13] = 138'h0494ec00f2d3c6a09988984bcc70c6cd956;
    stim[14] = 138'h0f8beedebeec5556c470ba05d3501c3106c;
    stim[15] = 138'h1d6b1b4d72f552ee5b4bcef6a525d43674b;
    stim[16] = 138'h06cd97f322a3ad5135d294539972f616d76;
    stim[17] = 138'h0849ddd10f98c9c503db026f1e67a2a9ff9;
    stim[18] = 138'h120d4d0c4ac4252c9707341498410113cd0;
    stim[19] = 138'h0c6750861f98c5859a9415229632e60aba9;
    stim[20] = 138'h17d4b39527713345937db13059d8594aa4a;
    stim[21] = 138'h0558022c3ccabf30659ce33959413534753;
    stim[22] = 138'h008a3755a1bbb66a3f0d84e77e6b9f61344;
    stim[23] = 138'h1b6319cc79a1a965ecd7866ca5111dde997;
    stim[24] = 138'h156bbd1636fec15cc8cd48b9cf449bdea26;
    stim[25] = 138'h1a198358d36ff23b12c466bc635bbfa161c;
    stim[26] = 138'h16df161681e47d14db81774b3c55aff8311;
    stim[27] = 138'h0007555fee9e6a9793153f1c7a581e2212c;
    stim[28] = 138'h0dd18d82cfe9aeb961b91b1ce8d602586b1;
    stim[29] = 138'h0d4491e01216adf7b0ba1bea3b5cf27430f;
    stim[30] = 138'h0f80a1441a278ec80a81c9b58a52c753e35;
    stim[31] = 138'h27c9876eec652f2a842d6493e4de463cb00;
    stim[32] = 138'h1549c8ae0a1c28377a990a5787fc531fd01;
    stim[33] = 138'h1ab9f31c30eb0d274faf28be03abcd84693;
    stim[34] = 138'h1f9c79f6f6ed2c6b7b68bb3c15e83e4565f;
    stim[35] = 138'h1e939e4ea7aa521013e152a297bd3af49da;
    stim[36] = 138'h046572c79103583a66fdc3a01de7a85f5d4;
    stim[37] = 138'h0827b885166fe8ee49e963fcb79050b18d6;
    stim[38] = 138'h03ed5cdc7c737ee3583917a279be208f704;
    stim[39] = 138'h0842541db8c0477f6fd5429e47a659533d5;
    stim[40] = 138'h12a7c98d5f06bfc053f1531bfe538a7fd64;
    stim[41] = 138'h00aaa85f792597c12eec347d2142762b521;
    stim[42] = 138'h02881d048f379ed0f2e7784573c5e515072;
    stim[43] = 138'h02696fcac256cd933ded6b3fa9ec24cb8c9;
    stim[44] = 138'h1ec80eace52525fa10d4b22420e7f2a8e56;
    stim[45] = 138'h00d1534e23785698863c1ac2bce09913745;
    stim[46] = 138'h11fc536836a1a7fc820e112ce116137860f;
    stim[47] = 138'h055bc2fa7ee9631a9cf71b3c425b570f427;
    stim[48] = 138'h09424aabddd28e3d519e1253485bbf0e778;
    stim[49] = 138'h107e0f7d965ee8484746e1a77c380ddc580;
    stim[50] = 138'h071755dfd68c79b746c5eb83699d2cf050a;
    stim[51] = 138'h143a050f191227caf4d0092bab9240d332a;
    stim[52] = 138'h19a51063ef99ebf5b8ebbd9f8a4f2f1847a;
    stim[53] = 138'h1899afb0d80249e13469c073f16ffb7916c;
    stim[54] = 138'h0bf2acccb97270079b7c365cb3d63238b9d;
    stim[55] = 138'h1ea3b5206a18935254faedc732ef50b0229;
    stim[56] = 138'h1f34b9a8633426d700d25fb4723a9fa678e;
    stim[57] = 138'h0baa65c2a643ff15774dad87f2e3cbe344a;
    stim[58] = 138'h04c64a96dcd913ad41c8df67116a9b5736a;
    stim[59] = 138'h1b77d49b5f032033f0269143d1b1ccdab84;
    stim[60] = 138'h17ed56c3adbc16c6d701c3dc1494ce19e11;
    stim[61] = 138'h119f93c6b767dc73c184498e1ba6aefd0bc;
    stim[62] = 138'h0649b5ead7afdd438460b1870e9c8174c2a;
    stim[63] = 138'h18ca89aa5b5ec36c2fd9d4beb008112572b;
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
      expv[0] = 136'h0000000000000000000000002000000000;
      expv[1] = 136'h0000000000000000000000002000000000;
      expv[2] = 136'h0000000000000000000000002000000000;
      expv[3] = 136'h00000000000000000000000020a98b7c3b;
      expv[4] = 136'h7f15660f3791605a9576e8899187541627;
      expv[5] = 136'h9dbcfaa9c85ea3187afa26238024fb6a61;
      expv[6] = 136'h4a67b1bf20656f0f8767af3d3f1008078f;
      expv[7] = 136'h262ce11630a1bfbf8703a318af1ee0e6a1;
      expv[8] = 136'he85b5cdafd762163dd9e0db286cbf20501;
      expv[9] = 136'h031c9a025911cb5369230581ebc40e33d4;
      expv[10] = 136'h3633ca38e67bda56fcde00bc1c40b6ea53;
      expv[11] = 136'h000000000000000000000000205d6d7561;
      expv[12] = 136'h0000000000000000000000002093bf9ccc;
      expv[13] = 136'h000000000000000000000000208ab63dd6;
      expv[14] = 136'h494ec00f2d3c6a09988984bcc70c6cd956;
      expv[15] = 136'hf8beedebeec5556c470ba05d3501c3106c;
      expv[16] = 136'h000000000000000000000000205d43674b;
      expv[17] = 136'h6cd97f322a3ad5135d294539972f616d76;
      expv[18] = 136'h849ddd10f98c9c503db026f1e67a2a9ff9;
      expv[19] = 136'h0000000000000000000000002010113cd0;
      expv[20] = 136'hc6750861f98c5859a9415229632e60aba9;
      expv[21] = 136'h000000000000000000000000208594aa4a;
      expv[22] = 136'h558022c3ccabf30659ce33959413534753;
      expv[23] = 136'h08a3755a1bbb66a3f0d84e77e6b9f61344;
      expv[24] = 136'h0000000000000000000000002011dde997;
      expv[25] = 136'h0000000000000000000000002049bdea26;
      expv[26] = 136'h00000000000000000000000020bbfa161c;
      expv[27] = 136'h000000000000000000000000205aff8311;
      expv[28] = 136'h007555fee9e6a9793153f1c7a581e2212c;
      expv[29] = 136'hdd18d82cfe9aeb961b91b1ce8d602586b1;
      expv[30] = 136'hd4491e01216adf7b0ba1bea3b5cf27430f;
      expv[31] = 136'h0000000000000000000000002000000000;
      expv[32] = 136'h0000000000000000000000002000000000;
      expv[33] = 136'h00000000000000000000000020c531fd01;
      expv[34] = 136'h00000000000000000000000020bcd84693;
      expv[35] = 136'h0000000000000000000000002083e4565f;
      expv[36] = 136'h00000000000000000000000020d3af49da;
      expv[37] = 136'h46572c79103583a66fdc3a01de7a85f5d4;
      expv[38] = 136'h827b885166fe8ee49e963fcb79050b18d6;
      expv[39] = 136'h3ed5cdc7c737ee3583917a279be208f704;
      expv[40] = 136'h842541db8c0477f6fd5429e47a659533d5;
      expv[41] = 136'h0000000000000000000000002038a7fd64;
      expv[42] = 136'h0aaa85f792597c12eec347d2142762b521;
      expv[43] = 136'h2881d048f379ed0f2e7784573c5e515072;
      expv[44] = 136'h2696fcac256cd933ded6b3fa9ec24cb8c9;
      expv[45] = 136'h000000000000000000000000207f2a8e56;
      expv[46] = 136'h0d1534e23785698863c1ac2bce09913745;
      expv[47] = 136'h000000000000000000000000206137860f;
      expv[48] = 136'h55bc2fa7ee9631a9cf71b3c425b570f427;
      expv[49] = 136'h9424aabddd28e3d519e1253485bbf0e778;
      expv[50] = 136'h0000000000000000000000002080ddc580;
      expv[51] = 136'h71755dfd68c79b746c5eb83699d2cf050a;
      expv[52] = 136'h00000000000000000000000020240d332a;
      expv[53] = 136'h00000000000000000000000020f2f1847a;
      expv[54] = 136'h00000000000000000000000020ffb7916c;
      expv[55] = 136'hbf2acccb97270079b7c365cb3d63238b9d;
      expv[56] = 136'h00000000000000000000000020f50b0229;
      expv[57] = 136'h00000000000000000000000020a9fa678e;
      expv[58] = 136'hbaa65c2a643ff15774dad87f2e3cbe344a;
      expv[59] = 136'h4c64a96dcd913ad41c8df67116a9b5736a;
      expv[60] = 136'h000000000000000000000000201ccdab84;
      expv[61] = 136'h000000000000000000000000204ce19e11;
      expv[62] = 136'h000000000000000000000000206aefd0bc;
      expv[63] = 136'h649b5ead7afdd438460b1870e9c8174c2a;
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
