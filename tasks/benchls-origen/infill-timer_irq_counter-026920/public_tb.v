// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 138;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026920 dut (
    .iCLOCK(clk),
    .inRESET(in_vec[137:137]),
    .iMTIMER_WORKING(in_vec[136:136]),
    .iMTIMER_COUNT(in_vec[135:72]),
    .iCONF_WRITE(in_vec[71:71]),
    .iCONF_ENA(in_vec[70:70]),
    .iCONF_IRQENA(in_vec[69:69]),
    .iCONF_64MODE(in_vec[68:68]),
    .iCONF_PERIODIC(in_vec[67:67]),
    .iCOUNT_WRITE(in_vec[66:66]),
    .inCOUNT_DQM(in_vec[65:64]),
    .iCOUNT_COUNTER(in_vec[63:0]),
    .oIRQ(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 138'h3bf9436313ec84ec944e8174b5aca3dcd16;
    stim[1] = 138'h29014a1c63897032b231dbdfab180ad30f1;
    stim[2] = 138'h1e533a8252c6ccdcc8db38020eed10386aa;
    stim[3] = 138'h0e6933f60abdccf2d0ce9356bff2ad539f3;
    stim[4] = 138'h09f045cc5a24e95b16e1b238bb5df1b32a8;
    stim[5] = 138'h0408e40fe05ba723b876d65d7c877df23dd;
    stim[6] = 138'h0ffa6326941043f6c2b854ae5f1ac169fff;
    stim[7] = 138'h057be7044e18ed7572fcfd9303fc3d2a4cb;
    stim[8] = 138'h14fda6f9eb31c43bff059c4c31b5fcb0d25;
    stim[9] = 138'h1698b4a0f89f0fa2bb7b9fbf3f509ffac34;
    stim[10] = 138'h0ee6fad9e1f7d0a4a8e10d60fe6c240d9e7;
    stim[11] = 138'h0e1a9795f780692e2710650ed84c0e1f0e4;
    stim[12] = 138'h1500c73e38234ac0b977ee4973744d7c9aa;
    stim[13] = 138'h053f19be30ebb7cb7e9f84212b666b1fb42;
    stim[14] = 138'h0b2172a6af9f3f720bb450350958224a0f0;
    stim[15] = 138'h10c0c08b667fd3dfa6d327316fb46b30b0b;
    stim[16] = 138'h0d3104c153063e29e25f164ef574f599221;
    stim[17] = 138'h082a27ad8e855cbdcae1e4c31cfcfa07007;
    stim[18] = 138'h161d209a9bb0b48377d980252442281434d;
    stim[19] = 138'h121af34d89b4282b036e6b607a34a6e91d3;
    stim[20] = 138'h1aa68471eb94f085f8fbbf37d98518e9733;
    stim[21] = 138'h09c031d7793a2c83fb9fecf98ec303db990;
    stim[22] = 138'h14f2f11f3027d7f295f822ac6c1690dadbb;
    stim[23] = 138'h1e59e88153fc57c23008f1740b0a2024488;
    stim[24] = 138'h0471dbb357c1dc3aa6169e68e9726f01e35;
    stim[25] = 138'h04700f707023cc96c1b7528e82f15b83eff;
    stim[26] = 138'h1b59447e7a6ca56e2b84507b102bd38ce47;
    stim[27] = 138'h10be5e7b8d8cc27c4992164b2f5797ad38e;
    stim[28] = 138'h13ba8e34d4d4bfb050dd64519d9507f8848;
    stim[29] = 138'h03c300725cbc67151e6ac112cc554d29d00;
    stim[30] = 138'h18864d65680ac020f96ad201d0bd87b5a40;
    stim[31] = 138'h0e37264810af8d513fbc0de3bae81820a17;
    stim[32] = 138'h1d74a1ab6d6783f420043f95cc23f770ce8;
    stim[33] = 138'h0dd21a6ee0d9420dca1e1ce20364a5781b8;
    stim[34] = 138'h01f16f45084eeb6c6317b56daad9cf19459;
    stim[35] = 138'h176acbfd0a3d7bbacf08bcc039757578118;
    stim[36] = 138'h134554528153cfb002fe3f685307f8fa561;
    stim[37] = 138'h1140543f49385f9c4e036fe988605149d97;
    stim[38] = 138'h1228241025a1aa7557e6da32645221586a8;
    stim[39] = 138'h0b82512f074fd8c83cf8f61b4a656eab234;
    stim[40] = 138'h0defec98c31ce8ee7d441618d093fdeb603;
    stim[41] = 138'h0582c87d9877dfd43c9bbc754a655d196ec;
    stim[42] = 138'h1418cdc8fd21fab4fc637c8dc198b101f25;
    stim[43] = 138'h1cbb52fb764f8ad45638d2bb032e8e1f013;
    stim[44] = 138'h1a9375ea80b271b34d59aae7cab5756e77f;
    stim[45] = 138'h0ba256e20dece1e1caeda1396c9730c892f;
    stim[46] = 138'h152e6422fcaf423a176a42f06d3e038dcae;
    stim[47] = 138'h038ea220decf1e13025d1235be31760263f;
    stim[48] = 138'h0486ef020e5772e921ff1f8f7d824511b04;
    stim[49] = 138'h16874531f73c11e7d09957a33f826d84308;
    stim[50] = 138'h0739d030e1085cfc79cb63b831565c9dcf2;
    stim[51] = 138'h1df60d54bfd64753f2c69e098d5df1b96c8;
    stim[52] = 138'h1a0dd66dd71667ba19b96b39ca52e1a5676;
    stim[53] = 138'h1767ccea1398fde78661a767ed5889ab844;
    stim[54] = 138'h1b25c8345e581396522150d0e712e814c51;
    stim[55] = 138'h082e986c3e9721435c5f961101456d1f9fb;
    stim[56] = 138'h13565384c039066c19600d052270dc0439b;
    stim[57] = 138'h0a99953cfeaa94c292cde6652a08fc0535e;
    stim[58] = 138'h17492dd9d463a2d1f40d37e9e818182208d;
    stim[59] = 138'h1f429c1726b4e169ba16b5a95e36280a736;
    stim[60] = 138'h077daaac7948cb4e0aab65225ba6640f2ed;
    stim[61] = 138'h1b26ee0902f1e54bfcb47bb895e55baf95c;
    stim[62] = 138'h0e7c272cd389e49dfdc0b4d22107385e398;
    stim[63] = 138'h118bf9475070093f3aee66aae52a9c2d65a;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
