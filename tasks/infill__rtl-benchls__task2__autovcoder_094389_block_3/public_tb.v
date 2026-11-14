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
    stim[0] = 161'h02d0b25a78955080f3e622bb6474f5763f1e7b656;
    stim[1] = 161'h0118c095cfa125c7b90cb7c56a3845639032465f9;
    stim[2] = 161'h0794344966cfd3feac62bcea8c114ee5a34f31174;
    stim[3] = 161'h1e5a0eb2e384a9cfa817e8b0fdf04840e24d33509;
    stim[4] = 161'h0baed460f6e18aca0f7e0ae85622a6cea44f843fb;
    stim[5] = 161'h11017b4c037797be0542079f153f10ddec7cea46e;
    stim[6] = 161'h1c82ef1f64256a2704640bc522d04fb9950aac73b;
    stim[7] = 161'h0e08dd8f45a5c1ad9042c943ca3dbb839ded85eeb;
    stim[8] = 161'h01078723498030e63912ff7bf857d7facdcb1c8ba;
    stim[9] = 161'h1e7ab0818d6acf1db5496f6fcb190be34182ad7bf;
    stim[10] = 161'h14c74e40d034ff0b17066487bb9d453f444dc2524;
    stim[11] = 161'h0c6f42db9f8e58e22be15ccffcefb733ec76054cb;
    stim[12] = 161'h194c88c6d27595f1c6d468570065983ac41a54213;
    stim[13] = 161'h1a4957369a5b279d8f7259bcc9e401ca3d159ad12;
    stim[14] = 161'h01c7971a651c267110835e2d7ad7bb8b80ef4b467;
    stim[15] = 161'h146d74ce65b6cd35509b7f5223c6c5e413695afce;
    stim[16] = 161'h05511dfa942d0259bd7b091967236133a7aa45496;
    stim[17] = 161'h079287d841f93480a238c9df24a1e6aaa8b25a38f;
    stim[18] = 161'h188d3e9508b977fbf0df7a1aec63d2668e6f11a09;
    stim[19] = 161'h01deb15d140b8a566cdc934e7707e7b86bdba0bb9;
    stim[20] = 161'h05008aea10e539d5bae307b15500f2ab3fb2b44ea;
    stim[21] = 161'h16d416e40d2ff35ae308ccb98f6d38d86891edc31;
    stim[22] = 161'h1d1f649978382d46be22044b975e939aafc154dec;
    stim[23] = 161'h01fc90e2172dd095d9e0f4ca85b4a155c8030c9e2;
    stim[24] = 161'h073cb5a822271e748b7b4f3fd1e70f39517865f17;
    stim[25] = 161'h065693448148e9f5885f21d6d03be66954ee2f415;
    stim[26] = 161'h18ffec10818003ec862e8adc9c6b1662336f28f57;
    stim[27] = 161'h17d015045bc99f7924c927332c6d9a19929a2d672;
    stim[28] = 161'h0729f368a25b557702b0c77465c4f1f850629915e;
    stim[29] = 161'h10e974aa0a92efefab309ed6ae6bc085aecd6b6d8;
    stim[30] = 161'h12856a590cfb14139371d74368b73eb1439073b6d;
    stim[31] = 161'h019a67d6efa07c86f876598cbce07a88ae5b9ce43;
    stim[32] = 161'h0d986a4b34a1d2b4ec43e8fe84a4a8224bcca2073;
    stim[33] = 161'h0e28c373ac1a6396f86d34dc0d73badac10aeaa15;
    stim[34] = 161'h09ff55d30d7f739283a9f346ba2b7bd85f606553f;
    stim[35] = 161'h0d60416b16ec5bd0431441ca6f32b38a1521794a9;
    stim[36] = 161'h0bae3f01e573328cf677352b66b4700221c745ae4;
    stim[37] = 161'h026920311662a36f6d54c4c203b6a5ea91be0b0c1;
    stim[38] = 161'h1a0508484141f781157d89df0213897091a1a5cba;
    stim[39] = 161'h054c9726e95159ae018ecf15b379ccc69910957d3;
    stim[40] = 161'h1ed8e5d4f8458cda982637aad802d815574dbcd00;
    stim[41] = 161'h1b18a107e97996c8ff4fc13c15d6c3c7f8fcc1df4;
    stim[42] = 161'h1dab675f496adeb1162c012f11a635e2688ebdc46;
    stim[43] = 161'h0b7149514fcc71792b93fe7290c9fc03c22919b7c;
    stim[44] = 161'h1f0986c8575086b48315c9b586fd117bcb7c0724a;
    stim[45] = 161'h0a0bdaeca915c806c35306655fbd20c6c37dda04d;
    stim[46] = 161'h150f2c101cda86e4ce810e370d93a399cd15061e0;
    stim[47] = 161'h1a568d3b36c61ecc558862c5e4459298a48fb3735;
    stim[48] = 161'h1f9790afd281b4c8d427b3038205541ebed9c0ad2;
    stim[49] = 161'h1eea7561ae3d0a6458532e9a7269e24b8618cd5f7;
    stim[50] = 161'h14cd7ade46fc2ef9232c2c9c7761ed9f6964dd761;
    stim[51] = 161'h01da8f946b6e57249bb99c44c47dd82da08a4da49;
    stim[52] = 161'h053fbb66e7dbc5632095215463493135b337932ee;
    stim[53] = 161'h04881b708a0384dc328ab69f66e762d34820f0517;
    stim[54] = 161'h08a57673ab3181c084e638f02a7133a6e0ab3b1dd;
    stim[55] = 161'h0c5ec380a882a37a7b1b7a2ba15597829807dba8d;
    stim[56] = 161'h0d001b2339e6def28221bfcb8e5eff635e8dbb4cb;
    stim[57] = 161'h1acb2d4a12ed6972293ef6048e842ac62c1aea72c;
    stim[58] = 161'h04441324dafb7d418d0746b9fe1cd14568559771b;
    stim[59] = 161'h1b48d860f2de1d91c624403f5a07fbe62b956187f;
    stim[60] = 161'h1a47b69ecb905f5f98d03752710e6ae12385b3266;
    stim[61] = 161'h191dc947fdc7136e2d69864b4ca8983c9034882fe;
    stim[62] = 161'h0d8dba75151fb554af8d1f80d3ed11aa68c96205e;
    stim[63] = 161'h06a40e409e4a69beb5313b44e2622c0ee97294173;
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
      expv[0] = 153'h05a0b07cc457689550813000000000000000000;
      expv[1] = 153'h06312ffffffc8fa125c7f000000000000000000;
      expv[2] = 153'h01a89fffffff16cfd3fee000000000000000000;
      expv[3] = 153'h00756fffe05fa384a9cfe000000000000000000;
      expv[4] = 153'h069ccfffdf82b6e18aca4000000000000000000;
      expv[5] = 153'h03c290000000137797be4000000000000000000;
      expv[6] = 153'h07443000000234256a274000000000000000000;
      expv[7] = 153'h06d11000000025a5c1add000000000000000000;
      expv[8] = 153'h040e4fff912ff98030e67000000000000000000;
      expv[9] = 153'h05b5000000549d6acf1df000000000000000000;
      expv[10] = 153'h024e800000706034ff0b5000000000000000000;
      expv[11] = 153'h021fbfffffffef8e58e26000000000000000000;
      expv[12] = 153'h045980006d46827595f20000000000000000000;
      expv[13] = 153'h02926fee4b379a5b279dc000000000000000000;
      expv[14] = 153'h048e30000000851c26715000000000000000000;
      expv[15] = 153'h039b904dbfa915b6cd359000000000000000000;
      expv[16] = 153'h00e3ffffffff542d0259f000000000000000000;
      expv[17] = 153'h0425b0008e3271f93480e000000000000000000;
      expv[18] = 153'h01db2000df7a18b977fc3000000000000000000;
      expv[19] = 153'h05bcbff3724d340b8a56a000000000000000000;
      expv[20] = 153'h0441dfffff5c60e539d5f000000000000000000;
      expv[21] = 153'h00a9c00c2332ed2ff35b2000000000000000000;
      expv[22] = 153'h033f3fff888118382d46f000000000000000000;
      expv[23] = 153'h04b9cfffffff972dd0961000000000000000000;
      expv[24] = 153'h05b95fffffdbd2271e74c000000000000000000;
      expv[25] = 153'h04ac8fffffc2f148e9f5c000000000000000000;
      expv[26] = 153'h077e20c5d15b918003ecc000000000000000000;
      expv[27] = 153'h00a0000000000bc99f796000000000000000000;
      expv[28] = 153'h0792d015863ba25b55774000000000000000000;
      expv[29] = 153'h03935ffffffeca92efefe000000000000000000;
      expv[30] = 153'h034ab00000371cfb1413d000000000000000000;
      expv[31] = 153'h0335affe1d966fa07c873000000000000000000;
      expv[32] = 153'h03709fc43e8fe4a1d2b52000000000000000000;
      expv[33] = 153'h0610efff86d34c1a63973000000000000000000;
      expv[34] = 153'h02bfa01d4f9a3d7f7392c000000000000000000;
      expv[35] = 153'h0200d18a20e536ec5bd08000000000000000000;
      expv[36] = 153'h01dc000000000573328d3000000000000000000;
      expv[37] = 153'h01126ffeaa626662a36fa000000000000000000;
      expv[38] = 153'h004a9002bec4e141f7815000000000000000000;
      expv[39] = 153'h04984000c767895159ae4000000000000000000;
      expv[40] = 153'h0731afffffc138458cdad000000000000000000;
      expv[41] = 153'h053000000000097996c93000000000000000000;
      expv[42] = 153'h0316b018b004b96adeb15000000000000000000;
      expv[43] = 153'h0262afffffffbfcc71796000000000000000000;
      expv[44] = 153'h041390000000375086b4c000000000000000000;
      expv[45] = 153'h06d7d00035306915c8070000000000000000000;
      expv[46] = 153'h015e2fffffffecda86e50000000000000000000;
      expv[47] = 153'h046c70016218b6c61ecc9000000000000000000;
      expv[48] = 153'h04af500084f66281b4c91000000000000000000;
      expv[49] = 153'h0394cffffff85e3d0a649000000000000000000;
      expv[50] = 153'h03dbb000000cb6fc2ef96000000000000000000;
      expv[51] = 153'h04752ffffffeeb6e5724d000000000000000000;
      expv[52] = 153'h05fec000000017dbc5636000000000000000000;
      expv[53] = 153'h00d0e0000028aa0384dc7000000000000000000;
      expv[54] = 153'h038ae0001398eb3181c0c000000000000000000;
      expv[55] = 153'h063d0ffd8dbd1882a37ab000000000000000000;
      expv[56] = 153'h00c04000001109e6def2c000000000000000000;
      expv[57] = 153'h01569e4fbd8122ed69726000000000000000000;
      expv[58] = 153'h00884ffffff41afb7d41c000000000000000000;
      expv[59] = 153'h06d0c189100fd2de1d920000000000000000000;
      expv[60] = 153'h058f3ffffe340b905f5fd000000000000000000;
      expv[61] = 153'h067a8ffeb4c32dc7136e6000000000000000000;
      expv[62] = 153'h05daeffe347e051fb554e000000000000000000;
      expv[63] = 153'h0048800014c4ee4a69bef000000000000000000;
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
