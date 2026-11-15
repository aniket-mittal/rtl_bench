// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 121;
  localparam OW = 119;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034338 dut (
    .clk(clk),
    .reset(in_vec[120:120]),
    .clr(in_vec[119:119]),
    .reg_write_d(in_vec[118:118]),
    .mem2reg_d(in_vec[117:117]),
    .mem_wr_d(in_vec[116:116]),
    .alu_control_d(in_vec[115:113]),
    .alu_src_d(in_vec[112:112]),
    .reg_dst_d(in_vec[111:111]),
    .rd1_d(in_vec[110:79]),
    .rd2_d(in_vec[78:47]),
    .rsd_d(in_vec[46:42]),
    .rtd_d(in_vec[41:37]),
    .rde_d(in_vec[36:32]),
    .sign_extend_d(in_vec[31:0]),
    .reg_write(out_vec[118:118]),
    .mem2reg(out_vec[117:117]),
    .mem_wr(out_vec[116:116]),
    .alu_control(out_vec[115:113]),
    .alu_src(out_vec[112:112]),
    .reg_dst(out_vec[111:111]),
    .rd1_e(out_vec[110:79]),
    .rd2_e(out_vec[78:47]),
    .rse(out_vec[46:42]),
    .rte(out_vec[41:37]),
    .rdE(out_vec[36:32]),
    .sign_extend(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 121'h1bfe227bd322629526259352b2a4527;
    stim[1] = 121'h1070a0d4e020fdbb43e7115460d290d;
    stim[2] = 121'h0ab28a5b476a08686a31662f9472252;
    stim[3] = 121'h01660254cedd5fef4f3b311e4372260;
    stim[4] = 121'h0647f79610358a6f2b0f15c944095b4;
    stim[5] = 121'h0ac9fe1eee12ebcac2af68dc6f91fd1;
    stim[6] = 121'h026be5dba1497a4d55a56af29c933e4;
    stim[7] = 121'h003bf63d27d6ef9298fc01f646c8bf3;
    stim[8] = 121'h08f8a55ace3b775e882d2abf801f4e0;
    stim[9] = 121'h08520d1edb13aa99de68a0565fd411f;
    stim[10] = 121'h0d3854eafd87da2cfe2bfcd377d6bc4;
    stim[11] = 121'h076ef5c653efa78d9c9e6525d94f7a7;
    stim[12] = 121'h03360f30855f74f9daf7d2981aba9b1;
    stim[13] = 121'h0936af037b0d2f8b858190636de0789;
    stim[14] = 121'h08a8399f43acc60022e7f6432e3d64f;
    stim[15] = 121'h07e5cfc7eaa3ee767cd74f636bf0ab7;
    stim[16] = 121'h0da26a39a9c665f9f664f2884470285;
    stim[17] = 121'h07db512c11ef57a87f04098baec0a50;
    stim[18] = 121'h087a7cbb788d1ec2b3313a990ee6da4;
    stim[19] = 121'h0ca5ccf38473feba45add8819df72f0;
    stim[20] = 121'h00f08f9b67e2237959cc5eb5259ff03;
    stim[21] = 121'h03c2fe53773a286631575e7015701b4;
    stim[22] = 121'h06649af6d70d60a368ac7088b2190bc;
    stim[23] = 121'h02e3c700f80d83d0367034c620c1f76;
    stim[24] = 121'h0720a72d92f77c89c13840322166d09;
    stim[25] = 121'h00bfa6e5850d1319c7b7c515c60e026;
    stim[26] = 121'h06172b6a73383f8023fe101cd620bfe;
    stim[27] = 121'h007a639bada8d2f548e7f14f7a6de85;
    stim[28] = 121'h021ba903e76a5a1ecd847de4bfcfd47;
    stim[29] = 121'h094d0bbfe55db65c96b28ff8b674545;
    stim[30] = 121'h0ed1f69aefa6bd4ce1dfb206d558c48;
    stim[31] = 121'h0929f1835138dd348d4a788b8b8fffc;
    stim[32] = 121'h0616c5606100f949baa422da3203aa3;
    stim[33] = 121'h01b0716eb468ae86f790468674d63ee;
    stim[34] = 121'h16cebe2d0586d391d57286c1b440879;
    stim[35] = 121'h080a9af9b66206a476a0d4cdda9b04f;
    stim[36] = 121'h04717eb16cc0fb94db50d78c627a321;
    stim[37] = 121'h031299495b782e19c96110d915105bb;
    stim[38] = 121'h0ded2b573513a9e550062c186dec0ad;
    stim[39] = 121'h0c803af9a55b06b51bba83083ac8357;
    stim[40] = 121'h0ce82ae8a3150a8a726fa7d5988b975;
    stim[41] = 121'h0994166cf670549e7b5cbe1141ebe83;
    stim[42] = 121'h0282d79ac4c44581c55ce470d916ef2;
    stim[43] = 121'h0fa330fe3eecb24f8221e848ef121a6;
    stim[44] = 121'h09c3c1e42f6824d64e1b2e28510610b;
    stim[45] = 121'h09abd0168caf2005f67c53fafe7654d;
    stim[46] = 121'h1da19aff516780cb372a89af9c91d53;
    stim[47] = 121'h022abcfa629134434dc239cac9674ca;
    stim[48] = 121'h0ddb4a532a575e23ef45d1af7427a38;
    stim[49] = 121'h0eceb693d8ee3b6da7e2a1054bcc3fe;
    stim[50] = 121'h01654c3f70374042a2751f9e47213be;
    stim[51] = 121'h0ce7483df1ab3004128c3d19d8b95b5;
    stim[52] = 121'h0f5f94953fbfa597aa098f9dc68ce09;
    stim[53] = 121'h034954f218e18dff61d44958a4e2026;
    stim[54] = 121'h0a42eb13d54b9f638cb352b41d6e42c;
    stim[55] = 121'h0e1091e8770e34295c2113f5f42ce03;
    stim[56] = 121'h074ff9360622f36bfa6a9c2b7d43ed0;
    stim[57] = 121'h0c1adafc52674510d1ef16550238451;
    stim[58] = 121'h06953bcdda4125f16a47ed23e0eba31;
    stim[59] = 121'h06cf18ec77c6fa5802d0ff009b044ad;
    stim[60] = 121'h0edfca8851b5368e98f0fe206ca16c4;
    stim[61] = 121'h0ef547b0cfe6a625a330c1799c11b8d;
    stim[62] = 121'h0c48fe8f7e3647fce8cdb2886dd31c7;
    stim[63] = 121'h039ac61186e4408df9cecc5a9eb3873;
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
      expv[0] = 119'h000000000000000000000000000000;
      expv[1] = 119'h000000000000000000000000000000;
      expv[2] = 119'h000000000000000000000000000000;
      expv[3] = 119'h000000000000000000000000000000;
      expv[4] = 119'h000000000000000000000000000000;
      expv[5] = 119'h000000000000000000000000000000;
      expv[6] = 119'h000000000000000000000000000000;
      expv[7] = 119'h000000000000000000000000000000;
      expv[8] = 119'h000000000000000000000000000000;
      expv[9] = 119'h000000000000000000000000000000;
      expv[10] = 119'h000000000000000000000000000000;
      expv[11] = 119'h000000000000000000000000000000;
      expv[12] = 119'h000000000000000000000000000000;
      expv[13] = 119'h000000000000000000000000000000;
      expv[14] = 119'h000000000000000000000000000000;
      expv[15] = 119'h000000000000000000000000000000;
      expv[16] = 119'h000000000000000000000000000000;
      expv[17] = 119'h000000000000000000000000000000;
      expv[18] = 119'h000000000000000000000000000000;
      expv[19] = 119'h000000000000000000000000000000;
      expv[20] = 119'h000000000000000000000000000000;
      expv[21] = 119'h000000000000000000000000000000;
      expv[22] = 119'h000000000000000000000000000000;
      expv[23] = 119'h000000000000000000000000000000;
      expv[24] = 119'h000000000000000000000000000000;
      expv[25] = 119'h000000000000000000000000000000;
      expv[26] = 119'h000000000000000000000000000000;
      expv[27] = 119'h000000000000000000000000000000;
      expv[28] = 119'h000000000000000000000000000000;
      expv[29] = 119'h000000000000000000000000000000;
      expv[30] = 119'h000000000000000000000000000000;
      expv[31] = 119'h000000000000000000000000000000;
      expv[32] = 119'h000000000000000000000000000000;
      expv[33] = 119'h000000000000000000000000000000;
      expv[34] = 119'h000000000000000000000000000000;
      expv[35] = 119'h000000000000000000000000000000;
      expv[36] = 119'h000000000000000000000000000000;
      expv[37] = 119'h000000000000000000000000000000;
      expv[38] = 119'h000000000000000000000000000000;
      expv[39] = 119'h000000000000000000000000000000;
      expv[40] = 119'h000000000000000000000000000000;
      expv[41] = 119'h000000000000000000000000000000;
      expv[42] = 119'h000000000000000000000000000000;
      expv[43] = 119'h000000000000000000000000000000;
      expv[44] = 119'h000000000000000000000000000000;
      expv[45] = 119'h000000000000000000000000000000;
      expv[46] = 119'h000000000000000000000000000000;
      expv[47] = 119'h000000000000000000000000000000;
      expv[48] = 119'h000000000000000000000000000000;
      expv[49] = 119'h000000000000000000000000000000;
      expv[50] = 119'h000000000000000000000000000000;
      expv[51] = 119'h000000000000000000000000000000;
      expv[52] = 119'h000000000000000000000000000000;
      expv[53] = 119'h000000000000000000000000000000;
      expv[54] = 119'h000000000000000000000000000000;
      expv[55] = 119'h000000000000000000000000000000;
      expv[56] = 119'h000000000000000000000000000000;
      expv[57] = 119'h000000000000000000000000000000;
      expv[58] = 119'h000000000000000000000000000000;
      expv[59] = 119'h000000000000000000000000000000;
      expv[60] = 119'h000000000000000000000000000000;
      expv[61] = 119'h000000000000000000000000000000;
      expv[62] = 119'h000000000000000000000000000000;
      expv[63] = 119'h000000000000000000000000000000;
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
