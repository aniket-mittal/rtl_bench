// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 110;
  localparam OW = 109;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041289 dut (
    .clk(clk),
    .rst(in_vec[109:109]),
    .WBE(in_vec[108:107]),
    .MemE(in_vec[106:102]),
    .PCAdderE(in_vec[101:70]),
    .zeroE(in_vec[69:69]),
    .ALUResultE(in_vec[68:37]),
    .ReadData2E(in_vec[36:5]),
    .RegDstE(in_vec[4:0]),
    .WBM(out_vec[108:107]),
    .MemWrite(out_vec[106:106]),
    .MemRead(out_vec[105:105]),
    .Branch(out_vec[104:104]),
    .PCAdderM(out_vec[103:72]),
    .zeroM(out_vec[71:71]),
    .ALUResultM(out_vec[70:39]),
    .ReadData2M(out_vec[38:7]),
    .RegDstM(out_vec[6:2]),
    .lbSel(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 110'h2fd175c51a6ced6a0346b3348748;
    stim[1] = 110'h256676127986e584556adeefe684;
    stim[2] = 110'h00e07b7903eb461f2f69d063a462;
    stim[3] = 110'h1fa5af1819633a606524f2c268b4;
    stim[4] = 110'h187149914c9d7504541ee0d0a8a1;
    stim[5] = 110'h15e74864f8dd4145300a600ae239;
    stim[6] = 110'h131eb1568a05f943be9c189b590f;
    stim[7] = 110'h09ff0572225a0d7422b9fa8e01d8;
    stim[8] = 110'h0ce2e757c3c3aa3e4188ba609227;
    stim[9] = 110'h1d72d26d92b5cc9fae009f91815d;
    stim[10] = 110'h1e539e0234195bcbaed0a30bf7c7;
    stim[11] = 110'h1ecbde559a3181098579f4371bc5;
    stim[12] = 110'h1e0750301a804deb9b0eaff20226;
    stim[13] = 110'h1e6c9c48bac667eb58eac7124178;
    stim[14] = 110'h145eae657c3503a012b775ba4a06;
    stim[15] = 110'h0215a7484ae8d8ca9ec24b644798;
    stim[16] = 110'h1ef4b71172d03eb52b1304f94709;
    stim[17] = 110'h014d5f591461d461d8b695f36bca;
    stim[18] = 110'h0722f0e21d58f548c71ae789e338;
    stim[19] = 110'h1ca6622ce22d0be1e1d0da7f895f;
    stim[20] = 110'h0b38ba98115c2b9c1708b7c4889e;
    stim[21] = 110'h0cbe2ff1721bc06f019c1e3b0afe;
    stim[22] = 110'h09776e7575584bed6023388f3dd0;
    stim[23] = 110'h0a8d9368c06782300143dc6384e4;
    stim[24] = 110'h1d2907e198a0bc21be72af4224cd;
    stim[25] = 110'h1251e4ec315181b60d5a95b9ff1b;
    stim[26] = 110'h1b1e4b01b0a73455c26af2a5af94;
    stim[27] = 110'h19619623e656f883429cf4a06d06;
    stim[28] = 110'h144cf5bbfa44ea9858a92a7ac06b;
    stim[29] = 110'h03d60c28c2c28fbe96331eda0123;
    stim[30] = 110'h151c352194c863d2a4030f9f526d;
    stim[31] = 110'h16b20c60a9f088d5d82ae47d6662;
    stim[32] = 110'h1cf291374d003f45ee8cb012a534;
    stim[33] = 110'h0d4e3d4c42407322b4673aa018cd;
    stim[34] = 110'h15115c034c0dcbc1938cfac7bde6;
    stim[35] = 110'h15c8b0d53a7ba4ad3276b3f64ff8;
    stim[36] = 110'h13458e2565b204d41fc61469a244;
    stim[37] = 110'h010af518ff78411e93ba668457db;
    stim[38] = 110'h1e170d0b2d58c2b425f9019f31bd;
    stim[39] = 110'h0e149023e91e8929404f3e66ade5;
    stim[40] = 110'h16f1670704e9ac13f0b33274fef9;
    stim[41] = 110'h061225b25dce3903dda08c43ef45;
    stim[42] = 110'h15d4825a9811fee59399c42b4063;
    stim[43] = 110'h0d6c724830ec61fe8ded9845aafa;
    stim[44] = 110'h1044627dde1022b9bf6d5e430460;
    stim[45] = 110'h1904599e367baa097ef53feb75ef;
    stim[46] = 110'h0697d436e73c9358be8b8127ad6c;
    stim[47] = 110'h17b6f8cc075f9f4356b4bd9aad65;
    stim[48] = 110'h1253153237a7305cf7d75f18595a;
    stim[49] = 110'h1012c698737a014055ba9f4ec6ac;
    stim[50] = 110'h06a1566310f88bef75b70cafc041;
    stim[51] = 110'h015230a25d88cae381b3dcc7a12d;
    stim[52] = 110'h073642337fbe0d1860c69d5fee70;
    stim[53] = 110'h372b5b7e535301bcaff35b35ad4b;
    stim[54] = 110'h1840b7963ab03dc6b70c81a46fe5;
    stim[55] = 110'h12351306abaad8a2ab2fa89e9075;
    stim[56] = 110'h188b069df22bf42e9881a1daefc1;
    stim[57] = 110'h0c375a5e6f0ca18f028decb2a041;
    stim[58] = 110'h0ae42896a51dd0f31d87fa4e1426;
    stim[59] = 110'h18b8372b25993c157dea426284bf;
    stim[60] = 110'h024d83aad4b453bd4594bc7cd448;
    stim[61] = 110'h014ccdbcbdffccf009b0b0d9a56c;
    stim[62] = 110'h0e8407c86b5018ec7c36170ac0be;
    stim[63] = 110'h1c968f346f1eee7009dc96305f10;
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
      expv[0] = 109'h0000000000000000000000000000;
      expv[1] = 109'h0000000000000000000000000000;
      expv[2] = 109'h0000000000000000000000000000;
      expv[3] = 109'h0381ede40fad187cbda7418e9188;
      expv[4] = 109'h1e96bc60658ce9819493cb09a2d3;
      expv[5] = 109'h19c526453275d411507b8342a284;
      expv[6] = 109'h179d2193e3750514c029802b88e6;
      expv[7] = 109'h147ac55a2817e50efa70626d643d;
      expv[8] = 109'h0ffc15c8896835d08ae7ea380760;
      expv[9] = 109'h0b8b9d5f0f0ea8f90622e982489e;
      expv[10] = 109'h1dcb49b64ad7327eb8027e460576;
      expv[11] = 109'h194e7808d0656f2ebb428c2fdf1f;
      expv[12] = 109'h1b2f795668c6042615e7d0dc6f17;
      expv[13] = 109'h181d40c06a0137ae6c3abfc8089b;
      expv[14] = 109'h19b27122eb199fad63ab1c4905e3;
      expv[15] = 109'h117ab995f0d40e804addd6e9281a;
      expv[16] = 109'h00569d212ba3632a7b092d911e61;
      expv[17] = 109'h1bd2dc45cb40fad4ac4c13e51c27;
      expv[18] = 109'h05357d645187518762da57cdaf28;
      expv[19] = 109'h048bc3887563d5231c6b9e278ce3;
      expv[20] = 109'h1a9988b388b42f87874369fe257e;
      expv[21] = 109'h0ce2ea604570ae705c22df122279;
      expv[22] = 109'h0af8bfc5c86f01bc067078ec2bfa;
      expv[23] = 109'h0dddb9d5d5612fb5808ce23cf740;
      expv[24] = 109'h0a364da3019e08c0050f718e1391;
      expv[25] = 109'h1ca41f866282f086f9cabd089336;
      expv[26] = 109'h114793b0c54606d8356a56e7fc6d;
      expv[27] = 109'h1c792c06c29cd15709abca96be51;
      expv[28] = 109'h1d86588f995be20d0a73d281b418;
      expv[29] = 109'h1133d6efe913aa6162a4a9eb01ae;
      expv[30] = 109'h075830a30b0a3efa58cc7b68048d;
      expv[31] = 109'h1470d48653218f4a900c3e7d49b6;
      expv[32] = 109'h12c83182a7c2235760ab91f5998b;
      expv[33] = 109'h1bca44dd3400fd17ba32c04a94d2;
      expv[34] = 109'h0d38f5310901cc8ad19cea806336;
      expv[35] = 109'h1445700d30372f064e33eb1ef79a;
      expv[36] = 109'h1722c354e9ee92b4c9dacfd93fe2;
      expv[37] = 109'h1516389596c813507f1851a68911;
      expv[38] = 109'h042bd463fde1047a4ee99a115f6c;
      expv[39] = 109'h185c342cb5630ad097e4067cc6f7;
      expv[40] = 109'h0852408fa47a24a5013cf99ab797;
      expv[41] = 109'h13c59c1c13a6b04fc2ccc9d3fbe7;
      expv[42] = 109'h004896c97738e40f7682310fbd17;
      expv[43] = 109'h1752096a6047fb964e6710ad018e;
      expv[44] = 109'h0db1c920c3b187fa37b66116abea;
      expv[45] = 109'h111189f778408ae6fdb5790c1180;
      expv[46] = 109'h1c116678d9eea825fbd4ffadd7bc;
      expv[47] = 109'h025f50db9cf24d62fa2e049eb5b3;
      expv[48] = 109'h16dbe3301d7e7d0d5ad2f66ab597;
      expv[49] = 109'h114c54c8de9cc173df5d7c616569;
      expv[50] = 109'h104b1a61cde8050156ea7d3b1ab0;
      expv[51] = 109'h0285598c43e22fbdd6dc32bf0107;
      expv[52] = 109'h0548c28976232b8e06cf731e84b4;
      expv[53] = 109'h0000000000000000000000000000;
      expv[54] = 109'h0000000000000000000000000000;
      expv[55] = 109'h1902de58eac0f71adc320691bf94;
      expv[56] = 109'h10d44c1aaeab628aacbea27a41d5;
      expv[57] = 109'h1a2c1a77c8afd0ba6206876bbf04;
      expv[58] = 109'h08dd6979bc32863c0a37b2ca8106;
      expv[59] = 109'h0b90a25a947743cc761fe9385099;
      expv[60] = 109'h1ae0dcac9664f055f7a9098a12fc;
      expv[61] = 109'h01360eab52d14ef51652f1f35121;
      expv[62] = 109'h053336f2f7ff33c026c2c36695b0;
      expv[63] = 109'h0a101f21ad4063b1f0d85c2b02fb;
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
