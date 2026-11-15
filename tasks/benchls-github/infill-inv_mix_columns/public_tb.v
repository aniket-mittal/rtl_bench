// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  inv_mix_columns dut (
    .in(in_vec[127:0]),
    .out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'haa3583cb0e430f8505024097e0691fbb;
    stim[1] = 128'h2f0adbcf88ecf671fef39de8ad8a0300;
    stim[2] = 128'h61a661e121ad92f7657474ec6c28f614;
    stim[3] = 128'h55fcf23af3c782f3c8800a2e6783324b;
    stim[4] = 128'h7a57ad9b991a5dea3ba2c56ecf0a0a22;
    stim[5] = 128'h3c7e2a87c01a7266f31865d14ad27a1b;
    stim[6] = 128'h87254147efd9d408b8187399522bf317;
    stim[7] = 128'hb8897a6f9d3721427a5f3a3d3f54f607;
    stim[8] = 128'hdc5a4d6a0e64f6ac972b6b664e68901e;
    stim[9] = 128'h58ab23f6194a0fa54cf82820dbadd6f2;
    stim[10] = 128'haeb30b5bf957e3ef9542bae13e293408;
    stim[11] = 128'h843c6f79f401671267e09282b0f44409;
    stim[12] = 128'had436756730c4b21de3c3ece5ebb6d8c;
    stim[13] = 128'h2ef96de41a30955503701c065037e915;
    stim[14] = 128'hdd1b7be8bc5dd43e97dff0e4a25c2f33;
    stim[15] = 128'haf92aa6337fddba6186298ed8146b628;
    stim[16] = 128'h39439f5407a9fd52a368096a64871fc1;
    stim[17] = 128'h9d28aaa3499a87a77b63f09c89a9c68c;
    stim[18] = 128'h468f3838bbb1d80a287856d7c576e303;
    stim[19] = 128'h2f7e20655663c52136c677415a656471;
    stim[20] = 128'hf2656d1350cef2339f14cfc47a141b98;
    stim[21] = 128'h28b71fc20afd2353f2af6a4faa6f5ecd;
    stim[22] = 128'h8b10f85231d9d5e251445cfa792ab83f;
    stim[23] = 128'h74c80b7b06c5ed6a3d041cc47bf32c5d;
    stim[24] = 128'h6526836bf5ff3905844aa92cc1adaded;
    stim[25] = 128'h899c3acbd9bfc38b5449a73dc7a068bf;
    stim[26] = 128'hec7f07bc23c7545ca869191ef8a13f0d;
    stim[27] = 128'hd3c6a4be56533f104db33aa8f766995e;
    stim[28] = 128'h5764b6cbe35aa24fc80d4c299846317f;
    stim[29] = 128'hee4bf07a643fe0a6c1d095776c1674c6;
    stim[30] = 128'h5dea0b6367e34f34788c629e8f76aa95;
    stim[31] = 128'h52507b39949eea5ff00d45f441feb5e6;
    stim[32] = 128'ha562f29a856598651289d0b7f78d3c58;
    stim[33] = 128'h7642345d1f940cf459db199d3934bc28;
    stim[34] = 128'ha3c001466c6997ed9aee8b9dee43be0c;
    stim[35] = 128'h2b0da9061e625aad814a6e725198dc83;
    stim[36] = 128'h838d11a74193ad672543cc2b231a5384;
    stim[37] = 128'haabbe3e0027e3e06db5080836ff684c1;
    stim[38] = 128'h970273614ffb5b406a210ce08e434809;
    stim[39] = 128'h4efb72d9bfe4ed16f4cf036ac974e445;
    stim[40] = 128'hda791230aae4ed0602cf7ab8cf53addb;
    stim[41] = 128'h12bcc193e92fe745389523270ad607cb;
    stim[42] = 128'hfc23d3b7b2d2dfdf5c2e71e35d8ce8a8;
    stim[43] = 128'h6f80ab3ffc5d6c88290df50cb9c6c9c6;
    stim[44] = 128'h9bfce83ea6cd61b6b2f7dce550a1fc68;
    stim[45] = 128'he45051ba1e1681a3ee69adc550464806;
    stim[46] = 128'hbbda0855a57f568e1e797988c832c876;
    stim[47] = 128'h1f6277a28a9fc84c1a3e64dc93802742;
    stim[48] = 128'h40aa307d2fad12fed721992784cb54c7;
    stim[49] = 128'h741646f049320f58a5bc21745637c178;
    stim[50] = 128'h8071f2e25ea476bd8f2acf2be77db74e;
    stim[51] = 128'h9bb63a9fb23b25b92541e42bf522776e;
    stim[52] = 128'h01af93d9294708f6829e199867b551c6;
    stim[53] = 128'hb7cf606f54eebdf33fb17a2a48c7bfe4;
    stim[54] = 128'h96ba026661ef34bac68617e08ff8a21d;
    stim[55] = 128'h14c1e8709293e8bc26708e36daaa6eb3;
    stim[56] = 128'hd401bf84c5cc404de4e10645010d4deb;
    stim[57] = 128'h5cb14d31ad86161e2042fe8f797c8f34;
    stim[58] = 128'h2fcfacbfa88bb9c00f99a14359a491f5;
    stim[59] = 128'ha42da898fa79d1485149c6f85a881e76;
    stim[60] = 128'h36f7a6017b502efee4a56cc6fd1f022b;
    stim[61] = 128'h0570f5bddc8ad6eecd51928c7a484d70;
    stim[62] = 128'h5b97efad14c07db0fdf352deaf864c29;
    stim[63] = 128'had2fa66d4bc4b8c426927ea394e79035;
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
      expv[0] = 128'h1ea282e9354ba1180eeef0c066bec336;
      expv[1] = 128'h3a28ac8f1920ba60e6d6753d72829440;
      expv[2] = 128'hbd7d33b4384042d3ae8fb61e5b9e96f5;
      expv[3] = 128'hf29197951fc6e4785c204656e2ee9607;
      expv[4] = 128'h9266739c36f69a6e7ec8e460a36ea787;
      expv[5] = 128'h36c9e5f575c5403ec17ae90dd1e008c0;
      expv[6] = 128'h1e8d8bbc9451604fced091c50b698b74;
      expv[7] = 128'he0de6a70cf0ffaf3022f0609c67a2006;
      expv[8] = 128'h676aaf03bcfd245567cae2fec8df5de2;
      expv[9] = 128'h5fc268d3972168279f25989ef7c85e33;
      expv[10] = 128'h25461a34133756d01c93303350ff0c88;
      expv[11] = 128'hc73c6b3e936d1b65c8d40883841762f8;
      expv[12] = 128'h12227d92d08bc28c2e5fea8967f45ccb;
      expv[13] = 128'h1426eb87bf15ffbf956758c36337f738;
      expv[14] = 128'h2ff123a88d90f3e50ae7d564f4aea61e;
      expv[15] = 128'hd41e221c5dbec490adf033616fb9ea65;
      expv[16] = 128'h2df2f29c8cc974302f3dce748061815d;
      expv[17] = 128'h1b064feecb7ef8bea876cb61f9f46205;
      expv[18] = 128'hf7cb00f57afbb2eb68adafbbdd755da6;
      expv[19] = 128'h051a222945246fdf7e39a829bd56d716;
      expv[20] = 128'h6d563be958fe44bd25386ef3fdc85d85;
      expv[21] = 128'hb55706a68807b4bc8b06e31616634e6d;
      expv[22] = 128'hd36ac24a3a507bce13e66325d86faac9;
      expv[23] = 128'h0659fa69484d2b6a63b19ba847a8f9ef;
      expv[24] = 128'hd2dc79dc6130c1a6923129c1e5e1d1f9;
      expv[25] = 128'hdc09bc8d38d27eba5c96baf7c4101074;
      expv[26] = 128'h23dd984efa6d4e356fe24902651e7464;
      expv[27] = 128'h498e20e882fdbfea4cf7e334bdb37f27;
      expv[28] = 128'h9059ed6a5727be9aa8c877b7d1304332;
      expv[29] = 128'h8baecbc1013dbf9e82da2b802a6db936;
      expv[30] = 128'h165ce57092975fa5ab4ba1495ed8ecac;
      expv[31] = 128'h84cf2d26536f48cbe94ec42f14c5231e;
      expv[32] = 128'hd734c589df71f84b479e6643ec631b8a;
      expv[33] = 128'h8e5176f498e26d646b71273b3c729047;
      expv[34] = 128'hc4682ea60d02087869acbc1b13627d13;
      expv[35] = 128'hf4df7fdd52bc1b7ea8d7f25a90362a1a;
      expv[36] = 128'hee091748bbca670e851875695519e240;
      expv[37] = 128'h35fe58815857eca7052e55f6a1a8e93c;
      expv[38] = 128'hc8a439d2ccda9d2497baa42ebae67faf;
      expv[39] = 128'h2194218a8dc4846d871ad41be077f57e;
      expv[40] = 128'h6f75be25cba9dd1a0f0e69678459291e;
      expv[41] = 128'h69a7596b2f7ee9dc838ad1710d8b20b6;
      expv[42] = 128'hf1aab35390b13d7cad285b3e73a1ffbc;
      expv[43] = 128'h19922bdb881d9242538d2e2d4105d1e5;
      expv[44] = 128'hccbfc6046a52ce4a2a58bcb24f722971;
      expv[45] = 128'he446ef1225a0ee413aaabcc3b2ef1a1f;
      expv[46] = 128'h44a88f5ff9d60e231dda4d1c7584fd48;
      expv[47] = 128'hc1fae271c625bdcfa13ffcfeb81be035;
      expv[48] = 128'hbc1c999ef7ac16233d6ce3fa11b86217;
      expv[49] = 128'h562dd778ebacf59eab8ab7dabca58041;
      expv[50] = 128'h02bea9f4b3ddf9a6ba807803c568539d;
      expv[51] = 128'hd7b57d976c84d12c4027cc009a479f8c;
      expv[52] = 128'hbd91fc340d5717ddf98a43ad5beae713;
      expv[53] = 128'hd4deed90a729bdc74312a12e9295d605;
      expv[54] = 128'h96b292fe290d7c585744f3570727a149;
      expv[55] = 128'h6b720d59a8127897c34bacca6eef9bb7;
      expv[56] = 128'h0d9ba1d9d1d95c500bd265fabfb5bc1c;
      expv[57] = 128'hac1184a801cbfc153ab3c258bf832eac;
      expv[58] = 128'he4f89a751664b39b4f55096788ac69d4;
      expv[59] = 128'h9bd8fe04813c9e3906b3dd4ef377d8e6;
      expv[60] = 128'ha2dbfee10040b8038249c7e73a3c4885;
      expv[61] = 128'hccb646016b8abd32776b37a9b5d59cf3;
      expv[62] = 128'hac1d1f20c9ab92e995e025d246993dae;
      expv[63] = 128'ha90230d285168beb2299a87a5e50ed35;
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
