// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 216;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087772 dut (
    .clk(clk),
    .write_en1(in_vec[215:215]),
    .write_en2(in_vec[214:214]),
    .write_en3(in_vec[213:213]),
    .write_en4(in_vec[212:212]),
    .write_en5(in_vec[211:211]),
    .write_en6(in_vec[210:210]),
    .write_en7(in_vec[209:209]),
    .write_en8(in_vec[208:208]),
    .read_en1(in_vec[207:207]),
    .read_en2(in_vec[206:206]),
    .read_en3(in_vec[205:205]),
    .read_en4(in_vec[204:204]),
    .read_en5(in_vec[203:203]),
    .read_en6(in_vec[202:202]),
    .read_en7(in_vec[201:201]),
    .read_en8(in_vec[200:200]),
    .addr1(in_vec[199:191]),
    .addr2(in_vec[190:182]),
    .addr3(in_vec[181:173]),
    .addr4(in_vec[172:164]),
    .addr5(in_vec[163:155]),
    .addr6(in_vec[154:146]),
    .addr7(in_vec[145:137]),
    .addr8(in_vec[136:128]),
    .Data_in1(in_vec[127:112]),
    .Data_in2(in_vec[111:96]),
    .Data_in3(in_vec[95:80]),
    .Data_in4(in_vec[79:64]),
    .Data_in5(in_vec[63:48]),
    .Data_in6(in_vec[47:32]),
    .Data_in7(in_vec[31:16]),
    .Data_in8(in_vec[15:0]),
    .Data_out1(out_vec[127:112]),
    .Data_out2(out_vec[111:96]),
    .Data_out3(out_vec[95:80]),
    .Data_out4(out_vec[79:64]),
    .Data_out5(out_vec[63:48]),
    .Data_out6(out_vec[47:32]),
    .Data_out7(out_vec[31:16]),
    .Data_out8(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 216'h28a7e798faa775e917e4a51b6c4a615516bcad794af01100319184;
    stim[1] = 216'h6ef8f1179cf2828a648d7515428866c8e40d588fa7b8bf68a384c1;
    stim[2] = 216'hf75135e480f01e54f4e1bbf13f244df6499ead137670f95eb79a03;
    stim[3] = 216'hbde4ab4b08cb5f9e00c335a67617f396c59ce549fd1a0363776881;
    stim[4] = 216'he9b2aa51f35c676fb0fc6304487350c361c9aeb3e965ede977cba7;
    stim[5] = 216'h8618ab5ccd52b06eb6500dd0596b554ee48fa83077adcec26fa07a;
    stim[6] = 216'h2d11670ae3ce7d932c00e6dc7642a9782a9e47334894248af7d784;
    stim[7] = 216'hc3bb54341f09266743642842984dc4d29a93ad712bfdd73bf7d87b;
    stim[8] = 216'h335fd5bf231d4cc9634fdbe63186dd56806ea27a827f96c8b7cfaa;
    stim[9] = 216'hd099ac1188722d037e03824c02e19b8079ba374779cad5ab6a09f5;
    stim[10] = 216'h16a37417c4a7c0585c6ba08e636e17c18e7900d2b60cdb1178abbe;
    stim[11] = 216'hddee4625d712926ff5fbe7de3f3b1e325d32d97db40db39c73dd1b;
    stim[12] = 216'h3dccfbb0f89d6702e6438d09b5592748d07b2447b6b28aee40b8a7;
    stim[13] = 216'h14120ddc6ec0bea502128ffc07cfe80d7d507c3700674897842a15;
    stim[14] = 216'hb511253c8a9aedd4e97ad3046965c2a001c47928de4f47bad01669;
    stim[15] = 216'h88ed19dc00907ed371eda78274980b803f70ace7fb4b94315bc684;
    stim[16] = 216'h147dad38ba0c2675c6027223aa6a4f007b962d6628c3bedfb6b9d3;
    stim[17] = 216'h329ce3586b91460afec74676cd11e97a9efb94411eff5b24f4825f;
    stim[18] = 216'h4e67f34ae94cf6079040cd3c489e7eb32c019be41c53a37b4bf04c;
    stim[19] = 216'h9520b76aac19eea22dcbf644a1e5deafc02a812169b4965658d832;
    stim[20] = 216'hb2126269586e1c75e9c467dfd4b3c09cf76ae78ea91d4f6c21d8d0;
    stim[21] = 216'h124a7aa9ee84ac006e2a3c035ef9271ed0392d38ffbff9c654569c;
    stim[22] = 216'ha30c49f6e124ee881c68e0299a13dbd6df0b887a1bd618ba5d0834;
    stim[23] = 216'h6d780506ace225d11b74b120322d3766a7a2366c31d1472bbd96c2;
    stim[24] = 216'h91d0c11bb7dfdec7c17dbbba0c62b62f71cc6c02b82cc64d970269;
    stim[25] = 216'h010f5fc321e2a3027e8fb3eeff0d4fbb1f3c616f42811348831712;
    stim[26] = 216'h9fe56852e06000bf64d6564434b9725495661e8b81819108ca1f3b;
    stim[27] = 216'hcb92134894dcc6b50f2197fc01887fd1e9a710ef6fbead9374beb3;
    stim[28] = 216'h8b33f8049c3ba90b6ad398beb93bf98dd001f1195d7667363804bb;
    stim[29] = 216'h2a0269e3bf81df66eca28110078de05409f581adade850e4a1a8b1;
    stim[30] = 216'hb283bff3f35166a39d258bc63adefbf3234925aede7330164621ce;
    stim[31] = 216'hce25468350ce2aaf3d8e6c5b42f492e35e2de882eba037df4ebd8d;
    stim[32] = 216'h8171092a3132135ec6ec3a1ec2887c9b588dbe883f401aafe833e2;
    stim[33] = 216'hfde13e43f40086d6fbe7b8497d7a5949ac0b4d7c747daf97c2235b;
    stim[34] = 216'h22f6e4a7cb2bc31f8b02cf6e245c2781ae1770b49e5d728e56af12;
    stim[35] = 216'h739a459557433b9e6e87b57312281983193bc021603917a195c0b3;
    stim[36] = 216'he09266943740e7aa279193f347f0dd946c785e7be1efb4a1f16eaf;
    stim[37] = 216'haa526ac49c3d04fff267b057c952be02eb81c46d9ed438d66b79ce;
    stim[38] = 216'h55bf57d6f04f8c0f0555a53908571d67c43f9bd0e4b7322d1021ae;
    stim[39] = 216'he0d0facb1ae7108ec7c0d42f1d0b5d7024110c6313b13435673ab4;
    stim[40] = 216'h7f3dbfe48716f379b95073c5515e7b6ccaed6447559c3eb500d8f3;
    stim[41] = 216'h43a4797d08bb320c01fbee7dfa1677221a39dc7cdb394f9f3c403d;
    stim[42] = 216'hc598c5b1de4a022d4a7c80ec03633e2f093eec9c80eb3dadae3562;
    stim[43] = 216'hcaef5825837d4210896f9db29b57c3b5ceb827ffd5f7dbc6cc2657;
    stim[44] = 216'h1520a0ef254bee49d4bf2a3708e6845db0fc2c199f6b7f262675e7;
    stim[45] = 216'h5dc822715aa69c8200a0624ec3f39feecf23547197e7561d82838c;
    stim[46] = 216'h4f46bf747c6dda49bb2e05023dc590e482172f810f243084f09ee1;
    stim[47] = 216'hed0b7b52ac8912fb8dc4c6cbd45c4f2acc6d2241cfaf8f69be9b54;
    stim[48] = 216'h9a55d64d77ac3e3d9f9bdf12ab0e3aa8caa3aacb0eb5eb5ee5c5f4;
    stim[49] = 216'he26e35ee2e328d07b7ecdd46bcaa09b388778be7bd734fc7e41097;
    stim[50] = 216'h2147edb5766d5778cbd3100c960a62b4820315ce99849f2fa3afcd;
    stim[51] = 216'h1732e38b0808771933ba603392bab1734db261d07938ca1fb7b6f4;
    stim[52] = 216'h897879b8d0fc645f441e9d256305cee4e6a1a5b8ccffdcaafe5d72;
    stim[53] = 216'h79706928c99f2b7c7df745c69663f1753fba68ea3098cc7851ecc5;
    stim[54] = 216'ha6077d1bcdbc48abf546d83610d212dc0df1eb0fd86ae27d405835;
    stim[55] = 216'hf5fd519ea81c6ec0f7ed774da869580a905ed1a6ab61b120bb773b;
    stim[56] = 216'h4c0d2ccceb3de4120b919bded73a5f6d1bedfb9599cdf1d763bb7d;
    stim[57] = 216'h3485b1e05c6c0c058bfe1274a863df00197fba5e8d94ad689d4fec;
    stim[58] = 216'h6f274e855b0cc4a8af223897917e406ca876009a4fd39ed56cf05e;
    stim[59] = 216'h18cc416f15e8167979da5d8957e8c0717c632bde4ae59d04277285;
    stim[60] = 216'h00119f8acfa458912998a07801dc3f82e08c2e9f30ade6aea6e4b4;
    stim[61] = 216'ha3b5b009c28c5cded90fbf2b2c6d07596ff17cbb4fdc20076d8de9;
    stim[62] = 216'h1bf570ee7dbd9e8eda85d9ad76bff981e553f42c4be8c19d2a28d6;
    stim[63] = 216'hbfc95127ffdd237d4bd62a669527e1fab67293545b714c3f4f240c;
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
      expv[1] = 128'hxxxxxxxx5516xxxxxxxxxxxxxxxxxxxx;
      expv[2] = 128'hxxxx8866c8e4xxxx8fa7xxxxxxxxxxxx;
      expv[3] = 128'hxxxx244dc8e49ead8fa7xxxxxxxx9a03;
      expv[4] = 128'ha676xxxx96c59ead8fa71a03xxxx9a03;
      expv[5] = 128'h0448xxxxc361xxxx8fa71a03xxxx9a03;
      expv[6] = 128'h0448xxxxc361xxxxxxxx1a03xxxx9a03;
      expv[7] = 128'h0448xxxxc361c8e4xxxx1a03xxxxd784;
      expv[8] = 128'h4298xxxxxxxxxxxxxxxx1a033bf7d87b;
      expv[9] = 128'h4298xxxxxxxx6ea2xxxxxxxxc8b7cfaa;
      expv[10] = 128'h4c02xxxxxxxxba37xxxxxxxxc8b7xxxx;
      expv[11] = 128'hxxxxxxxxxxxxba37xxxxxxxx1178xxxx;
      expv[12] = 128'hde3f3b1exxxxba377db40db3xxxxxxxx;
      expv[13] = 128'hxxxxxxxxxxxxba3747b6b28axxxxxxxx;
      expv[14] = 128'hxxxxxxxxxxxx507c47b6b28axxxxxxxx;
      expv[15] = 128'hxxxxxxxxxxxxc47947b6b28axxxx1669;
      expv[16] = 128'h8274xxxxxxxxc479e7fbxxxxxxxxc8b7;
      expv[17] = 128'h8274xxxxxxxx962dxxxxc3bexxxxxxxx;
      expv[18] = 128'hxxxxxxxxxxxxfb94xxxxxxxxxxxxxxxx;
      expv[19] = 128'hxxxx9e7exxxxfb94xxxx53a37b4bxxxx;
      expv[20] = 128'hxxxx9e7exxxxfb94xxxx53a37b4bxxxx;
      expv[21] = 128'hxxxx9e7exxxx6ae7xxxx53a36c21xxxx;
      expv[22] = 128'hxxxxxxxxxxxx6ae71a0353a3c654xxxx;
      expv[23] = 128'hxxxxxxxxxxxx6ae7xxxxf649c654xxxx;
      expv[24] = 128'hxxxx2d3766a7xxxx6c31f649c654xxxx;
      expv[25] = 128'hba0cxxxx66a7cc6c6c31f649c654xxxx;
      expv[26] = 128'hba0cxxxx66a7cc6cxxxxxxxx73501712;
      expv[27] = 128'h4434xxxxxxxxcc6cxxxx819173501f3b;
      expv[28] = 128'hfc01xxxxxxxxxxxxxxxx819193741f3b;
      expv[29] = 128'hfc01xxxx6ae7xxxxxxxx8191363804bb;
      expv[30] = 128'hfc01xxxx6ae7xxxxxxxx8191e4a104bb;
      expv[31] = 128'hc63axxxx6ae7xxxxxxxx81911646xxxx;
      expv[32] = 128'hc63axxxxxxxxxxxxxxxxa0371646xxxx;
      expv[33] = 128'hc63a4298xxxx195dxxxxa037164633e2;
      expv[34] = 128'h497d7a5949ac195dxxxxa0371646235b;
      expv[35] = 128'hxxxxxxxx81aexxxxxxxxxxxx8e56235b;
      expv[36] = 128'hb496xxxx81ae3bc0xxxxxxxxa195235b;
      expv[37] = 128'hf347xxxx81aexxxxxxxxxxxxxxxx235b;
      expv[38] = 128'hf347xxxx81aexxxxxxxxxxxxd66b235b;
      expv[39] = 128'hxxxxxxxxba0c3f9b8e56b732xxxx21ae;
      expv[40] = 128'h2f1d0b5dba0cxxxx8e56b732xxxx21ae;
      expv[41] = 128'h2f1d0b5d6ccaed6447559c3exxxxd8f3;
      expv[42] = 128'hxxxx0b5dxxxxed644755xxxxxxxxd8f3;
      expv[43] = 128'hec030b5dxxxxxxxxxxxxxxxxxxxxd8f3;
      expv[44] = 128'hb29b57c3xxxxxxxxffd5xxxxc6ccxxxx;
      expv[45] = 128'hb29b57c375e7xxxxffd5xxxxc6ccxxxx;
      expv[46] = 128'hxxxxf39f75e7xxxx7197xxxxc6ccxxxx;
      expv[47] = 128'hxxxxc59075e7xxxx7197243084f0xxxx;
      expv[48] = 128'hxxxxc59075e7xxxx41cf24306c219b54;
      expv[49] = 128'hxxxx688175e7a3aa41cf66a76c21xxxx;
      expv[50] = 128'hxxxxaa09b388a3aa49acxxxxc7e4xxxx;
      expv[51] = 128'hxxxx57c9b388a3aa49acxxxxxxxxafcd;
      expv[52] = 128'hxxxx57c9xxxxb26149acxxxx1fb7afcd;
      expv[53] = 128'hxxxxaf8fb261xxxxb8ccxxxx1fb7afcd;
      expv[54] = 128'hxxxx63f1753fba68b8ccxxxx1fb7afcd;
      expv[55] = 128'hxxxx7d40753fba68b8cc6ae27d40xxxx;
      expv[56] = 128'h4da869580a905ed1xxxx61b14da8773b;
      expv[57] = 128'h4da869580a905ed1cdf1cdf14da8xxxx;
      expv[58] = 128'h24f469580a905ed1cdf194ad4da81ec2;
      expv[59] = 128'h24f469586ca85ed1cdf1d39ed56cf05e;
      expv[60] = 128'hcdf1xxxx6ca85ed1de4a8866d56cf05e;
      expv[61] = 128'hcdf1xxxx6ca8xxxxde4a8866d56cxxxx;
      expv[62] = 128'h2b2cxxxx596fxxxxde4axxxxd56c8de9;
      expv[63] = 128'h02ebxxxxxxxx28d6de4axxxxd56c28d6;
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
