// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .in(in_vec[263:8]),
    .sel(in_vec[7:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 264'h0935888bd66f809b3a703cb3a7d232217c01020acf4260f26b2288b5aa39ba168a;
    stim[1] = 264'h51abefca13c5a5de3071e610bb92b04d05399f4a04cea592a139e0e7802920559d;
    stim[2] = 264'h9375784680d69d80506fb843f7be5a949f7319b8cc36d6f6931eecd9d49aaf0c38;
    stim[3] = 264'h1ff6c42b86f1c2476ee1cb69853d56d667161c7e34d8e31605a4abcd68cada3228;
    stim[4] = 264'ha5d08191513e9d90cd167b1a5def0ab4da133eace7f4369a82f6b6f5bf1ae4e35b;
    stim[5] = 264'hfc598e031d5c0d88573bdc2479146564574a04229174545127271fefb8d1183597;
    stim[6] = 264'he634957ac14a940d169111a52806f35397057d73c426a0c8ce9b33cdc19c07d134;
    stim[7] = 264'hff058108e34d0fcd28714f6e60a2908490ef9cb68c955bc4f074fc496fa2b52934;
    stim[8] = 264'h4640b8618ef2ea07a46839bb3a89cbeec528d74e82e92c95df1f4d70416589bb8d;
    stim[9] = 264'hf6e8f31a08c35a74da94b8ced7ac05006de43bed41500798da89dffdac0faff486;
    stim[10] = 264'h4fdf2cbd4ff33cfebb07d8925026c343f9d35c98f08071ceec32a1b4db64301091;
    stim[11] = 264'h73ae0d41dcf642ed8c94ec63f54602c7e1c70014022ff42e747ab70f5444d72ccd;
    stim[12] = 264'h14b24280fc7110af7b8b8ed985e9151b5f09432a28278171e8394bc94b34067f61;
    stim[13] = 264'h2d47559ef0ce0ef31f131c477489356eb47c8a41de2f482efabb9134227b9e5a9d;
    stim[14] = 264'h340893dd1226c6031dd5ca64811a3644a6a8ae5a95251c7552a842015ba358930d;
    stim[15] = 264'h5c078db54e1c0c59d88820830ba5ed5e67e44d2ec0d234042661b2837f9b46a064;
    stim[16] = 264'had62419520cedc0cebe8046c86f6c6a45bbc454bb623c3f2a40ddce880e0737b08;
    stim[17] = 264'hc5fbefc11749c2705550390e3171f16f3fc5c1d72fb4412f1732a34d3233bac7fb;
    stim[18] = 264'h8a718e416c51732f337781045d2eead5a6b892d438084e348f457f057774da3a92;
    stim[19] = 264'hf228874e3888cf1f41aceeac0ccc33b565c6642fc42573b311c96edb00371607c2;
    stim[20] = 264'hc4757e5497dc1e60a2c845a4e427a25b2c1db80e8b3f82db109b2d3b908759f376;
    stim[21] = 264'hb62e959470b21bb5543f018343427e27452272edd36b0fbf6bd2c3346e94ef5418;
    stim[22] = 264'haecb24822f0a800687e344bdc11d9e5a24b33f1add43e1a6ee1022b0e08a7d02db;
    stim[23] = 264'h8edcce7069f4b6e0c10e6febea5da4db9c939e2c5a7b0c4b56e9b30d5fc9188cd8;
    stim[24] = 264'h345d9d71e0ae61f3eb1539cfa80679c0c643ed33f1d508633f5dba0049a8d77047;
    stim[25] = 264'hdd5acc200b926fe8f5d19d04a8adcca0eb5f852c5ac8f224a9eb66c9a3be4f3f91;
    stim[26] = 264'ha08f43cb0095e7245039ebe86c3e971507abcad60812e4cf4633e6ef83fa11fb14;
    stim[27] = 264'h7c4c378c2a746b68e38d5a29778ef03368d6c3e3745796ed18a95bfad6628416f7;
    stim[28] = 264'h53f599861ecd1c26330c1e613c0322d21f03469c489a100d4811fdf732d24c5190;
    stim[29] = 264'h9392c59cd074d48b777648485d23d7c224b438e6f66754fe1adcbf831b5fdc8b27;
    stim[30] = 264'h3df7e5be9f503958c286f549e85fd633cd9e3e174302687ad2469f17968e148615;
    stim[31] = 264'h8c06fd54729e64d00d01a7d35862725d1a9fdc510a52445005ca140ea3feba1abd;
    stim[32] = 264'h6351b1cc1d07c697e1ac3de064b3a0e939404a595d0990e0430c6aa1ab45ac8c60;
    stim[33] = 264'h7ea8c078698ed1151e4da687643e5da026228f506cf5030c646a5514120dfb8360;
    stim[34] = 264'hb3f69bdcbe08c61ec97f58b85e3a76c7b1e4eeffaaadda50b906207bdf801c2d2d;
    stim[35] = 264'ha3caccdfbc649ba970495d4a6d6a221f92d33f7976c6310965f0b8b72766247010;
    stim[36] = 264'hbc69dbbacf456cbcaf3b3ce0fe7869e998c7553b80b25d20b43a6525fa0f6b77ad;
    stim[37] = 264'he77d6297fcef93ab9a8241fb868bc2f49422480dc39ecc87a05ebde2e67afe1670;
    stim[38] = 264'hb2a6946b65f35380175f616015b69f7c03fb2d6a8b53660c19a70558d65c4382a4;
    stim[39] = 264'h4688260499b3e11b36273b26ce4ba657864c71968aa5aff49743550624829c0024;
    stim[40] = 264'h6a6e7c3656126fdf904d4f8589ae21704173553985228fb2295815c505eb4be037;
    stim[41] = 264'h8ab7b54cbadd4a067334b1cfbb80b4afa7013e09acfa7ee106979812a585e2fc63;
    stim[42] = 264'h3a624437e855d638342158c0f052de9951fc1c7119c3c2e9c0b86a2104db0e89e0;
    stim[43] = 264'h7b1e846bb2b40ed3b6d91ea3a62e60af068095ad987e805c2a3f4cf2120ef7a001;
    stim[44] = 264'h3d553b789e403a92518f934caaa91ab0b1098e0b0a27ff1791e1e8779d9f24e00f;
    stim[45] = 264'he32b8d4211abc00a733f0101bc6cd881af77964034493f709b914eeab77fe8e58a;
    stim[46] = 264'h9d84c2bb7f84badf27ba23f383555cf4236f63a17323108c4df74a77fe9ceb9e11;
    stim[47] = 264'h3e300e781063ce663732cf55891bcfca2f90156cab058d00a95b03c792a0df79c0;
    stim[48] = 264'h3beafd903121ae586ce8ca1b6eb9fc6911d312583246cba70e98d1a66bfecab6d1;
    stim[49] = 264'ha56cd49467993b5d1f5a3fceb8bf75f1a26d22b9f801d1b81416b87e03c4dccaae;
    stim[50] = 264'h2eea00042faedba4d1261c3bf103919e24a666d1600df21040027ff68d4ba90bf3;
    stim[51] = 264'hf92a2e8a5f1b906d9a7644658d3cda021b4ea7392f9dc2bde3fc7a155842d3ef5d;
    stim[52] = 264'h2fd272905587dbb7c90355efc0afd4a244165cadf19be0f71bd46a85e87f085404;
    stim[53] = 264'h3eb6b6bf183e4bb20562c6f1e6d1caac3578e0b05feb2514f23b95b2d2ebd56c88;
    stim[54] = 264'hc0a4d5093acb20e2cd4f7f28cd09575346c8e607f1396f405d5a916f885395f5cd;
    stim[55] = 264'hd27d799cf9e113d3c49470a9fda06a32e4e0d7ee18ec551fdbc5c350f139945a54;
    stim[56] = 264'h6c6fa95347db318532b3e365a6d7a671383e267b6a73726ea04dde9a55e998019c;
    stim[57] = 264'h53f4ef86bc3e89dec65d7904bbfa02fe6c1f4d17fe39b1ebfc6a197aabc7c9b7f7;
    stim[58] = 264'h12d757df7536413ee34b28591eb47a3bd18f0c5fc584f049640c1047df584e85d5;
    stim[59] = 264'h1453f85c0ee8d8285801dad1c0cf41c1af2faca05cc5f6299c5d5df4e001cb2084;
    stim[60] = 264'h81245978ce7c70ceb9c0bd21b4301ed48088c9278bb14544ddfc719964497875c9;
    stim[61] = 264'hf1efd752a1f9dc4d6715bc0a62537b46d37fc73f7dec15d30296bd4c47cc965c16;
    stim[62] = 264'h5d36506c60deee3e3e812d4331f39a689329f1a835b58c083d2a3a30d4bd4a9eef;
    stim[63] = 264'h23a8fbe1bde121a487448ecd2913c11a2c813bc006ac9e0cdca67ef9f3ac2a8659;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
