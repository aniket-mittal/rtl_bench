// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 83;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_197422 dut (
    .clk(clk),
    .rst_n(in_vec[96:96]),
    .aluout(in_vec[95:64]),
    .rd(in_vec[63:32]),
    .ram_rd(in_vec[31:0]),
    .ra(out_vec[82:77]),
    .wa(out_vec[76:71]),
    .wd(out_vec[70:39]),
    .td(out_vec[38:7]),
    .ram_we(out_vec[6:6]),
    .ram_ra(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h0aeea32f2be8fa9d24d2bdf16;
    stim[1] = 97'h0a6199b4f989b5875fac2f03d;
    stim[2] = 97'h110e78832e76afcde56e475f9;
    stim[3] = 97'h112fb9e9ec1560ee4c4018799;
    stim[4] = 97'h123bbe60c05b75d4576e3e10f;
    stim[5] = 97'h195a5447e4b3e39b8f8723c99;
    stim[6] = 97'h115385389352334a7d939f039;
    stim[7] = 97'h1b406634e0fac4a8788c0730e;
    stim[8] = 97'h132c18b07505b060334993a56;
    stim[9] = 97'h153be03cf646feadfcde577d1;
    stim[10] = 97'h1b5a374c0666a7709b4cd9858;
    stim[11] = 97'h1d5bf6e33860965876a743f80;
    stim[12] = 97'h1671ad6f149451a893cf66804;
    stim[13] = 97'h1c38e657f2980fe484eaca162;
    stim[14] = 97'h1cdee0869c45d0247885bf86d;
    stim[15] = 97'h1343d9160de12010fa6752bd1;
    stim[16] = 97'h1561832df51d3a4604a25d67a;
    stim[17] = 97'h12c5cd3ffb44c1b7a26f26aad;
    stim[18] = 97'h1d5dbbbb2c2674f61fa253e9b;
    stim[19] = 97'h1c9b22a1c7de7a374a910c8e4;
    stim[20] = 97'h158cd65d50f90eb1a1ff7bd64;
    stim[21] = 97'h1cbc442c96b77848e0499badd;
    stim[22] = 97'h1d4e0dbcc04a25b9306897593;
    stim[23] = 97'h13d34ed0f4ed917c1ab9e9533;
    stim[24] = 97'h1ed321304472904fe7acf8f5c;
    stim[25] = 97'h1e9fc72b714e9012b146fadd8;
    stim[26] = 97'h1dd97c5bba91d62bfe31c40ed;
    stim[27] = 97'h1ac3ae38cec3d281e907c6b38;
    stim[28] = 97'h1bf1b284db152ed825c92ad9d;
    stim[29] = 97'h1be41b8b097dcac8e42aad252;
    stim[30] = 97'h19a8a8990246f4ed3985b0e8a;
    stim[31] = 97'h12694fd823d0aaa2808fad8d8;
    stim[32] = 97'h1c175545f43b19a1df9ee0857;
    stim[33] = 97'h14713bb4a9f06313883f15ad4;
    stim[34] = 97'h13bcdd826ef55a453ea75bed9;
    stim[35] = 97'h110d756076f3a288a280ead45;
    stim[36] = 97'h1b9ed1e01f38a6b7136ce8e87;
    stim[37] = 97'h150977f5dbdf99382dfb263a7;
    stim[38] = 97'h196078304093f2c0e5fedaadd;
    stim[39] = 97'h1dbebd2e3163c68208f53d6dc;
    stim[40] = 97'h1c530112a9031b729d4393d29;
    stim[41] = 97'h17664628476e32664255e45d9;
    stim[42] = 97'h1d08fa00ab6046efb6ff13ac0;
    stim[43] = 97'h134f1270a505ac8fed5cfb319;
    stim[44] = 97'h1559cf0f65ca54f7b4f8cb6fe;
    stim[45] = 97'h1400e3bdcc4762ae32cfff8fb;
    stim[46] = 97'h10d5057f999c1896c84e031a6;
    stim[47] = 97'h1fe535fe3fd4ff9d5ff53dd91;
    stim[48] = 97'h1f27fa2ac2eff4baffb0e6fd2;
    stim[49] = 97'h185d88e4e2e1bd7c9ad1116d1;
    stim[50] = 97'h1a9476dee4c59bd2518244d9d;
    stim[51] = 97'h1a48d9544b6ba910426cfc159;
    stim[52] = 97'h199644982c6353acf6b093347;
    stim[53] = 97'h1f4824c135f0c13b8d31d5036;
    stim[54] = 97'h13315308550f4c7cdca2f1577;
    stim[55] = 97'h157814deb1674fb652d3c747e;
    stim[56] = 97'h1f7fc8647955e158fe68df1cf;
    stim[57] = 97'h1fcb42087586ae01962eb217e;
    stim[58] = 97'h187151acc78d33db20744d22b;
    stim[59] = 97'h145d94c51b04e0db7605eab90;
    stim[60] = 97'h181eb566a03bb49e1883e90d6;
    stim[61] = 97'h191ad239cd36ee93c7645f031;
    stim[62] = 97'h1d6e6222b15d8c90e1daf2795;
    stim[63] = 97'h1f3b3713f157bc11987b8967f;
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
      expv[0] = 83'hxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 83'h000xxxxxxxxxxxxxxxxxx;
      expv[2] = 83'h000xxxxxxxxxxxxxxxxxx;
      expv[3] = 83'h000xxxxxxxxxxxxxxxxxx;
      expv[4] = 83'h000e200c3ccxxxxxxxxxx;
      expv[5] = 83'h0213b71f08782dbaea2xx;
      expv[6] = 83'h041cad2a23f259f1cdcxx;
      expv[7] = 83'h0620a9c29c49a919a53xx;
      expv[8] = 83'h082da0331a707d62543xx;
      expv[9] = 83'h0a31960c583a82d8301xx;
      expv[10] = 83'h0c3a9df01e7b237f56fxx;
      expv[11] = 83'h0e45ad1ba6033353b84xx;
      expv[12] = 83'h104eadfb719c304b2c3xx;
      expv[13] = 83'h125338d6b78a4a28d44xx;
      expv[14] = 83'h145e1c732bf94c07f24xx;
      expv[15] = 83'h16666f70434e22e8123xx;
      expv[16] = 83'h1869a1ec8b06f090087xx;
      expv[17] = 83'h1a72b0c196fa8e9d230xx;
      expv[18] = 83'h1c7962e69ffda260dbdxx;
      expv[19] = 83'h1e86aedddd96133a7b0xx;
      expv[20] = 83'h208e4d9150e3ef3d1baxx;
      expv[21] = 83'h2292c66b2ea87c8758dxx;
      expv[22] = 83'h249e5e22164b5bbc247xx;
      expv[23] = 83'h26a6a706de602512dc9xx;
      expv[24] = 83'h28a9e9a7687a76c8be0xx;
      expv[25] = 83'h2ab769909822394827fxx;
      expv[26] = 83'h2cbf4fe395b8a748095xx;
      expv[27] = 83'h2ec6ecbe2ddd48eb15fxx;
      expv[28] = 83'h30cd61d71c6761e940fxx;
      expv[29] = 83'h32d5f8d9426d8a976c1xx;
      expv[30] = 83'h34ddf20dc584bee5647xx;
      expv[31] = 83'h36e4d4544c81237a769xx;
      expv[32] = 83'h38e934a7ec11e855514xx;
      expv[33] = 83'h3af60baaa2fa1d8cd0exx;
      expv[34] = 83'h3cfa389dda54f83189cxx;
      expv[35] = 83'h3f01de6ec1377aad229xx;
      expv[36] = 83'h410886bab03b79d1445xx;
      expv[37] = 83'h4315cf68f00f9c535b8xx;
      expv[38] = 83'h451a84bbfaedefcc9c1xx;
      expv[39] = 83'h4724b03c182049f9607xx;
      expv[40] = 83'h492edf5e9718b1e3410xx;
      expv[41] = 83'h4b3629808954818db94xx;
      expv[42] = 83'h4d3bb3231423b719332xx;
      expv[43] = 83'h4f46847d0055b02377dxx;
      expv[44] = 83'h5149a789385282d647fxx;
      expv[45] = 83'h5352ace787b2e52a7bdxx;
      expv[46] = 83'h555a0071dee623b1571xx;
      expv[47] = 83'h57606a82bfccce0c4b6xx;
      expv[48] = 83'h596ff29aff1fea7fceaxx;
      expv[49] = 83'h5b7793fd156177fa5d7xx;
      expv[50] = 83'h5d7c2ec4727170debe4xx;
      expv[51] = 83'h5f854a3b6f7262cde92xx;
      expv[52] = 83'h618d246caa25b5d4882xx;
      expv[53] = 83'h6394cb224c1631a9d67xx;
      expv[54] = 83'h659fa412609af8609dcxx;
      expv[55] = 83'h67a198a9842a87a63e6xx;
      expv[56] = 83'h69aabc0a6f58b3a7db2xx;
      expv[57] = 83'h6bb7bfe4323caaf0ac7xx;
      expv[58] = 83'h6dbfe5a1043ac35700cxx;
      expv[59] = 83'h6fc438a8d663c699ed9xx;
      expv[60] = 83'h71ca2eca628d82706dbxx;
      expv[61] = 83'h73d40f5ab3501dda4f0xx;
      expv[62] = 83'h75dc8d691ce69b7749exx;
      expv[63] = 83'h77e6b7311158aec6487xx;
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
