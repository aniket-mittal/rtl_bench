// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 192;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  add64 dut (
    .A(in_vec[191:128]),
    .B(in_vec[127:64]),
    .C(in_vec[63:0]),
    .Carry(out_vec[127:64]),
    .S(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 192'heb031a83d55279dc0799fb7c498f1db946b6950dfa89d603;
    stim[1] = 192'h5e4c29abab5c0f352fa07a0289be4fcc9cad49ddd2b527ee;
    stim[2] = 192'h02586d5716d5d38f2eb0c59b0288fa318663c02948bda0eb;
    stim[3] = 192'hffd64aafbad136f477af6c378f552b7b8d18d99a46b6ef52;
    stim[4] = 192'hf3d36de8a913baca1d5ca8726d67a0724662dc74ddae6c85;
    stim[5] = 192'h34c183ecd76bb6bc8abce83fefd5fb0df7754129d6ace8b2;
    stim[6] = 192'hb29ce861f1c34c8ad8e5aa4e8d537c261e6784915f490d12;
    stim[7] = 192'h82504f7f096cbfb88b9c90c4fcb3674df19209d76abc7032;
    stim[8] = 192'h7fb20c793156b46fa00883f84ab3c4c31f703460e222e4b8;
    stim[9] = 192'hda8db38fa99b0c2b87415a78abf46a521031d95b50e1942d;
    stim[10] = 192'hf11e2f2df37f475c576b812c868be88d6760ac91cbfb52e0;
    stim[11] = 192'h86d006bb8de2c761bc38af5717724fb33f8b223ee1fc9a8e;
    stim[12] = 192'h7e3fae59a03bdddf02c6a40c197f78f09f8d8dcfd25ba121;
    stim[13] = 192'hbf05cccacdc0058a73f4984b3c4e7d80a85ad42fa10ba735;
    stim[14] = 192'hfc2c1c16df5513a5e78fbbfaa3f4c83329ec4cadbaaca88a;
    stim[15] = 192'h48474cf027cdc08ed93b004a346065656398554381bc914f;
    stim[16] = 192'h0c3eb8fa34a8c82b23861421423bb8a137bc2a55482976da;
    stim[17] = 192'ha050101df86727d40cbe49dee60cd62294b78ac1748e6ea5;
    stim[18] = 192'hbb8f611a1d20d2eba8f27a2408177bae397634ae97a029e4;
    stim[19] = 192'h2030f9cdc8f4aa02eb22878f4bdd7a19b65a1d4d5c5f969b;
    stim[20] = 192'h674d20d785ddcf00b9034b50bdf80e362d3b75ccdaf5c97c;
    stim[21] = 192'h86bc36b33bc6f047e876bf1b7b6a4c116614537eee1beade;
    stim[22] = 192'h667578af5930a22abf6a66e18c4247ddecff7edb5a499b73;
    stim[23] = 192'h3e41d790a2b2f6df25f0bc672a622b07a4d9eae4cfd46386;
    stim[24] = 192'hcbdbf71ce4338f51e501a98667703e6d0842d6e38a562ea9;
    stim[25] = 192'h01ff9c095cf23e5f7d1b0d97fca773886b2af890fe736ea7;
    stim[26] = 192'h41b8a6f292a1186c47aa7c17aa2f5d0da5b84d383c57bba1;
    stim[27] = 192'h71afaeeb1b9e4f61d081d2abf6de57734320d153b8d15e7f;
    stim[28] = 192'h0b59bcc79d079f70252e266aa751680f7d9fb09ade27b0b6;
    stim[29] = 192'h2c2a9d0abb26442266aac7b786ce8d2aea1eb1d29bf92ca4;
    stim[30] = 192'hfc38e2fb0e012726e7d486f007a5e99c981c9f18da537052;
    stim[31] = 192'h05b676fb15fecef02ad57142c810475552458928e197cd39;
    stim[32] = 192'hbb6ba0f9c4b05877e0d6749d15aa696ab3afe0002422926f;
    stim[33] = 192'h2b62c982704904421cc614bb630ca7f3afbf57e5ea8e6fde;
    stim[34] = 192'h1536c48423df2c49b3878b09d6f335c783df662bf17b043e;
    stim[35] = 192'hf60b34db183562466d1298a19af32c5fb5d8d715b518a6b0;
    stim[36] = 192'hdf32c736459d848b2137f14cede3c9d2ec21ac23c6ec7318;
    stim[37] = 192'hcc4434f6d18792e9673e23b1503a0ecf974dbbca27fa0858;
    stim[38] = 192'hb05c99d25ea21ce9eadab962225f882b534391693c9f0257;
    stim[39] = 192'he38b006c588d980e26a37f4697e3508f7cc1c1006e169cea;
    stim[40] = 192'h95e6d95324a20f1d732bae9a587538580a53d52baea9cbe3;
    stim[41] = 192'h2425bee1fc9e88dee93834d12c638543ecccb0c0731a6237;
    stim[42] = 192'hbb798369d369e6a80f75ea54572b952195ecf7bd68866eff;
    stim[43] = 192'h0f77b5a642c10a03473cb32576cfed6c844d57c3d02d41aa;
    stim[44] = 192'h8bdcfad451cd05c48540a25b75c499b54719a96b28eda536;
    stim[45] = 192'h2dcd7bba214d9256817f872aedebf10c07304d24c8957e8e;
    stim[46] = 192'h2f9e2f189fd6b6906aeb8f523d1b4db56b061396b79678c9;
    stim[47] = 192'h26b4f59ed8356c8921ae34e43a92b40c2f7572259b54cdbe;
    stim[48] = 192'ha4ddd6440bca2fcc9738ba5fae805297eab5367423b4299f;
    stim[49] = 192'h256e058dd3324f18452858c3773a2c9a56041018f3df8208;
    stim[50] = 192'hf3ae5206d0004d2b86fd3b9077635030ee88426d185a2bc9;
    stim[51] = 192'h416108668a92812b834127cdb32c9bb54c50777cbad5cda3;
    stim[52] = 192'hfecf9ed3daad193ea750ead989a32f37a3da91ce10023904;
    stim[53] = 192'h1df34c81276ce6de6ead090f7d4ae6cd99daec3c54cbefb8;
    stim[54] = 192'h3364a2f766fa9759c11bc1e90f67d8f1da740f1593072208;
    stim[55] = 192'hd8633240a5c568c981784394a2d7fd15b20b8a3ca272168f;
    stim[56] = 192'h30ace6ea431abe6d9c1efcb19e6d13d8b779219d34e99533;
    stim[57] = 192'hd9d108f5d76e1aaeec889f3bddf6c90c7f3a86533c122bd4;
    stim[58] = 192'h1c6066f0347dfc1eab9d9a496a1df215726a87c518b2f165;
    stim[59] = 192'h773292e3f218f7bd1c6683f59aea3edf16dfa18a03e637e2;
    stim[60] = 192'h8eac391967db765f88f9ed1b4b6a4649b838a2ff40ce11e7;
    stim[61] = 192'h46cfabb40f140512e08faeeddf1f744ab4cc7329967bc37a;
    stim[62] = 192'h8571f8dbb3484e539d48379b3958e0b33c39cb074555fcb8;
    stim[63] = 192'h8e19bbfacc479ee5db7d5ef5807713ea9b0b2a11ac9aeee0;
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
      expv[0] = 128'h47939b0dd98b5d99aa2c74f26654b266;
      expv[1] = 128'h1eac698b8bbc0feced411a74f0576717;
      expv[2] = 128'h0670c51b029df2abaa8b68e55ce08955;
      expv[3] = 128'hff9e48bf8ed52f720561ff027332f2dd;
      expv[4] = 128'h5752ec70ed27a8c2a8ed19ee19da763d;
      expv[5] = 128'hb6f5c12dd7edfabc49082afaee12a503;
      expv[6] = 128'h9ae5a841dd434c02741ec6be23d93dbe;
      expv[7] = 128'h839009d768bc7738f85ed66c9f63a8c7;
      expv[8] = 128'h3f3004786232e4ebc0cabbe199c79414;
      expv[9] = 128'h9201db5ba9f10c2b4dfd30ac528ef254;
      expv[10] = 128'h776aad2dc3fb42ccc1150290be0ffd31;
      expv[11] = 128'hbe98263f85f2cfa305638bd27b6c125c;
      expv[12] = 128'h1e8fac4d907bf9f1e374879a6b1f040e;
      expv[13] = 128'hbb54dc4bad4a258064ab80ae5085df3f;
      expv[14] = 128'hedac1cbebbf488a3324feb41c60d731c;
      expv[15] = 128'h491b444225ecc14ff2e419f9921134a4;
      expv[16] = 128'h27be38714029f8ab1804868e3eba0650;
      expv[17] = 128'h84b608ddf40e66a43859d3026ae59f53;
      expv[18] = 128'hb9f6702e1d207bee2a0b2f90829780a1;
      expv[19] = 128'ha2329dcd48ddba1b7d48630fdf764680;
      expv[20] = 128'h2d0b61d49dfdcf34f3751e4be2d0084a;
      expv[21] = 128'he634373b7b4ae85708dedad6aeb75688;
      expv[22] = 128'hee7f7eeb5840837b35e060958f3b7e84;
      expv[23] = 128'h24d1fee4aaf26387bf6881134704be5e;
      expv[24] = 128'hc943f786e6722e692698887909159f95;
      expv[25] = 128'h693b9c91fcf37e8f17ce690e5e262370;
      expv[26] = 128'h45b86c32ba27192da3aa97dd04d9fec0;
      expv[27] = 128'h51a1d2ebbade5f73e20ead135591466d;
      expv[28] = 128'h2d1fb4ca9f07b83653e82a37e47147c9;
      expv[29] = 128'h6e2a95929bee0c22a09eeb6fa611e5ac;
      expv[30] = 128'hfc1c86f80e01611683f0fb13d3f7bee8;
      expv[31] = 128'h02d5716ac196cf717d268e913c79449c;
      expv[32] = 128'hb3efe09904a2586fe8123464f538a372;
      expv[33] = 128'h2fe655a3620c27d2981b8adcf9cbcc6f;
      expv[34] = 128'h9397c609f3fb244f256e29a604571db0;
      expv[35] = 128'hf51a9491983126562ec17b6f37dee8a9;
      expv[36] = 128'hed33e526c5edc19a12249a596e923e41;
      expv[37] = 128'hc74c33f251ba0ac93c37ac8da647947e;
      expv[38] = 128'hf25a99623e9f086b09c5b1d940629695;
      expv[39] = 128'h668341445e87988eb9e9be2aa178546b;
      expv[40] = 128'h1363dd1b2ca10b59ec9ea2e2d27efca6;
      expv[41] = 128'hec2cb4c17c1a805721d13af0a3e76faa;
      expv[42] = 128'h9f7de37d532be6a921e09e80ecc41d76;
      expv[43] = 128'h077db7a752cd492acc065140e423a6c5;
      expv[44] = 128'h8758aa5b71cd85b44985f1e40ce43947;
      expv[45] = 128'h057d4f2ae9cdf20eab82b1b404331dd4;
      expv[46] = 128'h6b8e0f12bf967c912e73b3dc155b83ec;
      expv[47] = 128'h27b474a49a14ec8c286fb35f79f3153b;
      expv[48] = 128'ha6bdb6542b802b9fd9505a6f86fe54c4;
      expv[49] = 128'h452c1089f33a0e1836424d5657d7e18a;
      expv[50] = 128'he6ac5204504249299bdb2bfbbf3936d2;
      expv[51] = 128'h4141276cba9489a38e7058d7836bd73d;
      expv[52] = 128'ha7da9adb98a33936fa45e5c4430c0f0d;
      expv[53] = 128'h1dfb4c0d754ae6dcea84a9b20eedefab;
      expv[54] = 128'hd37483f507679259280b6c0bfa9a6da0;
      expv[55] = 128'h906b0214a2d77c8deb10fbe8a5608353;
      expv[56] = 128'hb43ce4b9166997791bcb3bc6e99e3886;
      expv[57] = 128'hfd988e73dd760b8c4a63119d368af876;
      expv[58] = 128'h3a6886c1383df015c5977b7c46d2ff6e;
      expv[59] = 128'h167683e392ea37ff7d8bb09c6b14fe80;
      expv[60] = 128'h88b8a91b43ca564fbe6d76fd6c7f21f1;
      expv[61] = 128'he4cfabad9f1f455a128c76704670b222;
      expv[62] = 128'h9d79fb9b3158ecb324000447cf455258;
      expv[63] = 128'h9b193af18c579ee0ce6fcf1ee0aa63ef;
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
