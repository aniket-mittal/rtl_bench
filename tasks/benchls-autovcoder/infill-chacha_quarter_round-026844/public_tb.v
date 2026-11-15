// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 256;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_026844 dut (
    .clk(clk),
    .m0(in_vec[255:224]),
    .m1(in_vec[223:192]),
    .cs0(in_vec[191:160]),
    .cs1(in_vec[159:128]),
    .a(in_vec[127:96]),
    .b(in_vec[95:64]),
    .c(in_vec[63:32]),
    .d(in_vec[31:0]),
    .a_prim(out_vec[127:96]),
    .b_prim(out_vec[95:64]),
    .c_prim(out_vec[63:32]),
    .d_prim(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 256'h5cb2f873555d763094d84c3b568cb7e565fd271a2649b048ead3e36bff8c7374;
    stim[1] = 256'h5d1d02726b309dfd8c07d46b6d4cafc40470e9e38d298e8db513675004055c09;
    stim[2] = 256'hbb4ea0cc49ad3fc7fb27580cfbc5caccd872be531b4f7615d2a5955751c9f174;
    stim[3] = 256'hd2ea65bfd158589437c17cd745c77c779476d8532b517b30feae57cfac346c2f;
    stim[4] = 256'hc3e448b2f359d4fd45c1eaffba67ed0501a9310bc6d1a51bb82be627340515a2;
    stim[5] = 256'h41e8055c48eb638c6cb9a63cd5d67d9b10ab09d5284b494d1f3c9c6328f1f3b8;
    stim[6] = 256'h9e3809b7847eb2620da733a2036824675f2482d5ee79df461bbc4f9d897fea49;
    stim[7] = 256'hf400b2c4aee6566253f13f614d6dc1dabb6a8aa771cd1a1281ec216aa9d469f6;
    stim[8] = 256'hf763cac65ea3b1b7048e8470be09ed8d2366690ad277c4391d5e35ded81c0742;
    stim[9] = 256'h4deeaa5798cf888ff594bd59a6f685f0be036f3aadf72c46a67b459f42225b91;
    stim[10] = 256'hdd3497dd4620a6fedac7fa1d9b5fdf6895d04c369982492d3b7a68c38f0574f4;
    stim[11] = 256'h18c4244790236c553db745ad5cc2ad2eebc10f567288f99197d8eff248d070fe;
    stim[12] = 256'he1fe6dee40dba6df813812726095dd51b615d0e4f59b7678d8d5a4cdf5855348;
    stim[13] = 256'hc7a01177a2ae55fdc7ebfc3381860d6f417009559e426db26144ede852252516;
    stim[14] = 256'hf000c8a90f675c697d571760a0db2d37055f8bd5b03f93476045b25bbf4bff03;
    stim[15] = 256'hbab043dc45ea3c881e05c4979167a46c3a684da9571bf52911d2c975b251ff2b;
    stim[16] = 256'hd1682ba2931a9303eabbd2cfbed99b8b988392b140724d5a6b13894dca01a358;
    stim[17] = 256'h6cc86f13c8d06646da357f3f6f0f35ab0628ffaf87fd36e593d75efd65cddb53;
    stim[18] = 256'hc1b6b20c95ca8bb79cf3947e29ffd2ad8a2c17137c114c900f13512b40895e9c;
    stim[19] = 256'hc5b4c8cce45362d846efbebe224d21e5a7fc486f31a85c965ab6cb51b494ef01;
    stim[20] = 256'h0abdac81a3523e293d06a796f33d7f2b62d29405089ffcf224644072ec0d83c9;
    stim[21] = 256'hf27cece16413edd14216487eb581ff9c3bbda73455b4cbf1eb573ead8d13a8cf;
    stim[22] = 256'hf3c26bd5002b342ce010d84140c275f5dfd81447ab7b5266758896aab39dfbb4;
    stim[23] = 256'h924ef747a80d7632a95e6143f180dbc2890a419ecb0ad95424cb607ae4048172;
    stim[24] = 256'h3a6f19dcec52f8018f0f3b470ca1800e88f2c060f6c3b6f4d0f694e77430f93e;
    stim[25] = 256'h144981f98bdd3c3cd49623d6744c6bb72086e00666fbdde73b78e8ad74698e83;
    stim[26] = 256'h37bb599fcbb62567ca4799131e1018f01b43b3ce0115aeca0bd12311943ce914;
    stim[27] = 256'h9e90f0ae71c16eed07867397edf768bbd23b3686bc188da74fd56540d39d5390;
    stim[28] = 256'h42ee9eb37991f326b1cd3816ac8d113b8f5a6143f65682876399cce360c799b4;
    stim[29] = 256'h894029d90f0eb719914c16d2b0381c8bf136ebe1a0b713e8da43a2306cbd0251;
    stim[30] = 256'h597e8861abaa2b4f5ec8a6a90be1444d95525a4da65005baba84ebeb9443f91e;
    stim[31] = 256'ha815e6fc7752d6f883f05a1400ab49742fcfcc400e702b31365245af2ae02b89;
    stim[32] = 256'h8b7085dd9418b4e0faa279cc9e846a2ed2fc3a2c23504b58adabe4343d6abc4e;
    stim[33] = 256'h65453393af439db623c48c6a8172cf05305b803f0aad626da769601da8fa3a1c;
    stim[34] = 256'h36661c48d1c8167cd6b6347d1d6c32ee61e90484582f2e5591b8487ad74558d9;
    stim[35] = 256'h7eb8ca6f268947ac911eb254113e39a2c381d4c9c0d79e9ebc87ea0cca4c977a;
    stim[36] = 256'hd1ad1e3d63105701adfda766960b6e53a68f244c88e6e5bf7a3875e9917e6464;
    stim[37] = 256'h5a5777924da759f8439e4bf5cde00a81f6542d28ba1a845cf58da5fd2967e580;
    stim[38] = 256'h9a69d7badd15711619ab85a894040f1d8b570d60f00698229ea47880327f6c85;
    stim[39] = 256'h42e6f6184721b628fb8c4c6b29abae137f2d1d46fd198ed8a4ca2988ba9b1cb4;
    stim[40] = 256'h6daefeacdff040b27ef495b18e1001d61bcce6e802092fd089741cd80d8852bb;
    stim[41] = 256'h6982368e74ce501ca103847c522597c485814bfb2d160a4cecdbae7664059a36;
    stim[42] = 256'h09661e3487a2b3bc2f8cbce6fb371f540c2296a000b3bfee3f0808bc8363ead8;
    stim[43] = 256'haa84edced7c37ea7adf24569a279c998f085c5bedebc1049e79145913df0e8e0;
    stim[44] = 256'hc8653466cef297d07ba77e3be449ab7255ff4fcee53e71a5dc6cd730d04b7888;
    stim[45] = 256'hde4c81e5fdde078624e0526d77473df3dd9782ecca35dff7c24685c4c568c525;
    stim[46] = 256'ha7ad5694636c9eeaea1ae162b4d62261a651675da6747c54ba0d28dd2c948b7a;
    stim[47] = 256'hde7f9ab2b7eed77e47ebd8219395807637572e8ab5c95d8beb414b51a37456a7;
    stim[48] = 256'h322362ab209811e0431419c2f33e464f11fc67f34f36ab098c0f9f0051cf070e;
    stim[49] = 256'h9681d5bb0426c71cb0a1894e7bb85393e1668b8975636c8a8138b0230efe606e;
    stim[50] = 256'hab8a15c0126fbee688157b115c0687165356d7619cf0f080dc381c36d3548569;
    stim[51] = 256'h98ee9929480df45841ac843e059ea50017740bfdf8a6f6aa6f4def6e45f865f8;
    stim[52] = 256'hfb5f1f31671537f80703f172dca835c944561e9f67699df77939818ecd78b2fe;
    stim[53] = 256'h42c895c9fbc972f88be88bd00c4d157d313fb2907355c877752959cefcfa878a;
    stim[54] = 256'hcc97a7238bddd0a9c1fbdbc6542f44ee3fff26bcfd5b0f0e0feba221505ae664;
    stim[55] = 256'hc5cb866a9d24f207dcfd5ab4098f30d56eb7dd3ed77ffab23663fdb7aa82cad9;
    stim[56] = 256'hc54b612a1e152b375d47aaf9109d43946407c6cb581e7121f6c789a065406627;
    stim[57] = 256'h690b988c0ab24eb4db45cd6a29721f790b2e51486c1272760cf311eeb76f70f2;
    stim[58] = 256'hf9712be56405d4d5261dd3b2ebbba30455f340103ad2545c2c8c0d53bd52f1c3;
    stim[59] = 256'h1561b51f39ffffaf42170311e6e40d29766552c10d56750e4ac9fee8f5582b6b;
    stim[60] = 256'h9cb11320caccb486147569f1f246bceffc251891b8b7338937c59bf16db6283f;
    stim[61] = 256'he49e81aa7ea1e06eeb242e89defeba85b3cacc6917903eb2c57c29adaecf7ba6;
    stim[62] = 256'hfb551a796c69c67e12c3e7dff33baca256fccc62affe39f1c10d5c312cd53d74;
    stim[63] = 256'h9060b101ef9f39af659780f27215b238e642a86f9739d9753a47cd52511cb706;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 128'h1bd0c3a20250d197ebaea91eab4e5caa;
      expv[5] = 128'he46d96664d0b5692bee16f8c8f9e4253;
      expv[6] = 128'hb3bdaf1b9a5af668e19e9ca59fdca1ca;
      expv[7] = 128'hd79145b0dbd7d1f871ea484f71d6f5bf;
      expv[8] = 128'h8c34c18ef21e27409c8da7d675e24bb4;
      expv[9] = 128'ha7df8df5987cf3d9882e1090309f8e68;
      expv[10] = 128'h3b4f0421c7ee76a531bda095b05eed67;
      expv[11] = 128'h90539ce0507ad9ff91fbe3ae91ee72d3;
      expv[12] = 128'h2a2fc02228ee3e6be7a500597679e327;
      expv[13] = 128'h2d07ad64c1c6ed418bef0c8754bdb1b8;
      expv[14] = 128'hb80d394dd8fc3b76db7a453ef512e1c3;
      expv[15] = 128'h8e153d3a7615882d34f49649ba6cbbd7;
      expv[16] = 128'ha0e7c7e84a89a455f5353185710bb41f;
      expv[17] = 128'h1096cdadbfc51b2a67f5059f50a69fba;
      expv[18] = 128'h057a0bd2656461263efe2f3de2fec3b2;
      expv[19] = 128'hf40728a3569e4d01959d86a9ae21ae27;
      expv[20] = 128'h2ce6c124249404f2209f9636821f8a43;
      expv[21] = 128'h04584b6bf4ed807429459adc4b4e47bf;
      expv[22] = 128'h326d43b818b673d56194b527b7a8b5ed;
      expv[23] = 128'h31340f7569efddfe3b365bd57f501b7a;
      expv[24] = 128'h5b683393304351fe7988ca2b6dbc00bb;
      expv[25] = 128'h8cf9f356ab93c7c1446727d02aa294a7;
      expv[26] = 128'h807558d1b4e9c9ad1501314d1fff0cd5;
      expv[27] = 128'h8c887c8e6d0e92b8541b4190694a8d2f;
      expv[28] = 128'h3067d13ac2bcc65448e7d6af8fd87f13;
      expv[29] = 128'h5d6414cf7f0c7a2b90ad59152e7bdc87;
      expv[30] = 128'h002bff90c7720f6401322d76a84d382d;
      expv[31] = 128'h2420b4c78fd9942540d429cce12bf266;
      expv[32] = 128'h6f8cc1183a523d9c1a054c8bcb856ad5;
      expv[33] = 128'h07e3ea7b9a5f0bc1b1bef358a030a94d;
      expv[34] = 128'h890758391d9ad95cc80e302e385c2a42;
      expv[35] = 128'h8b6e0f1846cc0bd7c9c9309006061ec3;
      expv[36] = 128'h5b719df8bd54040a4a775e0bd39248ac;
      expv[37] = 128'h07705775c00e04415caa46b7cfe22ee0;
      expv[38] = 128'h37e9ba95f9ec4bfabd6cca69f20e4f88;
      expv[39] = 128'h7ddf1d478e940ae99863b4dceb8d9124;
      expv[40] = 128'he54b75ebab7a21732251b2de89fb5693;
      expv[41] = 128'h8c86ec9c675796669dec98cbdd47918d;
      expv[42] = 128'h0fee88613a8e14c6866e7667d51d4233;
      expv[43] = 128'h2936064c2508da6c009931f24331ab5b;
      expv[44] = 128'h14f6ea75368822af364da8db68507fe6;
      expv[45] = 128'hf3e44544a7ebec0bda217c807f9e43cf;
      expv[46] = 128'h5645301b3fe58c615c29f84c5feb734c;
      expv[47] = 128'h03d2855e187605ab8a609abf90116f60;
      expv[48] = 128'h1c015ea12b17831274809d3a80040ee9;
      expv[49] = 128'h723cb650e86fd3757fccfb98e1a9e023;
      expv[50] = 128'h881a91febe4e4f0ab9453c8f2b5bc6dd;
      expv[51] = 128'h0f569da37ebbf3d9b9bf0bd4ddff2805;
      expv[52] = 128'h1f4b7c8d4aac8516cf2db7ae122fa50f;
      expv[53] = 128'h73397b7670a0ab932afb67518b6d6c31;
      expv[54] = 128'h85b12f1876ae25635470bfd1985a6f1b;
      expv[55] = 128'hcbdfdc382e0569c41607cf154b90f734;
      expv[56] = 128'h0e884a1b66fd7e09a40598b0d55bf854;
      expv[57] = 128'h80d515dd64659eda2f574dc83dfce41a;
      expv[58] = 128'h96884d48eece0f181148a43501697bcb;
      expv[59] = 128'h14d111b61406a308c32b5e5e4850a7a9;
      expv[60] = 128'hcd259128e27f2324c84726c194f1a865;
      expv[61] = 128'h950411f764c3602b6ae257d422ae4511;
      expv[62] = 128'h6a3a613b272c65b812a0e094f986b47f;
      expv[63] = 128'h342a33b2bbc250e6a1d7c5b2ab9f44b1;
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
