// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  compress_42 dut (
    .ci(in_vec[64:64]),
    .a(in_vec[63:48]),
    .b(in_vec[47:32]),
    .c(in_vec[31:16]),
    .d(in_vec[15:0]),
    .co(out_vec[32:32]),
    .oo(out_vec[31:16]),
    .ot(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0020122c5fc6c2b2a;
    stim[1] = 65'h016e5f69f16232bcd;
    stim[2] = 65'h10c626431b89e46c6;
    stim[3] = 65'h133ff2a124d527245;
    stim[4] = 65'h03bf45aec89f3790c;
    stim[5] = 65'h0878a13270c0a6c2f;
    stim[6] = 65'h17471ca1bb7832f48;
    stim[7] = 65'h18b1755e4fd855d00;
    stim[8] = 65'h19db1c1dcbc07da50;
    stim[9] = 65'h14a1112ddbef291c3;
    stim[10] = 65'h09ac11615a0bc04f0;
    stim[11] = 65'h0155795e961ce472d;
    stim[12] = 65'h19bc69109bd357193;
    stim[13] = 65'h1dd6d1b02283f6dea;
    stim[14] = 65'h1f674980bd7c9fdb6;
    stim[15] = 65'h1d98019b23864f54a;
    stim[16] = 65'h0b212c5890afc39db;
    stim[17] = 65'h1499fafe95392731f;
    stim[18] = 65'h1d5161dbd7b1a396d;
    stim[19] = 65'h031ff17cf67c2ad11;
    stim[20] = 65'h0215f14831ba51c90;
    stim[21] = 65'h078a666af3161326c;
    stim[22] = 65'h1affd43bda217abe4;
    stim[23] = 65'h14d4b400a53aeafb8;
    stim[24] = 65'h0cfc7ad6db873af82;
    stim[25] = 65'h10c9b31ce54a7b5fc;
    stim[26] = 65'h05f1c38e1add31aae;
    stim[27] = 65'h15c34f11d7baff9f1;
    stim[28] = 65'h10224d7794ef76424;
    stim[29] = 65'h1af4f231baf0777ad;
    stim[30] = 65'h0407b8a370d00ca19;
    stim[31] = 65'h0757f321234f4f853;
    stim[32] = 65'h0da1182423be46012;
    stim[33] = 65'h132bd07e12ee0f84d;
    stim[34] = 65'h0c4a079bf1d693bd0;
    stim[35] = 65'h1e6c27a482d2d0a4a;
    stim[36] = 65'h13c380b908216462d;
    stim[37] = 65'h03d9d08d0b76da6fd;
    stim[38] = 65'h18f40749fc9c62448;
    stim[39] = 65'h1276bf4faa649db27;
    stim[40] = 65'h1ca3912543d85a428;
    stim[41] = 65'h063e257137a03ddec;
    stim[42] = 65'h0504757edad06d548;
    stim[43] = 65'h049e8e56905526140;
    stim[44] = 65'h150ac5d6a9f6b73a7;
    stim[45] = 65'h0bffd00c6ea07f9db;
    stim[46] = 65'h104e70196249ba92d;
    stim[47] = 65'h013f5d1f10486f3a3;
    stim[48] = 65'h1d080cb8c2b4f0a15;
    stim[49] = 65'h165519da4189db991;
    stim[50] = 65'h197e13d3da7643a41;
    stim[51] = 65'h0a0d5f062c74ad098;
    stim[52] = 65'h004ac20ee00faf38c;
    stim[53] = 65'h073771e3c32180961;
    stim[54] = 65'h1632cc7a9da67af6d;
    stim[55] = 65'h04b659df1442ef8b1;
    stim[56] = 65'h1d030fe8aa7f4e3f8;
    stim[57] = 65'h1e97842f0aa6e6c29;
    stim[58] = 65'h14e9a58e705a98933;
    stim[59] = 65'h11b2bb2a5e9a694d5;
    stim[60] = 65'h19e21023876b4e965;
    stim[61] = 65'h10d1bd3befa4a18c7;
    stim[62] = 65'h1640cf5216edd960e;
    stim[63] = 65'h0d775d2de0f4c4944;
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
      expv[0] = 33'h0b3084caa;
      expv[1] = 33'h0f0da2f4d;
      expv[2] = 33'h0ce6e50c5;
      expv[3] = 33'h0705f56a5;
      expv[4] = 33'h0a60f79e8;
      expv[5] = 33'h0fa9c0c27;
      expv[6] = 33'h1ca862d69;
      expv[7] = 33'h1c57d3b02;
      expv[8] = 33'h10111fa6a;
      expv[9] = 33'h0425eb5a3;
      expv[10] = 33'h10db22468;
      expv[11] = 33'h08dc3633c;
      expv[12] = 33'h1f462339b;
      expv[13] = 33'h0b1e56e5a;
      expv[14] = 33'h1e893bdb6;
      expv[15] = 33'h03e5df142;
      expv[16] = 33'h1418c3d73;
      expv[17] = 33'h051ccb737;
      expv[18] = 33'h030e1bb3d;
      expv[19] = 33'h0837d6d92;
      expv[20] = 33'h011e72e18;
      expv[21] = 33'h0fc4a236c;
      expv[22] = 33'h1a2c84f77;
      expv[23] = 33'h073428ebd;
      expv[24] = 33'h12f95daca;
      expv[25] = 33'h0f51129fe;
      expv[26] = 33'h0ab225aae;
      expv[27] = 33'h0dd0cf2f3;
      expv[28] = 33'h073658caa;
      expv[29] = 33'h10ae1771f;
      expv[30] = 33'h01d33c24c;
      expv[31] = 33'h0e32678d9;
      expv[32] = 33'h137256092;
      expv[33] = 33'h0ae3259cd;
      expv[34] = 33'h020f4bb52;
      expv[35] = 33'h0677c9883;
      expv[36] = 33'h0e7b2142d;
      expv[37] = 33'h05f67a2b8;
      expv[38] = 33'h18ddc3209;
      expv[39] = 33'h1e2285dd7;
      expv[40] = 33'h075eba428;
      expv[41] = 33'h07518cee6;
      expv[42] = 33'h0d56aaa8c;
      expv[43] = 33'h04243a9d0;
      expv[44] = 33'h05bdfb2a5;
      expv[45] = 33'h1f969559e;
      expv[46] = 33'h081e8292f;
      expv[47] = 33'h016cbe3a2;
      expv[48] = 33'h1ad4f1211;
      expv[49] = 33'h062d2b929;
      expv[50] = 33'h159322ec9;
      expv[51] = 33'h187e1d09c;
      expv[52] = 33'h0d6e8219c;
      expv[53] = 33'h0324a4d71;
      expv[54] = 33'h157d4ae6b;
      expv[55] = 33'h0f0c19aba;
      expv[56] = 33'h187d7e968;
      expv[57] = 33'h1b93e44e1;
      expv[58] = 33'h003b09957;
      expv[59] = 33'h1a3b2544d;
      expv[60] = 33'h02fa9e865;
      expv[61] = 33'h18a1d34e7;
      expv[62] = 33'h0a1e5de1a;
      expv[63] = 33'h1ed1b0ae4;
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
