// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 177;
  localparam OW = 164;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08794 dut (
    .clk(clk),
    .instructionin(in_vec[176:145]),
    .datahazard(in_vec[144:144]),
    .DatabusAin(in_vec[143:112]),
    .DatabusBin(in_vec[111:80]),
    .immin(in_vec[79:48]),
    .PCplusin(in_vec[47:16]),
    .RegDstin(in_vec[15:14]),
    .RegWrin(in_vec[13:13]),
    .ALUSrc1in(in_vec[12:12]),
    .ALUSrc2in(in_vec[11:11]),
    .ALUFunin(in_vec[10:5]),
    .Signin(in_vec[4:4]),
    .MemWrin(in_vec[3:3]),
    .MemRdin(in_vec[2:2]),
    .MemtoRegin(in_vec[1:0]),
    .RegDstout(out_vec[163:162]),
    .RegWrout(out_vec[161:161]),
    .ALUSrc1out(out_vec[160:160]),
    .ALUSrc2out(out_vec[159:159]),
    .ALUFunout(out_vec[158:153]),
    .Signout(out_vec[152:152]),
    .MemWrout(out_vec[151:151]),
    .MemRdout(out_vec[150:150]),
    .MemtoRegout(out_vec[149:148]),
    .shamt(out_vec[147:143]),
    .Rsout(out_vec[142:138]),
    .Rtout(out_vec[137:133]),
    .Rdout(out_vec[132:128]),
    .DatabusAout(out_vec[127:96]),
    .DatabusBout(out_vec[95:64]),
    .immout(out_vec[63:32]),
    .PCplusout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 177'h1a9676622c757c01bfbd920704eed8ed3271e9d06fa4c;
    stim[1] = 177'h1b83b18d97578cb8a98d3eee06d336333dee2395b8bfa;
    stim[2] = 177'h1c57e6e134e4b25cde046519a64bfb10fada3410c6b4f;
    stim[3] = 177'h19360ed42c33debd4cccc38df3283c5eba36fcaacb9e0;
    stim[4] = 177'h060e671612d9eee87e51141555af6e0e23993c94d4a01;
    stim[5] = 177'h0792e3c3f63c47534c2036ca7f69c5cb064b0b85a5c9c;
    stim[6] = 177'h1b626edcaadf107ed0f3d42cc0810612f6a3f8bcf36e4;
    stim[7] = 177'h164cf876e0e2e347c05a726d93a4f617acb11e2e87b0a;
    stim[8] = 177'h1fbcac178dea7d36bef6ae209d9dbf26b5f50bbcf6b58;
    stim[9] = 177'h17d7ec77aee1db1e8d56ac6c3dbf86d9792f2fe980d12;
    stim[10] = 177'h03ea4236ce382c303bc5de7c9d561371b2778038d4295;
    stim[11] = 177'h09cdf91dbf8afe9195c491a90639a035db01c63aed86d;
    stim[12] = 177'h086459dbb75ce147d4bfb514b987625f323ce5e48179f;
    stim[13] = 177'h172a654287c75c99edd09f2aa75edda06d9cace6eb92d;
    stim[14] = 177'h0ee96c665dbb7e35039b5b973de5bd70942d58ccf6e0b;
    stim[15] = 177'h1a67f28f3114b403a728c6455c9369f263e7107b89177;
    stim[16] = 177'h0175691ae649c5ade51358b0acf1a04a7c5d2a4923af3;
    stim[17] = 177'h0ef8dde730f6b08a0b2e0d00d1670cf35fad20068c632;
    stim[18] = 177'h12130b302f8a10313d1f4c5ffde51c540f27e78c5e498;
    stim[19] = 177'h02d873366fc806c67d9a4276932551722e53312e6a865;
    stim[20] = 177'h026f1c9df957e81e1fbc5013002d2dbd193729d999799;
    stim[21] = 177'h0712b222364c32b23ada4122765de6e3ed4558aa1eb16;
    stim[22] = 177'h1413c6836c80b870876b388e1fb89547d3760beff2e5e;
    stim[23] = 177'h19b4eb7fe38e01a654418e1c280b7c1c62d6ec058d8f6;
    stim[24] = 177'h0918eab82b06203f2a43a60dc5973aade8a1805adac7e;
    stim[25] = 177'h16a1a402329997e4cbe782c409b5de2669fc737445a15;
    stim[26] = 177'h1dbcb39e2786cf5e99b596b00fe700f156ee21f9e74d7;
    stim[27] = 177'h0c5e382c173c23b5c2023127438ecd8b8d4f89aa4be34;
    stim[28] = 177'h152eb226e0144312d3b32a370a2068ac885b69c9e6b0c;
    stim[29] = 177'h148ff4ac34269010ee02797e3cefd7a73010bef377a34;
    stim[30] = 177'h0ad5615cef43fdeb853f1de303e65958c87057d604e12;
    stim[31] = 177'h0ceb1398ce9732c70121298b4713a7f9822d1f73525a1;
    stim[32] = 177'h0676b2f30b9a510a7390ee308c5173a71c7366af84b9b;
    stim[33] = 177'h0979ad19dd092129b852631ef0385155f2f2143aee93c;
    stim[34] = 177'h180cb8cf6e993ded2e3bdc67fd5d20d4b5a6500b57bf7;
    stim[35] = 177'h0291a3317fc5965126b60a79db502a05eb9e044a6c01a;
    stim[36] = 177'h168c50bfa400f2994025f8cc4e5f27ebb38cb8981aa18;
    stim[37] = 177'h0eb58e1efb273ae4d91540e4e63016f2bcc6e6789629c;
    stim[38] = 177'h049c003bd6be18a60139bc85c8ed5203e0f5ae62ff63d;
    stim[39] = 177'h165171e2a5f9fc002cef47696cb5e7e224b4b2f261739;
    stim[40] = 177'h0cec4ddb15cd3321a5e476b246a38370b1226615cad49;
    stim[41] = 177'h01f5de7155c22480c829bb260f540db8c1d870a668a0b;
    stim[42] = 177'h039be4ec9932a829c1862fb7fa44a6e7ce7be296057ea;
    stim[43] = 177'h1e1a7b5e5b01432e5c1e4f8486ac19d9037253bc70885;
    stim[44] = 177'h0ccd42f3788cebb52ef7d457490e3fd018a7cabf8eb90;
    stim[45] = 177'h17479b8ce608fa099d8d5d4af691829c09835fa78ddd8;
    stim[46] = 177'h0477110581150e120b5f4bea7327787178b1060297ea5;
    stim[47] = 177'h19698ebb335d12c372ec39c691d8cf263275804a55d1e;
    stim[48] = 177'h128bf8babeede4e0971adf709082fa57ed61145aad3ef;
    stim[49] = 177'h1c8b9bda6cd8daef1742c65769889def9f75a7501a63b;
    stim[50] = 177'h1cda4e7135937e63e11ea60317a84f887e23857bdf8c0;
    stim[51] = 177'h1b6c15e75213f54b08850be040694f5c1a12c97779577;
    stim[52] = 177'h055318fc8df7584def14005218aa325d8b6fa5980924c;
    stim[53] = 177'h05a4fa0e7a6970920ec696f6e3d4a9912b08fbe87b4ae;
    stim[54] = 177'h1cd4a05f9d4915932ada130f2a95eae4fbb854747974c;
    stim[55] = 177'h1f9faa1ee16114ce8b82992428e112af070f887505b18;
    stim[56] = 177'h1ca004676cea17bdf3d490e3439faaf78a3cdc474fc11;
    stim[57] = 177'h0c4b8c6e17f39c562120defaafceba408b139f4ca9ecc;
    stim[58] = 177'h122f794ac1478430871cee08200c4f2e44c474a16c16c;
    stim[59] = 177'h172e8d82df8c0f846b7174bee4e5a30809b74e2bbc5d7;
    stim[60] = 177'h1c1b9e6aec587f96d4f00dad726272a8029908b91d658;
    stim[61] = 177'h10dd7525655bde0d876b703e7a10230c4439f40f2707a;
    stim[62] = 177'h1cdd5ff8c572ca5450bd9069ca4572a547fd10e319b38;
    stim[63] = 177'h03e1c15c91099a1e222462d0be2ad6b4ba3a4dd515f1b;
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
      expv[0] = 164'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 164'hfa4c6167ac757c01bfbd920704eed8ed3271e9d06;
      expv[2] = 164'hfa4c6167ac757c01bfbd920704eed8ed3271e9d06;
      expv[3] = 164'hfa4c6167ac757c01bfbd920704eed8ed3271e9d06;
      expv[4] = 164'hb9e0d361fc33debd4cccc38df3283c5eba36fcaac;
      expv[5] = 164'hb9e0d361fc33debd4cccc38df3283c5eba36fcaac;
      expv[6] = 164'hb9e0d361fc33debd4cccc38df3283c5eba36fcaac;
      expv[7] = 164'h36e4de26eadf107ed0f3d42cc0810612f6a3f8bcf;
      expv[8] = 164'h7b0a74ce70e2e347c05a726d93a4f617acb11e2e8;
      expv[9] = 164'h6b5813ca5dea7d36bef6ae209d9dbf26b5f50bbcf;
      expv[10] = 164'h0d12757ecee1db1e8d56ac6c3dbf86d9792f2fe98;
      expv[11] = 164'h429536a52e382c303bc5de7c9d561371b2778038d;
      expv[12] = 164'h429536a52e382c303bc5de7c9d561371b2778038d;
      expv[13] = 164'h429536a52e382c303bc5de7c9d561371b2778038d;
      expv[14] = 164'hb92d42a7f7c75c99edd09f2aa75edda06d9cace6e;
      expv[15] = 164'hb92d42a7f7c75c99edd09f2aa75edda06d9cace6e;
      expv[16] = 164'hb92d42a7f7c75c99edd09f2aa75edda06d9cace6e;
      expv[17] = 164'h3af31f569649c5ade51358b0acf1a04a7c5d2a492;
      expv[18] = 164'h3af31f569649c5ade51358b0acf1a04a7c5d2a492;
      expv[19] = 164'he4983131af8a10313d1f4c5ffde51c540f27e78c5;
      expv[20] = 164'ha8653587ffc806c67d9a4276932551722e53312e6;
      expv[21] = 164'ha8653587ffc806c67d9a4276932551722e53312e6;
      expv[22] = 164'ha8653587ffc806c67d9a4276932551722e53312e6;
      expv[23] = 164'h2e5e813c6c80b870876b388e1fb89547d3760beff;
      expv[24] = 164'hd8f67b4fa38e01a654418e1c280b7c1c62d6ec058;
      expv[25] = 164'hac7eb98ffb06203f2a43a60dc5973aade8a1805ad;
      expv[26] = 164'hac7eb98ffb06203f2a43a60dc5973aade8a1805ad;
      expv[27] = 164'h74d79bca5786cf5e99b596b00fe700f156ee21f9e;
      expv[28] = 164'h74d79bca5786cf5e99b596b00fe700f156ee21f9e;
      expv[29] = 164'h6b0c22eb50144312d3b32a370a2068ac885b69c9e;
      expv[30] = 164'h6b0c22eb50144312d3b32a370a2068ac885b69c9e;
      expv[31] = 164'h4e125d56bf43fdeb853f1de303e65958c87057d60;
      expv[32] = 164'h25a19eb13e9732c70121298b4713a7f9822d1f735;
      expv[33] = 164'h4b9bf76b5b9a510a7390ee308c5173a71c7366af8;
      expv[34] = 164'h4b9bf76b5b9a510a7390ee308c5173a71c7366af8;
      expv[35] = 164'h7bf7c8ca5e993ded2e3bdc67fd5d20d4b5a6500b5;
      expv[36] = 164'h7bf7c8ca5e993ded2e3bdc67fd5d20d4b5a6500b5;
      expv[37] = 164'haa18b8c5f400f2994025f8cc4e5f27ebb38cb8981;
      expv[38] = 164'haa18b8c5f400f2994025f8cc4e5f27ebb38cb8981;
      expv[39] = 164'haa18b8c5f400f2994025f8cc4e5f27ebb38cb8981;
      expv[40] = 164'h1739e51715f9fc002cef47696cb5e7e224b4b2f26;
      expv[41] = 164'h1739e51715f9fc002cef47696cb5e7e224b4b2f26;
      expv[42] = 164'h1739e51715f9fc002cef47696cb5e7e224b4b2f26;
      expv[43] = 164'h1739e51715f9fc002cef47696cb5e7e224b4b2f26;
      expv[44] = 164'h1739e51715f9fc002cef47696cb5e7e224b4b2f26;
      expv[45] = 164'h1739e51715f9fc002cef47696cb5e7e224b4b2f26;
      expv[46] = 164'hddd88c79a608fa099d8d5d4af691829c09835fa78;
      expv[47] = 164'h7ea5077181150e120b5f4bea7327787178b106029;
      expv[48] = 164'h7ea5077181150e120b5f4bea7327787178b106029;
      expv[49] = 164'h7ea5077181150e120b5f4bea7327787178b106029;
      expv[50] = 164'ha63bd8b9fcd8daef1742c65769889def9f75a7501;
      expv[51] = 164'ha63bd8b9fcd8daef1742c65769889def9f75a7501;
      expv[52] = 164'ha63bd8b9fcd8daef1742c65769889def9f75a7501;
      expv[53] = 164'h924cfd31fdf7584def14005218aa325d8b6fa5980;
      expv[54] = 164'h924cfd31fdf7584def14005218aa325d8b6fa5980;
      expv[55] = 164'h924cfd31fdf7584def14005218aa325d8b6fa5980;
      expv[56] = 164'h5b1819fbd16114ce8b82992428e112af070f88750;
      expv[57] = 164'hfc116201acea17bdf3d490e3439faaf78a3cdc474;
      expv[58] = 164'hfc116201acea17bdf3d490e3439faaf78a3cdc474;
      expv[59] = 164'hc16c4af7a1478430871cee08200c4f2e44c474a16;
      expv[60] = 164'hc16c4af7a1478430871cee08200c4f2e44c474a16;
      expv[61] = 164'hd65869b9ac587f96d4f00dad726272a8029908b91;
      expv[62] = 164'h707a25d6b55bde0d876b703e7a10230c4439f40f2;
      expv[63] = 164'h9b38fdd5f572ca5450bd9069ca4572a547fd10e31;
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
