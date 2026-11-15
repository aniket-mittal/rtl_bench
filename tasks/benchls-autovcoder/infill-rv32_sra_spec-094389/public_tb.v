// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 161;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094389 dut (
    .rvfi_valid(in_vec[160:160]),
    .rvfi_insn(in_vec[159:128]),
    .rvfi_pc_rdata(in_vec[127:96]),
    .rvfi_rs1_rdata(in_vec[95:64]),
    .rvfi_rs2_rdata(in_vec[63:32]),
    .rvfi_mem_rdata(in_vec[31:0]),
    .spec_valid(out_vec[152:152]),
    .spec_trap(out_vec[151:151]),
    .spec_rs1_addr(out_vec[150:146]),
    .spec_rs2_addr(out_vec[145:141]),
    .spec_rd_addr(out_vec[140:136]),
    .spec_rd_wdata(out_vec[135:104]),
    .spec_pc_wdata(out_vec[103:72]),
    .spec_mem_addr(out_vec[71:40]),
    .spec_mem_rmask(out_vec[39:36]),
    .spec_mem_wmask(out_vec[35:32]),
    .spec_mem_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 161'h027bcbeaf24079428d8837e2cd36a5131ac0b4e2d;
    stim[1] = 161'h1032478caa429abc063a42fcf064799adcea6cf49;
    stim[2] = 161'h1b350e5397f8d234917c6e730d7c06035525dd738;
    stim[3] = 161'h00242f88118e3f315cd5367840f27bae46fccfae9;
    stim[4] = 161'h085a769d4a5ee99ab0622fd31d2b430906532ed51;
    stim[5] = 161'h02442f796852c03967a95dddca3f6bd591b0dbd72;
    stim[6] = 161'h1eb933a0ae8ef8f15dec63e67f2b24210a8ca5f48;
    stim[7] = 161'h05990e34a722e1450b0d236fc402ede782f60b9df;
    stim[8] = 161'h1fb1e5a7d4550a0cba654e723cbdc1e455ab7177d;
    stim[9] = 161'h1c11c0c3519c3d2430c78809b89d8e476af86b7fb;
    stim[10] = 161'h11fdb4c51cdd822b8b1754827f80f5be5ae95b251;
    stim[11] = 161'h052d0d1e55deac06b62c4971cab218e62703ed473;
    stim[12] = 161'h09a410f5a7ffa515f2a3da8e8f6c843ae112a6f90;
    stim[13] = 161'h067105d0a15e585b70dfd284241abf1f499d84d48;
    stim[14] = 161'h01dbb9532c3edb1da70333e8d72e16a371e2d8092;
    stim[15] = 161'h19a9167e21bc62e1bd6af1f02d42338c88ad6232a;
    stim[16] = 161'h14290b0cecd085632fa92ecf9bdfc45b12825aa29;
    stim[17] = 161'h06a8241b08c4cf075c2a37897cc4962aa7656a240;
    stim[18] = 161'h0683d6f0c81584423742f5bc46d42a584b49429e1;
    stim[19] = 161'h1de95d3419df92dc62e4aca1a6adae1a7897890da;
    stim[20] = 161'h1b42e0ce9ad7d4eea9e1e12f1da474f3debd550b9;
    stim[21] = 161'h10397dd383134a7d1e6d4f3b33276405079ee38ce;
    stim[22] = 161'h162f86d5723f2c2feec5e1b87621be731850e6a77;
    stim[23] = 161'h10cabe1b337db589fd84dbb6f3f0d701107f43330;
    stim[24] = 161'h12326ae83eb036b22360ca8b37fd3bb01c2cd69bd;
    stim[25] = 161'h1f32ecb86e4db18b2e60fe9b22a296dfbd630a786;
    stim[26] = 161'h190edc6caa4a4651df2c3269fb2ada24d07bea64c;
    stim[27] = 161'h12acee0d0169d893af16643aeb9aa45b687db82f8;
    stim[28] = 161'h08f2891266e2f3909edcd846f748227ea6ff15a09;
    stim[29] = 161'h16039ecf2e774bc615c8dcf60d705236231d21139;
    stim[30] = 161'h051e20da58ff5e677d4d5e53a3a5b11490ab84e87;
    stim[31] = 161'h112a68fc1d823b928cb5f48d430316beab30ecfe0;
    stim[32] = 161'h15d4f678b2168d4ad7f6cecefc86e8bb04062c3ac;
    stim[33] = 161'h1508da870069a424e8970e1e2c430fe044809971c;
    stim[34] = 161'h128b396aea4a92daf04f6e92ce2e7fd0a8fa358db;
    stim[35] = 161'h19857674a969b346d8fb886519492d3d75f313394;
    stim[36] = 161'h16e4580de56547cbab3ce0cd0c64b8a88d4995d3c;
    stim[37] = 161'h0174188fe90753161ba8bb3dfbb6f2073cddc0c49;
    stim[38] = 161'h1028d8ba163c6304d0e2d4ddd84d5346bacee6fae;
    stim[39] = 161'h02fe7db46ae0e92366aeb6c5bc0f049617dabc815;
    stim[40] = 161'h02516470088b1182944763977f0bc1933bee52259;
    stim[41] = 161'h0c4c00b7aaf6667a41b25f554586309cc26be5f30;
    stim[42] = 161'h1b43c316d2da738c41dd414c4462e5d39b5d4486b;
    stim[43] = 161'h030b222066727d66f6abcb59a2cfb16829a7af54b;
    stim[44] = 161'h0c24d94ee9408b67fd02b1ff64aa89e73b5659704;
    stim[45] = 161'h09b4c703dd46cb33d8da4bbbec2f30c4f8c40d903;
    stim[46] = 161'h148f0483cf8c6e720f5122ea626a8d6d8606389e3;
    stim[47] = 161'h18d579e69d36f33becbf794ba60fcf465cdd069cd;
    stim[48] = 161'h130ccdfe35ddb74cf8159821ce37d51a9b9126805;
    stim[49] = 161'h16c9c46d6d63f3fe2859930618fbaf74b91b6473d;
    stim[50] = 161'h04a9c292f6474b5faed2809d4d88fe379d356fe4c;
    stim[51] = 161'h056652c899ca05bc240a9a85cf3ba1fae8da58c44;
    stim[52] = 161'h113ccfca94e33372baa7f1d5744dd84ea5f745f3a;
    stim[53] = 161'h1471c86d85806222714cd53f4406d2bfbda3bf2c8;
    stim[54] = 161'h11bb59b80919b0bae5fef4783e099f63ceacbba6d;
    stim[55] = 161'h0e454f0343ffc12115572140b1a7c7f13d5592a28;
    stim[56] = 161'h04283979746e9bdd539dda6da19107c749e853b99;
    stim[57] = 161'h1f2d9b85dd9fc3c6e3566660eb950c91680b15b81;
    stim[58] = 161'h0fe8ca16b0673afb967ace3424a12953553cc1d7b;
    stim[59] = 161'h1c0dd41b670077e626787caf3d3a584f4daafb9c3;
    stim[60] = 161'h13455af3b8fc0c4ef10739f5c104eda4cbd9c8566;
    stim[61] = 161'h1ccb5af62a0b7fdb92d76c2c10a70cffbde7567be;
    stim[62] = 161'h0e713bacc9ce802a9cfe5604e454b055e3477ed6d;
    stim[63] = 161'h0259e2f6589865e927c1f20ca2dc09cea48938c34;
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
      expv[0] = 153'h0677dffffec412407942c000000000000000000;
      expv[1] = 153'h0225100031d21a429abc4000000000000000000;
      expv[2] = 153'h006aa000000be7f8d234d000000000000000000;
      expv[3] = 153'h01491fcd5367818e3f319000000000000000000;
      expv[4] = 153'h03b5300000622a5ee99af000000000000000000;
      expv[5] = 153'h0148f0000003d852c039a000000000000000000;
      expv[6] = 153'h01b34ffffdec6e8ef8f19000000000000000000;
      expv[7] = 153'h00726ffffffb0722e1454000000000000000000;
      expv[8] = 153'h07234fd32a7394550a0cf000000000000000000;
      expv[9] = 153'h062380000003119c3d247000000000000000000;
      expv[10] = 153'h05bb8fd8baa41cdd822bc000000000000000000;
      expv[11] = 153'h005a318b125c75deac06f000000000000000000;
      expv[12] = 153'h0089e0000a8f67ffa5163000000000000000000;
      expv[13] = 153'h0023a000000df15e585bb000000000000000000;
      expv[14] = 153'h05f6a000000e0c3edb1de000000000000000000;
      expv[15] = 153'h0092fffd6af1f1bc62e1f000000000000000000;
      expv[16] = 153'h00521fffffd49cd085636000000000000000000;
      expv[17] = 153'h01103fff0a8de8c4cf079000000000000000000;
      expv[18] = 153'h0687e0742f5bc81584427000000000000000000;
      expv[19] = 153'h02d26005c95949df92dca000000000000000000;
      expv[20] = 153'h07059fffffffcad7d4eee000000000000000000;
      expv[21] = 153'h03f3affffe6d43134a7d5000000000000000000;
      expv[22] = 153'h041fafffff62f23f2c302000000000000000000;
      expv[23] = 153'h05d43ffffec2637db58a3000000000000000000;
      expv[24] = 153'h0365d1b065459eb036b26000000000000000000;
      expv[25] = 153'h07657fffffffce4db18b6000000000000000000;
      expv[26] = 153'h06dcdffff9619a4a46521000000000000000000;
      expv[27] = 153'h07581ffffffc5169d893e000000000000000000;
      expv[28] = 153'h04642fffb73616e2f390d000000000000000000;
      expv[29] = 153'h04c79172373d8e774bc65000000000000000000;
      expv[30] = 153'h013dbffea6af28ff5e67b000000000000000000;
      expv[31] = 153'h0355ffff2d7d2d823b92c000000000000000000;
      expv[32] = 153'h07a8f00007f6c2168d4b1000000000000000000;
      expv[33] = 153'h06d10f8970e1e069a4252000000000000000000;
      expv[34] = 153'h01d6d00013dbaa4a92db3000000000000000000;
      expv[35] = 153'h038aeffffff1f969b3471000000000000000000;
      expv[36] = 153'h02c81ffb3ce0c56547cbe000000000000000000;
      expv[37] = 153'h00e91fffff75190753165000000000000000000;
      expv[38] = 153'h06d170001c5a963c63051000000000000000000;
      expv[39] = 153'h03fd63575b62dae0e923a000000000000000000;
      expv[40] = 153'h0322e0000088e88b1182d000000000000000000;
      expv[41] = 153'h001960001b25faf6667a8000000000000000000;
      expv[42] = 153'h060620000000e2da738c8000000000000000000;
      expv[43] = 153'h011641aaf2d666727d673000000000000000000;
      expv[44] = 153'h06c89fffffa059408b683000000000000000000;
      expv[45] = 153'h0628000000000d46cb341000000000000000000;
      expv[46] = 153'h001f0fffffff5f8c6e724000000000000000000;
      expv[47] = 153'h03ebcfe5fbca5d36f33c2000000000000000000;
      expv[48] = 153'h0659fffc0acc15ddb74d3000000000000000000;
      expv[49] = 153'h0612dfff0b326d63f3fe6000000000000000000;
      expv[50] = 153'h06132fffffff66474b5fe000000000000000000;
      expv[51] = 153'h028d9000102a69ca05bc6000000000000000000;
      expv[52] = 153'h06799ffea9fc74e33372f000000000000000000;
      expv[53] = 153'h0662d000000025806222b000000000000000000;
      expv[54] = 153'h02f7700000005919b0bb2000000000000000000;
      expv[55] = 153'h024a0000000003ffc1215000000000000000000;
      expv[56] = 153'h01d0f0000039d46e9bdd9000000000000000000;
      expv[57] = 153'h04db0000000d5d9fc3c72000000000000000000;
      expv[58] = 153'h065020000033d0673afbd000000000000000000;
      expv[59] = 153'h069a30000067870077e66000000000000000000;
      expv[60] = 153'h02cbe000107398fc0c4f3000000000000000000;
      expv[61] = 153'h02d7e00000005a0b7fdbd000000000000000000;
      expv[62] = 153'h01e35ffffffff9ce802ad000000000000000000;
      expv[63] = 153'h0733e001f07c889865e96000000000000000000;
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
