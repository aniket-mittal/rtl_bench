// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036693 dut (
    .clk(clk),
    .EX_PC_IMM(in_vec[69:38]),
    .EX_PC(in_vec[37:6]),
    .EX_opcode(in_vec[5:2]),
    .EX_condFlag(in_vec[1:1]),
    .prediction(in_vec[0:0]),
    .correctOut(out_vec[34:34]),
    .update(out_vec[33:33]),
    .reset(out_vec[32:32]),
    .newPC(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h21509632a8bf1b6eef;
    stim[1] = 70'h2e369b5deaf4f96de7;
    stim[2] = 70'h1231af777c5c1df685;
    stim[3] = 70'h016a0cfc5148eaf499;
    stim[4] = 70'h1e78f87237c8d05eda;
    stim[5] = 70'h00f3d4ca389b8d47db;
    stim[6] = 70'h3be75aea675c5ef851;
    stim[7] = 70'h381273069a8ed26ef8;
    stim[8] = 70'h325d090c16b1b8ad37;
    stim[9] = 70'h050559318015ccb95c;
    stim[10] = 70'h194fcaf7917ce5ebd1;
    stim[11] = 70'h140c27c64176bc4daf;
    stim[12] = 70'h1815d4e7df47055934;
    stim[13] = 70'h29be6310a5eceba3fe;
    stim[14] = 70'h0ad61d8eaffff73ad9;
    stim[15] = 70'h02436a04df789864d6;
    stim[16] = 70'h39e68b7bc48d4058ed;
    stim[17] = 70'h115650783b9d20a47d;
    stim[18] = 70'h0a9f41b88d917c23ba;
    stim[19] = 70'h2990662c3f49553e23;
    stim[20] = 70'h0a7423117905aad135;
    stim[21] = 70'h0f463c7aa40936393d;
    stim[22] = 70'h06ffdc92356453a1ef;
    stim[23] = 70'h3de96c6ec9befe813f;
    stim[24] = 70'h119073b8c8585f2d55;
    stim[25] = 70'h3c1ce6a1ec128f2cc3;
    stim[26] = 70'h3cea8accdad3f484e2;
    stim[27] = 70'h01d5c22fdf10a789fb;
    stim[28] = 70'h3fdeeb286b53c9a905;
    stim[29] = 70'h130bf566a4f1c25a66;
    stim[30] = 70'h332367cd8f19c90375;
    stim[31] = 70'h2e10d12b4d5c8a3be4;
    stim[32] = 70'h2ff190df7315b0e25d;
    stim[33] = 70'h39ebd7f0063fc47b99;
    stim[34] = 70'h0c42a18354de247484;
    stim[35] = 70'h24214f57d760fe05a6;
    stim[36] = 70'h2c59fb6f25479f8c90;
    stim[37] = 70'h040b13a6011fce1b28;
    stim[38] = 70'h33d2149733c41e7736;
    stim[39] = 70'h117a57f08fadc92d7c;
    stim[40] = 70'h1316c9eba3d7988caa;
    stim[41] = 70'h2251af1d9fabf1cb58;
    stim[42] = 70'h1a9ced522230db50d9;
    stim[43] = 70'h27cf3ef8949927b8c6;
    stim[44] = 70'h18cfaca4d8d66d3ec3;
    stim[45] = 70'h21276cd8c1cd7a4884;
    stim[46] = 70'h35c6254f1d4c4a8d11;
    stim[47] = 70'h2e9e6836bd475378ce;
    stim[48] = 70'h0af3ef3680dd92b707;
    stim[49] = 70'h1a79b345cd2e2d6d60;
    stim[50] = 70'h3b18f2a1376bd4dbf2;
    stim[51] = 70'h319f3e3639733b03dc;
    stim[52] = 70'h09c3aae14108fb358e;
    stim[53] = 70'h0f25401797ef4a0b24;
    stim[54] = 70'h2559040eb18341e4ce;
    stim[55] = 70'h0e54c422eb190ec20c;
    stim[56] = 70'h3fd68707084d6594ec;
    stim[57] = 70'h2c1eb18e06e608d3e6;
    stim[58] = 70'h1fa7dc878160ee7598;
    stim[59] = 70'h3b83de58cb4f7a2009;
    stim[60] = 70'h1fd94b5f5296234216;
    stim[61] = 70'h0458d62bb05d70418c;
    stim[62] = 70'h259e6b735d1f0494eb;
    stim[63] = 70'h1e71d8e80747465b8d;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h0a2fc6dbf;
      expv[2] = 35'h0abd3e5bb;
      expv[3] = 35'h0f17077de;
      expv[4] = 35'h04523abd6;
      expv[5] = 35'h0df23417f;
      expv[6] = 35'h0e26e3523;
      expv[7] = 35'h09d717be5;
      expv[8] = 35'h06a3b49bf;
      expv[9] = 35'h05ac6e2b8;
      expv[10] = 35'h0005732e9;
      expv[11] = 35'h045f397b3;
      expv[12] = 35'h005daf13a;
      expv[13] = 35'h07d1c1568;
      expv[14] = 35'h097b3ae93;
      expv[15] = 35'h0bfffdcef;
      expv[16] = 35'h07de26197;
      expv[17] = 35'h012350167;
      expv[18] = 35'h0ee748295;
      expv[19] = 35'h03645f092;
      expv[20] = 35'h6fd2554fc;
      expv[21] = 35'h0e416ab48;
      expv[22] = 35'h09024d8e8;
      expv[23] = 35'h0d5914e8b;
      expv[24] = 35'h026fbfa08;
      expv[25] = 35'h021617cb9;
      expv[26] = 35'h0b04a3cb7;
      expv[27] = 35'h3f3aa2b33;
      expv[28] = 35'h07c429e2b;
      expv[29] = 35'h0ad4f26a8;
      expv[30] = 35'h093c7096d;
      expv[31] = 35'h03c672411;
      expv[32] = 35'h0357228f3;
      expv[33] = 35'h0cc56c38d;
      expv[34] = 35'h018ff11f2;
      expv[35] = 35'h0537891d6;
      expv[36] = 35'h05d83f81a;
      expv[37] = 35'h0951e7e36;
      expv[38] = 35'h0047f3870;
      expv[39] = 35'h0cf1079e0;
      expv[40] = 35'h03eb724b9;
      expv[41] = 35'h08f5e6236;
      expv[42] = 35'h07eafc731;
      expv[43] = 35'h088c36d47;
      expv[44] = 35'h052649ee7;
      expv[45] = 35'h06359b4ff;
      expv[46] = 35'h00735e926;
      expv[47] = 35'h075312a38;
      expv[48] = 35'h0f51d4de7;
      expv[49] = 35'h003764ae0;
      expv[50] = 35'h634b8b5b9;
      expv[51] = 35'h0ddaf5373;
      expv[52] = 35'h0e5ccec13;
      expv[53] = 35'h00423ecda;
      expv[54] = 35'h05fbd2830;
      expv[55] = 35'h0c60d0797;
      expv[56] = 35'h0ac643b0c;
      expv[57] = 35'h021359657;
      expv[58] = 35'h01b982353;
      expv[59] = 35'h00583b9da;
      expv[60] = 35'h02d3de884;
      expv[61] = 35'h04a588d0c;
      expv[62] = 35'h0c175c10a;
      expv[63] = 35'h0747c1257;
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
