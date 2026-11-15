// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09263 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h1203261cb20b4ac64629a52fb2b27d4;
    stim[1] = 122'h39bbd2bad9095c7ac934a7bc1778080;
    stim[2] = 122'h18c9b8ac7e54cc65f5634978ece29e0;
    stim[3] = 122'h3bcc568a762e36e945da04c5ecce704;
    stim[4] = 122'h1850b7f86774b9f761dc1b41316238a;
    stim[5] = 122'h1aaaf80a1a82d82cf15077dd5110b3e;
    stim[6] = 122'h2b2a809adc17a0fad05ec09e5119848;
    stim[7] = 122'h3690bbd88600bd3f0b504110caddbbc;
    stim[8] = 122'h199f7f20ab6fffb213d1d0fbfbd8514;
    stim[9] = 122'h04ac0b14a4d8768f1bc47bccf7c06d9;
    stim[10] = 122'h3b3a363bcb89674a0ff79b24462e6d1;
    stim[11] = 122'h0f52cd9a6300d227f360b67bd0fe891;
    stim[12] = 122'h307ebb2e0ae9ac67bbf4406492b3788;
    stim[13] = 122'h2b30a8b5e988cf6112c3b735348150b;
    stim[14] = 122'h36a811e2ca35daea05cf5901a8f53d5;
    stim[15] = 122'h3d5024cc87e3441db9f2965b51ba382;
    stim[16] = 122'h20aa0988312c76e1a17ea7ec97fd667;
    stim[17] = 122'h264c5c1335f4f4c46a7a83e6951e629;
    stim[18] = 122'h2c30e2f1e0a8e9f88a4711699b8f0ff;
    stim[19] = 122'h1afc394cdeff71c1aa5d4081412d366;
    stim[20] = 122'h2e15052b519d0fce1068614c6777eea;
    stim[21] = 122'h06f75576b8bf91755fc85125d1f7ae0;
    stim[22] = 122'h385f768f41e841e5ed7a6a04db4af11;
    stim[23] = 122'h0e11f80da156a8271ce674a8dc26aa1;
    stim[24] = 122'h30dfcbde8e6bb82523d4794becd6693;
    stim[25] = 122'h12a5bbdeab2a3b62847663df346eb77;
    stim[26] = 122'h1d75625b9ae3cbc52cf234635ef56a3;
    stim[27] = 122'h3dc7336653eeba4cac4ca7674d185ba;
    stim[28] = 122'h20084c79feed1f9d8ce988f44440505;
    stim[29] = 122'h276fce050ff593d8ebcdf36467010b6;
    stim[30] = 122'h18fd506526c1c40603740b693048467;
    stim[31] = 122'h2c9ab1be3c7c57d170fbf7b18fc0f19;
    stim[32] = 122'h34a89631e242e047c57cc541d165b38;
    stim[33] = 122'h009b6f194a6141b5c4f4a961d4f00ce;
    stim[34] = 122'h14fc8087b18f02bf1ded05fd744f7c0;
    stim[35] = 122'h39c3c8175a41b61a12c38279d4be822;
    stim[36] = 122'h130fddfef3aae7ca3546bb795efc99e;
    stim[37] = 122'h2e99ba4781b053d7437dba6e8e3fbdd;
    stim[38] = 122'h3ca5e1f173b6a37d856512dc257f00a;
    stim[39] = 122'h23f5d2da6568fa83cc5185d1236a6a6;
    stim[40] = 122'h3b33a09c32e2cfb5e9ec024ef974840;
    stim[41] = 122'h33a38788e3e834db6e5554a8d670ed5;
    stim[42] = 122'h1367c590dc8277144870ab6ca4ae4f9;
    stim[43] = 122'h1a74d09f34e27af6caed5f29dacf180;
    stim[44] = 122'h3ac92b359ca7fef477c2e7727085765;
    stim[45] = 122'h2903d14cf84c601021c467ca98945c9;
    stim[46] = 122'h2905764a95220b6df400eb6640fbcf7;
    stim[47] = 122'h16f5b84dd70fd482edf33312d1b93ee;
    stim[48] = 122'h09be5c61fdf767dee15a8e32584b183;
    stim[49] = 122'h24731ed8df633232d1e8c95c7f8fe44;
    stim[50] = 122'h0ef38a4de37b7bbd8571bee2b9279c0;
    stim[51] = 122'h2856d0137e2c341653d1a2ed08f8f06;
    stim[52] = 122'h259d2db4c79f55f88d57fdd7c6fa4c8;
    stim[53] = 122'h0bbc970c0984adaca87006d40ba45cf;
    stim[54] = 122'h30238af7a1f7323e6af23a6b6daef67;
    stim[55] = 122'h029c462554400d9d12d7b662d3431ef;
    stim[56] = 122'h2f60748b3060a126e375c3bea5acf6b;
    stim[57] = 122'h06463d97c441c1e625cdc569e5548d8;
    stim[58] = 122'h3e3fc6164b2a2e78c947856e2d131bc;
    stim[59] = 122'h1d7b0f7c849d8b128652a565133e58a;
    stim[60] = 122'h289dc405fb4b85188681c11c6ef1a3c;
    stim[61] = 122'h27d13b2c14782bb966e14bb6c7c204c;
    stim[62] = 122'h3bdbe3f719ab8ddb66f5b893451abdf;
    stim[63] = 122'h064232e8c29428baa7651f58f38cfc6;
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
      expv[0] = 53'h00000000006000;
      expv[1] = 53'h00000000006000;
      expv[2] = 53'h00000000006000;
      expv[3] = 53'h00000000007b25;
      expv[4] = 53'h0000000000625c;
      expv[5] = 53'h0000000000724c;
      expv[6] = 53'h00000000007b64;
      expv[7] = 53'h00000000006b74;
      expv[8] = 53'h000000000064fa;
      expv[9] = 53'h000000000068d6;
      expv[10] = 53'h00000000006c93;
      expv[11] = 53'h000000000064da;
      expv[12] = 53'h00000000007ba5;
      expv[13] = 53'h00000000007dc2;
      expv[14] = 53'h00000000006897;
      expv[15] = 53'h0000000000601f;
      expv[16] = 53'h00000000007d42;
      expv[17] = 53'h0000000000714e;
      expv[18] = 53'h000000000076c8;
      expv[19] = 53'h0000000000659b;
      expv[20] = 53'h000000000075ca;
      expv[21] = 53'h00000000006837;
      expv[22] = 53'h00000000006eb1;
      expv[23] = 53'h00000000007768;
      expv[24] = 53'h00000000006c33;
      expv[25] = 53'h000000000070ce;
      expv[26] = 53'h0000000000617e;
      expv[27] = 53'h0000000000744a;
      expv[28] = 53'h0000000000750b;
      expv[29] = 53'h0000000000651b;
      expv[30] = 53'h00000000007789;
      expv[31] = 53'h000000000060de;
      expv[32] = 53'h00000000007a64;
      expv[33] = 53'h0000000000637c;
      expv[34] = 53'h0000000000635c;
      expv[35] = 53'h00000000006c13;
      expv[36] = 53'h000000000068b7;
      expv[37] = 53'h00000000007827;
      expv[38] = 53'h000000000062fc;
      expv[39] = 53'h0000000000611f;
      expv[40] = 53'h00000000006758;
      expv[41] = 53'h00000000007729;
      expv[42] = 53'h000000000076e8;
      expv[43] = 53'h00000000006658;
      expv[44] = 53'h00000000006799;
      expv[45] = 53'h00000000007a85;
      expv[46] = 53'h00000000006000;
      expv[47] = 53'h00000000006000;
      expv[48] = 53'h00000000007748;
      expv[49] = 53'h0000000000734c;
      expv[50] = 53'h00000000006b35;
      expv[51] = 53'h0000000000617e;
      expv[52] = 53'h00000000006af4;
      expv[53] = 53'h0000000000655a;
      expv[54] = 53'h0000000000754a;
      expv[55] = 53'h000000000076e8;
      expv[56] = 53'h000000000068d6;
      expv[57] = 53'h000000000073ec;
      expv[58] = 53'h0000000000702f;
      expv[59] = 53'h00000000006719;
      expv[60] = 53'h00000000006000;
      expv[61] = 53'h00000000006000;
      expv[62] = 53'h0000000000728d;
      expv[63] = 53'h000000000072ec;
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
