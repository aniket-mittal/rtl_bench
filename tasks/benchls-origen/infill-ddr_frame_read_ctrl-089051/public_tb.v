// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 165;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_089051 dut (
    .ui_clk(clk),
    .rst(in_vec[132:132]),
    .rd_start(in_vec[131:131]),
    .rd_ack(in_vec[130:130]),
    .app_rdy(in_vec[129:129]),
    .app_rd_data_vld(in_vec[128:128]),
    .app_rd_data(in_vec[127:0]),
    .rd_req(out_vec[164:164]),
    .rd_done(out_vec[163:163]),
    .rd_busy(out_vec[162:162]),
    .app_cmd(out_vec[161:159]),
    .app_en(out_vec[158:158]),
    .app_addr(out_vec[157:129]),
    .rd_ddr_data_vld(out_vec[128:128]),
    .rd_ddr_data(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h1708e611f3f6a87d38076b67a1f5a03169;
    stim[1] = 133'h1aff32d376940fe973fb0a4abbddd5468c;
    stim[2] = 133'h0e10a91870698c2768d69a91a0a027cb60;
    stim[3] = 133'h0d506a2e589bafc66f9ed49cf0865146eb;
    stim[4] = 133'h0cea3e22289887d87b4240e182034b8184;
    stim[5] = 133'h138462f562e6f34d3e50e78c837fb61d3d;
    stim[6] = 133'h0511d459837616c5efd0f5619df7c2b105;
    stim[7] = 133'h094108193aa9b6e47f47f85e25ce11cd1f;
    stim[8] = 133'h09ef3c3340cf969e9f7fbf8299c28736ce;
    stim[9] = 133'h0ea27d62fec514ae9da8e7fd036e563e4d;
    stim[10] = 133'h05b87ba0fd07dcb95ae162151107655547;
    stim[11] = 133'h057c76ec9e7c21aff1c21313db86857622;
    stim[12] = 133'h064369b1e6895a09a0ca504da1a79fb4ab;
    stim[13] = 133'h0cdaf2ea2c02d310f95c1d8eca898d7e89;
    stim[14] = 133'h0c2abcb7600c602113f984ae2be8e29aba;
    stim[15] = 133'h09bbb1dabfd68965ae29d30efc7480c328;
    stim[16] = 133'h0fa4a66383e18aeb02365b6dafc3410d61;
    stim[17] = 133'h066de5c1cd58f8311de768f8607c4cbd3a;
    stim[18] = 133'h1c695a3f7c83431fd7e3c9bd7ecfc4778e;
    stim[19] = 133'h02f35fad4b639587de482cfedf4c889623;
    stim[20] = 133'h05c3af7fb050695a29b72ea56ea836e3f6;
    stim[21] = 133'h0e239b96ebaff5ce98a111c83e9a288d4e;
    stim[22] = 133'h003f2297a5d347ad8774e2017bba99601d;
    stim[23] = 133'h010177c37cb6f8d4f1d0407ba1d3160e66;
    stim[24] = 133'h0b800956ea5601e7deedd00163bd5a9a3b;
    stim[25] = 133'h000f86c79c50d0026afc953fd2a2198b8d;
    stim[26] = 133'h0ce7a74a51281398e97a17557859c6a9f6;
    stim[27] = 133'h06101ad21d416903c8aea0662bd2b5d604;
    stim[28] = 133'h043339cdb23c280bca0719541024f3d899;
    stim[29] = 133'h034dc78c214a8fb1bfb0571a6d22dbb352;
    stim[30] = 133'h0d06b31cb61dbdda5fdf7d04f1d5982dce;
    stim[31] = 133'h02290fa6ef09162f36572674f5806e837c;
    stim[32] = 133'h00007d1411ff3738b44c4502217490bf7b;
    stim[33] = 133'h072f523ae6b7ce4ff6c6db58e4442949a5;
    stim[34] = 133'h0adee6caae4d4f3eb62b4435c1d4d172dc;
    stim[35] = 133'h0731caa614f367cf88d28db9db3f534f93;
    stim[36] = 133'h099b2a95810ba5572039686a8bdfb043a7;
    stim[37] = 133'h05ed703a0a1599a03d4866b4cc3e104ead;
    stim[38] = 133'h0207c498c1bd045eef3df564f27b53ccf2;
    stim[39] = 133'h05de5da115dfb3a97f16f066920040663c;
    stim[40] = 133'h088c7ef3eb31867ba75d54ed25f04b4d37;
    stim[41] = 133'h002f1400e46b20a470ba55b094db6b16ec;
    stim[42] = 133'h0039fb8caa973cda354948a774c498502f;
    stim[43] = 133'h0f870ecf4d0f0f6be73e62f45546606787;
    stim[44] = 133'h0449fd2ea9c157234f35d2ff390bb107c6;
    stim[45] = 133'h0b258dcf12564c1f4dfa496848d033ea7b;
    stim[46] = 133'h0de04f24fa5e169be81c2857b36eea95a7;
    stim[47] = 133'h0ba1f76ade6c77d27ca940475a9d60d79f;
    stim[48] = 133'h062aa7400c73e1ca4912be9f34b3e767a3;
    stim[49] = 133'h1a202c090fc5de0f49697ffa245a22892b;
    stim[50] = 133'h0bc65e21c376cf703f20fd4b15640b4608;
    stim[51] = 133'h0823fb5469018c90d6293f31b129880c79;
    stim[52] = 133'h0b7b20e3316e60890d7ccd28d824677407;
    stim[53] = 133'h02dbceac286a6c2fa77a226816c5d2cd29;
    stim[54] = 133'h0502ffb29a5b9a739ce878c9aea65e2f8c;
    stim[55] = 133'h0f86efcbdf1f48ef3e1d0c6238c70a38af;
    stim[56] = 133'h0c14356367593fa9c1c83197fa2c23feec;
    stim[57] = 133'h0d34acb6a189581ee897ac96fbbb452c7e;
    stim[58] = 133'h077f49cf21dbe8adf5777c7b780c907e14;
    stim[59] = 133'h0e4edb8a4015fd4132ce5b4c7971e53ec4;
    stim[60] = 133'h0d812ddac361a86f770602e9ac681a5f33;
    stim[61] = 133'h0655443bc495ac71f02578e268af7a61b8;
    stim[62] = 133'h0ad0e9295dc90b9e003772ef8b0dc654fb;
    stim[63] = 133'h0fe724173c318953cfc70686ce21d78bfb;
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
      expv[0] = 165'h000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 165'h000000000108e611f3f6a87d38076b67a1f5a03169;
      expv[2] = 165'h0000000000ff32d376940fe973fb0a4abbddd5468c;
      expv[3] = 165'h000000000010a91870698c2768d69a91a0a027cb60;
      expv[4] = 165'h14c0000001506a2e589bafc66f9ed49cf0865146eb;
      expv[5] = 165'h0000000000ea3e22289887d87b4240e182034b8184;
      expv[6] = 165'h00000000018462f562e6f34d3e50e78c837fb61d3d;
      expv[7] = 165'h000000000111d459837616c5efd0f5619df7c2b105;
      expv[8] = 165'h00000000014108193aa9b6e47f47f85e25ce11cd1f;
      expv[9] = 165'h14c0000001ef3c3340cf969e9f7fbf8299c28736ce;
      expv[10] = 165'h14c0000000a27d62fec514ae9da8e7fd036e563e4d;
      expv[11] = 165'h1480000001b87ba0fd07dcb95ae162151107655547;
      expv[12] = 165'h14800000017c76ec9e7c21aff1c21313db86857622;
      expv[13] = 165'h14800000004369b1e6895a09a0ca504da1a79fb4ab;
      expv[14] = 165'h1480000000daf2ea2c02d310f95c1d8eca898d7e89;
      expv[15] = 165'h14800000002abcb7600c602113f984ae2be8e29aba;
      expv[16] = 165'h1480000001bbb1dabfd68965ae29d30efc7480c328;
      expv[17] = 165'h1480000001a4a66383e18aeb02365b6dafc3410d61;
      expv[18] = 165'h00000000006de5c1cd58f8311de768f8607c4cbd3a;
      expv[19] = 165'h0000000000695a3f7c83431fd7e3c9bd7ecfc4778e;
      expv[20] = 165'h0000000000f35fad4b639587de482cfedf4c889623;
      expv[21] = 165'h0000000001c3af7fb050695a29b72ea56ea836e3f6;
      expv[22] = 165'h0000000000239b96ebaff5ce98a111c83e9a288d4e;
      expv[23] = 165'h14c00000003f2297a5d347ad8774e2017bba99601d;
      expv[24] = 165'h14c00000010177c37cb6f8d4f1d0407ba1d3160e66;
      expv[25] = 165'h14c0000001800956ea5601e7deedd00163bd5a9a3b;
      expv[26] = 165'h14800000000f86c79c50d0026afc953fd2a2198b8d;
      expv[27] = 165'h1480000000e7a74a51281398e97a17557859c6a9f6;
      expv[28] = 165'h1480000000101ad21d416903c8aea0662bd2b5d604;
      expv[29] = 165'h14800000003339cdb23c280bca0719541024f3d899;
      expv[30] = 165'h14800000014dc78c214a8fb1bfb0571a6d22dbb352;
      expv[31] = 165'h148000000106b31cb61dbdda5fdf7d04f1d5982dce;
      expv[32] = 165'h1480000000290fa6ef09162f36572674f5806e837c;
      expv[33] = 165'h1480000000007d1411ff3738b44c4502217490bf7b;
      expv[34] = 165'h14800000012f523ae6b7ce4ff6c6db58e4442949a5;
      expv[35] = 165'h1480000000dee6caae4d4f3eb62b4435c1d4d172dc;
      expv[36] = 165'h148000000131caa614f367cf88d28db9db3f534f93;
      expv[37] = 165'h14800000019b2a95810ba5572039686a8bdfb043a7;
      expv[38] = 165'h1480000001ed703a0a1599a03d4866b4cc3e104ead;
      expv[39] = 165'h148000000007c498c1bd045eef3df564f27b53ccf2;
      expv[40] = 165'h1480000001de5da115dfb3a97f16f066920040663c;
      expv[41] = 165'h14800000008c7ef3eb31867ba75d54ed25f04b4d37;
      expv[42] = 165'h14800000002f1400e46b20a470ba55b094db6b16ec;
      expv[43] = 165'h148000000039fb8caa973cda354948a774c498502f;
      expv[44] = 165'h1480000001870ecf4d0f0f6be73e62f45546606787;
      expv[45] = 165'h148000000049fd2ea9c157234f35d2ff390bb107c6;
      expv[46] = 165'h1480000001258dcf12564c1f4dfa496848d033ea7b;
      expv[47] = 165'h1480000001e04f24fa5e169be81c2857b36eea95a7;
      expv[48] = 165'h1480000001a1f76ade6c77d27ca940475a9d60d79f;
      expv[49] = 165'h00000000002aa7400c73e1ca4912be9f34b3e767a3;
      expv[50] = 165'h0000000000202c090fc5de0f49697ffa245a22892b;
      expv[51] = 165'h0000000001c65e21c376cf703f20fd4b15640b4608;
      expv[52] = 165'h14c000000023fb5469018c90d6293f31b129880c79;
      expv[53] = 165'h14c00000017b20e3316e60890d7ccd28d824677407;
      expv[54] = 165'h1480000000dbceac286a6c2fa77a226816c5d2cd29;
      expv[55] = 165'h148000000102ffb29a5b9a739ce878c9aea65e2f8c;
      expv[56] = 165'h148000000186efcbdf1f48ef3e1d0c6238c70a38af;
      expv[57] = 165'h148000000014356367593fa9c1c83197fa2c23feec;
      expv[58] = 165'h148000000134acb6a189581ee897ac96fbbb452c7e;
      expv[59] = 165'h14800000017f49cf21dbe8adf5777c7b780c907e14;
      expv[60] = 165'h14800000004edb8a4015fd4132ce5b4c7971e53ec4;
      expv[61] = 165'h1480000001812ddac361a86f770602e9ac681a5f33;
      expv[62] = 165'h148000000055443bc495ac71f02578e268af7a61b8;
      expv[63] = 165'h1480000000d0e9295dc90b9e003772ef8b0dc654fb;
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
