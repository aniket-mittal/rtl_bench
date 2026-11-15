// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 83;
  localparam OW = 134;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031838 dut (
    .rdoclk(clk),
    .dtc_cmd_rnw(in_vec[82:82]),
    .dtc_cmd_exec(in_vec[81:81]),
    .dtc_cmd_feenal(in_vec[80:80]),
    .dtc_cmd_data(in_vec[79:60]),
    .dtc_cmd_addr(in_vec[59:40]),
    .dtc_fpga_cmd_rdata(in_vec[39:24]),
    .fpga_cmd_ack(in_vec[23:23]),
    .acmd_tx(in_vec[22:3]),
    .acmd_ack(in_vec[2:2]),
    .frame_st(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .dtc_cmd_ack(out_vec[133:133]),
    .dtc_fpga_cmd_exec(out_vec[132:132]),
    .dtc_fpga_cmd_rnw(out_vec[131:131]),
    .dtc_fpga_cmd_addr(out_vec[130:123]),
    .dtc_fpga_cmd_wdata(out_vec[122:107]),
    .acmd_exec(out_vec[106:106]),
    .acmd_rw(out_vec[105:105]),
    .acmd_addr(out_vec[104:85]),
    .acmd_rx(out_vec[84:65]),
    .reply_addr(out_vec[64:33]),
    .reply_data(out_vec[32:1]),
    .reply_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 83'h2ee15216dd81bdc18a137;
    stim[1] = 83'h5929d2a303c21f77f00bb;
    stim[2] = 83'h1b8e71545eb8a85c319e2;
    stim[3] = 83'h450475faaae06fb7df2a2;
    stim[4] = 83'h41c71c9d9308b75887eba;
    stim[5] = 83'h1980a624183909bb1e4a8;
    stim[6] = 83'h7cef2a98ffe79f751aeb0;
    stim[7] = 83'h37e6db7162e338c270c62;
    stim[8] = 83'h3dbdbefeebc66eef03770;
    stim[9] = 83'h70d7f909199ba9f89a276;
    stim[10] = 83'h153d5dc51da1cf0bf5206;
    stim[11] = 83'h6acee9043bcabac3541b8;
    stim[12] = 83'h3505c2cfb4e36e7858194;
    stim[13] = 83'h0901a3dac048fa1f0f2da;
    stim[14] = 83'h405e76a6b15884150d0c6;
    stim[15] = 83'h785ad06cf831c40fc3208;
    stim[16] = 83'h12bedede68ef8c48a74dc;
    stim[17] = 83'h3419e15c1eaad4947df7e;
    stim[18] = 83'h7457606a0db45a1bb52be;
    stim[19] = 83'h27b305596677fe86e7b82;
    stim[20] = 83'h3dd16e932d7931a48add0;
    stim[21] = 83'h37dbb11b1a014dd8fe7c6;
    stim[22] = 83'h566fc5156cf98b509ad46;
    stim[23] = 83'h6aa211b99e7e906778704;
    stim[24] = 83'h3128d811867c5a9861598;
    stim[25] = 83'h7f618a0f6a1eb66b7c8ce;
    stim[26] = 83'h29ef04cd070caf23ae4fa;
    stim[27] = 83'h2950668334772b8982136;
    stim[28] = 83'h5ec95b145208db29edc98;
    stim[29] = 83'h288770f4c1bffe9ae9df0;
    stim[30] = 83'h2170ac7d6321927d9ac84;
    stim[31] = 83'h13a1a9d8ae454ef4e747a;
    stim[32] = 83'h468235271afa7ba5f0eee;
    stim[33] = 83'h534da702c5db8914d639a;
    stim[34] = 83'h497f36e32f42c5e295e24;
    stim[35] = 83'h200d34cb4ff20f94c898c;
    stim[36] = 83'h564aa5ecc2e339c1c2dba;
    stim[37] = 83'h6ad632b7cde4726366d30;
    stim[38] = 83'h328f74d24cf6d18a5e9f0;
    stim[39] = 83'h47c58d78f0322f60a784a;
    stim[40] = 83'h09260479c8c881e988226;
    stim[41] = 83'h646bed07b215f647c9bde;
    stim[42] = 83'h2bfb50133e43b301a5d80;
    stim[43] = 83'h27ecbeebc38654b4c12b2;
    stim[44] = 83'h6fdea5912f5f92de565fc;
    stim[45] = 83'h4e229f9fba335db534046;
    stim[46] = 83'h53a82c5f52e0b19241392;
    stim[47] = 83'h13b55dfa4cec6e297df1c;
    stim[48] = 83'h1ec41c8737db1dfe1f4b8;
    stim[49] = 83'h0db96ac08702fd2291190;
    stim[50] = 83'h2789d9b9cbdc5881d7ef4;
    stim[51] = 83'h779623869471781f99de0;
    stim[52] = 83'h4c4d4357e0c42fc6d905c;
    stim[53] = 83'h6b9d40af0c992a46a43dc;
    stim[54] = 83'h00ceadd764284fce23b70;
    stim[55] = 83'h6cb30b5554f8a1c3aefe2;
    stim[56] = 83'h286fe151c5877d0b79fe8;
    stim[57] = 83'h62aa635a9b207c2dfbdba;
    stim[58] = 83'h49a6b9eab3495a2c76a68;
    stim[59] = 83'h5f6124b65a5ab14ae2432;
    stim[60] = 83'h080bb2e7ba6d1407fadbc;
    stim[61] = 83'h7f96667121424811dc736;
    stim[62] = 83'h52d283a5e5ee8b3a0bdd6;
    stim[63] = 83'h176efce77179e1c8ab9a0;
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
      expv[0] = 134'h36c70a902dbb1dc2a40000000000000000;
      expv[1] = 134'h09e14e9346079253a40000000000000000;
      expv[2] = 134'h275c7388a8bd771ce20000000000000000;
      expv[3] = 134'h0d7023abf555ca08ea000000000010c678;
      expv[4] = 134'h298638e33b26038e380000000000000df6;
      expv[5] = 134'h241c0530483073014c00000000000116ea;
      expv[6] = 134'h0ff7795731ffd9de5400000000000c792a;
      expv[7] = 134'h017736dce2c5cfcdb780131ffc00146bad;
      expv[8] = 134'h25e5edf5fdd79b7b7d800e2c5c0009c318;
      expv[9] = 134'h2ccebfce123321aff3801fdd78001c0ddc;
      expv[10] = 134'h26d1eae98a3b4a7abb800123320002689c;
      expv[11] = 134'h1de6774a0877959dd380012332000fd480;
      expv[12] = 134'h22702e159f69ca0b850000877800015758;
      expv[13] = 134'h20200d19b5809203478019f69c00016065;
      expv[14] = 134'h28aaf3b34d62a0bced8019f69c00011f42;
      expv[15] = 134'h2c1ad686d9f070b5a18019f69c00011082;
      expv[16] = 134'h2475f6f1bcd1c57dbd800d9f06001f0c82;
      expv[17] = 134'h2750cf0cb83d4833c3800d9f0600029d37;
      expv[18] = 134'h2edabb06d41b68aec1800b83d40011f7de;
      expv[19] = 134'h133d9828b2ccef660b800d41b6000ed4ae;
      expv[20] = 134'h06be8b75265afba2dd000b2cce0000ffd0;
      expv[21] = 134'h2506dd8c36340fb763801265ae00122b74;
      expv[22] = 134'h2e7b7e2a2ad9ecdf8b800363400003f9f1;
      expv[23] = 134'h3f3d108b733cf544238003634000026b51;
      expv[24] = 134'h233946c4230ce251b1001733ce0001d20d;
      expv[25] = 134'h2d0b0c561ed43ec315800230ce00018566;
      expv[26] = 134'h138778219a0e13de098001ed42000df232;
      expv[27] = 134'h323a83310668f2a0cd0019a0e0000195e4;
      expv[28] = 134'h29064ada28a41d92b70010668e0000e570;
      expv[29] = 134'h30dc3b81e983710ee10010668e0007b726;
      expv[30] = 134'h31938560fac642e159001e98360001ffd3;
      expv[31] = 134'h07250d49b15c874353000fac640000324e;
      expv[32] = 134'h2d7c11aa4e35ed046b000fac6400139d1e;
      expv[33] = 134'h0aea6d3a058ba69b4f000fac6400014f74;
      expv[34] = 134'h2fa3f9b3c65e92fe6d000fac64001358e6;
      expv[35] = 134'h37f869a1969fe01a69000fac64000058bc;
      expv[36] = 134'h0972552bd985cc954b001969fe000041f3;
      expv[37] = 134'h1ef6b1936f9bd5ac65001969fe00070b6e;
      expv[38] = 134'h267c7ba5a499e51ee90016f9bc00008e4c;
      expv[39] = 134'h081e2c6af1e06f8b1b801a499e00097a7c;
      expv[40] = 134'h24613020f391924c09801a499e000045ec;
      expv[41] = 134'h390b5f6a0f6428d7db801a499e0001103c;
      expv[42] = 134'h1727da80267c97f6a10000f6420000bec8;
      expv[43] = 134'h11c765f1d7870fd97d000267c800007660;
      expv[44] = 134'h3faef52b225ebfbd4b001d78700000ca97;
      expv[45] = 134'h2d1914fb3f747c453f001225ea0001f25b;
      expv[46] = 134'h09754162bea5c75059001225ea00006bb6;
      expv[47] = 134'h2675aae9f499c76abb001225ea000904e4;
      expv[48] = 134'h23ee20e10e6fbd8839001225ea0005f7c6;
      expv[49] = 134'h0385cb51810e1b72d5001225ea00187d2f;
      expv[50] = 134'h35ec4ec97397af13b3001225ea00005fa4;
      expv[51] = 134'h2a3cb11f0d28ef2c470017397a00018b10;
      expv[52] = 134'h28626a1aafc1989a878010d28e001e6778;
      expv[53] = 134'h3e4cea035e19373a818010d28e000085f8;
      expv[54] = 134'h22167569aec8419d5b0015e19200012549;
      expv[55] = 134'h1a7d985aaaa9f966170015e192000109f8;
      expv[56] = 134'h32c37f08a38b10dfc3000aaa9e00011438;
      expv[57] = 134'h3d95531ab5364554c7000a38b00000efa0;
      expv[58] = 134'h29a535cbd566934d73000b536400000f85;
      expv[59] = 134'h2d2b09236cb4bec249000b536400012b45;
      expv[60] = 134'h25305d91cf74d01765000b5364000b890c;
      expv[61] = 134'h28a4b336e2429f2ccd000b53640001a280;
      expv[62] = 134'h2af6941b4bcbc5a507800e2428000771cc;
      expv[63] = 134'h20bb77e1cee2eeddf9800e242800082f74;
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
