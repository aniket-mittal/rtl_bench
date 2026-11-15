// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 158;
  localparam OW = 137;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103729 dut (
    .port0_rd_en(in_vec[157:157]),
    .port0_rd_addr(in_vec[156:148]),
    .port1_rd_en(in_vec[147:147]),
    .port1_rd_addr(in_vec[146:138]),
    .port2_rd_en(in_vec[137:137]),
    .port2_rd_addr(in_vec[136:128]),
    .rd_data(in_vec[127:0]),
    .port_rd_data(out_vec[136:9]),
    .rd_addr(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 158'h23a44808437eb591886fb5f756e51e269fd5915e;
    stim[1] = 158'h0887cee9d4ac745b1415db1cd517f7dcdc362cfe;
    stim[2] = 158'h21ad8cafdb34a5b7ee6905157f38e4024f5d3f59;
    stim[3] = 158'h07c2092fcc2aa55970cc1af1eee861929d1f9bf3;
    stim[4] = 158'h14c326744e98889dc6b46f77136d23d91269e5f0;
    stim[5] = 158'h2335f571e490095f2b20b7870b26c6f74a438b9d;
    stim[6] = 158'h3f0a718bb0cb4bee3e7f0a4fea527ec2b59e50d8;
    stim[7] = 158'h1e74ee4469d3bfb16a5588de516d37798babc673;
    stim[8] = 158'h1edb30ea13dc99b1153a958a72a03338c5622a9f;
    stim[9] = 158'h08dbf1346db4e6715db6d7612636c76e6c78d8d5;
    stim[10] = 158'h2480b1a8191ccf24b6c7d3cdadf7dc1575ff75a7;
    stim[11] = 158'h3b9025fce78cb988e1899358fbffb44f860e6b94;
    stim[12] = 158'h00dee99adc373901f024716c8e2ce72a8f4c836a;
    stim[13] = 158'h09198b6300a2b03943b30b6294d617e559314fc9;
    stim[14] = 158'h0518d950e5212e9604c85cc3d7437f1664a37e8d;
    stim[15] = 158'h11158079941f3c0fe246b3afa0df006b41bc95cd;
    stim[16] = 158'h13198fe030a3e4d2804031bb71658dad7ce68e36;
    stim[17] = 158'h2c26c0cb10c1860ee5e72b2e070095bf8d3ff43b;
    stim[18] = 158'h3b34f432fc78000c4baa085ca6f239f2fa47d3aa;
    stim[19] = 158'h24134b3235d8f3af7deb77e46d2d61918f23dece;
    stim[20] = 158'h099ad62c227dacb39a6a805c548ef3756a11a147;
    stim[21] = 158'h368b1356ebc6e58e385a077763582f2dae6c6e69;
    stim[22] = 158'h28d70792626beb0f5ce3e75be3b26c54aa626c2c;
    stim[23] = 158'h0a65e3558de9747d44e440c5d1a32f1bd23ad016;
    stim[24] = 158'h23efc9f9fa4f12ffa670a8f4b7b3e0e1de2643da;
    stim[25] = 158'h26d319adacfc33599f432b1573a119ead2b39188;
    stim[26] = 158'h3ec088c8158acfe8a15040f613c440dfd5f4a1ad;
    stim[27] = 158'h05eb31f4864496ea297b90213c7aa58b64b4bf72;
    stim[28] = 158'h03368597178d75142436795cff1ff0a8d2e0a938;
    stim[29] = 158'h0ce20f290c86e2eecb110906eff16a8324cfdd0d;
    stim[30] = 158'h21d4ffa500e1c281430373460a6c12d6eb83db5b;
    stim[31] = 158'h1461e65ceaa096b36dd74ce4dc1d4dad9e18f021;
    stim[32] = 158'h02d2f71448b17a384deb9a5bd3ec5f2ca7c6c41e;
    stim[33] = 158'h215f53905dba4532319ffc66eb13dd5d8b08b940;
    stim[34] = 158'h1aec6266f06b135ba45a0e552f37ae455c94447f;
    stim[35] = 158'h185bb450d6b4f21a2ffc709151dcdd460ceb2418;
    stim[36] = 158'h0bbfdcac802c6bfcba8646e3ed782d62baa01b56;
    stim[37] = 158'h3e865b27e7777da99a3bf44f300ddb25d923f9e7;
    stim[38] = 158'h3814569e4ad2a444e1973783027d1687ad427c2f;
    stim[39] = 158'h149c7f5e62a62c807eb6d5a1d07d8be4c394ba4f;
    stim[40] = 158'h0f77f6ee3665258643936c6f1a1819eb7d5eb1dc;
    stim[41] = 158'h127d2b1f09fa8b4ca6f54e9242244eba1f9a7bf3;
    stim[42] = 158'h3242ca307be504e3bdf4f04179f6eaeaaa77ee40;
    stim[43] = 158'h234808483491a428f2397c11770edbd11fe93132;
    stim[44] = 158'h1df5899777d45e99116990dda88e83da1da708da;
    stim[45] = 158'h234bfa2d1698d8897863aedd83f824c5ee154429;
    stim[46] = 158'h3f8350d304a8d93622afee9c2996782213379a8a;
    stim[47] = 158'h1d6459b112618aa4cfe6a2b259986e5e411c47bf;
    stim[48] = 158'h13c26a820300949569079ed0880ae2a181e02f6d;
    stim[49] = 158'h31421e3b2e8523bd718d02393f2dc7c047ab3264;
    stim[50] = 158'h00ec2657c421cb895914c1ea2cf0a1ee860a767e;
    stim[51] = 158'h0a3eb58157a0b297f969e62219d25195840ab2fd;
    stim[52] = 158'h144b252d443cbe5a44d569ed67a09f09660623b4;
    stim[53] = 158'h18fb26a7f4fa445087d8e64f64059ca44e20e7c7;
    stim[54] = 158'h072729d311e759dbffa689476e960b89fe1f5266;
    stim[55] = 158'h3ee42cd1e449a47984c5750f8c215670d14dd570;
    stim[56] = 158'h00f3123c5a933d677433829115d0bb4756e18a20;
    stim[57] = 158'h3343b04fe4b4aaf17da1112862d72c9acc1d8bee;
    stim[58] = 158'h1d23e226bce46f89cb402c20ee8ace0b969f9bea;
    stim[59] = 158'h1548cedf19cfc41804d527a9196c964660af91d2;
    stim[60] = 158'h2953bed9ab915b07203fcd65694da4cca21a25ac;
    stim[61] = 158'h0057bf6af010cd3b851778cc80b6378ae029c317;
    stim[62] = 158'h03862b64a0eedf978f1a2d300fe31eaa4255a2ab;
    stim[63] = 158'h2b1c095dda12a7ceb8b241fdf5c00ff0a69a5dc2;
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
      expv[0] = 137'h086fd6b2310df6beeadca3c4d3fab22bc3a;
      expv[1] = 137'h1a958e8b6282bb639aa2fefb9b86c59fce9;
      expv[2] = 137'h1b6694b6fdcd20a2afe71c8049eba7ebxxx;
      expv[3] = 137'h198554ab2e19835e3ddd0c3253a3f37exxx;
      expv[4] = 137'h09d31113b8d68deee26da47b224d3cbe074;
      expv[5] = 137'h1c92012be56416f0e164d8dee9487173a33;
      expv[6] = 137'h1619697dc7cfe149fd4a4fd856b3ca1bxxx;
      expv[7] = 137'h0d3a77f62d4ab11bca2da6ef317578ce644;
      expv[8] = 137'h027b933622a752b14e54066718ac4553ecc;
      expv[9] = 137'h0db69cce2bb6daec24c6d8edcd8f1b1aafc;
      expv[10] = 137'h032399e496d8fa79b5befb82aebfeeb4e48;
      expv[11] = 137'h1cf197311c31326b1f7ff689f0c1cd729b9;
      expv[12] = 137'h1b86e7203e048e2d91c59ce551e9906d5ba;
      expv[13] = 137'h001456072876616c529ac2fcab2629f9xxx;
      expv[14] = 137'h1ca425d2c0990b987ae86fe2cc946fd1a36;
      expv[15] = 137'h1283e781fc48d675f41be00d683792b9xxx;
      expv[16] = 137'h06147c9a500806376e2cb1b5af9cd1c6xxx;
      expv[17] = 137'h021830c1dcbce565c0e012b7f1a7fe876c2;
      expv[18] = 137'h1f8f00018975410b94de473e5f48fa755b3;
      expv[19] = 137'h06bb1e75efbd6efc8da5ac3231e47bd9xxx;
      expv[20] = 137'h044fb596734d500b8a91de6ead423428xxx;
      expv[21] = 137'h1d78dcb1c70b40eeec6b05e5b5cd8dcdxxx;
      expv[22] = 137'h0c4d7d61eb9c7ceb7c764d8a954c4d85xxx;
      expv[23] = 137'h11bd2e8fa89c8818ba3465e37a475a02d55;
      expv[24] = 137'h1f49e25ff4ce151e96f67c1c3bc4c87bxxx;
      expv[25] = 137'h159f866b33e86562ae74233d5a56723106d;
      expv[26] = 137'h02b159fd142a081ec278881bfabe9435bec;
      expv[27] = 137'h10c892dd452f7204278f54b16c9697ee4cc;
      expv[28] = 137'h02f1aea28486cf2b9fe3fe151a5c1527xxx;
      expv[29] = 137'h0190dc5dd9622120ddfe2d506499fba1b29;
      expv[30] = 137'h001c385028606e68c14d825add707b6bxxx;
      expv[31] = 137'h1d5412d66dbae99c9b83a9b5b3c31e0425c;
      expv[32] = 137'h09162f4709bd734b7a7d8be594f8d883d14;
      expv[33] = 137'h0bb748a64633ff8cdd627babb1611728xxx;
      expv[34] = 137'h1e0d626b748b41caa5e6f5c8ab92888fxxx;
      expv[35] = 137'h1ad69e4345ff8e122a3b9ba8c19d64830ed;
      expv[36] = 137'h10058d7f9750c8dc7daf05ac5754036adf7;
      expv[37] = 137'h1ceeefb533477e89e601bb64bb247f3cxxx;
      expv[38] = 137'h095a54889c32e6f0604fa2d0f5a84f85xxx;
      expv[39] = 137'h0c54c5900fd6dab43a0fb17c98729749xxx;
      expv[40] = 137'h06cca4b0c8726d8de343033d6fabd63b8ee;
      expv[41] = 137'h013f516994dea9d2484489d743f34f7exxx;
      expv[42] = 137'h0f7ca09c77be9e082f3edd5d554efdc8xxx;
      expv[43] = 137'h069234851e472f822ee1db7a23fd2626xxx;
      expv[44] = 137'h0efa8bd3222d321bb511d07b43b4e11bxxx;
      expv[45] = 137'h02d31b112f0c75dbb07f0498bdc2a885xxx;
      expv[46] = 137'h00951b26c455fdd38532cf044266f3515f8;
      expv[47] = 137'h024c315499fcd4564b330dcbc82388f7xxx;
      expv[48] = 137'h00601292ad20f3da11015c54303c05eda82;
      expv[49] = 137'h05d0a477ae31a04727e5b8f808f5664cxxx;
      expv[50] = 137'h188439712b22983d459e143dd0c14ecfxxx;
      expv[51] = 137'h0af41652ff2d3cc4433a4a32b081565fbad;
      expv[52] = 137'h088797cb489aad3dacf413e12cc0c4768c9;
      expv[53] = 137'h1e9f488a10fb1cc9ec80b39489c41cf8xxx;
      expv[54] = 137'h023ceb3b7ff4d128edd2c1713fc3ea4cxxx;
      expv[55] = 137'h1c89348f3098aea1f1842ace1a29baae1ee;
      expv[56] = 137'h0b5267acee86705222ba1768eadc314403c;
      expv[57] = 137'h1c96955e2fb422250c5ae5935983b17dd34;
      expv[58] = 137'h179c8df1396805841dd159c172d3f37d426;
      expv[59] = 137'h0339f883009aa4f5232d92c8cc15f23axxx;
      expv[60] = 137'h15722b60e407f9acad29b499944344b5xxx;
      expv[61] = 137'h1e0219a770a2ef199016c6f15c053862f6a;
      expv[62] = 137'h141ddbf2f1e345a601fc63d5484ab455764;
      expv[63] = 137'h1b4254f9d716483fbeb801fe14d34bb8xxx;
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
