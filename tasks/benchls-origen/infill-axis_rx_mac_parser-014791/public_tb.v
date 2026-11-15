// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 152;
  localparam OW = 199;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_014791 dut (
    .user_clk(clk),
    .reset(in_vec[151:151]),
    .router_axis_rxd_tdata(in_vec[150:23]),
    .router_axis_rxd_tkeep(in_vec[22:7]),
    .router_axis_rxd_tvalid(in_vec[6:6]),
    .router_axis_rxd_tlast(in_vec[5:5]),
    .trans_axis_rxd_tready(in_vec[4:4]),
    .router_axis_rxd_tuser(in_vec[3:0]),
    .router_axis_rxd_tready(out_vec[198:198]),
    .trans_axis_rxd_tdata(out_vec[197:70]),
    .trans_axis_rxd_tkeep(out_vec[69:54]),
    .trans_axis_rxd_tvalid(out_vec[53:53]),
    .trans_axis_rxd_tlast(out_vec[52:52]),
    .trans_axis_rxd_tuser(out_vec[51:48]),
    .rx_dst_mac_addr(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 152'hb8b8a29922fba522629142c46193c0e84938a0;
    stim[1] = 152'hb82a73fd7e8a91bb1d1c746814b3933a8c99ea;
    stim[2] = 152'h1a147a93558471dc3e40d554fb2d778dbd37dc;
    stim[3] = 152'h3e1af703c4c82206d333fce7c555579acaa7b7;
    stim[4] = 152'h777f0bedbd4a676153aa0014585c9910403e77;
    stim[5] = 152'h3891c0afc3e443022d5b8c429bc70c9c692704;
    stim[6] = 152'h08afbe02788b42edb6dba1e553c55a41f69854;
    stim[7] = 152'h691cde92b7dcdade1a4744b03eb84551cf607b;
    stim[8] = 152'h09149ed168f716e3dcf1261901bda470eec1b0;
    stim[9] = 152'h55f932311453d0b23af37f4d1e636579d24970;
    stim[10] = 152'h4b9b653095e8021875297ac337ee81772bc0f8;
    stim[11] = 152'h3661e86a1e8aab871895c0e2b60a093592bd27;
    stim[12] = 152'h22d0a21aba9310b0dccaf85e2b1265daabd568;
    stim[13] = 152'h04105194e4d805e210ba243d489ca5c8b7dde7;
    stim[14] = 152'h0b188de2c55abc79918dac5169af01767ee796;
    stim[15] = 152'h4596eb0a7ffb56f837d98247d9185a24c6cb87;
    stim[16] = 152'h6edc02a479772f4cf5fa7c90b00b26a9d198f5;
    stim[17] = 152'h296a9da6fae43b045586ccb7f4b5b1d82b23e8;
    stim[18] = 152'h19a875a13f52e1dafc11d3246d6ed1ef434750;
    stim[19] = 152'h5009bdcbffce1f93302654fd43445eeac1f06a;
    stim[20] = 152'h382623bcb54c0ff4ba264ba5b3cdddaf59a3d0;
    stim[21] = 152'h7226f8cfe998e7a4015c689d5da3fdc0240104;
    stim[22] = 152'h686b1e04b2bf08d3526800d37f44632255a513;
    stim[23] = 152'h1823de2687073211d99dd3d0f9c75c0b5185ad;
    stim[24] = 152'h27184edb7bcfa9b10d43367beea9313e509d8c;
    stim[25] = 152'h11348f08e1ca392d065031db822fecff0fea07;
    stim[26] = 152'h0b6934e6bd09c18fece8348ac73787d373219c;
    stim[27] = 152'h1644a0f3ac72878a635c40795eca407b7862bd;
    stim[28] = 152'h21c6b63079221951f28a1c5dba6f03182cb5db;
    stim[29] = 152'h4d017ea102e63dd6282d3f96fe340f9e4d4579;
    stim[30] = 152'h100fe54759a9312c6cc04929feb267bc709a2e;
    stim[31] = 152'h3f343acba6ff1c1c8ec879a7f9b4d92fed7bc5;
    stim[32] = 152'h09ce314cf2249d48b1a0770d247ee62f35ae3b;
    stim[33] = 152'h74fba893935eb8a0ec0d6ade2bf267cd3b2166;
    stim[34] = 152'h354e8b5c0c6551a67a9a6bab3053d5927354cc;
    stim[35] = 152'h4bab795f20c09fb09008f6f667a5c5efde52f7;
    stim[36] = 152'h30e3e5835c7d82dde084de2837f9fd19effac1;
    stim[37] = 152'h41b596663ede0bbfccd645b3c2e7992f9db2b3;
    stim[38] = 152'h5b173cf3d7cc487c9503780ea0e986427d3cd2;
    stim[39] = 152'h37446853f7cec4afad41a6201b63c73902d5ce;
    stim[40] = 152'h060b02798e280b73aa33eb5745c5d76281bfaf;
    stim[41] = 152'h24f7a00bba0d6f7c8a955a2a5d0c9d1cd774d9;
    stim[42] = 152'h4184316ef8ca6ed1b9a75766b303f8ddfcc1d2;
    stim[43] = 152'h12d7f5dd9a112b2633852dcab296d58ca616c7;
    stim[44] = 152'h66f88668d1aa95bd2279111f2fa5eb6e132a20;
    stim[45] = 152'h739bc9725711bf618d7998036f2ae08bacce59;
    stim[46] = 152'h08e20b3957cb4305d352457c5a7ebcb065c199;
    stim[47] = 152'h6062117eedc68c1ccda025f5e1def5923925fb;
    stim[48] = 152'h3edb970d0b085282a275505a1242eb28d51f0f;
    stim[49] = 152'h51a604c7c3d7197ff322511ba2b1afb369a929;
    stim[50] = 152'h0970b630c38c92e0b1c80182bc0bf7b521f755;
    stim[51] = 152'h4be4cb48380a13a9794c4d4cb6806af584e6a3;
    stim[52] = 152'h46083168eaa03b9e63592cd626c0c5f21f92d2;
    stim[53] = 152'h167ed92ae69d55c8556a197c47ba887ca672a3;
    stim[54] = 152'h71b07c3db69d80652e168529f73cf797292490;
    stim[55] = 152'h00dfe0fd6e32fb030c84526385a0bc000c324e;
    stim[56] = 152'h238637b068a10990051e44c7c085bdcddfca3e;
    stim[57] = 152'h283708a348709bcfafed3375d00bd6f46b5581;
    stim[58] = 152'h68287ea9478aa8c50dcc0ffe3ba0f80496e3ae;
    stim[59] = 152'h2840095dbb46b9c76f810069f6700bff37a5b3;
    stim[60] = 152'h3c8064c3fa8d09bc0a12ea42622b5840e0e966;
    stim[61] = 152'h6822719f0e6f4b9db3e0a78eb3a433bf623ce0;
    stim[62] = 152'h6f9943ce9b45f3695fff396c696fa10122b73b;
    stim[63] = 152'h5a6ba75face42dd7c4564d9194a0d56e7de8d8;
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
      expv[0] = 199'h00000000000000000000000000000000000000000000000000;
      expv[1] = 199'h00000000000000000000000000000000000000000000000000;
      expv[2] = 199'h00000000000000000000000000000000000000000000000000;
      expv[3] = 199'h40000000000000000000000000000000000000aaa9f65aef1b;
      expv[4] = 199'h40000000000000000000000000000000000000aaa9f65aef1b;
      expv[5] = 199'h40000000000000000000000000000000000000aaa9f65aef1b;
      expv[6] = 199'h00000000000000000000000000000000000000aaa9f65aef1b;
      expv[7] = 199'h4000000000000000000000000000000000000043caa78ab483;
      expv[8] = 199'h748e6f495bee6d6f0d23a2581f5c22a8e7b03b43caa78ab483;
      expv[9] = 199'h748e6f495bee6d6f0d23a2581f5c22a8e7b03b43caa78ab483;
      expv[10] = 199'h748e6f495bee6d6f0d23a2581f5c22a8e7b03bfe9a3cc6caf3;
      expv[11] = 199'h65cdb2984af4010c3a94bd619bf740bb95e078fe9a3cc6caf3;
      expv[12] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078fe9a3cc6caf3;
      expv[13] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078f0bc5624cbb5;
      expv[14] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078f0bc5624cbb5;
      expv[15] = 199'h65cdb2984af4010c3a94bd619bf740bb95e078f0bc5624cbb5;
      expv[16] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078f0bc5624cbb5;
      expv[17] = 199'h65cdb2984af4010c3a94bd619bf740bb95e078f92160164d53;
      expv[18] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078f92160164d53;
      expv[19] = 199'h65cdb2984af4010c3a94bd619bf740bb95e078a648dadda3de;
      expv[20] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078a648dadda3de;
      expv[21] = 199'h65cdb2984af4010c3a94bd619bf740bb95e078974b679bbb5e;
      expv[22] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078974b679bbb5e;
      expv[23] = 199'h65cdb2984af4010c3a94bd619bf740bb95e078974b679bbb5e;
      expv[24] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078974b679bbb5e;
      expv[25] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078974b679bbb5e;
      expv[26] = 199'h25cdb2984af4010c3a94bd619bf740bb95e078974b679bbb5e;
      expv[27] = 199'h65cdb2984af4010c3a94bd619bf740bb95e078974b679bbb5e;
      expv[28] = 199'h65cdb2984af4010c3a94bd619bf740bb95e078974b679bbb5e;
      expv[29] = 199'h50e35b183c910ca8f9450e2edd37818c165aeb974b679bbb5e;
      expv[30] = 199'h6680bf5081731eeb14169fcb7f1a07cf26a2bb974b679bbb5e;
      expv[31] = 199'h2680bf5081731eeb14169fcb7f1a07cf26a2bb974b679bbb5e;
      expv[32] = 199'h2680bf5081731eeb14169fcb7f1a07cf26a2bbf34ff369b25f;
      expv[33] = 199'h6680bf5081731eeb14169fcb7f1a07cf26a2bbf34ff369b25f;
      expv[34] = 199'h2680bf5081731eeb14169fcb7f1a07cf26a2bbf34ff369b25f;
      expv[35] = 199'h2680bf5081731eeb14169fcb7f1a07cf26a2bbd75660a7ab24;
      expv[36] = 199'h40000000000000000000000000000000000000d75660a7ab24;
      expv[37] = 199'h00000000000000000000000000000000000000bc506ff3fa33;
      expv[38] = 199'h40000000000000000000000000000000000000bc506ff3fa33;
      expv[39] = 199'h6d8b9e79ebe6243e4a81bc075074c3213e9e62bc506ff3fa33;
      expv[40] = 199'h2d8b9e79ebe6243e4a81bc075074c3213e9e62bc506ff3fa33;
      expv[41] = 199'h2d8b9e79ebe6243e4a81bc075074c3213e9e62bc506ff3fa33;
      expv[42] = 199'h527bd005dd06b7be454aad152e864e8e6bba62bc506ff3fa33;
      expv[43] = 199'h60c218b77c653768dcd3abb35981fc6efe60e2bc506ff3fa33;
      expv[44] = 199'h20c218b77c653768dcd3abb35981fc6efe60e2bc506ff3fa33;
      expv[45] = 199'h20c218b77c653768dcd3abb35981fc6efe60e2bc506ff3fa33;
      expv[46] = 199'h79cde4b92b88dfb0c6bccc01b7957045d66722bc506ff3fa33;
      expv[47] = 199'h79cde4b92b88dfb0c6bccc01b7957045d66722bc506ff3fa33;
      expv[48] = 199'h703108bf76e3460e66d012faf0ef7ac91c92f2bc506ff3fa33;
      expv[49] = 199'h303108bf76e3460e66d012faf0ef7ac91c92f2bc506ff3fa33;
      expv[50] = 199'h303108bf76e3460e66d012faf0ef7ac91c92f2bc506ff3fa33;
      expv[51] = 199'h703108bf76e3460e66d012faf0ef7ac91c92f203057817ef6a;
      expv[52] = 199'h303108bf76e3460e66d012faf0ef7ac91c92f203057817ef6a;
      expv[53] = 199'h630418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[54] = 199'h230418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[55] = 199'h630418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[56] = 199'h230418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[57] = 199'h630418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[58] = 199'h230418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[59] = 199'h230418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[60] = 199'h630418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[61] = 199'h230418b475501dcf31ac966b136062f90fc96203057817ef6a;
      expv[62] = 199'h230418b475501dcf31ac966b136062f90fc9624f1d6748677e;
      expv[63] = 199'h630418b475501dcf31ac966b136062f90fc9624f1d6748677e;
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
