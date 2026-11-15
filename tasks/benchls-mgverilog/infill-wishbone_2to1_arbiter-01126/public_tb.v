// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 145;
  localparam OW = 77;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01126 dut (
    .i_clk(clk),
    .i_a_cyc(in_vec[144:144]),
    .i_a_stb(in_vec[143:143]),
    .i_a_we(in_vec[142:142]),
    .i_a_adr(in_vec[141:110]),
    .i_a_dat(in_vec[109:78]),
    .i_a_sel(in_vec[77:74]),
    .i_b_cyc(in_vec[73:73]),
    .i_b_stb(in_vec[72:72]),
    .i_b_we(in_vec[71:71]),
    .i_b_adr(in_vec[70:39]),
    .i_b_dat(in_vec[38:7]),
    .i_b_sel(in_vec[6:3]),
    .i_ack(in_vec[2:2]),
    .i_stall(in_vec[1:1]),
    .i_err(in_vec[0:0]),
    .o_a_ack(out_vec[76:76]),
    .o_a_stall(out_vec[75:75]),
    .o_a_err(out_vec[74:74]),
    .o_b_ack(out_vec[73:73]),
    .o_b_stall(out_vec[72:72]),
    .o_b_err(out_vec[71:71]),
    .o_cyc(out_vec[70:70]),
    .o_stb(out_vec[69:69]),
    .o_we(out_vec[68:68]),
    .o_adr(out_vec[67:36]),
    .o_dat(out_vec[35:4]),
    .o_sel(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 145'h1487ee0dcc813ff94cfee258bacc7ad81d0b4;
    stim[1] = 145'h086a59c13d8c1e73461e49a09b6144d43ec1a;
    stim[2] = 145'h11f427d8c47c3d064c6a45d0a8be6c1e26b24;
    stim[3] = 145'h197027ac2b667615766190a5c312f3ec7b788;
    stim[4] = 145'h04692bd4f82ea19c4b3976117e18a9a0c7d87;
    stim[5] = 145'h1b067f01a9730b78b832bafab93c79072fd1d;
    stim[6] = 145'h10fbe35f1f23767a70560d8cacf556ec9f7a7;
    stim[7] = 145'h17880bf090c9185784a15fef8f532df773c1f;
    stim[8] = 145'h1f91fd8490c5a4f1c0aa4c7878acc90c71a81;
    stim[9] = 145'h1c61c05f4bbfe32e1ee5124fe5d0babf83d07;
    stim[10] = 145'h1dc0bdc4f58277a8d6f587b0510eb47ece2a4;
    stim[11] = 145'h03967ce345518dcde91198b3cd1ece2065e02;
    stim[12] = 145'h1fa2b3ac148bdcde311f6df14c2a459f0a26a;
    stim[13] = 145'h0922333fa6a28241d9eddccd5b96b69163b29;
    stim[14] = 145'h083fda516b2d9fde1c1382482572a154108df;
    stim[15] = 145'h0a60043728e51b8454ea2caad2675bcf8aea3;
    stim[16] = 145'h1c8dda5f1217cf7325b400a9324a7eab8a5ed;
    stim[17] = 145'h1b218a5ce781447bc473f783bec493e60fdd7;
    stim[18] = 145'h033f2bcc2a21c9865df8d3a7ee7768d65cb68;
    stim[19] = 145'h15b6d130f0806bcc49956bab684b58b75093b;
    stim[20] = 145'h18aaed98a9ee0430183f0ad07f294b534d227;
    stim[21] = 145'h182068f486b101a80571d9b9d44d6135a3277;
    stim[22] = 145'h1534cf64ac604dd73d373480c5947c2570604;
    stim[23] = 145'h17a1f684f96c90c239650c2e17af7dda96218;
    stim[24] = 145'h1e76443e281bd71357fc48abb406cbf80ac99;
    stim[25] = 145'h1b6bb308f3d560f12840c34f4de1b3b8547e3;
    stim[26] = 145'h187530f3edac45bd13c6c0d5510cedb1c546a;
    stim[27] = 145'h049ce3c0aaf37959660663ba363914e6b3dac;
    stim[28] = 145'h0c4f6b63f1e279dfb068b3010f8464fea31d3;
    stim[29] = 145'h048b2ab07222c2e1081de836f651ac96e8f83;
    stim[30] = 145'h0761b41fd570118140acc5aafb32866b46b26;
    stim[31] = 145'h067478facc9aebe0292130302b233888492c1;
    stim[32] = 145'h02bff295549a8c29bf19f9b707f5fb26ad67f;
    stim[33] = 145'h07ac87dd09f7a0d29af538b35b094257a428d;
    stim[34] = 145'h17ef55a7b2e9ac558e7ae328937b2af58a849;
    stim[35] = 145'h03b9909aef98d19cd37982793c4e497b844dd;
    stim[36] = 145'h04a962aaa039aae17f7990946b368cae2df56;
    stim[37] = 145'h152bad671aaf030b56b13ebcadb143a4c2854;
    stim[38] = 145'h17263dd2e74d05a1b1d14adb0e78b5ff7c03c;
    stim[39] = 145'h0b1346bf74968c1636886a13743805a8c1c27;
    stim[40] = 145'h02ca4da4c6ce8f2b0e2c3a189070061b60782;
    stim[41] = 145'h1c39b075d756bc47aece90549d71ac9164802;
    stim[42] = 145'h1f4fbffef7aa9cd699597f818518a222bb7dc;
    stim[43] = 145'h15fc56ed98476a42c96351ead86065c9e4d0a;
    stim[44] = 145'h04366a28a24e2d3e7b17d603e1daa5341f2da;
    stim[45] = 145'h0c70970284db8af1d561a86fac5efde2ee294;
    stim[46] = 145'h0c94041bf4cf47f83fe9f4f6cdcad23007752;
    stim[47] = 145'h014e414bad0b44c4e409c2b398d57853bb2ab;
    stim[48] = 145'h021734ff2fbcf10345a7d9b8c542f03849cb1;
    stim[49] = 145'h11eb9d80be336e493a3bc17707168251b242d;
    stim[50] = 145'h13d3c5b30e64359047c8792349430566f3969;
    stim[51] = 145'h1f8d0b8e43d3670e1c0e1829dce451693ec27;
    stim[52] = 145'h1eaa85b974b03c226393a7d4c3521d96cbcef;
    stim[53] = 145'h171147b453b94a74c34a086328b6c2e1743f0;
    stim[54] = 145'h01fdbbb5694e4212e549c4484a0b4625dbe63;
    stim[55] = 145'h127e001c8cd41fc301546ec057f63aa99322e;
    stim[56] = 145'h0ca1afca1921f8f6be60c1dc175730df7bff6;
    stim[57] = 145'h1dc2204522b15af8cf5272f2d0d7b8b0a319f;
    stim[58] = 145'h05b441f8b2589da18260fc8396cfbcb38ea1e;
    stim[59] = 145'h08134c6e38eb16c0078975240bbf4f3cabe62;
    stim[60] = 145'h1b534bebb9885334683985c585a621d415580;
    stim[61] = 145'h1cdffe07707c847c44690abc7749e81132795;
    stim[62] = 145'h04531b98568b3bb264e874031cca7b39ae14e;
    stim[63] = 145'h029073cedec84cd3cd508d67aedce286f7164;
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
      expv[0] = 77'h11521fb8373204ffe533;
      expv[1] = 77'h0921a96704f63079cd18;
      expv[2] = 77'h1147d09f6311f0f41931;
      expv[3] = 77'h0165c09eb0ad99d855d9;
      expv[4] = 77'h1d11a4af53e0ba86712c;
      expv[5] = 77'h0ae575f57278f20e5fa3;
      expv[6] = 77'h0bac1b1959eaadd93ef4;
      expv[7] = 77'h1d5e202fc24324615e12;
      expv[8] = 77'h057e47f612431693c702;
      expv[9] = 77'h1d7187017d2eff8cb87b;
      expv[10] = 77'h117702f713d609dea35b;
      expv[11] = 77'h090e59f38d15463737a4;
      expv[12] = 77'h097e8aceb0522f7378c4;
      expv[13] = 77'h052488ccfe9a8a090767;
      expv[14] = 77'h1d20ff6945acb67f7870;
      expv[15] = 77'h0d298010dca3946e1153;
      expv[16] = 77'h157237697c485f3dcc96;
      expv[17] = 77'h1d6c8629739e0511ef11;
      expv[18] = 77'h010cfcaf30a887261977;
      expv[19] = 77'h09aad756d096b16ea127;
      expv[20] = 77'h1d62abb662a7b810c060;
      expv[21] = 77'h1d6081a3d21ac406a015;
      expv[22] = 77'h1154d33d92b181375cf4;
      expv[23] = 77'h015e87da13e5b24308e5;
      expv[24] = 77'h0579d910f8a06f5c4d5f;
      expv[25] = 77'h0d6daecc23cf5583c4a1;
      expv[26] = 77'h0961d4c3cfb6b116f44f;
      expv[27] = 77'h1112738f02abcde56598;
      expv[28] = 77'h0d313dad8fc789e77ec1;
      expv[29] = 77'h0d122caac1c88b0b8420;
      expv[30] = 77'h191d86d07f55c0460502;
      expv[31] = 77'h0519d1e3eb326baf80a4;
      expv[32] = 77'h1d0affca55526a30a6fc;
      expv[33] = 77'h151eb21f7427de834a6b;
      expv[34] = 77'h08f5c65126f655eb1509;
      expv[35] = 77'h0af304f2789c92f7089b;
      expv[36] = 77'h0b732128d66d195c5bea;
      expv[37] = 77'h0a627d795b628749850a;
      expv[38] = 77'h0a2295b61cf16bfef807;
      expv[39] = 77'h1d2c4d1afdd25a3058da;
      expv[40] = 77'h090b2936931b3a3cac38;
      expv[41] = 77'h0970e6c1d75d5af11ebb;
      expv[42] = 77'h117d3efffbdeaa735a65;
      expv[43] = 77'h0957f15bb6611da90b25;
      expv[44] = 77'h0910d9a8a28938b4f9ec;
      expv[45] = 77'h1131c25c0a136e2bc755;
      expv[46] = 77'h093250106fd33d1fe0ff;
      expv[47] = 77'h0d0539052eb42d131390;
      expv[48] = 77'h05085cd3fcbef3c40d16;
      expv[49] = 77'h1547ae7602f8cdb924e8;
      expv[50] = 77'h054f4f16cc3990d6411f;
      expv[51] = 77'h1d7e342e390f4d9c3870;
      expv[52] = 77'h1d7aaa16e5d2c0f0898e;
      expv[53] = 77'h015c451ed14ee529d30d;
      expv[54] = 77'h0d07f6eed5a539084b95;
      expv[55] = 77'h1949f8007233507f0c05;
      expv[56] = 77'h193286bf286487e3daf9;
      expv[57] = 77'h1d770881148ac56be33d;
      expv[58] = 77'h1916d107e2c962768609;
      expv[59] = 77'h09204d31b8e3ac5b001e;
      expv[60] = 77'h016d4d2faee6214cd1a0;
      expv[61] = 77'h15737ff81dc1f211f111;
      expv[62] = 77'h19114c6e615a2ceec993;
      expv[63] = 77'h110a41cf3b7b21334f35;
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
