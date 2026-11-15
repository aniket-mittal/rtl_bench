// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 198;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_fspu_single dut (
    .check_nan(in_vec[197:197]),
    .ex1_op_fmvvf(in_vec[196:196]),
    .ex1_op_fsgnj(in_vec[195:195]),
    .ex1_op_fsgnjn(in_vec[194:194]),
    .ex1_op_fsgnjx(in_vec[193:193]),
    .ex1_oper0(in_vec[192:129]),
    .ex1_oper1(in_vec[128:65]),
    .ex1_scalar(in_vec[64:64]),
    .mtvr_src0(in_vec[63:0]),
    .ex1_result(out_vec[159:96]),
    .result_fclass(out_vec[95:64]),
    .result_fmfvr(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 198'h098ed5e9f12a5d3c6e49139e07e37a3b90d40a78ce1fb06ab9;
    stim[1] = 198'h2f95893c10a5c0d14b6578f5ba93870ebb1a94c877797340db;
    stim[2] = 198'h12e29208daf100c39bd6498713f079e423f3e07ae5abd07ed0;
    stim[3] = 198'h050bc569042c3a195d537195d4519e80363f7db5d047907a0b;
    stim[4] = 198'h3845617168ee478ad208b9c1496b5c12d275303f1ad234e2f6;
    stim[5] = 198'h270430af1da648929bb745c705b5ca7bbb536ac52ca29ac75e;
    stim[6] = 198'h2285ee89272ef3c112b0fcb2ce8ceb7ae4acc47e4b2c975040;
    stim[7] = 198'h136e3ba6b50e3b5b43248de881800a67823532f43063bc4585;
    stim[8] = 198'h3be2b195fd39dd6ec5d4395db0bf162d89a9d582d2e3d41238;
    stim[9] = 198'h067e2f7b092481e03d026337745253270858dd386395f62a1c;
    stim[10] = 198'h1c77cb43cd9d9aa904a91c57e74b45729a2fac8315806f435d;
    stim[11] = 198'h0e25946162f78f19248f0403d4a3bce3df8236d13bedb4d7c6;
    stim[12] = 198'h240593f1a26d7054f1cf530b154ff6676feaf48f3eb44b9efb;
    stim[13] = 198'h3d3bc1ae620a6ccebacafda05272df48ad61503bc82cc3f0c6;
    stim[14] = 198'h055188f7df2cf9aca36e8bc68143cb94f87b1a36343e0e8b22;
    stim[15] = 198'h2bdeb9ec1356f9b1a2411d800edeb642ba38a774f72958c07f;
    stim[16] = 198'h02b539360f9f02281b0a2a4cf933af2ccf95caf647a84778f9;
    stim[17] = 198'h07abc000070597f09eb2e420f45ce8f5f08df36470c81b2321;
    stim[18] = 198'h3406ae4c48fcf656b98df09c86f1c6c0c02d2149c2e79534f6;
    stim[19] = 198'h27576b833953759b52d6422f52dcc2dfe2c84babef1f85c9c6;
    stim[20] = 198'h1fb101bc53a38e0081d18637e0d50cf85ee01fd55fd140cef9;
    stim[21] = 198'h1517b5ce1184e4896f1dc872ab1a3345de8c91f97c89bdf18f;
    stim[22] = 198'h381ef545008456a9e8fbb57f5a91bfd13dc8dd9003f52f6ace;
    stim[23] = 198'h3e29f9ed9a7ad7d7b87b2c3ddf5f61c5c8180a60a310e0a427;
    stim[24] = 198'h0638bf4667bf6294b84bd2b38e7992e70cb2a52fc37cdb3b22;
    stim[25] = 198'h38528a2c2d24e096c09857f6d8d28d73b5b7b5eb4fdccc0a66;
    stim[26] = 198'h083bf4a1e80e9b750d90c25f018e3622a2ee3a5fdd1b53424e;
    stim[27] = 198'h2b097273c79d6b80510ccf0e8b1d97f948184f727f7e97430f;
    stim[28] = 198'h2f775da5289332be03f661905643ce54cb741e2b99c7ad4059;
    stim[29] = 198'h00f0ff94fd7a70eb15742f692b854a106c174b45ad56d50535;
    stim[30] = 198'h1d42cc69f4655b500ea3cacd2638066830246d4b1d2e430a4a;
    stim[31] = 198'h06f52312f0ae4a227b7bb5e9e90a0ac92c6018def742ff1d9f;
    stim[32] = 198'h0ad4a715203db4886898ed2597cee5811a194e2d24fc2633cb;
    stim[33] = 198'h0fa78a1953946ad2ae86877a4a31fcc2238b537f5131d5b234;
    stim[34] = 198'h03f2a095919252b745c4341e54e221dd2b08879f7b54697d4f;
    stim[35] = 198'h1286f9bca08dfb25007981ad1565406084b6b3940f87d4b47c;
    stim[36] = 198'h220cd006fa626ed0545eb34decd6d1c05741b25515acf89643;
    stim[37] = 198'h266d59bb3217bfc4ff9bf07b551cc8eb30f531cf9819fb4eb8;
    stim[38] = 198'h12de0dc080d935c27c9123bb9f9c97c2ab41b8154acbd76dd3;
    stim[39] = 198'h17283d334885a45fa47670ef72dc0547cbb3043471417964c9;
    stim[40] = 198'h1ed6ca9d4419fb40cdc9398c3bdf6b14066ec900f5ce0a045b;
    stim[41] = 198'h04f19875594f68c246fca3249279ce0217863d41fb866cf21d;
    stim[42] = 198'h2f2e02055305ecc00312dcf0270aa23b8aa614a35ebe84c1fe;
    stim[43] = 198'h0d754032ddb056e975a2c5c87535354536328c164c9a514100;
    stim[44] = 198'h227a9c5b288687aeb46dfb00ea4b20c9d9be81f03e7adee0d3;
    stim[45] = 198'h198005076154889a2e87ef44695e7f160c3d9625450f0c1208;
    stim[46] = 198'h02d57533368cff5701e8e2bd67962ea5b65ccbddedfed19588;
    stim[47] = 198'h1de8ff11cd4744558d6dc6f1f20bc6da4f9b2776b98860d0ab;
    stim[48] = 198'h1079662108fce6383713c2e7c02c60ed55fc34baa5602ceec3;
    stim[49] = 198'h265cdee43ac372d97e7fb60168a58a2efdef289f7fb3abf120;
    stim[50] = 198'h09b0673fcbfbe7dfd56e2e4813efad2ffbae47f8b1d4438262;
    stim[51] = 198'h1d71c74a38e506d50e60bde88303369de2169ac561645917da;
    stim[52] = 198'h21328330dbd42ffb0bbf42ad54f7615a01f37e8ed50ffd099c;
    stim[53] = 198'h37c890d02b2278159f7d4f8677cc207323a84ab9fa4f8bdd51;
    stim[54] = 198'h2e4aad46f2aa215ebb87e5f50e8bfe62598c0616da484eadfe;
    stim[55] = 198'h07f53ad284d69a5c923d614c101e3655da1b5506f3bde8438d;
    stim[56] = 198'h0f36e6c4b9d5a16d14e8057c10942bea0315d46b4849ece404;
    stim[57] = 198'h2b3a745276263509873bd38f8fb97195e0bd03f31794c8356d;
    stim[58] = 198'h1b9cf688981657916efc71774e712219de82c9c87ef1ad87af;
    stim[59] = 198'h1c10212e8682d6d6cdfd6b897a9d688bec7d801867fc78d0ae;
    stim[60] = 198'h1167d7d7b7b6c082268ceeb5467f7a51290ca4c0d45c9caac0;
    stim[61] = 198'h18db3d35226b4a2c52908f477a7d53eb3219773c1fde7d3f6e;
    stim[62] = 198'h2ee4da597bcd64d2d979b4d15bd33782d89200ab237e057c91;
    stim[63] = 198'h18e3b64e6551f66470f8edea742df901e073f5f23deac8253e;
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
      expv[0] = 160'hffffffff952e9e3700000002ffffffff952e9e37;
      expv[1] = 160'hffffffffffc00000000002000000000052e068a5;
      expv[2] = 160'hffffffffffd07ed00000020000000000788061cd;
      expv[3] = 160'hffffffff961d0cae0000004000000000161d0cae;
      expv[4] = 160'hffffffffffe3c56900000040000000007723c569;
      expv[5] = 160'hffffffffffc0000000000200ffffffffd324494d;
      expv[6] = 160'hffffffff9779e08900000002ffffffff9779e089;
      expv[7] = 160'hffffffff67bdeda500000002ffffffff871dada1;
      expv[8] = 160'hffffffff7fc0000000000200ffffffff9ceeb762;
      expv[9] = 160'hffffffff9240f01e00000002ffffffff9240f01e;
      expv[10] = 160'hffffffffceef57df00000002ffffffffcecd5482;
      expv[11] = 160'hffffffffffc0000000000200000000007bc78c92;
      expv[12] = 160'hffffffffffc00000000002000000000036b82a78;
      expv[13] = 160'hffffffffffc0000000000200000000000536675d;
      expv[14] = 160'hffffffff167cd65100000002ffffffff967cd651;
      expv[15] = 160'hffffffffab7cd8d100000002ffffffffab7cd8d1;
      expv[16] = 160'hffffffff7fc0000000000200ffffffffcf81140d;
      expv[17] = 160'hffffffff82cbf84f00000002ffffffff82cbf84f;
      expv[18] = 160'hfffffffffffb2b5c00000040000000007e7b2b5c;
      expv[19] = 160'hffffffffa9bacda900000002ffffffffa9bacda9;
      expv[20] = 160'hffffffffd1c7cef900000002ffffffffd1c70040;
      expv[21] = 160'hffffffffcbfff5bf00000002ffffffffc27244b7;
      expv[22] = 160'hffffffff7fc000000000020000000000422b54f4;
      expv[23] = 160'hffffffffffebebdc00000040000000003d6bebdc;
      expv[24] = 160'hffffffffdfb14a5c00000002ffffffffdfb14a5c;
      expv[25] = 160'hffffffff7fc0000000000200ffffffff92704b60;
      expv[26] = 160'hffffffff874dba860000004000000000074dba86;
      expv[27] = 160'hffffffffceb5c02800000002ffffffffceb5c028;
      expv[28] = 160'hffffffffffc00000000002000000000049995f01;
      expv[29] = 160'h000000000000000000000002ffffffffbd38758a;
      expv[30] = 160'hffffffffbeefaa4f000000400000000032ada807;
      expv[31] = 160'hffffffffd725113d00000040000000005725113d;
      expv[32] = 160'hffffffff9eda443400000040000000001eda4434;
      expv[33] = 160'hffffffffffc0000000000200ffffffffca356957;
      expv[34] = 160'hffffffff7fc0000000000200ffffffffc9295ba2;
      expv[35] = 160'hffffffffc7fdb6fc000000400000000046fd9280;
      expv[36] = 160'hffffffff7fc0000000000200000000003137682a;
      expv[37] = 160'hffffffff8bdfe27f00000040000000000bdfe27f;
      expv[38] = 160'hffffffffffd76dd300000200000000006c9ae13e;
      expv[39] = 160'hfffffffffff964c9000002000000000042d22fd2;
      expv[40] = 160'hffffffffceffa47f00000040000000000cfda066;
      expv[41] = 160'hffffffffffc0000000000200ffffffffa7b46123;
      expv[42] = 160'hffffffff82f6600100000002ffffffff82f66001;
      expv[43] = 160'hffffffffd82b74ba00000002ffffffffd82b74ba;
      expv[44] = 160'hffffffff7fc0000000000200000000004343d75a;
      expv[45] = 160'hffffffffaf4c5f1f00000002ffffffffaa444d17;
      expv[46] = 160'hffffffffc67fab800000004000000000467fab80;
      expv[47] = 160'hffffffffffe0d0ab00000200ffffffffa3a22ac6;
      expv[48] = 160'hffffffff602ceec300000200000000007e731c1b;
      expv[49] = 160'hffffffffffc00000000002000000000061b96cbf;
      expv[50] = 160'hffffffff7fc0000000000200fffffffffdf3efea;
      expv[51] = 160'hfffffffff6db7fdf000000400000000072836a87;
      expv[52] = 160'h000000000000000000000200ffffffffea17fd85;
      expv[53] = 160'hffffffffffc0000000000200ffffffff913c0acf;
      expv[54] = 160'hffffffffffc0000000000200000000005510af5d;
      expv[55] = 160'hffffffffeb4d2e4900000040000000006b4d2e49;
      expv[56] = 160'hffffffffffc0000000000200ffffffffead0b68a;
      expv[57] = 160'hffffffff931a84c30000004000000000131a84c3;
      expv[58] = 160'hfffffffffbafcfbf00000040000000000b2bc8b7;
      expv[59] = 160'hfffffffffd7bfbee0000004000000000416b6b66;
      expv[60] = 160'hffffffff5c9caac000000200ffffffffdb604113;
      expv[61] = 160'hfffffffffffd3f6f000000400000000035a51629;
      expv[62] = 160'hffffffffe6b2696c00000002ffffffffe6b2696c;
      expv[63] = 160'hffffffffeafb373e00000002ffffffffa8fb3238;
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
