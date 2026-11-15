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

  rtlpp_07459 dut (
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
    stim[0] = 122'h23b9805990787ec437835c1cf0c4360;
    stim[1] = 122'h21cc25e58793ac506eafa5a4cac0008;
    stim[2] = 122'h3ab162d3be3f6be0407421d1dee3275;
    stim[3] = 122'h210a0df85cbc5da1cc534bacaf2e110;
    stim[4] = 122'h3d8670d142b09d3cb5e119bfeb2d1e1;
    stim[5] = 122'h09be8307cb28e782bfe9548e1729b27;
    stim[6] = 122'h3c31240ed2feae2350f37c2169f3193;
    stim[7] = 122'h0be4594c829a650fc3c5083fcd11cd9;
    stim[8] = 122'h3cdf00beb06cfa680f54a7f3c201ff2;
    stim[9] = 122'h176f7e6d65db5757bacf122645fd8b6;
    stim[10] = 122'h0c641ef01dbaf0860271cc6bb0b243d;
    stim[11] = 122'h3093106a1c63f05790df62a54f2d7b2;
    stim[12] = 122'h086064035be453de59d05398666607b;
    stim[13] = 122'h3619e5f048d7fe5b25fdac66978a4da;
    stim[14] = 122'h2c64ce0d1b224d83cdec02ff59324e2;
    stim[15] = 122'h35382a59bb4a49c5ec4b0875bfbf101;
    stim[16] = 122'h31c37f6b68ab380f187c5074f44408e;
    stim[17] = 122'h1414cbc11f1e254756c27636893ab06;
    stim[18] = 122'h091544e7f11a5cb60b4866d8c5e4dbc;
    stim[19] = 122'h1eeeeff35bb5eda86174f76127c4d73;
    stim[20] = 122'h0a9c5b74aa4f8289f74c12233dc72e5;
    stim[21] = 122'h03413f45ae7bf4000f6959f4bc3364f;
    stim[22] = 122'h115335353230455f8ffa76eaf6d4328;
    stim[23] = 122'h0545a3c66b28939134f8753e655d7a3;
    stim[24] = 122'h3e0a00fd37ad37a286cacc768c43f72;
    stim[25] = 122'h10fd8adf00874a2602cd4763de5ba61;
    stim[26] = 122'h08224a8e9b88f22f5875f053e702c81;
    stim[27] = 122'h269a4681b3e2f2631975a486375571a;
    stim[28] = 122'h0822118576d1b73d96ea4fde7bb9fb3;
    stim[29] = 122'h1fb2cdd70f1d3a8e4562ac596831ea4;
    stim[30] = 122'h298c2acad98bf1d6414d9969b56a5eb;
    stim[31] = 122'h11a81ef809dc79068451098825998e7;
    stim[32] = 122'h319e3d7f8995488a2ae0b1fe4d33be6;
    stim[33] = 122'h014b6125986c67b2b9c2a6f35f2d5bc;
    stim[34] = 122'h2648bc30634e56bbf1cad08cdb3f4bc;
    stim[35] = 122'h173c5cc471f1828597db57c7ebb758b;
    stim[36] = 122'h11c2bf2a005997bf90652799cb4e0dc;
    stim[37] = 122'h29cba131d6314aa0567f3aa62dbc682;
    stim[38] = 122'h0e1c349fb7685438bc6c5562633eefb;
    stim[39] = 122'h3b35aab6e9fe0c93d076da96c854053;
    stim[40] = 122'h08f327dc0228a9f98d492388593e725;
    stim[41] = 122'h150afabac4572e1b3641cb49d082936;
    stim[42] = 122'h252ed73d15d0066bf7511a240b170eb;
    stim[43] = 122'h1bad74f6b4314ba9ccf4160501e7baa;
    stim[44] = 122'h0550820b0eb02610474622ce68643b3;
    stim[45] = 122'h2d37fc271738c7aaeafc2e1cdadc872;
    stim[46] = 122'h1627079e26b06fbbfafa4803d51f2da;
    stim[47] = 122'h25da82e98ff47541b4606a33a2a2d10;
    stim[48] = 122'h03ae0ed8a1e74ed591757fc3690be65;
    stim[49] = 122'h0f1c4e040bc61a3060e4489a8797ded;
    stim[50] = 122'h2b4806f0aeadc7a8abd5b045d962e15;
    stim[51] = 122'h2cdd0e582a383718ac69914c4bc9b7d;
    stim[52] = 122'h30bce7c048d499b8bd663fc0055fc50;
    stim[53] = 122'h3b06f1e39bea94e4464637a833377d1;
    stim[54] = 122'h22fc2b8df983689b045ccdb7eff89f4;
    stim[55] = 122'h3f3c5bd57ff753d47ac36eac14bd5aa;
    stim[56] = 122'h3be958761d39e5884dce7765d4bd288;
    stim[57] = 122'h0afd75edfa339b6bc9f32ac1091183d;
    stim[58] = 122'h1bba0424e6bfafc2f8d14cbef8478e8;
    stim[59] = 122'h25d943299f5526e47e5e35f570c8c3d;
    stim[60] = 122'h1a7dad3b8c4383b4006e0a0edcf7501;
    stim[61] = 122'h1216f90d6d0700a1274090adff6ba13;
    stim[62] = 122'h305af2746d40772eba516420c5f2d31;
    stim[63] = 122'h1319e53fb38f43f501f1270e7f46aa4;
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
      expv[0] = 53'h08ee60166da817;
      expv[1] = 53'h087309796bb887;
      expv[2] = 53'h0eac58b4e04678;
      expv[3] = 53'h0842837e134619;
      expv[4] = 53'h0f619c345d603f;
      expv[5] = 53'h026fa0c1ffe976;
      expv[6] = 53'h0f0c4903b47629;
      expv[7] = 53'h02f9165320e9b7;
      expv[8] = 53'h0f37c02fa3cd13;
      expv[9] = 53'h05dbdf9b5ef946;
      expv[10] = 53'h031907bc00cef0;
      expv[11] = 53'h0c24c41a847609;
      expv[12] = 53'h02181900d666b9;
      expv[13] = 53'h0d86797c196699;
      expv[14] = 53'h0b19338343601f;
      expv[15] = 53'h0d4e0a966b403f;
      expv[16] = 53'h0c70dfdad646d8;
      expv[17] = 53'h050532f045f946;
      expv[18] = 53'h02455139f2c9d6;
      expv[19] = 53'h07bbbbfcd8453b;
      expv[20] = 53'h02a716dd2dc876;
      expv[21] = 53'h00d04fd163c8f6;
      expv[22] = 53'h0454cd4d43ee91;
      expv[23] = 53'h015168f19d7629;
      expv[24] = 53'h0f82803f41f907;
      expv[25] = 53'h043f62b7c0f927;
      expv[26] = 53'h020892a3a6453b;
      expv[27] = 53'h09a691a0664699;
      expv[28] = 53'h0208846155f927;
      expv[29] = 53'h07ecb375c1415e;
      expv[30] = 53'h0a630ab2b040bf;
      expv[31] = 53'h046a07be01457a;
      expv[32] = 53'h0c678f5feaf946;
      expv[33] = 53'h0052d8496e60de;
      expv[34] = 53'h09922f0c1c60de;
      expv[35] = 53'h05cf173115eeb1;
      expv[36] = 53'h0470afca8440de;
      expv[37] = 53'h0a72e84c75ce11;
      expv[38] = 53'h03870d27ef41bf;
      expv[39] = 53'h0ecd6aadb44639;
      expv[40] = 53'h023cc9f703407e;
      expv[41] = 53'h0542beaebdc956;
      expv[42] = 53'h094bb5cf4dceb1;
      expv[43] = 53'h06eb5d3da3758b;
      expv[44] = 53'h01542082c1c837;
      expv[45] = 53'h0b4dff09cafd03;
      expv[46] = 53'h0589c1e78efe81;
      expv[47] = 53'h0976a0ba6d411f;
      expv[48] = 53'h00eb83b624457a;
      expv[49] = 53'h03c713810871ee;
      expv[50] = 53'h0ad201bc2aed72;
      expv[51] = 53'h0b3743960b41fe;
      expv[52] = 53'h0c2f39f01f411f;
      expv[53] = 53'h0ec1bc78e1c837;
      expv[54] = 53'h08bf0ae371455a;
      expv[55] = 53'h0fcf16f55ef887;
      expv[56] = 53'h0efa561d83609f;
      expv[57] = 53'h02bf5d7b7265fa;
      expv[58] = 53'h06ee81093e758b;
      expv[59] = 53'h097650ca6fcdf2;
      expv[60] = 53'h069f6b4ee0403f;
      expv[61] = 53'h0485be4359c937;
      expv[62] = 53'h0c16bc9d1ecd33;
      expv[63] = 53'h04c6794fe0655a;
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
