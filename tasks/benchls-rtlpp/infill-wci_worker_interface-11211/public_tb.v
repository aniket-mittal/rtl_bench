// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 127;
  localparam OW = 101;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11211 dut (
    .clk(clk),
    .rst_n(in_vec[126:126]),
    .wci_MCmd(in_vec[125:123]),
    .wci_MAddrSpace(in_vec[122:122]),
    .wci_MByteEn(in_vec[121:118]),
    .wci_MAddr(in_vec[117:98]),
    .wci_MData(in_vec[97:66]),
    .wci_MFlag(in_vec[65:64]),
    .wsi0_MCmd(in_vec[63:61]),
    .wsi0_MReqLast(in_vec[60:60]),
    .wsi0_MBurstPrecise(in_vec[59:59]),
    .wsi0_MBurstLength(in_vec[58:47]),
    .wsi0_MData(in_vec[46:15]),
    .wsi0_MByteEn(in_vec[14:11]),
    .wsi0_MReqInfo(in_vec[10:3]),
    .wsi1_SThreadBusy(in_vec[2:2]),
    .wsi_m_SReset_n(in_vec[1:1]),
    .wsi_s_MReset_n(in_vec[0:0]),
    .wci_SResp(out_vec[100:99]),
    .wci_SData(out_vec[98:67]),
    .wci_SFlag(out_vec[66:65]),
    .wci_SThreadBusy(out_vec[64:64]),
    .wsi0_SThreadBusy(out_vec[63:63]),
    .wsi1_MCmd(out_vec[62:60]),
    .wsi1_MReqLast(out_vec[59:59]),
    .wsi1_MBurstPrecise(out_vec[58:58]),
    .wsi1_MBurstLength(out_vec[57:46]),
    .wsi1_MData(out_vec[45:14]),
    .wsi1_MByteEn(out_vec[13:10]),
    .wsi1_MReqInfo(out_vec[9:2]),
    .wsi_m_MReset_n(out_vec[1:1]),
    .wsi_s_SReset_n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 127'h060a478a878102030f7c8a54451fef71;
    stim[1] = 127'h34014d9af28bd205153517e8f2f9e4f8;
    stim[2] = 127'h61b2e189ae2c515e04e8b94f997ed34a;
    stim[3] = 127'h2c32884461253515addb39b3cc218d42;
    stim[4] = 127'h32fca8d857a3ddb22ae756bee3f0300b;
    stim[5] = 127'h5605698220972838821bb34b466e4089;
    stim[6] = 127'h56c7899639ac5e7d27247e0f6ca49d1d;
    stim[7] = 127'h7c446ca4d86819a4b4beeb7efd56cfba;
    stim[8] = 127'h5ba8404e8a22cf9905ad6ab6b8bbc342;
    stim[9] = 127'h501981e4457ccaa2cb6c31a66053af32;
    stim[10] = 127'h4c093ff744d5f37d6f766129a7c57cbb;
    stim[11] = 127'h762aa4b29ed2ae42d474d7475834f9b1;
    stim[12] = 127'h55616ed3211fedec2e596d08ca57c9d7;
    stim[13] = 127'h6e388ee8c6537e4e2466044d175620a3;
    stim[14] = 127'h75b0dfdec03004859eda425ed0319577;
    stim[15] = 127'h7a6bffbda6d4fad942d5b46983889f65;
    stim[16] = 127'h612006a99f23aeb0c26303e82fe708ce;
    stim[17] = 127'h7bb8d0cdf1e73d831a52ff7203732461;
    stim[18] = 127'h5e3e029b66b089ef55c646911d6df006;
    stim[19] = 127'h71ac22d21079c40434313d69ada8cf0c;
    stim[20] = 127'h7d50b8610ef9c14ca40953c65fcae286;
    stim[21] = 127'h7846ac42a13e2d6543269c525fcbc3e8;
    stim[22] = 127'h55828dcaa24ab2320b308b447fed5e6f;
    stim[23] = 127'h4f5c7f72c41af1a2d4d8832934aa1f24;
    stim[24] = 127'h43767bc511b67711a3ae45ebe91ae928;
    stim[25] = 127'h48eb347e1c360021f3871ad3504521ae;
    stim[26] = 127'h77fa7f5c5150aa6c6f0522c9f9ef577b;
    stim[27] = 127'h464665a6567ddff9ebf0fd38f079cff3;
    stim[28] = 127'h46dc7e78ad776d667e5fc78568ed9120;
    stim[29] = 127'h4d8dde9250b317ff4e5e9a7dccb6fed5;
    stim[30] = 127'h5e25b29d4dbf2c1b987e3833f89528e0;
    stim[31] = 127'h648963ccc5ba8dc94ce95440895cc3da;
    stim[32] = 127'h5f2f1e99c3945976457da45692be990c;
    stim[33] = 127'h77230359add10d6f2db3645d8102e852;
    stim[34] = 127'h7f9f19903747fd303833a4d6a45f6a09;
    stim[35] = 127'h767196d005777556944e762331e2ad95;
    stim[36] = 127'h4458939f658d39e3bedc36b6414aeb17;
    stim[37] = 127'h72e272627182107d1c145ee065746771;
    stim[38] = 127'h5df2b25e1914810cab76221ae7187c10;
    stim[39] = 127'h65d21e823506f8b4d2a82930cdb8a6da;
    stim[40] = 127'h70a744477dca3f74b2347dc9e1e32368;
    stim[41] = 127'h7f48ff26c73f8845ab6aebf5ef63bf4d;
    stim[42] = 127'h770ffccc3ab679f7a48419ba8759c087;
    stim[43] = 127'h772917ed947e20ad3c2618f016168990;
    stim[44] = 127'h5634461c32b53ae507a8be8ded136e46;
    stim[45] = 127'h781056f68adfd856eacb2aa4a81dcdcb;
    stim[46] = 127'h45f8898f8f188e4f811ae4ef1f67cb3b;
    stim[47] = 127'h43d4509831d764fb7e880f472e88bba6;
    stim[48] = 127'h68bdbe565931a522e8ef15ffd99c0b63;
    stim[49] = 127'h4df144cd316a4b0f01e094ec479e5702;
    stim[50] = 127'h77f0ab791dc7d2af323a768f87dc9c9c;
    stim[51] = 127'h57d062f91582e56f37d25f9af3f8da0d;
    stim[52] = 127'h4e28b6c6af4331e727e99e4ff234a2a8;
    stim[53] = 127'h51ad9ed1e1a87f6d9c6d6b33e2f7202b;
    stim[54] = 127'h79caa9309e24d652caf502a5384c3b50;
    stim[55] = 127'h51eb759ded08dc9ca258b8d98e226d54;
    stim[56] = 127'h774b5e33fba1e57ce1c6934e366a9bc9;
    stim[57] = 127'h79c63f9c0345c387cba70d918d838d69;
    stim[58] = 127'h40ef556cb439442725958f02c3faf04b;
    stim[59] = 127'h6636ed7c352a9f4d70f5d76af516249d;
    stim[60] = 127'h4c220229c2f2ee1799dfd19b529d9660;
    stim[61] = 127'h685f996a74a9dc2889b03e9178c698b7;
    stim[62] = 127'h50c98523287d663e77748a8b53b48f7a;
    stim[63] = 127'h7392ea6a1d5d9fbe2938287a0367f634;
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
      expv[0] = 101'h0xxxxxxxxx8000000000000000;
      expv[1] = 101'h0xxxxxxxxx8000000000000000;
      expv[2] = 101'h0xxxxxxxxx8000000000000003;
      expv[3] = 101'h0xxxxxxxxx8000000000000000;
      expv[4] = 101'h0xxxxxxxxx8000000000000000;
      expv[5] = 101'h0xxxxxxxxx8000000000000003;
      expv[6] = 101'h0800000000810dc00000002047;
      expv[7] = 101'h08000000008392000000000e8f;
      expv[8] = 101'h00000000008a5f4000000027df;
      expv[9] = 101'h000000000082d68000000021a3;
      expv[10] = 101'h0e06f2100885b600000000179b;
      expv[11] = 101'h0e06f2100887bb000000003e5f;
      expv[12] = 101'h0606f210088a3a400000003cdb;
      expv[13] = 101'h0e89abe6f8872c8000000024eb;
      expv[14] = 101'h0689abe6f88233000000001053;
      expv[15] = 101'h0689abe6f88f6d000000000abb;
      expv[16] = 101'h0689abe6f8816ac00000000fb3;
      expv[17] = 101'h0689abe6f88131800000000467;
      expv[18] = 101'h0689abe6f88d29400000001233;
      expv[19] = 101'h0689abe6f88ae3000000003803;
      expv[20] = 101'h0689abe6f88a18800000002787;
      expv[21] = 101'h0689abe6f88204800000003143;
      expv[22] = 101'h0689abe6f881934000000021f7;
      expv[23] = 101'h0e89abe6f88598400000002f37;
      expv[24] = 101'h0e89abe6f88a6c400000000f93;
      expv[25] = 101'h0689abe6f881d7000000003497;
      expv[26] = 101'h0689abe6f889c38000000010d7;
      expv[27] = 101'h0689abe6f88782800000002bbf;
      expv[28] = 101'h0689abe6f885f84000000027fb;
      expv[29] = 101'h0689abe6f88f2fc00000000893;
      expv[30] = 101'h0e89abe6f8872f400000003f6b;
      expv[31] = 101'h0689abe6f88c3f000000001473;
      expv[32] = 101'h0689abe6f886748000000021ef;
      expv[33] = 101'h0689abe6f882bec00000000c87;
      expv[34] = 101'h0689abe6f886d980000000342b;
      expv[35] = 101'h0689abe6f88c19c00000003507;
      expv[36] = 101'h0689abe6f88a270000000016cb;
      expv[37] = 101'h0689abe6f88f6e00000000358b;
      expv[38] = 101'h0689abe6f88e0a0000000033bb;
      expv[39] = 101'h0689abe6f885bb000000003e0b;
      expv[40] = 101'h0689abe6f8895400000000136f;
      expv[41] = 101'h0689abe6f8891a0000000011b7;
      expv[42] = 101'h0689abe6f885b5400000001fa7;
      expv[43] = 101'h0689abe6f88242000000002043;
      expv[44] = 101'h0689abe6f88e130000000004cb;
      expv[45] = 101'h0ca1662ff883d4400000003723;
      expv[46] = 101'h04a1662ff885658000000026e7;
      expv[47] = 101'h04a1662ff8808d40000000259f;
      expv[48] = 101'h04a1662ff88f44000000001dd3;
      expv[49] = 101'h04a1662ff884778000000005b3;
      expv[50] = 101'h0ca1662ff880f0400000002b83;
      expv[51] = 101'h04a1662ff8891d000000000e4f;
      expv[52] = 101'h0a62d496188be9000000002d07;
      expv[53] = 101'h0a62d4961883f4c00000001157;
      expv[54] = 101'h0e06f210088e36800000001017;
      expv[55] = 101'h0606f21008857a800000001dab;
      expv[56] = 101'h0e06f21008012c4000000036ab;
      expv[57] = 101'h0606f2100870e3749b4e538de7;
      expv[58] = 101'h0606f2100865d3b1bcf9e006b7;
      expv[59] = 101'h0606f2100892caf275951bb827;
      expv[60] = 101'h0606f21008387ad6a9ada9524f;
      expv[61] = 101'h0e06f21008ccefd3c1dc6d0b33;
      expv[62] = 101'h0606f2100844d83b77eb448c5b;
      expv[63] = 101'h0e06f21008bbba6174d8bb87bf;
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
