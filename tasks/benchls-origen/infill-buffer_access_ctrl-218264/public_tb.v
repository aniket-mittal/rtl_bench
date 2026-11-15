// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 89;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_218264 dut (
    .clk(clk),
    .rst(in_vec[107:107]),
    .ctrl_word(in_vec[106:75]),
    .go(in_vec[74:74]),
    .dat_from_buf(in_vec[73:42]),
    .wr_data_i(in_vec[41:10]),
    .wr_flags_i(in_vec[9:2]),
    .wr_ready_i(in_vec[1:1]),
    .rd_ready_i(in_vec[0:0]),
    .done(out_vec[88:88]),
    .error(out_vec[87:87]),
    .idle(out_vec[86:86]),
    .en_o(out_vec[85:85]),
    .we_o(out_vec[84:84]),
    .addr_o(out_vec[83:74]),
    .dat_to_buf(out_vec[73:42]),
    .wr_ready_o(out_vec[41:41]),
    .rd_data_o(out_vec[40:9]),
    .rd_flags_o(out_vec[8:1]),
    .rd_ready_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'hbd3cf6fbfe92a3a8cd1141783ba;
    stim[1] = 108'he63838206704765c3efab1ad778;
    stim[2] = 108'h651585a45f31427850b7275c23c;
    stim[3] = 108'h78738831c3c657a1fd66f96a089;
    stim[4] = 108'h662454d0c5c8da53b34d20549d4;
    stim[5] = 108'h4bd7c017bfe58d4c17b8df666a6;
    stim[6] = 108'h0c09cda30a6c067f7f702b8a586;
    stim[7] = 108'h30195f9e8c93abc1f26c2ef4fc0;
    stim[8] = 108'h78c78a89dcbb07d782d39aa1f9d;
    stim[9] = 108'h7d76c6d1bd76005fe4bb29b929c;
    stim[10] = 108'h791e4e460548c85d39075835ca3;
    stim[11] = 108'h548b8860383ad0ae3f1dd32cdc2;
    stim[12] = 108'h7aa44eba6c9d6fb5a7913b444ca;
    stim[13] = 108'h376c7e3db3b70df3b4583d85f92;
    stim[14] = 108'h7f217859c2d4fec4a7104c1b0b3;
    stim[15] = 108'h255665d60aacb71555dc3f1627d;
    stim[16] = 108'h6ebaeae3c8f925a0532513229e5;
    stim[17] = 108'h0eeb4f85f2583852326861b61eb;
    stim[18] = 108'h5c5083ddb72439304a208a1d239;
    stim[19] = 108'h0d0bd53cededc63872a17a7d52e;
    stim[20] = 108'h087d2444101342d78b60a48bb36;
    stim[21] = 108'h501464df1f58db1b98256fed7d6;
    stim[22] = 108'h33397965b252d2b4d493b2fffd4;
    stim[23] = 108'h231ee47ff818e67756e3631b227;
    stim[24] = 108'h64f6ef929e437831a0697730644;
    stim[25] = 108'h6b1fb0f6f14cd63050fb25b7e2b;
    stim[26] = 108'h6767bf86c4c332f8dc2b7d21f25;
    stim[27] = 108'h560e3bd2fda47aa16f35262090d;
    stim[28] = 108'h60764ba762a36cf25a9d9d87109;
    stim[29] = 108'h0e49180a3f45d067db13d7b529e;
    stim[30] = 108'hb3af5c91e5c076b750885f2ce5f;
    stim[31] = 108'h56b54e56e203d4af1dd3f385366;
    stim[32] = 108'he20a91881d502bf51dca9cefaa6;
    stim[33] = 108'h041c957f142088d3f2e4c1e4b85;
    stim[34] = 108'h626a7ab22d6f4691a09349d117e;
    stim[35] = 108'h6bd63b955e57b2cfb3461529f4b;
    stim[36] = 108'h49fbd70e18a2f2c93749774ae53;
    stim[37] = 108'h2f4a4028ce6949a44547b75e7ea;
    stim[38] = 108'h25e54d023962afa89a79d5bc449;
    stim[39] = 108'h3dafe66fc22a88e98c7e27a9371;
    stim[40] = 108'h672bde08a72732ac443cea38214;
    stim[41] = 108'h721bb2977048b191da089cbed64;
    stim[42] = 108'h49c9cba0f98159b1dc1daad44fe;
    stim[43] = 108'h2147ab3ff67cb530146b1470e39;
    stim[44] = 108'h5ed3c9d44ec74c37e2320d0c86d;
    stim[45] = 108'h604dcc70809dc063718ca57e1f2;
    stim[46] = 108'h216fdbcd344cd3061d680335440;
    stim[47] = 108'h2fb6a4b6372352cb4fd57bbabdd;
    stim[48] = 108'h09e83b5de082dee5cf616165366;
    stim[49] = 108'h313449b57867d9647a971a9073d;
    stim[50] = 108'h6148697d7553e28bcfeb353fe64;
    stim[51] = 108'h4666cf3584ceb5f9f46034e7941;
    stim[52] = 108'h2441cee7e0a7c3eb9748d0c25c9;
    stim[53] = 108'h227c409c1c00d0c1e714c98b2f4;
    stim[54] = 108'h6d034b2c1637300b9e780cc09fe;
    stim[55] = 108'h7a199023f6aa3eed4436b442075;
    stim[56] = 108'h51a2f12cb81212b6b9be97c381a;
    stim[57] = 108'h130dbcdb6f2893582f012c0b105;
    stim[58] = 108'h20544611898f44d7c80c1fd3f2f;
    stim[59] = 108'h176747b02c6932e28b3a1e904f0;
    stim[60] = 108'h3a10abd31cb11a4d1dbec9e7755;
    stim[61] = 108'h2def5f2cb185a576063f8152806;
    stim[62] = 108'h766ed2e60d61691ad80c4be1348;
    stim[63] = 108'h4de38e4b30e8b5fb7f047b30be2;
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
      expv[0] = 89'h04000000000000000000000;
      expv[1] = 89'h04000000000000000000000;
      expv[2] = 89'h04000000000000000000000;
      expv[3] = 89'h04000000000000000000000;
      expv[4] = 89'h04000000000000000000000;
      expv[5] = 89'h04000000000000000000000;
      expv[6] = 89'h04000000000000000000000;
      expv[7] = 89'h04000000000000000000000;
      expv[8] = 89'h04000000000000000000000;
      expv[9] = 89'h04000000000000000000000;
      expv[10] = 89'h04000000000000000000000;
      expv[11] = 89'h04000000000000000000000;
      expv[12] = 89'h04000000000000000000000;
      expv[13] = 89'h04000000000000000000000;
      expv[14] = 89'h04000000000000000000000;
      expv[15] = 89'h04000000000000000000000;
      expv[16] = 89'h04000000000000000000000;
      expv[17] = 89'h04000000000000000000000;
      expv[18] = 89'h03000a208a1d2510450e800;
      expv[19] = 89'h030032a17a7d7950bd3ea00;
      expv[20] = 89'h03004b60a48ba5b05245c00;
      expv[21] = 89'h030098256fed6c12b7f6a00;
      expv[22] = 89'h0300d493b2ffea49d97fe00;
      expv[23] = 89'h0300d6e3631b2b71b18d800;
      expv[24] = 89'h0301206977307034bb98200;
      expv[25] = 89'h030110fb25b7e87d92dbe00;
      expv[26] = 89'h03015c2b7d21ee15be90e00;
      expv[27] = 89'h03016f352620b79a9310400;
      expv[28] = 89'h03015a9d9d872d4ecec3800;
      expv[29] = 89'h03015b13d7b52d89ebda800;
      expv[30] = 89'h04000000000000000000000;
      expv[31] = 89'h04000000000000000000000;
      expv[32] = 89'h04000000000000000000000;
      expv[33] = 89'h04000000000000000000000;
      expv[34] = 89'h04000000000000000000000;
      expv[35] = 89'h04000000000000000000000;
      expv[36] = 89'h04000000000000000000000;
      expv[37] = 89'h04000000000000000000000;
      expv[38] = 89'h04000000000000000000000;
      expv[39] = 89'h04000000000000000000000;
      expv[40] = 89'h04000000000000000000000;
      expv[41] = 89'h04000000000000000000000;
      expv[42] = 89'h04000000000000000000000;
      expv[43] = 89'h04000000000000000000000;
      expv[44] = 89'h04000000000000000000000;
      expv[45] = 89'h04000000000000000000000;
      expv[46] = 89'h04000000000000000000000;
      expv[47] = 89'h04000000000000000000000;
      expv[48] = 89'h04000000000000000000000;
      expv[49] = 89'h03003a971a907d4b8d48200;
      expv[50] = 89'h03000feb353fe7f59a9fe00;
      expv[51] = 89'h0300346034e7ba301a73c00;
      expv[52] = 89'h03001748d0c26ba46861200;
      expv[53] = 89'h03002714c98b338a64c5800;
      expv[54] = 89'h03001e780cc0af3c0660400;
      expv[55] = 89'h03004436b442221b5a21000;
      expv[56] = 89'h030079be97c3bcdf4be1c00;
      expv[57] = 89'h0300af012c0b37809605800;
      expv[58] = 89'h0300880c1fd3e4060fe9e00;
      expv[59] = 89'h0300cb3a1e90659d0f48200;
      expv[60] = 89'h0300ddbec9e76edf64f3a00;
      expv[61] = 89'h0300c63f8152a31fc0a9400;
      expv[62] = 89'h0301180c4be12c0625f0800;
      expv[63] = 89'h03013f047b30bf823d98400;
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
