// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 184;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03035 dut (
    .clk(clk),
    .reset(in_vec[183:183]),
    .insn(in_vec[182:151]),
    .data_rdy(in_vec[150:150]),
    .stall(in_vec[149:149]),
    .flush(in_vec[148:148]),
    .new_pc(in_vec[147:116]),
    .cache_miss(in_vec[115:115]),
    .cm_hart_id(in_vec[114:111]),
    .cm_addr(in_vec[110:79]),
    .br_hart_id(in_vec[78:75]),
    .br_taken(in_vec[74:74]),
    .br_addr(in_vec[73:42]),
    .hart_id(in_vec[41:38]),
    .id_hstart(in_vec[37:37]),
    .id_hidle(in_vec[36:36]),
    .id_hs_id(in_vec[35:32]),
    .id_hs_pc(in_vec[31:0]),
    .if_pc(out_vec[132:101]),
    .pc(out_vec[100:69]),
    .if_npc(out_vec[68:37]),
    .if_insn(out_vec[36:5]),
    .if_en(out_vec[4:4]),
    .if_hart_id(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 184'hbcc7f8ebbeefebcdceda6907b41f1e8d6078caa24fb8ea;
    stim[1] = 184'hcc95545c7451168f585e7955d283a67df28a54f26be739;
    stim[2] = 184'h69b22d61bb05bd48281788ea2d3d271db5d970904ce483;
    stim[3] = 184'h4331c0899667a028f86e92aed29f0eddca61aa840d5158;
    stim[4] = 184'h0f8d469c0cac39295d96eb9ba94ab5bb2ead787915886e;
    stim[5] = 184'hc0d3a08a172679a566d317b3baa967dbd5cbb82e07c947;
    stim[6] = 184'h38c1cbd4de24f0b3dac914be7d3561e4beaee986d0c41c;
    stim[7] = 184'h2155cee86bf7e06a80378f2218c9036c43f104f4f793af;
    stim[8] = 184'h1ab8e56451bdda36900abc514c5cfd42339f640f697dad;
    stim[9] = 184'h0c65f63978ce9f1d9a47b37d7357a22dc92932e053609c;
    stim[10] = 184'h77e5530b975cbd429bd5611b1521201c560328b80ac94f;
    stim[11] = 184'h5101d3e5340600f7ff0e49d434b3ef526fa03d81295776;
    stim[12] = 184'h2685d93235b2ad5e615d201e4fb65539b2555f95a42f15;
    stim[13] = 184'h0a4e6c9afdab4d1199b0fecff6a17c6e1f01332f2b40f4;
    stim[14] = 184'h69b206e999911a271d1162dd8a481e8b23a48fadc2a7c9;
    stim[15] = 184'h779c1e3915edb7736e8e8e5016ea8255175f0d76a2fb66;
    stim[16] = 184'h2b0d9591c9750f8c637b04a02bb0c6541496e16e69efd1;
    stim[17] = 184'h755c9731d18b2b27e35109f176494494cca9a14a83f3e9;
    stim[18] = 184'h2cb68439035fc0f9fc22436a200fd8d87f89e5dfe6e59c;
    stim[19] = 184'h4678f041d4dc90fbdc1fd8828f60745b202012413de6e9;
    stim[20] = 184'h564647d3f18706811ce87be1796e75395ace7332381b78;
    stim[21] = 184'h44ac4ed797b7c52333826032b5d9e1fa9d8f59431d19d2;
    stim[22] = 184'h21942219449d38d5d32ccbc116042b1c070638c8444997;
    stim[23] = 184'h3a61272aa113e4faf6d42cb762b2da89d7686417f46db6;
    stim[24] = 184'h3c81645e8af1b71416528603bacd4a8175630443d07d3a;
    stim[25] = 184'h4c19afc2e2fecb2ffbd68e003aa6abe8b5387dc8d9caa3;
    stim[26] = 184'h1f30a5309346824839f359a84d22724e12905184a29907;
    stim[27] = 184'h453316fc51b6c2a2833e2751b9137f320ea148fb62314d;
    stim[28] = 184'h6d80948f8fed30f32c8e3e29e160b0308e6e7d3c86281f;
    stim[29] = 184'h07c47b2c5cb46662728f6139e85dd58ca81f7a3cfcb111;
    stim[30] = 184'h2a8851f9968bf46f382c324827e789132cba157112aa14;
    stim[31] = 184'h73552d55ebe41dbd0d4e6a00366e3a01b9b95ebcdbabc9;
    stim[32] = 184'h099cd31c794c68f49beaaa3bb70d9fab494605a803e5fc;
    stim[33] = 184'h72c7e27a10509cc95e6366021722f06cc482c3c93d75f7;
    stim[34] = 184'h06c631497693fbb0a8b674b6f7e51d852ef2dc7ed890a5;
    stim[35] = 184'h2110a27801c392b6579157cfe1f0308b3180b5e61757b4;
    stim[36] = 184'h079dea2c6074c1d8e47438901aaa165ddd4d495626430d;
    stim[37] = 184'h0b65d0e5a7b7cc2fa5c18c21618c4855d8808cd1d031f1;
    stim[38] = 184'h0252d336f8c1e0a25fa6b51c37910e3e565f828bb8f225;
    stim[39] = 184'h690a1f948fad56ced2e3dcf4196084c89e1c1194090e1f;
    stim[40] = 184'h125b17d99ffe2b86f5917f33734e60deb29b8a2505c990;
    stim[41] = 184'h3970968a161aa059f5bd00a017a11e78a544d99cb1cfe8;
    stim[42] = 184'h20d11b39f644b7e85ce8db2c47f92cc8b145f5cd0cd8d0;
    stim[43] = 184'h1840d40ac37278dcf9bc8850e12226f2fe7d8858f2c684;
    stim[44] = 184'h430fe9645b013e9fb8ff66ca8e50e45b531530f852d148;
    stim[45] = 184'h7d2e4194048b2f82715cff97d55c75e498d29fe6fd5752;
    stim[46] = 184'h141f4cba06b5df70787472ae595d287ce4d919f11bb595;
    stim[47] = 184'h114c2b5a1b53c160a0194da88382ab3177619766f1fe44;
    stim[48] = 184'hfb8686f11310d495d3cc4159405de8dbb81652b1660a17;
    stim[49] = 184'h1546aaa8f80a859505cc7e3cc7a5e40613898a0eb94fcb;
    stim[50] = 184'h14ff31a795450d26f69543fe5d2dd983b96e09a6c02a9b;
    stim[51] = 184'h15e30f93f9513d217a9b4463df5fd7294768daf268206b;
    stim[52] = 184'h3b4af60221b07a3cb64a8d2fd2bef775036c9ce82c84ec;
    stim[53] = 184'h62c148403b250c728c165a77e84460d44d71d04f2d9199;
    stim[54] = 184'h5e53e43fbb991b8bc3ad103361a7440e4293c5dae79221;
    stim[55] = 184'h68c5b3b7357068fdfd7f24b334497ccf00ff782d254170;
    stim[56] = 184'h7c1e43b25a1c021f7ccd4f82d62db0ab04a56c1edfb0d5;
    stim[57] = 184'h1310c605156ad344c36a54cc0ecf4323a90393e8878dda;
    stim[58] = 184'h4598207cd40565e509c5bc3454e9298e2fba6707bc95f5;
    stim[59] = 184'h2759dd7a90fb228bac2839b9d6cb73c74cd5eb9ae1007f;
    stim[60] = 184'h5a667e61200e2bfe9f529460e54a75ae133cb1471f0455;
    stim[61] = 184'h5449c96b20c589776cd60d2108fefcd0911c9e8f78501d;
    stim[62] = 184'h077b779a0c6da4e00c51981db40a99e2b6f132a1c056c8;
    stim[63] = 184'hc00d9e3d49f6e93071854a04db0d6f2c5c32c6af55cb7d;
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
      expv[0] = 133'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 133'hxxxxxxxxx0000000000000000000000260;
      expv[2] = 133'hxxxxxxxxx0000000000000000000000260;
      expv[3] = 133'hxxxxxxxxx0000000000000000000000260;
      expv[4] = 133'hxxxxxxxxx0000000000000000000000266;
      expv[5] = 133'hxxxxxxxxxxxxxxxxxxxxxxxxx3e351a715;
      expv[6] = 133'h05bae6ea40000000000000000000000260;
      expv[7] = 133'hxxxxxxxxx000000000000000000000026b;
      expv[8] = 133'hxxxxxxxxx000000000000000000000026b;
      expv[9] = 133'hxxxxxxxxx000000000000000000000026d;
      expv[10] = 133'hxxxxxxxxx000000000000000000000026d;
      expv[11] = 133'hxxxxxxxxx000000000000000000000026c;
      expv[12] = 133'hxxxxxxxxx000000000000000000000026c;
      expv[13] = 133'hxxxxxxxxx000000000000000000000026c;
      expv[14] = 133'hxxxxxxxxx000000000000000000000026c;
      expv[15] = 133'h0eb97a8520000000000000000000000262;
      expv[16] = 133'h1c49e167a000000000000000000000026c;
      expv[17] = 133'h0ccf4051fc49e167bc49e1682ac365647b;
      expv[18] = 133'hxxxxxxxxx0000000000000000000000266;
      expv[19] = 133'hxxxxxxxxxxxxxxxxxxxxxxxxxb2da10e57;
      expv[20] = 133'h0000000000000000000000000000000260;
      expv[21] = 133'h037bb46d20000000000000000000000260;
      expv[22] = 133'h0f22b10dc000000000000000000000026d;
      expv[23] = 133'h1ec6c3fc4f22b10dcf22b10e4865088658;
      expv[24] = 133'h0bdb6ee6cf22b10dcf22b10e4865088658;
      expv[25] = 133'h1ec6c3fc4bdb6ee6cbdb6ee74f205917bc;
      expv[26] = 133'h1ec6c3fc4bdb6ee6cbdb6ee74f205917bc;
      expv[27] = 133'hxxxxxxxxx0000000000000000000000261;
      expv[28] = 133'h0a540bab00000000000000000000000265;
      expv[29] = 133'h0790c503ea540bab0a540bab8000000269;
      expv[30] = 133'h0f22b10e4000000000000000000000026d;
      expv[31] = 133'h036d854500000000000000000000000268;
      expv[32] = 133'h0d17e8de60000000000000000000000268;
      expv[33] = 133'h1c49e16820000000000000000000000268;
      expv[34] = 133'h00a13992a000000000000000000000026b;
      expv[35] = 133'h1322344e2000000000000000000000026b;
      expv[36] = 133'h1cc2eaf68000000000000000000000026b;
      expv[37] = 133'h1322344e2000000000000000000000026b;
      expv[38] = 133'h000000000000000000000000000000026b;
      expv[39] = 133'h0158e0382000000000000000000000026b;
      expv[40] = 133'h000000000000000000000000000000026b;
      expv[41] = 133'h000000000000000000000000000000026e;
      expv[42] = 133'hxxxxxxxxx0000000000000000000000263;
      expv[43] = 133'h0316564fc0000000000000000000000263;
      expv[44] = 133'hxxxxxxxxx316564fc316565046103502b6;
      expv[45] = 133'h079f962220000000000000000000000264;
      expv[46] = 133'h16027d3f679f9622279f9622bf4b90651a;
      expv[47] = 133'h0316565056027d3f76027d3fe507d32e94;
      expv[48] = 133'h038f8a7840000000000000000000000266;
      expv[49] = 133'h16a782c140000000000000000000000260;
      expv[50] = 133'h0d17e8de60000000000000000000000260;
      expv[51] = 133'h0f22143840000000000000000000000268;
      expv[52] = 133'h1322344e20000000000000000000000268;
      expv[53] = 133'hxxxxxxxxx0000000000000000000000268;
      expv[54] = 133'hxxxxxxxxx0000000000000000000000268;
      expv[55] = 133'h1968ccc4e0000000000000000000000268;
      expv[56] = 133'h1cc2eaf680000000000000000000000268;
      expv[57] = 133'h1ffc570de0000000000000000000000265;
      expv[58] = 133'h000000000000000000000000000000026e;
      expv[59] = 133'hxxxxxxxxx0000000000000000000000269;
      expv[60] = 133'h1322344e20000000000000000000000267;
      expv[61] = 133'h1322344e20000000000000000000000267;
      expv[62] = 133'h16027d3fe0000000000000000000000267;
      expv[63] = 133'h0943e726d6027d3ff6027d4061dedde694;
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
