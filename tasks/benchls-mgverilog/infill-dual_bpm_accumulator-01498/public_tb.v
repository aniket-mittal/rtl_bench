// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01498 dut (
    .clk(clk),
    .bunch_strb(in_vec[81:81]),
    .sel(in_vec[80:79]),
    .ai_in(in_vec[78:66]),
    .aq_in(in_vec[65:53]),
    .bi_in(in_vec[52:40]),
    .bq_in(in_vec[39:27]),
    .ci_in(in_vec[26:14]),
    .cq_in(in_vec[13:1]),
    .dac_cond(in_vec[0:0]),
    .bpm1_q_reg_int_a(out_vec[67:51]),
    .bpm1_i_reg_int_a(out_vec[50:34]),
    .bpm2_q_reg_int_a(out_vec[33:17]),
    .bpm2_i_reg_int_a(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h18af9e27787049313f1ef;
    stim[1] = 82'h35ffc81261f1545f5ecb5;
    stim[2] = 82'h1700cdbf836ce0a703513;
    stim[3] = 82'h03f2fc383bc25abbf7f56;
    stim[4] = 82'h246a7e6510863780f3d8f;
    stim[5] = 82'h0e4aad9d1a6e1542a4aa9;
    stim[6] = 82'h3a9b4a4ddd54232529841;
    stim[7] = 82'h34c94e85553221c1820b0;
    stim[8] = 82'h3b7ec81e7e0a4f545fff9;
    stim[9] = 82'h03f3cdb74297e352a6b99;
    stim[10] = 82'h3650f0cbf694f08081dda;
    stim[11] = 82'h3d6a6fbec16824cb3f7bf;
    stim[12] = 82'h24a9465e8a0acf42d5d33;
    stim[13] = 82'h2e51932114f434f7f8cb9;
    stim[14] = 82'h21867209f76d9e5e3f1ce;
    stim[15] = 82'h3f45a9954642691da597e;
    stim[16] = 82'h3e75895e09c5797e47c02;
    stim[17] = 82'h3d87773ae310afe3d05f9;
    stim[18] = 82'h14bf61af6e53d4d7ac923;
    stim[19] = 82'h030b1f50277af8d531fef;
    stim[20] = 82'h39a561f9dec7d8e360bfd;
    stim[21] = 82'h29c2d3b6e70ec2ae6768e;
    stim[22] = 82'h291b2ea22344e33d37631;
    stim[23] = 82'h3809d34e504f2f2d83836;
    stim[24] = 82'h183f965b4c11d1847b680;
    stim[25] = 82'h04ee3a53dd530f24daccb;
    stim[26] = 82'h2d4bf69c048c590b55c41;
    stim[27] = 82'h1a9151e2edfe0429ecd59;
    stim[28] = 82'h2072feab6012127d98bba;
    stim[29] = 82'h2651d510e80cfe20a3d09;
    stim[30] = 82'h065026b559d3f6c67cbf0;
    stim[31] = 82'h35c18cf20a5455a0a5979;
    stim[32] = 82'h00b1000000c41d7026aa6;
    stim[33] = 82'h1a01e6c31762e26903784;
    stim[34] = 82'h3da59c9ecd1df60b10cef;
    stim[35] = 82'h1535f752a62fb01bfe07b;
    stim[36] = 82'h10b858f75a1c194615853;
    stim[37] = 82'h07855542c3e0ad3148e53;
    stim[38] = 82'h0740eb8a3d4a5b59b0941;
    stim[39] = 82'h149e45833d530797fb438;
    stim[40] = 82'h248efbbee1404b5e44eea;
    stim[41] = 82'h163f5de4892b2883e52ef;
    stim[42] = 82'h1f22b657094adc5d2dd4d;
    stim[43] = 82'h178628bb363d0eafa1e5d;
    stim[44] = 82'h1f9af0b2664b9262fa540;
    stim[45] = 82'h2b05391e9ff85d5576d48;
    stim[46] = 82'h1d75666740debda8e2683;
    stim[47] = 82'h2cca373e7d161752dcd57;
    stim[48] = 82'h20e5f461c3a75b2884f11;
    stim[49] = 82'h1e14c8bac78a3fae4b350;
    stim[50] = 82'h19f197465a80a94b19d2b;
    stim[51] = 82'h031025bc55813160f2dd5;
    stim[52] = 82'h174c8a6544d620303dad6;
    stim[53] = 82'h0c8f7303e4b0c77ad5366;
    stim[54] = 82'h3efa6eed5c7572350af9a;
    stim[55] = 82'h2f2b9cedf41ba599e9c66;
    stim[56] = 82'h29bd3c048a40b58d79c8f;
    stim[57] = 82'h01b50c4434665da07adc2;
    stim[58] = 82'h32f8235736ebcfec862b0;
    stim[59] = 82'h32724db5161da5c000ce5;
    stim[60] = 82'h0742ab5f9093656ea3c55;
    stim[61] = 82'h283b26b51a06be51bbdb3;
    stim[62] = 82'h3d349f6b1d01815312f77;
    stim[63] = 82'h08a4ea827fafecdafc813;
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
      expv[0] = 68'hxxxxxxxxxxxxxxxxx;
      expv[1] = 68'h00000000000000000;
      expv[2] = 68'h00000000000000000;
      expv[3] = 68'h0204fdfffecb5f7d7;
      expv[4] = 68'h00000000000000000;
      expv[5] = 68'h00000000000000000;
      expv[6] = 68'hff997c6a418dff108;
      expv[7] = 68'h00000000000000000;
      expv[8] = 68'h04237f7541840094a;
      expv[9] = 68'h07c47c3ebf8f1f9aa;
      expv[10] = 68'h02137e36bf8e9eec1;
      expv[11] = 68'h00000000000000000;
      expv[12] = 68'hfc32fe50c1dda0020;
      expv[13] = 68'hf457015641599f2ef;
      expv[14] = 68'hf5eefdff800d5fb8f;
      expv[15] = 68'hfa237a53411a7ecde;
      expv[16] = 68'hf6a57bd98081fec54;
      expv[17] = 68'hf90e78f28219df3bd;
      expv[18] = 68'hfe87791981d9ff34e;
      expv[19] = 68'hff36fca5c2397ec42;
      expv[20] = 68'h00000000000000000;
      expv[21] = 68'h00000000000000000;
      expv[22] = 68'h07d8ff7b00bfdf8d8;
      expv[23] = 68'h069b0317007060748;
      expv[24] = 68'h0b7e03a401a92097c;
      expv[25] = 68'h0aad04e5012c814dc;
      expv[26] = 68'h0aad04e5012c814dc;
      expv[27] = 68'h00000000000000000;
      expv[28] = 68'hfc5900123f1640048;
      expv[29] = 68'h00000000000000000;
      expv[30] = 68'hffaa8072c0849f601;
      expv[31] = 68'h04eefec4bfc400481;
      expv[32] = 68'h04eefec4bfc400481;
      expv[33] = 68'h082b7c86015b80caa;
      expv[34] = 68'h082b7c86015b80caa;
      expv[35] = 68'h082b7c86015b80caa;
      expv[36] = 68'h06217fba422a60f6e;
      expv[37] = 68'h00000000000000000;
      expv[38] = 68'h00000000000000000;
      expv[39] = 68'h00000000000000000;
      expv[40] = 68'h00000000000000000;
      expv[41] = 68'h00000000000000000;
      expv[42] = 68'hfeeffc8ec012c0e14;
      expv[43] = 68'h00000000000000000;
      expv[44] = 68'h00000000000000000;
      expv[45] = 68'h00000000000000000;
      expv[46] = 68'h00000000000000000;
      expv[47] = 68'hf85d027ffe17409ff;
      expv[48] = 68'h00000000000000000;
      expv[49] = 68'h061701f44185c07d1;
      expv[50] = 68'h032f02da035c8040b;
      expv[51] = 68'h032f02da035c8040b;
      expv[52] = 68'h00000000000000000;
      expv[53] = 68'h00000000000000000;
      expv[54] = 68'h00000000000000000;
      expv[55] = 68'h00000000000000000;
      expv[56] = 68'h05727d71fef9a0d42;
      expv[57] = 68'h0117fd423de300c83;
      expv[58] = 68'h01cd7f6b3e1061527;
      expv[59] = 68'h01cd7f6b3e1061527;
      expv[60] = 68'hfaa282633c3b61048;
      expv[61] = 68'hfe0f84d57d09a0048;
      expv[62] = 68'h00000000000000000;
      expv[63] = 68'h06be7c6801af9f1a0;
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
