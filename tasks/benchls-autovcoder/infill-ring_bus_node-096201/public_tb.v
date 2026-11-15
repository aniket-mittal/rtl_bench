// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 134;
  localparam OW = 134;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096201 dut (
    .clk(clk),
    .rst(in_vec[133:133]),
    .rcn_in(in_vec[132:64]),
    .cs(in_vec[63:63]),
    .seq(in_vec[62:61]),
    .wr(in_vec[60:60]),
    .mask(in_vec[59:56]),
    .addr(in_vec[55:32]),
    .wdata(in_vec[31:0]),
    .rcn_out(out_vec[133:65]),
    .busy(out_vec[64:64]),
    .rdone(out_vec[63:63]),
    .wdone(out_vec[62:62]),
    .rsp_seq(out_vec[61:60]),
    .rsp_mask(out_vec[59:56]),
    .rsp_addr(out_vec[55:32]),
    .rsp_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 134'h205fd6068cef28cec27baaea54bab3a719;
    stim[1] = 134'h2751b07aedd47534d7da22173a89d3e04d;
    stim[2] = 134'h1b652695177d7ff8e46e102258a3100a6d;
    stim[3] = 134'h1b17bbcddbf811bd73e15c5aeb873aa2ec;
    stim[4] = 134'h12b01addbd802f53c7e770fa251ed58123;
    stim[5] = 134'h112ca8ff15b357ee47761d21c0f52b3a05;
    stim[6] = 134'h1eb4470f9a328af1a3ceddb15c3db9eebe;
    stim[7] = 134'h0d779ee74048a7650a724fa28f7fe5dbce;
    stim[8] = 134'h1257215017e435feee0826b78f67d5e676;
    stim[9] = 134'h2b8027b3901373d25460d9874a11287ea5;
    stim[10] = 134'h0cabb8e61806b5001437c8b1f198ec1a26;
    stim[11] = 134'h1d8f50af9a15abd4a7cbe938dd42eeb989;
    stim[12] = 134'h3ee720489ae2c4c542f4a3466e739ea2f1;
    stim[13] = 134'h0e7e7021dc36910bca447039dae0c12c86;
    stim[14] = 134'h1f810f653ee0192610f9b155b57514f1d9;
    stim[15] = 134'h08b2c3ed69e27f21f1b3f38d8011520265;
    stim[16] = 134'h1fc7dc2614a186986bfdadb5deef343b99;
    stim[17] = 134'h0fae66aa0bb928e6cae0cc18231ec4f54d;
    stim[18] = 134'h03ee2f2973464bae1f1052af427afdc263;
    stim[19] = 134'h117ed03645f666458f8cb76f353da85c6b;
    stim[20] = 134'h00632613a2bd5fe0a7ad749f59a90a6497;
    stim[21] = 134'h1167ed9139318704bb908421c3cb67e773;
    stim[22] = 134'h12b9a382a80345a2f8128342fe79bfe7dc;
    stim[23] = 134'h1a250881bfc3e7ca879147642678fe5667;
    stim[24] = 134'h10b92ba6667dee16f36b0597934a86e88e;
    stim[25] = 134'h08539934fe75c2f8f74f0903c70f84ebf7;
    stim[26] = 134'h0d1e323e3d33ebf45ee7b3b201325ecb48;
    stim[27] = 134'h1b3a435c63142f534697757de62939e613;
    stim[28] = 134'h119ca1c242d3c508c7ff49ce2613a18f0e;
    stim[29] = 134'h0d5c9e7e7043ba74dc05706df20d7d16ce;
    stim[30] = 134'h1e42bfeab52475da3aa774aba910e7ef92;
    stim[31] = 134'h06bfcbc70b248419b42d5648b7688d3c06;
    stim[32] = 134'h1da7487c0374b54d7fc942efad3af85738;
    stim[33] = 134'h185a7b76ea9fffd7c6f6dfe7a2184d066a;
    stim[34] = 134'h035efe26f2891ceea02506b1d077659216;
    stim[35] = 134'h1ec19b228d0d7170f7dc22a10a11753244;
    stim[36] = 134'h12081244945e684e8cbfb5c4055d4c42f6;
    stim[37] = 134'h0d7cd8895949067459412759216d8b8433;
    stim[38] = 134'h11febe0c0551e62a017e80bf9e66f1f872;
    stim[39] = 134'h0fb467dcaa35774976918e4504b11a572d;
    stim[40] = 134'h02aa1c8f7f01bd6d1abec08048db075138;
    stim[41] = 134'h029d303948e63b8df113cc89fe01d5ff9f;
    stim[42] = 134'h1117f3c04d0358258a34ecbffac4248f30;
    stim[43] = 134'h3cb5b25df9809f12ce9991d99435845f8d;
    stim[44] = 134'h027a01703eba19addfdcca0355cf2908c2;
    stim[45] = 134'h00ed6e7b850d55d4fa6a1acf4d8fe16165;
    stim[46] = 134'h1109efe06e1c948a8c9835b3e32bb808f4;
    stim[47] = 134'h04ce222321060e22ec23463a8f2c49bccf;
    stim[48] = 134'h0314739cf692c807196a5ba5cb42bff79d;
    stim[49] = 134'h118b5186463644adfe15163bfb3b541696;
    stim[50] = 134'h0ef67d46c32e1c58d93e77e442af890e2a;
    stim[51] = 134'h1a2edd2d9c45109688fedd83e932cf0361;
    stim[52] = 134'h02683f43bd5c672d5282aae6b2d75ad298;
    stim[53] = 134'h136e3cd7241958192761fa3b6291e384ba;
    stim[54] = 134'h128c8f53f23065f02e4b5e6fc187f82b4c;
    stim[55] = 134'h174863c0711dc9a51c49330f2292feede3;
    stim[56] = 134'h0419503c4c3c609b6a867db4db3f526168;
    stim[57] = 134'h18fca9608ce2ad871e1c0b4c9423ad7ccd;
    stim[58] = 134'h1bf25eaaf4d642f5c9ecab1a7ebd559a19;
    stim[59] = 134'h065e8cd2f315e1fd3c6c1b9d2b681d22ee;
    stim[60] = 134'h14d9d3dff3ed82189b559b9c565bc58714;
    stim[61] = 134'h07ac1430ae8664b535a0a85c5b289e96b5;
    stim[62] = 134'h1df48c6fb4a249f68b23a7bf127fa79e94;
    stim[63] = 134'h1b08d5c58e4e745e619b239b3cba39ffc1;
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
      expv[0] = 134'h0000000000000000000000000000000000;
      expv[1] = 134'h0000000000000000000000000000000000;
      expv[2] = 134'h0000000000000000000000000000000000;
      expv[3] = 134'h000000000000000001352695147d7ff8e4;
      expv[4] = 134'h36ca4d2a2efafff1c937bbcdd8f811bd73;
      expv[5] = 134'h362f779bb7f0237ae7101addbc802f53c7;
      expv[6] = 134'h256035bb7b005ea78f1ca8ff14b357ee47;
      expv[7] = 134'h225951fe2b66afdc8f24470f98328af1a3;
      expv[8] = 134'h3d688e1f346515e346079ee74048a7650a;
      expv[9] = 134'h0000000000000000000000000000000000;
      expv[10] = 134'h0000000000000000000000000000000000;
      expv[11] = 134'h0000000000000000000bb8e61806b50014;
      expv[12] = 134'h0000000000000000000000000000000000;
      expv[13] = 134'h0000000000000000000000000000000000;
      expv[14] = 134'h0000000000000000000e7021dc36910bca;
      expv[15] = 134'h381362ab6eea29e3b3210f653ce0192610;
      expv[16] = 134'h3f021eca7dc0324c2012c3ed68e27f21f1;
      expv[17] = 134'h381b5b6bbfde68773307dc2614a186986b;
      expv[18] = 134'h3f8fb84c29430d30d63e66aa08b928e6ca;
      expv[19] = 134'h1f5ccd54177251cd943e2f2970464bae1f;
      expv[20] = 134'h30196ede687b50b8d71ed03644f666458f;
      expv[21] = 134'h22fda06c8beccc8b1e232613a0bd5fe0a7;
      expv[22] = 134'h380108438196cfcee717ed9138318704bb;
      expv[23] = 134'h22cfdb2272630e097709a382a80345a2f8;
      expv[24] = 134'h2573470550068b45f1350881bcc3e7ca87;
      expv[25] = 134'h344a11037f87cf950f292ba6647dee16f3;
      expv[26] = 134'h2172574cccfbdc2de6239934fc75c2f8f7;
      expv[27] = 134'h300f67640664bd96901e323e3c33ebf45e;
      expv[28] = 134'h380eeafbc85273cc273a435c60142f5346;
      expv[29] = 134'h367486b8c6285ea68d2ca1c240d3c508c7;
      expv[30] = 134'h2339438485a78a118e0c9e7e7043ba74dc;
      expv[31] = 134'h300ee9575221cfdf2512bfeab42475da3a;
      expv[32] = 134'h3c857fd56a48ebb4743fcbc708248419b4;
      expv[33] = 134'h301285df5c75f0ae7137487c0074b54d7f;
      expv[34] = 134'h3b4e90f806e96a9aff2a7b76e89fffd7c6;
      expv[35] = 134'h30b4f6edd53fffaf8c2efe26f0891ceea0;
      expv[36] = 134'h381845421422ea6489119b228c0d7170f7;
      expv[37] = 134'h3d8336451a1ae2e1ef081244945e684e8c;
      expv[38] = 134'h2410248928bcd09d181cd8895849067459;
      expv[39] = 134'h1af9b112b2920ce8b31ebe0c0451e62a01;
      expv[40] = 134'h23fd7c180aa3cc54022467dca835774976;
      expv[41] = 134'h381d810093b60ea2703a1c8f7c01bd6d1a;
      expv[42] = 134'h0554391efe037ada340d303948e63b8df1;
      expv[43] = 134'h0000000000000000000000000000000000;
      expv[44] = 134'h0000000000000000000000000000000000;
      expv[45] = 134'h38199406ad9e5211842a01703cba19addf;
      expv[46] = 134'h04f402e07d74335bbe1d6e7b840d55d4fa;
      expv[47] = 134'h38106b67c0577011e929efe06c1c948a8c;
      expv[48] = 134'h2213dfc0dc392915181e222320060e22ec;
      expv[49] = 134'h099c4446420c1c45d824739cf492c80719;
      expv[50] = 134'h0628e739ed25900e332b5186443644adfe;
      expv[51] = 134'h2316a30c8c6c895bfc367d46c02e1c58d9;
      expv[52] = 134'h381dbb07d6659e06c30edd2d9c45109688;
      expv[53] = 134'h345dba5b388a212d10183f43bc5c672d52;
      expv[54] = 134'h04d07e877ab8ce5aa50e3cd72419581927;
      expv[55] = 134'h26dc79ae4832b0324f2c8f53f03065f02e;
      expv[56] = 134'h25191ea7e460cbe05d1863c0701dc9a51c;
      expv[57] = 134'h2e90c780e23b934a3809503c4c3c609b6a;
      expv[58] = 134'h0832a0789878c136d50ca9608ce2ad871e;
      expv[59] = 134'h31f952c119c55b0e3d025eaaf4d642f5c9;
      expv[60] = 134'h37e4bd55e9ac85eb923e8cd2f015e1fd3c;
      expv[61] = 134'h0cbd19a5e62bc3fa7939d3dff0ed82189b;
      expv[62] = 134'h29b3a7bfe7db0431362c1430ac8664b535;
      expv[63] = 134'h0f5828615d0cc96a6b048c6fb4a249f68b;
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
