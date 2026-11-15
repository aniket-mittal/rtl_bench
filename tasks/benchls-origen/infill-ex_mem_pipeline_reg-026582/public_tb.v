// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 107;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026582 dut (
    .ctlwb_out(in_vec[106:105]),
    .ctlm_out(in_vec[104:102]),
    .adder_out(in_vec[101:70]),
    .aluzero(in_vec[69:69]),
    .aluout(in_vec[68:37]),
    .readdat2(in_vec[36:5]),
    .muxout(in_vec[4:0]),
    .wb_ctlout(out_vec[106:105]),
    .branch(out_vec[104:104]),
    .memread(out_vec[103:103]),
    .memwrite(out_vec[102:102]),
    .add_result(out_vec[101:70]),
    .zero(out_vec[69:69]),
    .alu_result(out_vec[68:37]),
    .rdata2out(out_vec[36:5]),
    .five_bit_muxout(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h76550bbb90a2802779aafa29fdb;
    stim[1] = 107'h1232cfa316b9cea1b01b12ba8bd;
    stim[2] = 107'h6bdb4c55e12eccd40e6f6c5cd05;
    stim[3] = 107'h06723a3cccd9316e74372615a1e;
    stim[4] = 107'h78069cb7ddf6aea7bff17a6e058;
    stim[5] = 107'h670b22ddeb87f302911b1947b34;
    stim[6] = 107'h24607a32e4d2200937eb1b10652;
    stim[7] = 107'h213342d0b483a794c501b9457cd;
    stim[8] = 107'h5e189e07898b60e493c61c8efcc;
    stim[9] = 107'h7c6fbb28f49a2a034f16116cd59;
    stim[10] = 107'h2734ee8654a343f6232a68d4154;
    stim[11] = 107'h4af194b97036c0a545b694946a4;
    stim[12] = 107'h61d6b5fd40af36fadd759210cef;
    stim[13] = 107'h58c0b4336eb48ad11ed054e0df7;
    stim[14] = 107'h63971747d01f1beb3d28403cf95;
    stim[15] = 107'h1ac58299465fefddbcdbc209c02;
    stim[16] = 107'h60a7711a527b61214c2795a1895;
    stim[17] = 107'h7c23a38abebdd60fce286208cd3;
    stim[18] = 107'h48f2a7f7fd948f475f6279d9132;
    stim[19] = 107'h01057f93c47aa9320602c73b7fb;
    stim[20] = 107'h45b8b35b10fd53160e6d1728abd;
    stim[21] = 107'h563d9d32125bea8dbc63d531b1b;
    stim[22] = 107'h5f552de588fa7269d437a67563e;
    stim[23] = 107'h43e2bd256026a18a2fa966ae365;
    stim[24] = 107'h7eb0195a3a5a4f4f03e34fa4710;
    stim[25] = 107'h7d3cbabeb16ee5bf26a98e041aa;
    stim[26] = 107'h1c3a604a1d083915c2e8c6546be;
    stim[27] = 107'h59b723d99684d912281b2db24ae;
    stim[28] = 107'h232d4e69443cd3b5edf98af45ff;
    stim[29] = 107'h364353f9d9c71eb4811c95951df;
    stim[30] = 107'h55d4b26c0f042c90e4ff53fa482;
    stim[31] = 107'h229d641df2195013cd07ba03ebd;
    stim[32] = 107'h1bc6f11a96ab77846cc48a5a35e;
    stim[33] = 107'h5d91ffdf9f654143080ad8730f6;
    stim[34] = 107'h612e1cdc7e8c0d3b723174870aa;
    stim[35] = 107'h0b8191373edcac175b1140dae12;
    stim[36] = 107'h4ffa50348624fb9c938e6e52adb;
    stim[37] = 107'h47a031ddeb2542f47f15762f717;
    stim[38] = 107'h6a48ea7d28756f053d5e6e5becb;
    stim[39] = 107'h753e48ac3889351fb4525f80fd1;
    stim[40] = 107'h077a8afa8089934346aeeb45517;
    stim[41] = 107'h65f5594a94b5183de0c8c79f8e9;
    stim[42] = 107'h4d886f8f372b693a606cc7926ec;
    stim[43] = 107'h4a5316b72c474b3414606d3e7dd;
    stim[44] = 107'h4b73d9f2a5f72ae41e7d0826545;
    stim[45] = 107'h67e8597251e5cf45bd8086f1d9f;
    stim[46] = 107'h392fed6709382a216ddd13c5fdc;
    stim[47] = 107'h4e0c0eafdf68a9773e05ead60dc;
    stim[48] = 107'h00c46b058aaa17c13030f11e937;
    stim[49] = 107'h4e60e863ba71352f7e7a16507b4;
    stim[50] = 107'h4884dd36e70e9120e2f36bd2afd;
    stim[51] = 107'h495800ae9e028709dce4bf10309;
    stim[52] = 107'h43ee435498ba6c8c9a1d1283da5;
    stim[53] = 107'h0cfb63fb969e7cd9d48ba5f17d0;
    stim[54] = 107'h3d3ad32ea767c7f9469407b798a;
    stim[55] = 107'h1f2cd73eab6d0a4c8caf993ea0d;
    stim[56] = 107'h57bc6e0f9cced7c5b98565e38e4;
    stim[57] = 107'h638f290eed6bff23a95944e13d6;
    stim[58] = 107'h6a3640981bde7e72f65e3355835;
    stim[59] = 107'h759a454db469734d46414acf3b8;
    stim[60] = 107'h69455b6ec5d827a3ca49c30b497;
    stim[61] = 107'h72f31bb7c7c351f9c0eaa009221;
    stim[62] = 107'h6f90cf6a2b7b110f9affc5bec47;
    stim[63] = 107'h59b8513f3d4f7a53b9dad899686;
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
      expv[0] = 107'h000000000000000000000000000;
      expv[1] = 107'h76550bbb90a2802779aafa29fdb;
      expv[2] = 107'h1232cfa316b9cea1b01b12ba8bd;
      expv[3] = 107'h6bdb4c55e12eccd40e6f6c5cd05;
      expv[4] = 107'h06723a3cccd9316e74372615a1e;
      expv[5] = 107'h78069cb7ddf6aea7bff17a6e058;
      expv[6] = 107'h670b22ddeb87f302911b1947b34;
      expv[7] = 107'h24607a32e4d2200937eb1b10652;
      expv[8] = 107'h213342d0b483a794c501b9457cd;
      expv[9] = 107'h5e189e07898b60e493c61c8efcc;
      expv[10] = 107'h7c6fbb28f49a2a034f16116cd59;
      expv[11] = 107'h2734ee8654a343f6232a68d4154;
      expv[12] = 107'h4af194b97036c0a545b694946a4;
      expv[13] = 107'h61d6b5fd40af36fadd759210cef;
      expv[14] = 107'h58c0b4336eb48ad11ed054e0df7;
      expv[15] = 107'h63971747d01f1beb3d28403cf95;
      expv[16] = 107'h1ac58299465fefddbcdbc209c02;
      expv[17] = 107'h60a7711a527b61214c2795a1895;
      expv[18] = 107'h7c23a38abebdd60fce286208cd3;
      expv[19] = 107'h48f2a7f7fd948f475f6279d9132;
      expv[20] = 107'h01057f93c47aa9320602c73b7fb;
      expv[21] = 107'h45b8b35b10fd53160e6d1728abd;
      expv[22] = 107'h563d9d32125bea8dbc63d531b1b;
      expv[23] = 107'h5f552de588fa7269d437a67563e;
      expv[24] = 107'h43e2bd256026a18a2fa966ae365;
      expv[25] = 107'h7eb0195a3a5a4f4f03e34fa4710;
      expv[26] = 107'h7d3cbabeb16ee5bf26a98e041aa;
      expv[27] = 107'h1c3a604a1d083915c2e8c6546be;
      expv[28] = 107'h59b723d99684d912281b2db24ae;
      expv[29] = 107'h232d4e69443cd3b5edf98af45ff;
      expv[30] = 107'h364353f9d9c71eb4811c95951df;
      expv[31] = 107'h55d4b26c0f042c90e4ff53fa482;
      expv[32] = 107'h229d641df2195013cd07ba03ebd;
      expv[33] = 107'h1bc6f11a96ab77846cc48a5a35e;
      expv[34] = 107'h5d91ffdf9f654143080ad8730f6;
      expv[35] = 107'h612e1cdc7e8c0d3b723174870aa;
      expv[36] = 107'h0b8191373edcac175b1140dae12;
      expv[37] = 107'h4ffa50348624fb9c938e6e52adb;
      expv[38] = 107'h47a031ddeb2542f47f15762f717;
      expv[39] = 107'h6a48ea7d28756f053d5e6e5becb;
      expv[40] = 107'h753e48ac3889351fb4525f80fd1;
      expv[41] = 107'h077a8afa8089934346aeeb45517;
      expv[42] = 107'h65f5594a94b5183de0c8c79f8e9;
      expv[43] = 107'h4d886f8f372b693a606cc7926ec;
      expv[44] = 107'h4a5316b72c474b3414606d3e7dd;
      expv[45] = 107'h4b73d9f2a5f72ae41e7d0826545;
      expv[46] = 107'h67e8597251e5cf45bd8086f1d9f;
      expv[47] = 107'h392fed6709382a216ddd13c5fdc;
      expv[48] = 107'h4e0c0eafdf68a9773e05ead60dc;
      expv[49] = 107'h00c46b058aaa17c13030f11e937;
      expv[50] = 107'h4e60e863ba71352f7e7a16507b4;
      expv[51] = 107'h4884dd36e70e9120e2f36bd2afd;
      expv[52] = 107'h495800ae9e028709dce4bf10309;
      expv[53] = 107'h43ee435498ba6c8c9a1d1283da5;
      expv[54] = 107'h0cfb63fb969e7cd9d48ba5f17d0;
      expv[55] = 107'h3d3ad32ea767c7f9469407b798a;
      expv[56] = 107'h1f2cd73eab6d0a4c8caf993ea0d;
      expv[57] = 107'h57bc6e0f9cced7c5b98565e38e4;
      expv[58] = 107'h638f290eed6bff23a95944e13d6;
      expv[59] = 107'h6a3640981bde7e72f65e3355835;
      expv[60] = 107'h759a454db469734d46414acf3b8;
      expv[61] = 107'h69455b6ec5d827a3ca49c30b497;
      expv[62] = 107'h72f31bb7c7c351f9c0eaa009221;
      expv[63] = 107'h6f90cf6a2b7b110f9affc5bec47;
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
