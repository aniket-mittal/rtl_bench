// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 297;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_f_spsram_128x144 dut (
    .CLK(clk),
    .A(in_vec[296:290]),
    .CEN(in_vec[289:289]),
    .D(in_vec[288:145]),
    .GWEN(in_vec[144:144]),
    .WEN(in_vec[143:0]),
    .Q(out_vec[143:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 297'h1e81cda9cb63a0403481c2bc395fb9a5f8682711d0d43e46733a790d8659986591ac82b7ae4;
    stim[1] = 297'h011bd83bc8234f7c58a31a3464504cb53d3dda22c03dc7fa5800d628a1e10b249b32e395a66;
    stim[2] = 297'h0e131519b154702ac98191d946b3607e8c6ed762c8d51ef93eff0cd897b0b46229653cabfab;
    stim[3] = 297'h18e801be54bbf6c1f49bf32a74c3e9ebfcc8cd06cf16e3e76c1faf328fc7a251314d670079e;
    stim[4] = 297'h06b27999b1b9cd47b4c517d0aac81e042099b268acf020e210ef846c2291443f65cdf26480c;
    stim[5] = 297'h150e15b8706553cb5ca6ed7581fb555ae0fcafd43134dd4daf9c436e41a0f8713c0f790d369;
    stim[6] = 297'h14c437ce24e1bb53902cb30c7fa03180897f67734e06ec4aed5a79a0041774683986ad2a56c;
    stim[7] = 297'h118242f4d452edf8b47a2b8bfe005e16bbf39a8b9b007311d878d063eea8aa656c4b815e9b5;
    stim[8] = 297'h13d4871324cbfa8a388a2f5d29b02c3f01ab79c9979cb86e0be13bed3cbb2bfd1d66328fcc5;
    stim[9] = 297'h07fbe1dffb0e2d93985e71bd772e632b07dd1bea5ca8f0b85a55665b744bac1cdda33151702;
    stim[10] = 297'h13ce080205541f8f073fe8f46628636ea3209ae9185471e0f271b4efeb834f3a7dcafe8073e;
    stim[11] = 297'h1dc8a1b1c5581c3d144ea134a92807ffe6da6f0f876d8544e7aa6982e8606700efd3698cc6f;
    stim[12] = 297'h190cc2a82bedb6d76c2442a4ca533fb8c04c8e5511cfda8de55caf6d06baf5f8fd02976f004;
    stim[13] = 297'h1316862f5d2c26971564b53cc557cc08ed8d5c0d21f3fc08762dc84901afedd8f8280eac2b0;
    stim[14] = 297'h0b3da108f0b45db4ab8fde90e3af4eab41867f14e1daa47b4f3b74ec2850181e45ae577f318;
    stim[15] = 297'h0fff4caaf8ed4eceef2ab6842b9cac8c03e90f6484128539d797c905ec950e77ea79215a5f8;
    stim[16] = 297'h0e8c105edc287b9789a7540401f4080f92c8b0203ed85c03e9f6d6c86cb07e77401a46b5153;
    stim[17] = 297'h0172aa31dd49a729a9627997a26a1c0f1f592f8bab99cb108675f5a95e5e86259d49556a350;
    stim[18] = 297'h0ae5fad537446667f8e8d02771c7578e6ff337962dcf954bd396f619e1fdc9572fd04d3a3d7;
    stim[19] = 297'h152f7436afd5a5116597c53071779e01544b3697453771ffb2ee1d5fd6cf23c7da80a92d63d;
    stim[20] = 297'h026b9a22c210787bf959e40d246976392f7a02683d4f85c290185e24aad9990d6a6ff949fbf;
    stim[21] = 297'h0b2e8eeb01edb75c55f2ce7e0687a161b049f88f3687c751bcc4faa5513427fa06e4bf40966;
    stim[22] = 297'h0f0329900962753834c26e720e82ad2951ae19ff003db813c55b775a892890cef1369c144f8;
    stim[23] = 297'h11c0846e82e4ad0ada3190a1fd7a4ef9fc1196fc37aef16e0205804fa6b1c4cbf3b5a6eebb6;
    stim[24] = 297'h14532128a665852b54484108299d24ff73227876f24e0e84a74dd2c6241e72b95302a3d5fbb;
    stim[25] = 297'h1ba7713fca1fa12a5f22c03521c2defed99d5b458dfdd7157723c79c404e320e63bd555ab93;
    stim[26] = 297'h18be537028ee74bd50f86114353539bd632718dd6a15d1f550892deb811f60a1dc413e5536e;
    stim[27] = 297'h1f493f43e0ce1639c695eec50893a820b046c63d9ab130c53fa14fd183c4233726684208344;
    stim[28] = 297'h0797c745c55832f33fc283a0b896300054c21163472889ade33973f326ab75afd5c15c8fbcf;
    stim[29] = 297'h0ca66795630243856f5d0489dcb650c4b8a6d3fcc1610ddc6f38323f8b41ea92d1620bc0298;
    stim[30] = 297'h010d19f2b6ede2bc7d005bd1d37285240baf96abfbb4389dc2c59760cfa8c9d9b7776ff53b7;
    stim[31] = 297'h1c302fc39477628f6e35e3c3d8699aacfdaea1d9920c94727dc4a17a13faa2fafdbf73d4126;
    stim[32] = 297'h0bc2d10f7d6c6437b5868197d78d0e8b34c1e7cca762dedeb0fa260451a7030b55af7c13cf9;
    stim[33] = 297'h174af74a1738376af20cf9217d72eb5fc04c7f61b3aee674e5d7d626246678c33024e66af0c;
    stim[34] = 297'h13a2285c0ee74356d5cef15a109477d33d425a6320e14fd7c662787458701a382ee7b4ea3cf;
    stim[35] = 297'h114ceb42da7f91e18084066689247da2baef8202960c334cfadd0b0a2dd5e778fa5e32d5413;
    stim[36] = 297'h117984589d29bea55b9ea9fccea73ca87c3efcfea0a1e45d59ef46b98d0d3b5a7a8f6cfe2f7;
    stim[37] = 297'h180795a68f996fb176ca86a4485fee5c36e555f7cc2b291fa3882b9f5859a33d2b5e6d8fe03;
    stim[38] = 297'h10b1b6a2e0da00d47c02a3718f9bd86d1d238f10ed6d0aa9af418ba093204b095e581315c4d;
    stim[39] = 297'h060e0e050fec3aef75ed0b37c52fa613a6129be3052ac048867fdc0691501938342ccfa64bf;
    stim[40] = 297'h1d936400a93ae399a8baec125b9d6c2cda70f9bb88a5f59a47741f3c237b7d1967274241dd0;
    stim[41] = 297'h18de4bd1e168762e69c6e2f60af187e1363e89c95b29f49f361d3fff82676145694dce71155;
    stim[42] = 297'h0a2fd7ac4d0e358a13336384c37880f759c60a071ad1dbeffba28cd4c2c71eeec83a2ef2f7d;
    stim[43] = 297'h0ee8e1804a5cb7187a26fc8b91f35c68fafec7639971da002fc972f3cd275a62d03b136ea77;
    stim[44] = 297'h020e6caadecd4a96da69d2c9bc7ce67bcffc7a934c6c2e320338d00fa59025152007113922c;
    stim[45] = 297'h020b692fa5228996742ebda26507a55ca164b7791d9c44593b4bf6de6d74e6c843b3e77aad6;
    stim[46] = 297'h029a81eea15f8e3fab163467055d9d85fc07d446ae662815342634fe67f5bb574ede4bf52d5;
    stim[47] = 297'h1187788ac9d5c75ec84c522fe6dc0d24150d7cbd07bb39344024c8d80e669d20ea39407cda0;
    stim[48] = 297'h06efc23b9dae1a93f19385d5c79fcbfea74fe9194cb641741e968ebe09da7135a215ce038b0;
    stim[49] = 297'h1cfe6c107ae59f5001bf7762dc5d6f7374455ced61288fa5b866fc1195185e673814997bd74;
    stim[50] = 297'h0309b6a9791d777abd10b7e098da06850f22c1fd55b9e28a7039afaf259793ad4032a787706;
    stim[51] = 297'h16a6c27bccc23d02f8e62673c33fbd3f158f133cc7f3d56b4154cfdfb70c9eaeb8ca948083c;
    stim[52] = 297'h17c72bfc7a691cd9e33a8b7157251c70c5c1fad9a39c432432bb7aa5f5e07d45d16c6d0353e;
    stim[53] = 297'h08c85680f9ae8a52d5b3e7abd7cca6fcdd0222db4ec3d8fab5307aa2e9dcb1ce8bdfb2daccd;
    stim[54] = 297'h18e0ccef9e7fe3d2e6477948b21d97749053eaaeb7dd744e1c6f3629cfb36fb7206bb399621;
    stim[55] = 297'h1f226892ee2711e11289ea7f1ba2c0df0baa9c3110385e7ccacae22a88e018a6ee2c7a4e194;
    stim[56] = 297'h13a5f91111a67cc9e3223bf2820d0ba10e00f98a0f634fe81ad3c16f011c44f413b75c92c1d;
    stim[57] = 297'h10aa384b8c6baa47a32f5493d5787314b5f0c7f062feead53f434a6d6a24574cfec6654fb90;
    stim[58] = 297'h1ba95793d16c5f8f61c2fa160a157e47f53021ce4cf21da84d7ca7b2e2a008531b76ac5d4aa;
    stim[59] = 297'h1b1386a8949caa62646188fa8496c00fc58984a670d5af178aa076f5e5f555f93467c7bab44;
    stim[60] = 297'h02e4303683367be9f461b1b72adfed8f6ff3ca7f5c994621f1bb8f7e13bae31e2a74b8106ed;
    stim[61] = 297'h12f44c09253d16844400c25840e73a003f9bc5318b9029f4bf4d0fae29c7542030ffc2c1e1a;
    stim[62] = 297'h067524cd30493df9e01779ba482b7a3cb7355478dbe54cb656e3e68812e2c7810d538b7ec49;
    stim[63] = 297'h0ad830bd63cd82322aaf1e61916ed369c76967d2af8061c409c50c82831ad5bb006e6e34964;
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
      expv[0] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 144'hxxcxxxxxxxxbexxxxxxxx3xxxxxxxxxxxxxx;
      expv[3] = 144'hxxxxxxxxxxxxx6xxxxxxcxxxxxxxxxxxxxxx;
      expv[4] = 144'hxxxxxxxxxxxxx6xxxxxxcxxxxxxxxxxxxxxx;
      expv[5] = 144'hxxxxxxxxxxxxx6xxxxxxcxxxxxxxxxxxxxxx;
      expv[6] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 144'hxxx7axxxxxxxxxaxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 144'hxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 144'hxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 144'hxx4xxx2xafxxxx7xxxxxx3xxxxxxxxxx0xcx;
      expv[12] = 144'hxxxxxxxxxxxxxxxxxxxxaxx94xxxxxxxxxxx;
      expv[13] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 144'hxxxxxxx9xxxxxxxxx5xxxxxxxxxxx7xxxxx0;
      expv[15] = 144'hxxxxxxx9xxxxxxxxx5xxxxxxxxxxx7xxxxx0;
      expv[16] = 144'hxxxxxxx9xxxxxxxxx5xxxxxxxxxxx7xxxxx0;
      expv[17] = 144'h6xxxxxx1xxxxxxxxxxxx2xxxxx4xxxxxxxxx;
      expv[18] = 144'h6xxxxxx1xxxxxxxxxxxx2xxxxx4xxxxxxxxx;
      expv[19] = 144'h6xxxxxx1xxxxxxxxxxxx2xxxxx4xxxxxxxxx;
      expv[20] = 144'h6xxxxxx1xxxxxxxxxxxx2xxxxx4xxxxxxxxx;
      expv[21] = 144'h6xxxxxx1xxxxxxxxxxxx2xxxxx4xxxxxxxxx;
      expv[22] = 144'h6xxxxxx1xxxxxxxxxxxx2xxxxx4xxxxxxxxx;
      expv[23] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 144'hxxcxx63xxx39exxx0xxx82x28xxxxxxxxxxx;
      expv[32] = 144'hxxcxx63xxx39exxx0xxx82x28xxxxxxxxxxx;
      expv[33] = 144'hxxxxxxxxxx2xxxxcxxxxxexcxxxxxxxxxxxx;
      expv[34] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxx5xxxxxxxfx;
      expv[35] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxx5xxxxxxxfx;
      expv[36] = 144'hxxxaxxxxxxxxxcx4xxxxxxxxxxxxxxxxxxxx;
      expv[37] = 144'hxxxaxxxxxxxxxcx4xxxxxxxxxxxxxxxxxxxx;
      expv[38] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 144'hx0xxxx7xxxxxxxxfxxxxbxxxxxxxxxxxxxxx;
      expv[41] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 144'hxxx7axxxxxxxxxaxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 144'hxxx7axxxxxxxxxaxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 144'hxxx7axxxxxxxxxaxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 144'hxx3xxxxxxxxx1xxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 144'hxx3xxxxxxxxx1xxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 144'hxx3xxxxxxxxx1xxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 144'hxx3xxxxxxxxx1xxxxxxxxxxxxxxxxxxxxxxx;
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
