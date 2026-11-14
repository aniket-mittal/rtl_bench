// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[99:0]),
    .out_and(out_vec[2:2]),
    .out_or(out_vec[1:1]),
    .out_xor(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h99652ebc2872c8f88cdd22729;
    stim[1] = 100'h5009324aa5fe7c0791fbc6b47;
    stim[2] = 100'h29f7f61ae4d1adbf6e27a1983;
    stim[3] = 100'hc09a0eefc86aafe74c01b1a03;
    stim[4] = 100'he31714b28eb507d0857eb6895;
    stim[5] = 100'h72976ad5c5d84000b91abeb39;
    stim[6] = 100'h2dfb54bb90517b51094ab32c1;
    stim[7] = 100'hb0a00479e0d476fec94100bbf;
    stim[8] = 100'h7d46b7dbc175ce01bc8a20737;
    stim[9] = 100'h3ecf5c282d7f4635b0ab332cb;
    stim[10] = 100'hbcc311be7825c2cd2943d0401;
    stim[11] = 100'h20fb3e0b1ad47dea1ccaad40e;
    stim[12] = 100'hf3cc09cbd92736234669bd9c4;
    stim[13] = 100'h64ffb92032dfe85527477230d;
    stim[14] = 100'hc7c00e2a772e5ea277fbab2d8;
    stim[15] = 100'h868375b968215af0d81694da8;
    stim[16] = 100'h9d79628081a298ccfa9ddbdff;
    stim[17] = 100'he0b2d9fd2af984f75a0f4e9d3;
    stim[18] = 100'h18c90828ffa05e1feb0a13507;
    stim[19] = 100'hf7347e601e249db3cc188ba63;
    stim[20] = 100'hf75ea0109b5c11c0ad2c98ce4;
    stim[21] = 100'hb337165aec581455f1f8dbdc4;
    stim[22] = 100'h2e89952d3e8fb3aebefd288c0;
    stim[23] = 100'h381c9d2d9c1d6ce8ed4f92e16;
    stim[24] = 100'hb56b73e39a46060eeb32ae2b6;
    stim[25] = 100'hd03e27f9f8f13872ae161fc9c;
    stim[26] = 100'haace1111b8bed322d64e99a10;
    stim[27] = 100'h53bd114e54095747c04d4e5f7;
    stim[28] = 100'h2779144e70b9616708a38327f;
    stim[29] = 100'hb5eb09382ddd0157210532b37;
    stim[30] = 100'hf1b4cdf0f306078e4160c6ee5;
    stim[31] = 100'hc24520bbff3fc3ded5872abfa;
    stim[32] = 100'hcb0fdd9751e4edf454c74d4c7;
    stim[33] = 100'h25333e8e87606fce9f92a92b9;
    stim[34] = 100'he4035d7b378369fbf18502949;
    stim[35] = 100'h357bc283f7f8a0dc7231e3812;
    stim[36] = 100'h8de1d24a5cd79d382d359083b;
    stim[37] = 100'h9fdd44acf7436202425d4489f;
    stim[38] = 100'h55ec3fde43e5736cae7da3e51;
    stim[39] = 100'h09f2c2b795e65405baed0e099;
    stim[40] = 100'h97b774f1b359c98a664efb2c8;
    stim[41] = 100'h59c63a045fb76d4ead4935af3;
    stim[42] = 100'h03f0e887aa32b1b671969695c;
    stim[43] = 100'h1abd17726b478f18e2d66ac71;
    stim[44] = 100'h9aa3b5da01f4d7c22632d5837;
    stim[45] = 100'h0a948c41bc73d48c82641d6a4;
    stim[46] = 100'h6a2eaad9a20fa9a5131822ce5;
    stim[47] = 100'h4b0952c076923a40573ff88ab;
    stim[48] = 100'hba96a130ec2025281d604cb5f;
    stim[49] = 100'h76e135e544f6afb74fefbb094;
    stim[50] = 100'ha87964c7f497ad870781e985b;
    stim[51] = 100'h6c106a8b353ad14ce654bb483;
    stim[52] = 100'hea7ece9b614c6900a5d271ca7;
    stim[53] = 100'h1e40183e5443a69caa313f4c5;
    stim[54] = 100'h96f96f1fcf68e505fb4c37fff;
    stim[55] = 100'h2938f221b66b13f35f5a09d29;
    stim[56] = 100'hfcd4578dcf230ec06150e2768;
    stim[57] = 100'hb5202d1ce0928f5a05bc38ae0;
    stim[58] = 100'h567778d19891e6eaddd8a49cd;
    stim[59] = 100'h43e16424602393d0fee64fcf3;
    stim[60] = 100'h167235d0833f48563771ce826;
    stim[61] = 100'h34103811e0cc9a87e89d56941;
    stim[62] = 100'h7c4da5940c2c7392adabb4d9c;
    stim[63] = 100'hd76786c0209219a43bf0e385b;
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
      expv[0] = 3'h6;
      expv[1] = 3'h6;
      expv[2] = 3'h6;
      expv[3] = 3'h7;
      expv[4] = 3'h7;
      expv[5] = 3'h6;
      expv[6] = 3'h6;
      expv[7] = 3'h6;
      expv[8] = 3'h6;
      expv[9] = 3'h7;
      expv[10] = 3'h7;
      expv[11] = 3'h6;
      expv[12] = 3'h7;
      expv[13] = 3'h6;
      expv[14] = 3'h6;
      expv[15] = 3'h7;
      expv[16] = 3'h6;
      expv[17] = 3'h6;
      expv[18] = 3'h7;
      expv[19] = 3'h6;
      expv[20] = 3'h7;
      expv[21] = 3'h7;
      expv[22] = 3'h7;
      expv[23] = 3'h7;
      expv[24] = 3'h6;
      expv[25] = 3'h6;
      expv[26] = 3'h6;
      expv[27] = 3'h7;
      expv[28] = 3'h7;
      expv[29] = 3'h7;
      expv[30] = 3'h7;
      expv[31] = 3'h6;
      expv[32] = 3'h6;
      expv[33] = 3'h6;
      expv[34] = 3'h6;
      expv[35] = 3'h6;
      expv[36] = 3'h7;
      expv[37] = 3'h6;
      expv[38] = 3'h7;
      expv[39] = 3'h6;
      expv[40] = 3'h7;
      expv[41] = 3'h6;
      expv[42] = 3'h6;
      expv[43] = 3'h6;
      expv[44] = 3'h6;
      expv[45] = 3'h7;
      expv[46] = 3'h6;
      expv[47] = 3'h6;
      expv[48] = 3'h7;
      expv[49] = 3'h7;
      expv[50] = 3'h7;
      expv[51] = 3'h6;
      expv[52] = 3'h6;
      expv[53] = 3'h6;
      expv[54] = 3'h6;
      expv[55] = 3'h6;
      expv[56] = 3'h6;
      expv[57] = 3'h7;
      expv[58] = 3'h6;
      expv[59] = 3'h7;
      expv[60] = 3'h7;
      expv[61] = 3'h7;
      expv[62] = 3'h6;
      expv[63] = 3'h6;
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
