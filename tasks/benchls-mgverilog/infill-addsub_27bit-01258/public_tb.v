// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01258 dut (
    .add(in_vec[54:54]),
    .opa(in_vec[53:27]),
    .opb(in_vec[26:0]),
    .sum(out_vec[27:1]),
    .co(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h7cf34789717e50;
    stim[1] = 55'h1c3450aa6ea3a6;
    stim[2] = 55'h138f6f5ea5b0ef;
    stim[3] = 55'h1b54c2a37d4191;
    stim[4] = 55'h3933df85d62ea8;
    stim[5] = 55'h0c3443c9169204;
    stim[6] = 55'h4ec2f9b2ec8fee;
    stim[7] = 55'h1bfc156b959edb;
    stim[8] = 55'h4c4827681000cb;
    stim[9] = 55'h51d8d9cf6e660b;
    stim[10] = 55'h334d4161638e9e;
    stim[11] = 55'h1203fe65b75fb1;
    stim[12] = 55'h241802324c2eff;
    stim[13] = 55'h172e7146f7889f;
    stim[14] = 55'h4f3bea37a42e06;
    stim[15] = 55'h51591daf7061f0;
    stim[16] = 55'h7db2078eb13a57;
    stim[17] = 55'h057f9f445b8a59;
    stim[18] = 55'h39370327dced3b;
    stim[19] = 55'h3b2125bce2a7c6;
    stim[20] = 55'h7e1caf04c3d73f;
    stim[21] = 55'h0287500d97380b;
    stim[22] = 55'h6cbefa3af808d0;
    stim[23] = 55'h349c0ca1c393ad;
    stim[24] = 55'h202013db9584ca;
    stim[25] = 55'h1dc020b0694900;
    stim[26] = 55'h52c9e3b8a9d0aa;
    stim[27] = 55'h6cbf667880ac51;
    stim[28] = 55'h0ca1e649435356;
    stim[29] = 55'h1337da202b598f;
    stim[30] = 55'h13cf49c2732168;
    stim[31] = 55'h7b1b48d8101203;
    stim[32] = 55'h55e78a90e65b3e;
    stim[33] = 55'h3b28d6ee107b1a;
    stim[34] = 55'h4f38b12533163e;
    stim[35] = 55'h17ca7ede559aa3;
    stim[36] = 55'h0dfea82d5f682e;
    stim[37] = 55'h69b41c228bee89;
    stim[38] = 55'h06b01a3afe828e;
    stim[39] = 55'h7ee29d947bc017;
    stim[40] = 55'h25efedb63bc7f2;
    stim[41] = 55'h1894a61ec90774;
    stim[42] = 55'h3735f53e689964;
    stim[43] = 55'h4045d5a0b90529;
    stim[44] = 55'h035b1e835ddf50;
    stim[45] = 55'h436a1342edd06a;
    stim[46] = 55'h092ea6ebf05a68;
    stim[47] = 55'h5c2f3d1b09d147;
    stim[48] = 55'h2a25369e2046ae;
    stim[49] = 55'h6a1a7de5cfa5d6;
    stim[50] = 55'h46a7fb1f6d07c7;
    stim[51] = 55'h7a2d56542995ba;
    stim[52] = 55'h600b3f6bb72f88;
    stim[53] = 55'h1785bf6708ae40;
    stim[54] = 55'h6a3a37d8ee8189;
    stim[55] = 55'h65b6a794919035;
    stim[56] = 55'h569fb42993d15b;
    stim[57] = 55'h4732334ae85fe6;
    stim[58] = 55'h729a1864f0f6e1;
    stim[59] = 55'h773a84f5b69e0b;
    stim[60] = 55'h780a9f5696d741;
    stim[61] = 55'h50945ab1377d11;
    stim[62] = 55'h174fd37bd1a5f7;
    stim[63] = 55'h7e2b9bbf4ad02e;
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
      expv[0] = 28'h21fce83;
      expv[1] = 28'h22fccde;
      expv[2] = 28'h79879f9;
      expv[3] = 28'hfdaad87;
      expv[4] = 28'h2a09a90;
      expv[5] = 28'h0dfecea;
      expv[6] = 28'h989de48;
      expv[7] = 28'hfd3c7a5;
      expv[8] = 28'h3320b70;
      expv[9] = 28'h3530289;
      expv[10] = 28'ha0c331c;
      expv[11] = 28'h9124037;
      expv[12] = 28'h46da28e;
      expv[13] = 28'h7dc8b13;
      expv[14] = 28'h3175699;
      expv[15] = 28'h3370b4b;
      expv[16] = 28'hccef691;
      expv[17] = 28'h8a8d31f;
      expv[18] = 28'he93e653;
      expv[19] = 28'h502f9e2;
      expv[20] = 28'h90eda3f;
      expv[21] = 28'h57363ed;
      expv[22] = 28'h11fd02f;
      expv[23] = 28'h99fdbce;
      expv[24] = 28'h0dcfb62;
      expv[25] = 28'h69d762c;
      expv[26] = 28'h6061a42;
      expv[27] = 28'hc313240;
      expv[28] = 28'h0a1d2e6;
      expv[29] = 28'h477436a;
      expv[30] = 28'h00d8fa0;
      expv[31] = 28'hee6f63c;
      expv[32] = 28'h7469920;
      expv[33] = 28'h2a93f86;
      expv[34] = 28'he3458c4;
      expv[35] = 28'h9476a71;
      expv[36] = 28'h8c0d9af;
      expv[37] = 28'hf84e41a;
      expv[38] = 28'hbaf0173;
      expv[39] = 28'h8b02793;
      expv[40] = 28'hd046b89;
      expv[41] = 28'h8931a9f;
      expv[42] = 28'h0fc4a86;
      expv[43] = 28'h1837fba;
      expv[44] = 28'ha1b0901;
      expv[45] = 28'h6b625a4;
      expv[46] = 28'ha6af4eb;
      expv[47] = 28'hd1f71d4;
      expv[48] = 28'he48c04b;
      expv[49] = 28'h625eb25;
      expv[50] = 28'h0840e55;
      expv[51] = 28'h6de8109;
      expv[52] = 28'hf712eea;
      expv[53] = 28'h7d01359;
      expv[54] = 28'hc6b9108;
      expv[55] = 28'h290ca4f;
      expv[56] = 28'h8cf8fc0;
      expv[57] = 28'h79d4c9e;
      expv[58] = 28'h68873db;
      expv[59] = 28'h93bdd53;
      expv[60] = 28'hb305657;
      expv[61] = 28'h69410ce;
      expv[62] = 28'he30a8f1;
      expv[63] = 28'he20874b;
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
