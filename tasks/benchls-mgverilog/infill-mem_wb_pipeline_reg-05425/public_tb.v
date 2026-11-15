// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05425 dut (
    .clk(clk),
    .rst(in_vec[74:74]),
    .M_flush(in_vec[73:73]),
    .M_stall(in_vec[72:72]),
    .WB_stall(in_vec[71:71]),
    .M_regwrite(in_vec[70:70]),
    .M_memtoreg(in_vec[69:69]),
    .M_alu_out(in_vec[68:37]),
    .M_rt_rd(in_vec[36:32]),
    .M_readdata(in_vec[31:0]),
    .WB_regwrite(out_vec[70:70]),
    .WB_memtoreg(out_vec[69:69]),
    .WB_alu_out(out_vec[68:37]),
    .WB_rt_rd(out_vec[36:32]),
    .WB_readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h6e0c8684e57c073f069;
    stim[1] = 75'h4b33d784fdb515c9ae7;
    stim[2] = 75'h2b6ab4d8faddc06c23a;
    stim[3] = 75'h1c59bbceb54de5ff577;
    stim[4] = 75'h3b806e282acc8b59a03;
    stim[5] = 75'h268c21c32ebf441a04a;
    stim[6] = 75'h25249f442713d75b1b2;
    stim[7] = 75'h384c7a02e9b20876d71;
    stim[8] = 75'h1f4246a307671eb1cea;
    stim[9] = 75'h0c08d436e352d885508;
    stim[10] = 75'h2fe253f8b209dfdb3b5;
    stim[11] = 75'h06484a5c6c12601a86d;
    stim[12] = 75'h350df67ebea7f31b092;
    stim[13] = 75'h0404b5d06a9b3d61f86;
    stim[14] = 75'h23b98d336118799e71d;
    stim[15] = 75'h23beaa7753db2116165;
    stim[16] = 75'h10036968d93cf6b58ff;
    stim[17] = 75'h250b28eeda534852152;
    stim[18] = 75'h12491ab37d1ef9388ee;
    stim[19] = 75'h270b6a101723a39b189;
    stim[20] = 75'h21055283105c079b16c;
    stim[21] = 75'h0d82f82f3f585750c9c;
    stim[22] = 75'h0492f04efd425de8241;
    stim[23] = 75'h234a8dface577951262;
    stim[24] = 75'h0bfa087aac743a5aa03;
    stim[25] = 75'h25a767f89546683f77a;
    stim[26] = 75'h302948157ed6bda18b9;
    stim[27] = 75'h30307ce790394ba3684;
    stim[28] = 75'h1a69d704df291f054ec;
    stim[29] = 75'h0a851cb383e089e2bd4;
    stim[30] = 75'h1038a5700856f53977b;
    stim[31] = 75'h10640ed0534645e6061;
    stim[32] = 75'h02cb195836dd61579d1;
    stim[33] = 75'h1d49cf14649ec4acae0;
    stim[34] = 75'h1f45a0faabb8bf91e9c;
    stim[35] = 75'h35a59245e5394365568;
    stim[36] = 75'h2116d7ac03e44227bad;
    stim[37] = 75'h2d5c63e956a76471209;
    stim[38] = 75'h14dbaeece1ac2d841ab;
    stim[39] = 75'h2781581e307c470ee42;
    stim[40] = 75'h20752d0d6135cfe6f20;
    stim[41] = 75'h28d7eadd3d0dfbd0556;
    stim[42] = 75'h1f24d7d2f53933e24ef;
    stim[43] = 75'h2c698ce72ef3204849b;
    stim[44] = 75'h6907f200f18798e0921;
    stim[45] = 75'h37ca73c8d50bed26714;
    stim[46] = 75'h259921cb5ed80be6312;
    stim[47] = 75'h1b37fe9e3d849934576;
    stim[48] = 75'h39c7a59acd3f66dabb7;
    stim[49] = 75'h358803983f4923c5bd6;
    stim[50] = 75'h1289ed1c12b45eae0ef;
    stim[51] = 75'h02b07fc078384ec77c4;
    stim[52] = 75'h03fa81f179637c892f9;
    stim[53] = 75'h1461342a0df3781b455;
    stim[54] = 75'h35ebd11acfa228742f6;
    stim[55] = 75'h01cb29712b0b4d2b091;
    stim[56] = 75'h1843b088e71337f44bd;
    stim[57] = 75'h12c3b630dd9fe72f716;
    stim[58] = 75'h3921b305805a62a4d86;
    stim[59] = 75'h3a8fb7883aee9ef30ee;
    stim[60] = 75'h21be7c1f70383e6a060;
    stim[61] = 75'h265c4a95d548ac6e227;
    stim[62] = 75'h0254922d35b9303ed2a;
    stim[63] = 75'h01a7c29ce73fd018c2e;
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
      expv[0] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h000000000000000000;
      expv[4] = 71'h000000000000000000;
      expv[5] = 71'h000000000000000000;
      expv[6] = 71'h28c21c32ebf441a04a;
      expv[7] = 71'h1249f442713d75b1b2;
      expv[8] = 71'h1249f442713d75b1b2;
      expv[9] = 71'h1249f442713d75b1b2;
      expv[10] = 71'h1249f442713d75b1b2;
      expv[11] = 71'h1249f442713d75b1b2;
      expv[12] = 71'h6484a5c6c12601a86d;
      expv[13] = 71'h10df67ebea7f31b092;
      expv[14] = 71'h404b5d06a9b3d61f86;
      expv[15] = 71'h3b98d336118799e71d;
      expv[16] = 71'h3beaa7753db2116165;
      expv[17] = 71'h0036968d93cf6b58ff;
      expv[18] = 71'h10b28eeda534852152;
      expv[19] = 71'h2491ab37d1ef9388ee;
      expv[20] = 71'h30b6a101723a39b189;
      expv[21] = 71'h1055283105c079b16c;
      expv[22] = 71'h1055283105c079b16c;
      expv[23] = 71'h492f04efd425de8241;
      expv[24] = 71'h34a8dface577951262;
      expv[25] = 71'h34a8dface577951262;
      expv[26] = 71'h1a767f89546683f77a;
      expv[27] = 71'h02948157ed6bda18b9;
      expv[28] = 71'h0307ce790394ba3684;
      expv[29] = 71'h0307ce790394ba3684;
      expv[30] = 71'h0307ce790394ba3684;
      expv[31] = 71'h038a5700856f53977b;
      expv[32] = 71'h0640ed0534645e6061;
      expv[33] = 71'h2cb195836dd61579d1;
      expv[34] = 71'h2cb195836dd61579d1;
      expv[35] = 71'h2cb195836dd61579d1;
      expv[36] = 71'h1a59245e5394365568;
      expv[37] = 71'h116d7ac03e44227bad;
      expv[38] = 71'h116d7ac03e44227bad;
      expv[39] = 71'h0dbaeece1ac2d841ab;
      expv[40] = 71'h381581e307c470ee42;
      expv[41] = 71'h0752d0d6135cfe6f20;
      expv[42] = 71'h0752d0d6135cfe6f20;
      expv[43] = 71'h0752d0d6135cfe6f20;
      expv[44] = 71'h0752d0d6135cfe6f20;
      expv[45] = 71'h000000000000000000;
      expv[46] = 71'h3ca73c8d50bed26714;
      expv[47] = 71'h19921cb5ed80be6312;
      expv[48] = 71'h19921cb5ed80be6312;
      expv[49] = 71'h19921cb5ed80be6312;
      expv[50] = 71'h18803983f4923c5bd6;
      expv[51] = 71'h289ed1c12b45eae0ef;
      expv[52] = 71'h2b07fc078384ec77c4;
      expv[53] = 71'h3fa81f179637c892f9;
      expv[54] = 71'h061342a0df3781b455;
      expv[55] = 71'h1ebd11acfa228742f6;
      expv[56] = 71'h1cb29712b0b4d2b091;
      expv[57] = 71'h1cb29712b0b4d2b091;
      expv[58] = 71'h2c3b630dd9fe72f716;
      expv[59] = 71'h2c3b630dd9fe72f716;
      expv[60] = 71'h2c3b630dd9fe72f716;
      expv[61] = 71'h1be7c1f70383e6a060;
      expv[62] = 71'h25c4a95d548ac6e227;
      expv[63] = 71'h254922d35b9303ed2a;
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
