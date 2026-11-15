// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 77;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01259 dut (
    .OS1(in_vec[79:64]),
    .OS2(in_vec[63:48]),
    .OS3(in_vec[47:32]),
    .OS4(in_vec[31:16]),
    .OS5(in_vec[15:0]),
    .op1(out_vec[76:70]),
    .op2(out_vec[69:63]),
    .op3(out_vec[62:56]),
    .op4(out_vec[55:49]),
    .op5(out_vec[48:42]),
    .aSel2(out_vec[41:39]),
    .aSel3(out_vec[38:36]),
    .aSel4(out_vec[35:33]),
    .bSel2(out_vec[32:30]),
    .bSel3(out_vec[29:27]),
    .bSel4(out_vec[26:24]),
    .cSel2(out_vec[23:21]),
    .cSel3(out_vec[20:18]),
    .cSel4(out_vec[17:15]),
    .literalV(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'hea6dd3e8eecbd12ac635;
    stim[1] = 80'h2456ac06ae0758ecdce7;
    stim[2] = 80'hf519c6399b76e92390dc;
    stim[3] = 80'hca4d434a874ef3988c9a;
    stim[4] = 80'h7a62c7b64a290c26a773;
    stim[5] = 80'h48f656053ec29df64ab4;
    stim[6] = 80'h3e8c89d7be0d0ebf5ddf;
    stim[7] = 80'he40869aabdcda82f06ad;
    stim[8] = 80'h5b73faa3f694ce15b3df;
    stim[9] = 80'hbff5365e6a5add451fdb;
    stim[10] = 80'ha468fa9f5d77d887a7ea;
    stim[11] = 80'h3041c76f314103adea52;
    stim[12] = 80'h86d50f26c823e5da2fc0;
    stim[13] = 80'hf566a5c244c7b25a96b9;
    stim[14] = 80'he1c6f7e63fb360552187;
    stim[15] = 80'h60d23ea222c0cf0e4be6;
    stim[16] = 80'h7020569aa1c262ce0023;
    stim[17] = 80'haf023870d58eee1eacab;
    stim[18] = 80'h1e2a40527c36bd6d8fbf;
    stim[19] = 80'hee84c38c7987631ec04e;
    stim[20] = 80'h4e20311e3741a74ba8bb;
    stim[21] = 80'h17f846f3f4cc1e2b97c7;
    stim[22] = 80'h1314c6e5e43c97988aa3;
    stim[23] = 80'h23c0d8bba40c02fdc60c;
    stim[24] = 80'h1da33959671e00701d55;
    stim[25] = 80'hf98481b7e73e34c9dcf8;
    stim[26] = 80'h28723ba1b60fa6d3fa0e;
    stim[27] = 80'hac77d50d6d433a2b628a;
    stim[28] = 80'h2c99f3f5600ac328b9eb;
    stim[29] = 80'h05f4cad21881eb891790;
    stim[30] = 80'h8126254e5b092756eb4e;
    stim[31] = 80'h0190741a1d7e7b98a872;
    stim[32] = 80'h783304bd6c629d1607c7;
    stim[33] = 80'he8c2e3064ce6c9209439;
    stim[34] = 80'h22ed018fb753b41e614d;
    stim[35] = 80'h6fe68156f345d1a25a02;
    stim[36] = 80'h3f9c6b69f41c436c90b1;
    stim[37] = 80'h8a5b7a52e405296e1c8a;
    stim[38] = 80'hf7f21449560661e5048c;
    stim[39] = 80'h9212dee4b67d792bc02a;
    stim[40] = 80'h1a47ac676e0e4a352e5c;
    stim[41] = 80'hcc845d30ad2096487195;
    stim[42] = 80'hdc762bed4a862539063f;
    stim[43] = 80'h7474aada6f9d55838b1f;
    stim[44] = 80'h6a3746ef15f920ca3123;
    stim[45] = 80'h127753ddf052afc7a25a;
    stim[46] = 80'h0734557a51810b067dfc;
    stim[47] = 80'h1df42f7909f77e31999c;
    stim[48] = 80'h2a7f8bd4703deed2de8e;
    stim[49] = 80'h652d1ef48943ad025847;
    stim[50] = 80'hecb3889940c4478680ca;
    stim[51] = 80'h52fa0331b1ebc3ad28b7;
    stim[52] = 80'h9f006a49b3f30b9912fd;
    stim[53] = 80'h13fc009aca95f021a9ec;
    stim[54] = 80'hed2f5568c57c50447b41;
    stim[55] = 80'h65da251e83e768f8d1a0;
    stim[56] = 80'h3b2e83dc95708bc7fef8;
    stim[57] = 80'hefd99d53ef18697f6bf6;
    stim[58] = 80'h045c19be44d6e8ca5336;
    stim[59] = 80'h9583d79bf58b1175ffdd;
    stim[60] = 80'hbf6969a1092eae3cc24b;
    stim[61] = 80'h67e852aa63c7d074d83a;
    stim[62] = 80'h8e676080331126be810c;
    stim[63] = 80'h0a7599b5b50e8b3cd86b;
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
      expv[0] = 77'h1d74f7d18fb94d0d53e8;
      expv[1] = 77'h04ab5759b80605de2c06;
      expv[2] = 77'h1eb1cde92059f439c639;
      expv[3] = 77'h1950c3f31adc4b58434a;
      expv[4] = 77'h0f71a50d4f01acc747b6;
      expv[5] = 77'h09159f9c943e06ab5605;
      expv[6] = 77'h07e25f0ebb848ff789d7;
      expv[7] = 77'h1c9a5ea80f714d57e9aa;
      expv[8] = 77'h0b7efbcf65211272faa3;
      expv[9] = 77'h17cdb5dc3c9ad8cab65e;
      expv[10] = 77'h14beaed94d54f0fffa9f;
      expv[11] = 77'h06319803d6dd45e6c76f;
      expv[12] = 77'h10c3e4e45e0f23cd0f26;
      expv[13] = 77'h1ea922b32fb2035d25c2;
      expv[14] = 77'h1c3d9f6043e332cef7e6;
      expv[15] = 77'h0c0f91ce953901433ea2;
      expv[16] = 77'h0e15d0620176c14b569a;
      expv[17] = 77'h15ce6aef58e18b1b3870;
      expv[18] = 77'h03d03ebd1c8ab55ac052;
      expv[19] = 77'h1df0bc638368439f438c;
      expv[20] = 77'h09cc1ba7525ac1c5b11e;
      expv[21] = 77'h02d1fa1f2db18d71c6f3;
      expv[22] = 77'h0271f297158d3bb046e5;
      expv[23] = 77'h047652038d07cf72d8bb;
      expv[24] = 77'h038e33003ac2de383959;
      expv[25] = 77'h1f207335bb47b9f881b7;
      expv[26] = 77'h050edba7f7070a3dbba1;
      expv[27] = 77'h15b5363ac65045add50d;
      expv[28] = 77'h05bcb0c373898da873f5;
      expv[29] = 77'h00b28cea2dac8144cad2;
      expv[30] = 77'h10092d27d6ca4ac7254e;
      expv[31] = 77'h001d0e7b505cfb58741a;
      expv[32] = 77'h0f01369c0d19e2ab04bd;
      expv[33] = 77'h1d38a6c92a3824d86306;
      expv[34] = 77'h04405bb4c35053ef018f;
      expv[35] = 77'h0de079d0b6dc84d50156;
      expv[36] = 77'h07dafa43228b5d326b69;
      expv[37] = 77'h115ef228388a85577a52;
      expv[38] = 77'h1ec52b60088e443a9449;
      expv[39] = 77'h1277db7981993d95dee4;
      expv[40] = 77'h036b374a5c810efaac67;
      expv[41] = 77'h19975696e243a1005d30;
      expv[42] = 77'h1b8aa5240fa947b8abed;
      expv[43] = 77'h0eaab75515ecd855aada;
      expv[44] = 77'h0d518a2061f779e546ef;
      expv[45] = 77'h0254f8af479ed0abd3dd;
      expv[46] = 77'h00d5280afae9c047557a;
      expv[47] = 77'h038b847f32f1f63caf79;
      expv[48] = 77'h0562b8efbf86ba950bd4;
      expv[49] = 77'h0c87c4acb1d9808d1ef4;
      expv[50] = 77'h1da22047013cc0330899;
      expv[51] = 77'h0a40d8c2527dad2e8331;
      expv[52] = 77'h13dad90a24fc732cea49;
      expv[53] = 77'h024065f15120d454809a;
      expv[54] = 77'h1d956250f6d378125568;
      expv[55] = 77'h0c894169a276e7dc251e;
      expv[56] = 77'h0760ca8bffdef08383dc;
      expv[57] = 77'h1de77768d6ca9f639d53;
      expv[58] = 77'h008622e8a737d1d919be;
      expv[59] = 77'h12b5fa11ff6ace6ed79b;
      expv[60] = 77'h17da04af87412f3a69a1;
      expv[61] = 77'h0cd4b1d1b173465e52aa;
      expv[62] = 77'h11d81927014417076080;
      expv[63] = 77'h01665a8bb3498fba19b5;
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
