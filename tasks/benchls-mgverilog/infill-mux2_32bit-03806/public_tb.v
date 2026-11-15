// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03806 dut (
    .datain0(in_vec[64:33]),
    .datain1(in_vec[32:1]),
    .select(in_vec[0:0]),
    .dataout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h116ca87f68736e2dd;
    stim[1] = 65'h07523db09da170939;
    stim[2] = 65'h07fd05b7791ab7b8d;
    stim[3] = 65'h081b5a24da5002e0d;
    stim[4] = 65'h1021b646285f335f4;
    stim[5] = 65'h1dd296072b3139931;
    stim[6] = 65'h07142ce08a999804e;
    stim[7] = 65'h0d19c28de6f475225;
    stim[8] = 65'h19b9a6a3ad9c5ccab;
    stim[9] = 65'h06f6394c1023bad47;
    stim[10] = 65'h0e3ed7e414c29dc99;
    stim[11] = 65'h1a6d2a0957dcbd616;
    stim[12] = 65'h1aa8b82c452f5fb54;
    stim[13] = 65'h0dfacd08d2e2630ea;
    stim[14] = 65'h0d436e6a3a1f2f9db;
    stim[15] = 65'h117149597d4a43174;
    stim[16] = 65'h1fd3036f429aa68f2;
    stim[17] = 65'h1dd8649655be4aa15;
    stim[18] = 65'h1f9b17a7ca770d280;
    stim[19] = 65'h12c3939ea7e772f52;
    stim[20] = 65'h12cb266e684abb453;
    stim[21] = 65'h1b476ef61c6f0d750;
    stim[22] = 65'h16f6f3be56005216b;
    stim[23] = 65'h0cc7b80fb6fd8d562;
    stim[24] = 65'h0a9d45fb405640194;
    stim[25] = 65'h0a6e55d7115c76064;
    stim[26] = 65'h15083fa3fc2750584;
    stim[27] = 65'h02a983775d2715f69;
    stim[28] = 65'h1995f642c321d4515;
    stim[29] = 65'h1b89f73bb184f02d3;
    stim[30] = 65'h1c39b57d986a5b012;
    stim[31] = 65'h103e4e25a5e2c4a3e;
    stim[32] = 65'h04cec643577d15482;
    stim[33] = 65'h01771d4b7c5b3e51e;
    stim[34] = 65'h0b7ae16049ddff2ca;
    stim[35] = 65'h17c7b96d7d40458d9;
    stim[36] = 65'h0651f09c08d71b2db;
    stim[37] = 65'h1e15446c4ffb3c77b;
    stim[38] = 65'h171a67f224921f05e;
    stim[39] = 65'h0fde45b7995f3a187;
    stim[40] = 65'h0dc26d911cce167fa;
    stim[41] = 65'h0b39ab07a93cf8472;
    stim[42] = 65'h0c17975aafe104dae;
    stim[43] = 65'h0caf5cff79df04d77;
    stim[44] = 65'h1915c540d2593ec78;
    stim[45] = 65'h0c0cac7c06c80d4a4;
    stim[46] = 65'h1f0d2b4521e45c5b0;
    stim[47] = 65'h0daf1513baade20a3;
    stim[48] = 65'h1d312b09c73272937;
    stim[49] = 65'h176a5515d86bcb6ff;
    stim[50] = 65'h1c44b8e226983478d;
    stim[51] = 65'h1d7d7f7e2eefcf8f7;
    stim[52] = 65'h0958edce485c9c582;
    stim[53] = 65'h1ddc4005999204c23;
    stim[54] = 65'h0c882679288a3d76b;
    stim[55] = 65'h053c561d820d275e5;
    stim[56] = 65'h13bc46385d4e4ce98;
    stim[57] = 65'h0fcd69d3975e81795;
    stim[58] = 65'h0767da1635f2d9e05;
    stim[59] = 65'h077d19d8e34e298d6;
    stim[60] = 65'h1689fc6db38f249c6;
    stim[61] = 65'h15097ee0868d72175;
    stim[62] = 65'h1d4b7d0b9d537b948;
    stim[63] = 65'h1adb977c59e92ee9a;
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
      expv[0] = 32'h439b716e;
      expv[1] = 32'hed0b849c;
      expv[2] = 32'hc8d5bdc6;
      expv[3] = 32'hd2801706;
      expv[4] = 32'h810db231;
      expv[5] = 32'h5989cc98;
      expv[6] = 32'h38a16704;
      expv[7] = 32'h37a3a912;
      expv[8] = 32'h6ce2e655;
      expv[9] = 32'h811dd6a3;
      expv[10] = 32'ha614ee4c;
      expv[11] = 32'hd369504a;
      expv[12] = 32'hd545c162;
      expv[13] = 32'h6fd66846;
      expv[14] = 32'hd0f97ced;
      expv[15] = 32'h8b8a4acb;
      expv[16] = 32'hfe981b7a;
      expv[17] = 32'hadf2550a;
      expv[18] = 32'hfcd8bd3e;
      expv[19] = 32'h961c9cf5;
      expv[20] = 32'h4255da29;
      expv[21] = 32'hda3b77b0;
      expv[22] = 32'hb00290b5;
      expv[23] = 32'h663dc07d;
      expv[24] = 32'h54ea2fda;
      expv[25] = 32'h5372aeb8;
      expv[26] = 32'ha841fd1f;
      expv[27] = 32'he938afb4;
      expv[28] = 32'h190ea28a;
      expv[29] = 32'h8c278169;
      expv[30] = 32'he1cdabec;
      expv[31] = 32'h81f2712d;
      expv[32] = 32'h2676321a;
      expv[33] = 32'h0bb8ea5b;
      expv[34] = 32'h5bd70b02;
      expv[35] = 32'hea022c6c;
      expv[36] = 32'h46b8d96d;
      expv[37] = 32'h7fd9e3bd;
      expv[38] = 32'hb8d33f91;
      expv[39] = 32'hcaf9d0c3;
      expv[40] = 32'h6e136c88;
      expv[41] = 32'h59cd583d;
      expv[42] = 32'h60bcbad5;
      expv[43] = 32'hcef826bb;
      expv[44] = 32'hc8ae2a06;
      expv[45] = 32'h606563e0;
      expv[46] = 32'hf8695a29;
      expv[47] = 32'hd56f1051;
      expv[48] = 32'h3993949b;
      expv[49] = 32'hc35e5b7f;
      expv[50] = 32'h34c1a3c6;
      expv[51] = 32'h777e7c7b;
      expv[52] = 32'h4ac76e72;
      expv[53] = 32'hcc902611;
      expv[54] = 32'h4451ebb5;
      expv[55] = 32'h10693af2;
      expv[56] = 32'h9de231c2;
      expv[57] = 32'hbaf40bca;
      expv[58] = 32'haf96cf02;
      expv[59] = 32'h3be8cec7;
      expv[60] = 32'hb44fe36d;
      expv[61] = 32'h346b90ba;
      expv[62] = 32'hea5be85c;
      expv[63] = 32'hd6dcbbe2;
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
