// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 218;
  localparam OW = 218;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02698 dut (
    .clk(clk),
    .reset(in_vec[217:217]),
    .io_out_ready(in_vec[216:216]),
    .io_in_0_valid(in_vec[215:215]),
    .io_in_0_bits_centeroidsFinished(in_vec[214:214]),
    .io_in_0_bits_pointsFinished(in_vec[213:213]),
    .io_in_0_bits_centeroidIndex(in_vec[212:197]),
    .io_in_0_bits_point_x(in_vec[196:133]),
    .io_in_0_bits_point_y(in_vec[132:69]),
    .io_in_0_bits_point_z(in_vec[68:5]),
    .io_in_0_tag(in_vec[4:0]),
    .io_out_valid(out_vec[217:217]),
    .io_out_bits_centeroidsFinished(out_vec[216:216]),
    .io_out_bits_pointsFinished(out_vec[215:215]),
    .io_out_bits_centeroidIndex(out_vec[214:199]),
    .io_out_bits_point_x(out_vec[198:135]),
    .io_out_bits_point_y(out_vec[134:71]),
    .io_out_bits_point_z(out_vec[70:7]),
    .io_out_tag(out_vec[6:2]),
    .io_in_0_ready(out_vec[1:1]),
    .io_chosen(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 218'h37a08a6fed4c64fedbd5f185141d8222c4ab0aca82f26a3e876e86b;
    stim[1] = 218'h336c9b709fb291cc0a6041c22904cf00c3ef83bbbe3868698a5b099;
    stim[2] = 218'h10002f882af146e0facfbebc288cee773e14d39a5b3167c752aee68;
    stim[3] = 218'h1b20c5acd4fb2e8cef0009bdf8e67ac8a52fe7a317c344ab901ff22;
    stim[4] = 218'h12c608ad517e9f6da30701014dbb568edbde53e4c77a7305367553e;
    stim[5] = 218'h0059daf5fa8b5c53332b6855bd1b8c73e6d5235ad848ac348b70142;
    stim[6] = 218'h0593afb183595414f9840c7bc2023e289e19b51cc292f0fe45b1432;
    stim[7] = 218'h058916ed645c9f5c7f3af731baa0c142d70465d3c378c1b2bb8fe0e;
    stim[8] = 218'h0dd8c0c069097ab60e8bdcb98d1dccc792ae2f4c81108fbdd481883;
    stim[9] = 218'h027ae6f9bee3cacd555d6db2f57eb864a49fb156c62fa8d2a9eb0cb;
    stim[10] = 218'h0280dca4007db7fcd5adacb685a507050df079aaef34f4d9cf14508;
    stim[11] = 218'h01f2a8c0f1251c2c7d439ce5753e326216de79389de85359e3a9fda;
    stim[12] = 218'h1eca8147cfb9a776d34ae604ebd4a1cd92bc6155d70e2a7945128d8;
    stim[13] = 218'h04d2160352c178fdbf9269e8b37cc187d2814a369a797e6dac404b2;
    stim[14] = 218'h15cb5d257ef384e058ee867cf0b2dac5e61ae3bceeddf5918e9e9e6;
    stim[15] = 218'h15551b031d98f5c751ebf79aa4e770e0317144b59022705703dd5ce;
    stim[16] = 218'h0e41049fe49570a4caec2ee5ad75ae71ee675429fca347e6879c39c;
    stim[17] = 218'h08bc67c248e5a9b6d061f075f7c3547691ee9183240c059f1c8cdfa;
    stim[18] = 218'h1d5da065d54ec6a552b89b593158c3d70aa50f81608057d6797ea94;
    stim[19] = 218'h0bd51bdeead101061c2f915044d05a132e945d72fa1f92ca74e7991;
    stim[20] = 218'h0c9e75193fbc2b88d405372a74410460393d2300b28866515f02889;
    stim[21] = 218'h1d08d7b1c949e47c046d372d0e363f9b981389dd7c5dc38701e015a;
    stim[22] = 218'h152adbfe9c1587b2af9f7117873401bd7bad23d7879242ef3ab1014;
    stim[23] = 218'h158134c19dc0ba137e98224b4518b4aea239ef2a60130f10ab518f1;
    stim[24] = 218'h0aadbe4e343c15edef9e86c7e19ee17abfb3d6af3291b5cdc899642;
    stim[25] = 218'h16e5122e567897b16a2d23360317cac4f1b536a6f4b4e1b2eeec1d3;
    stim[26] = 218'h0c75fe9a5b47030d5eda839cc3dbe20208779340735bfc617b57147;
    stim[27] = 218'h12b2299df76f891e9c82b2378eb5b2ac34590c854ef72b72008840f;
    stim[28] = 218'h059d313cd42952f2bbd76ed63e88079d09ac37c9ef17138291fdfda;
    stim[29] = 218'h02841ede171643fe4b9b8cf6c29d0058db104f6a09c87b80deefc76;
    stim[30] = 218'h1cdb49b493ac5f41c7355d1dd1adf1ac49126806f415ed160b7ea1b;
    stim[31] = 218'h1d89bf75072003292cc986daba8948edb09ded855d941890e5a851c;
    stim[32] = 218'h0284da1e19d8f1439766860207d4371a1b8e48f073c19d621384eca;
    stim[33] = 218'h0e6d6982f38bfe4621784d1f464a9dd727900652860b861119d9201;
    stim[34] = 218'h04e28b2ba1b19580e4d4e9abb8fb5ef72d12b8d489367d492900e25;
    stim[35] = 218'h1def57034f0c78f538a0259f1de03ad5b3eba8244bccd91d50119e8;
    stim[36] = 218'h0bc81a27076f5e875feddd0a1ea9d9510fb043d452537fc025f7644;
    stim[37] = 218'h18d37d2795782f77045cb94360c8683a92bbe71f2de7803f6441863;
    stim[38] = 218'h06e8e7bbdfe314e72d0a63e4e16acac5d6c9a18b8b8193d2760b0fa;
    stim[39] = 218'h050b12fdef5ee37ea34ca84a38d37a755a7c3078ce40ec7f38d72ef;
    stim[40] = 218'h1d2a29e1b011df748d97814d708ed3ab8c6682ef4fb3568dd35dc67;
    stim[41] = 218'h04c66e5d8654cf30c696cb8e3181765b57d904eae19aebf2ab779e2;
    stim[42] = 218'h137fdd658ee526237b20c7eea72c94fcaf24a6f04e280c9c1bac07a;
    stim[43] = 218'h12971ced3bd97038d87ec5d85e46dc54b974cf0ad31e3796879cde7;
    stim[44] = 218'h0eb940a2efab1b989aafca28c7bc7793183d9de4abe25b55c02aed2;
    stim[45] = 218'h17237e2f2e2847c80a20797655997f123d64a14c36a19b5e5e683b4;
    stim[46] = 218'h13c28f077f489736577689dcefda93c122e314ba10f8f68a341728b;
    stim[47] = 218'h06e58fe6fe286e6fcb58a3b272ff98f41b88423bd367ccd084ee41f;
    stim[48] = 218'h072d2a01ed74be4b302c8ccd995c636838b207079967d7d97eca54d;
    stim[49] = 218'h1e8beb3d21616002e12d7ba7fff6f4c78b341bf26c29084083f1b7a;
    stim[50] = 218'h073298eeb5c1db0692cbc70e4de0af56486ea0d175095f15121e6c0;
    stim[51] = 218'h1b9606a0a161cfd3bcfc6a1b0b241eeb280c614907ae4ee49f8ffa8;
    stim[52] = 218'h149d707510aaf1d6f0cb60e1e5f284269af51f8bfdb33fbe51f6485;
    stim[53] = 218'h107ee92d082fee7df1741887550a750aad7b35302de7449f666fb28;
    stim[54] = 218'h0cd8ee19c58d1d0fd1f457f2c83982065b4b1ead80838b898649879;
    stim[55] = 218'h1963867c346623c137563f550aa88b8fb3e25af2ebe162acebdcf53;
    stim[56] = 218'h0be28feed20b4b069a79d5d4812c1839aed93e361c5cb5a52a2ca94;
    stim[57] = 218'h0c38c1d3fe1f9921846e86c1337f90f57076e71cb00289877071589;
    stim[58] = 218'h0607bd44f70be146f046756db53235d352475870e8943b67a2865d0;
    stim[59] = 218'h06cff6aa87e4c05e6c53600d53b407d6e79bf087c4ab9b4a1daf1b5;
    stim[60] = 218'h181ee48ac7a31642b2ba10ab118cd2bd6f429468396d49c80c7562e;
    stim[61] = 218'h0c45fb181db938c2becf0094970ed9cbbb22f43887957e28003758c;
    stim[62] = 218'h1914ee2f415de9cb54af36f5c9e798dd171920cd4ae6cd9d3c3dfb2;
    stim[63] = 218'h1d9dd022317f79547d6b1fd23f4522202597e41691137e8cd8e735a;
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
      expv[0] = 218'hxx822xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 218'hxxb26xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 218'hxx00bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 218'hxx831xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 218'hxx182xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 218'hxx676xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 218'hxx4ebxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 218'hxx245xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 218'hxx630xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 218'hxxeb9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 218'hxx037xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 218'hxxcaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 218'hxx2a0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 218'hxx485xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 218'hxx2d7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 218'hxx546xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 218'hxx041xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 218'hxxf19xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 218'hxx768xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 218'hxx546xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 218'hxx79dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 218'hxx235xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 218'hxxab6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 218'hxx04dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 218'hxxb6fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 218'hxx944xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 218'hxxd7fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 218'hxxc8axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 218'hxx74cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 218'hxx107xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 218'hxx6d2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 218'hxx26fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 218'hxx136xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 218'hxxb5axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 218'hxx8a2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 218'hxxbd5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 218'hxx206xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 218'hxx4dfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 218'hxxa39xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 218'hxx2c4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 218'hxxa8axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 218'hxx19bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 218'hxxff7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 218'hxx5c7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 218'hxxe50xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 218'hxx8dfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 218'hxx0a3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 218'hxx963xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 218'hxxb4axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 218'hxx2faxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 218'hxxca6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 218'hxx581xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 218'hxx75cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 218'hxxfbaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 218'hxx63bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 218'hxx8e1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 218'hxx8a3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 218'hxxe30xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 218'hxx1efxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 218'hxx3fdxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 218'hxx7b9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 218'hxx17exxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 218'hxx53bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 218'hxx774xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
