// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 226;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052066 dut (
    .clk(clk),
    .reset(in_vec[225:225]),
    .config_en(in_vec[224:224]),
    .config_data(in_vec[223:192]),
    .config_addr(in_vec[191:160]),
    .in_0(in_vec[159:144]),
    .in_1(in_vec[143:128]),
    .in_2(in_vec[127:112]),
    .in_3(in_vec[111:96]),
    .in_4(in_vec[95:80]),
    .in_5(in_vec[79:64]),
    .in_6(in_vec[63:48]),
    .in_7(in_vec[47:32]),
    .in_8(in_vec[31:16]),
    .in_9(in_vec[15:0]),
    .out(out_vec[47:32]),
    .read_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 226'h20e354f77ed48e126a8a2254adf09d9998cc5e4f71293b85aa0cf4369;
    stim[1] = 226'h371076e8333600e04c2fe889e69265f73cabdc2820fd0b0ea2b00eb1e;
    stim[2] = 226'h0a59e24dc1125fcde48d4ae57239a73c2a8bc29c86dd5add2bf1f852d;
    stim[3] = 226'h17b760a3c24b718ba2551c9d9991e3c85392947cc7a3b3e92e4103d8f;
    stim[4] = 226'h0d29f791a5d0c6b65e97edf9fca14b4f6e3e98d17aca7bda9442f21d0;
    stim[5] = 226'h1637e6204daf34661371cfd60481e49ac29ba38e9b577c2671f83b79b;
    stim[6] = 226'h05f08d85ec0677ab740f1f6ea73fcf7bf3754a6aca987acd977e11925;
    stim[7] = 226'h2206b8a196966091a95062f41216020c08638510b9d813638f3d20436;
    stim[8] = 226'h11cb0578b111fcbf6eb95d84a82996afa65ee4f0cb439a07a2915ec90;
    stim[9] = 226'h0664b13bd8808229b4f8e945a24c9ec6bfd1b54bd4623b59f5aa77d70;
    stim[10] = 226'h04bab5d0a2368a4c48d43abaea3e1921016734b50aa830315a89b5fc6;
    stim[11] = 226'h022235544c3fe80ba9b089138ed5f22de906da324a57fae83c59d25aa;
    stim[12] = 226'h10696b48687b5e5fa98a69c3279045c775d2374b68eb32f58776e7ea4;
    stim[13] = 226'h17bc5f9410fa3e1f749c3a22c2f7a5b1d2402eef52ded1da2d0046b46;
    stim[14] = 226'h0f285a806664b5b6a81df60da9993ee85e736b44bcfd8c4c72b1fbbd1;
    stim[15] = 226'h09d5b4c3bc8ab367589468ba42b67e404c388ad4d9a4bd209873e86f9;
    stim[16] = 226'h1e659a101c112530725470986b3b5e9b8fd8139763f2f7ee34d69fda1;
    stim[17] = 226'h0046d8d768c4f0218df1f2fb608a74a29aec9bcdcf887ff185952391c;
    stim[18] = 226'h0493e4e01bf536efd157b19d148d8fe33c5d10c996cd8bc53b23352b1;
    stim[19] = 226'h1b42dbe00ff7260b1bd3b7527cbbad997c92f56e77b97d0f26a6f097f;
    stim[20] = 226'h1cc765d18ed59b0adb8aa925e8e1815d2e8e043552938955fb8314075;
    stim[21] = 226'h187be76efeca69817415634769c457d62d0657864c538677794290e6b;
    stim[22] = 226'h31413691fea98a49cfe6f8fe0993512889faa04a0b1303376be0f28f9;
    stim[23] = 226'h15e6c24e0466b5fa04206bd282b8d22f8729252b45ec7dac857e68f22;
    stim[24] = 226'h00400ee6544146bedb316a3e517576379b9524beb0c5c010216657217;
    stim[25] = 226'h106282dc0b1c3d6c2265dc448219f5c8e18a6bff03a555ae19f109b6e;
    stim[26] = 226'h0041b38c1f8439151b2f35b255f0e7a29d5b14cfd7cb688da2dc9adf9;
    stim[27] = 226'h179dfacabead646a58f97b511884a3929ab7985a3ff4ef2f6820a723b;
    stim[28] = 226'h1aedbadffe066efd74a7fbc4e91bdb4421edcf97570dfb7d36f747516;
    stim[29] = 226'h0f4553f8f0fba4744381343cb73f24c6deb3fb7ac76a641e0b6af6543;
    stim[30] = 226'h0d09f9998404a87678cb9642efd60a5f923bd4d4b1e4a8e66d2b6a6ce;
    stim[31] = 226'h1341c1d2532b83340e8f9d2870ef99c157b07a341367f45f4b2e47595;
    stim[32] = 226'h0e54591f7cdb671f7798e23fa4353725f6effbd85e7d97d22c7d389dd;
    stim[33] = 226'h07f17bd5d63779b28ca8dcdd039ea4768173003b01a9373a2bb42f18f;
    stim[34] = 226'h0943686e30d8b011dc5eac01537a92414f9077236a6c3d8119c014d09;
    stim[35] = 226'h0a741fb1d253083c20180944b8245b7702076d74e2003166de4ead14b;
    stim[36] = 226'h0c27b882be3a7f89c023360a0588dd99386960aa9268c2e1ef3ec1981;
    stim[37] = 226'h072d8c794d026a66c960ebec4ba78c5697b9390a0404b96d873adf064;
    stim[38] = 226'h1b16ea87555d5f3c1fb452b5b514dd794f2a4e0942c3619cdb27c117c;
    stim[39] = 226'h0ff996ed0125500d30555f89df32354aee9b275b782dc5739d88aecb9;
    stim[40] = 226'h1677ef88d8be190777d2346b2c70917796c175db91fea24cf0cf4f571;
    stim[41] = 226'h02f3571ff69782c5fa60abb6d7924f1d19d2194ef27a244a476ca7741;
    stim[42] = 226'h065fc1a6bebcade587c16535be5a58b933dceef11ae85932eb9e5aa7c;
    stim[43] = 226'h0409faa962bd2e09acf7836c143572a055c4364e98562872fde09ff69;
    stim[44] = 226'h1eeb5d01340fbc9b60d2410bd9b9c0d67a20404a8e1bbd01a6247b815;
    stim[45] = 226'h183013ed5c0665b69ad0c982da2a55aaf81f7239493d28301374129d5;
    stim[46] = 226'h02e1ba3c879c56f422081765a773b7ef2c4603eb81946e51a8ed37710;
    stim[47] = 226'h16398bcc501753240fd28f8100dec7f55a61716ebe57474c2dfe5d378;
    stim[48] = 226'h02e9521b9678e2aae86eeec08debc47f9a03c202bd1fdccd3182c5a50;
    stim[49] = 226'h0e444769c61ad48a7317b1d00118a4d1d675425227726a6b05336afd1;
    stim[50] = 226'h14c41e8afec5bdb58aeb7b1ac1b09d13114b31d413917c666567eb59c;
    stim[51] = 226'h184ccf3e4368a214f0dbb4f37f1919261c74373de4ee18372e1d793d8;
    stim[52] = 226'h0bd5045bf209362b56ae1c64883e4ca74279a07ab042964ee52b18f2b;
    stim[53] = 226'h1c614e3516666bf157233c5b75748b6074985c972e2808ab4299d199c;
    stim[54] = 226'h13a3c6e7f042379ddb36d5e3eb81039b674d733e9ad54171ce823944b;
    stim[55] = 226'h0d4463ea6e92d8090142815e48324fb85bdb6a932c01471388fef2ff0;
    stim[56] = 226'h1b38c750c70ff955a6852780051c2b27c0914ec194d9887f8d047b776;
    stim[57] = 226'h01ef63eb1b12b2646eab3fe42e39ae965e9e360690da5c5cf4ae55d62;
    stim[58] = 226'h03e372bebb78158e8f91da96f14f2ae8b90e208f4fdd19c1e154ad2d2;
    stim[59] = 226'h12d7d8ce53cc29226a6a5b7f37c486e48c713cc77a1df388934f39548;
    stim[60] = 226'h1f4e2bbd1bf2fd8ecf197d72264d4edc6f0893fa2010e8e3991c12ba6;
    stim[61] = 226'h03be263c0cf32512b16259cc4ba029d3fbb3c885ed04f66521e82402b;
    stim[62] = 226'h11018adaf1fef5382bf8bbb53c5886e142f00a88150500c55b0f3363e;
    stim[63] = 226'h00e3fa5ecb59ce70f59c9bf917dcb05826dfeeb5ff0fbef965ef026e6;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h000000000000;
      expv[6] = 48'h000000000000;
      expv[7] = 48'h000000000000;
      expv[8] = 48'h000000000000;
      expv[9] = 48'h000000000000;
      expv[10] = 48'h000000000000;
      expv[11] = 48'h000000000000;
      expv[12] = 48'h000000000000;
      expv[13] = 48'h000000000000;
      expv[14] = 48'h000000000000;
      expv[15] = 48'h000000000000;
      expv[16] = 48'h000000000000;
      expv[17] = 48'h000000000000;
      expv[18] = 48'h000000000000;
      expv[19] = 48'h000000000000;
      expv[20] = 48'h000000000000;
      expv[21] = 48'h000000000000;
      expv[22] = 48'h000000000000;
      expv[23] = 48'h000000000000;
      expv[24] = 48'h000000000000;
      expv[25] = 48'h000000000000;
      expv[26] = 48'h000000000000;
      expv[27] = 48'h000000000000;
      expv[28] = 48'h000000000000;
      expv[29] = 48'h000000000000;
      expv[30] = 48'h000000000000;
      expv[31] = 48'h000000000000;
      expv[32] = 48'h000000000000;
      expv[33] = 48'h000000000000;
      expv[34] = 48'h000000000000;
      expv[35] = 48'h000000000000;
      expv[36] = 48'h000000000000;
      expv[37] = 48'h000000000000;
      expv[38] = 48'h000000000000;
      expv[39] = 48'h000000000000;
      expv[40] = 48'h000000000000;
      expv[41] = 48'h000000000000;
      expv[42] = 48'h000000000000;
      expv[43] = 48'h000000000000;
      expv[44] = 48'h000000000000;
      expv[45] = 48'h000000000000;
      expv[46] = 48'h000000000000;
      expv[47] = 48'h000000000000;
      expv[48] = 48'h000000000000;
      expv[49] = 48'h000000000000;
      expv[50] = 48'h000000000000;
      expv[51] = 48'h000000000000;
      expv[52] = 48'h000000000000;
      expv[53] = 48'h000000000000;
      expv[54] = 48'h000000000000;
      expv[55] = 48'h000000000000;
      expv[56] = 48'h000000000000;
      expv[57] = 48'h000000000000;
      expv[58] = 48'h000000000000;
      expv[59] = 48'h000000000000;
      expv[60] = 48'h000000000000;
      expv[61] = 48'h000000000000;
      expv[62] = 48'h000000000000;
      expv[63] = 48'h000000000000;
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
