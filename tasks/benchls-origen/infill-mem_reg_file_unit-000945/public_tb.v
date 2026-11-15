// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 166;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_000945 dut (
    .dir(in_vec[165:134]),
    .data_input(in_vec[133:102]),
    .mem_rd(in_vec[101:101]),
    .mem_wd(in_vec[100:100]),
    .mem_rd_Result(in_vec[99:99]),
    .numberOne(in_vec[98:67]),
    .numberTwo(in_vec[66:35]),
    .operation(in_vec[34:3]),
    .wd_numberOne(in_vec[2:2]),
    .wd_numberTwo(in_vec[1:1]),
    .wd_operation(in_vec[0:0]),
    .data_output(out_vec[63:32]),
    .result_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 166'h0b79ae38866a5e5f1de81e1d668fb0fb53f110be3b;
    stim[1] = 166'h361a0f92c8b21d5a5ca755c370f51a051af99f1b20;
    stim[2] = 166'h2ef3261740d182e6a20086bdecd90a8b48d90e93df;
    stim[3] = 166'h177c14a566440ffca1b0224b74cc27286320d0a7bf;
    stim[4] = 166'h0ca07999daffa6273194c7ffbe35add40fde125bc8;
    stim[5] = 166'h0a7d93376a8914b60be53c680a42835c40eefb698c;
    stim[6] = 166'h0847937f0290b32a42aafc8ddc5b5f583e20ba5343;
    stim[7] = 166'h3d4e4d84f5874c538ed5db4542a1bd38f718601b64;
    stim[8] = 166'h32387374d269a2de6b54776b56c93f8ba69d0e791c;
    stim[9] = 166'h2c91a1e4ba4f0f050b1d25435f25c251528a7b0eab;
    stim[10] = 166'h3f57357280c31a8df897251f151f60c1222002ef3b;
    stim[11] = 166'h09863d4e99dd5e761e8f1d741a63f62b784da0aef0;
    stim[12] = 166'h0effd8ec6298c24506d4f0c07a69c25c6cdf4d4b03;
    stim[13] = 166'h1a62c41de6102379aad63beaf98dd1befeed6a6dcd;
    stim[14] = 166'h39590eeaa11e0b8bb079bb6b297f71f71288c059bc;
    stim[15] = 166'h0410a2ff7faee9af9c455e7b11fbb0b373573eaa53;
    stim[16] = 166'h172695de8e81fb8bc6a5dd202f263dedb5de8cb65c;
    stim[17] = 166'h0f762ffb97370d680d46d882c52ad83b70481a6138;
    stim[18] = 166'h295a6139318c9a68bb3433f563f9f6c5a45cfc6323;
    stim[19] = 166'h2d4e62eac67e44d0692a4c110ca4301a8b8beeae7e;
    stim[20] = 166'h2ee1a56a268165ca9f56f784e37ebaeb8553c1a799;
    stim[21] = 166'h28ce70975fb4ac60d162e7ce44a70b4a3fd3029940;
    stim[22] = 166'h1601c1094ac330de1f212377c390cb89524ac3e0f2;
    stim[23] = 166'h3b3f92e228e03782311f07e8f66fa76d622c383209;
    stim[24] = 166'h2efe6dc5f1f28c1dc5c5a2a414bd10c2d5bae9405a;
    stim[25] = 166'h14546d72a887916f17d5642cc988142d805eed318e;
    stim[26] = 166'h13c2310f888fd3694311c646ec319ba5d0b51d9982;
    stim[27] = 166'h17389f44156592d1d423581c999d538587520079bd;
    stim[28] = 166'h191e4b44dc574ee3206908cc3cec6468fd67ed5eb3;
    stim[29] = 166'h0512b644ce5768ddd38d21c1c92e9413c98c021525;
    stim[30] = 166'h0a9e3d12489b5f2091fb0e13e4d8514a0319ce3587;
    stim[31] = 166'h2e1d373e7af975485771c5588c3f39bba9d9395fc8;
    stim[32] = 166'h271a30347839286abbc0e786cf7e4eb6aa7b54eb0d;
    stim[33] = 166'h16719e688aba6f16a7d4b617af67c8bc93a9a6c9b1;
    stim[34] = 166'h257c36fdf9b243b7f5cb3d6eb78257aeb39197fa8a;
    stim[35] = 166'h37930057035a8d23e45122376c7e2552a5bd2bec8c;
    stim[36] = 166'h2c411e8030a1ee5b4118d92187b51e3caa67e58dd5;
    stim[37] = 166'h24ba97447e7e5b0ce8bcd3dd3c7767ae493995d569;
    stim[38] = 166'h0a9eda140864b76a90c1ffaf332b6cd0b7ab626757;
    stim[39] = 166'h1503bbf18ecdc90d71acac5fa9b76dc658615a26b9;
    stim[40] = 166'h3fd2b35a67e0c7792b66e8a8e8eea4a99bf32ec94a;
    stim[41] = 166'h229ea389175e01a9b76ba4eb7a760b7bc663486042;
    stim[42] = 166'h33e2c599ca56a83ae8c21dd2e37e6103b40a6392f0;
    stim[43] = 166'h0b2597d2260403fd334c61888dff535cbf50ffcb05;
    stim[44] = 166'h3dd606964ef3b5258d23e09469a061c001179de741;
    stim[45] = 166'h3b343a44aaebfb6030fd7496915e2aa6d516002e2f;
    stim[46] = 166'h086cb8034ef705a678e3e44cd9e84b3c6ac9009d81;
    stim[47] = 166'h1d6d52b680998352da71a0ee9288d6dfa935a18ff9;
    stim[48] = 166'h05bdf70f03b286933a8f187c85d2882998bfcab2c6;
    stim[49] = 166'h2d7ccc0abe578c31c819daffe52a5d6513bb040350;
    stim[50] = 166'h377727e02edf97ff94de85fa9b73ec5b2c217ed1ba;
    stim[51] = 166'h163ec3d24de22645af6d68246b198902ff0f10dac7;
    stim[52] = 166'h1203c00d0405b2ca5001e37ef9ee71bfb1540ad24c;
    stim[53] = 166'h0224f7f828f2f77fffc4e521c0863deb1b8cbf59fc;
    stim[54] = 166'h061c2e4e26227d0d4ad2d1557f54c57c39c8b1effc;
    stim[55] = 166'h195b11d8aedabdf815cc69e48a2c0b1de9dec3f9d0;
    stim[56] = 166'h3742389a2bdf8b5c94d50f4a82a64fc4758d659370;
    stim[57] = 166'h3f428a42ffc6771197a61b5d2add106d80cafcd6ed;
    stim[58] = 166'h17408a7b7992171e6d2b2d78c7c9038c35ce21f347;
    stim[59] = 166'h1d06a0ee7748facf5a41d8a4f998573fb1facad777;
    stim[60] = 166'h203b7360293ba5071eefe04b93b2d5d87aee76a117;
    stim[61] = 166'h1a105b295e4ab2306d28a1724121d52c2c694c2504;
    stim[62] = 166'h2863118ac4e3d8f151685e3b53c3190bbfcf83af23;
    stim[63] = 166'h3251542a3f9f5e297fc6b942a30c0134bfd0acd036;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'hxxxxxxxx00000000;
      expv[3] = 64'hxxxxxxxx00000000;
      expv[4] = 64'hxxxxxxxx00000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'hxxxxxxxx00000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'hxxxxxxxx00000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'hxxxxxxxx00000000;
      expv[14] = 64'hxxxxxxxx00000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'hxxxxxxxx00000000;
      expv[19] = 64'hxxxxxxxx00000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'hxxxxxxxx00000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'hxxxxxxxx00000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'hxxxxxxxx00000000;
      expv[33] = 64'hxxxxxxxx00000000;
      expv[34] = 64'hxxxxxxxx00000000;
      expv[35] = 64'hxxxxxxxx00000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'hxxxxxxxx00000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'hxxxxxxxx00000000;
      expv[40] = 64'hxxxxxxxx00000000;
      expv[41] = 64'hxxxxxxxx00000000;
      expv[42] = 64'hxxxxxxxx00000000;
      expv[43] = 64'hxxxxxxxx00000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'hxxxxxxxx00000000;
      expv[46] = 64'hxxxxxxxx00000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'hxxxxxxxx00000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'hxxxxxxxx00000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'hxxxxxxxx00000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'hxxxxxxxx00000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'hxxxxxxxx00000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'hxxxxxxxx00000000;
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
