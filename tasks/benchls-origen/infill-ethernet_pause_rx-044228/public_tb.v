// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_044228 dut (
    .in_clk(clk),
    .rst(in_vec[51:51]),
    .up_data_rx_ctrl(in_vec[50:47]),
    .in_par_en(in_vec[46:46]),
    .in_data(in_vec[45:14]),
    .in_valid(in_vec[13:13]),
    .in_sop(in_vec[12:12]),
    .in_eop(in_vec[11:11]),
    .in_mod(in_vec[10:9]),
    .in_info(in_vec[8:6]),
    .in_stat(in_vec[5:4]),
    .in_snum(in_vec[3:0]),
    .pause_on(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'hea9d5c6cd35c4;
    stim[1] = 52'hfd7150c134d7a;
    stim[2] = 52'h379dc0628d907;
    stim[3] = 52'h131055c2f6c89;
    stim[4] = 52'h53d7ace43c16e;
    stim[5] = 52'h25360d6340cf3;
    stim[6] = 52'h1bec4573c0412;
    stim[7] = 52'h6cf85a80578e6;
    stim[8] = 52'h2a91c4f49713f;
    stim[9] = 52'h74bdc321ef1db;
    stim[10] = 52'h2da73c2007d9f;
    stim[11] = 52'h5910aff82927b;
    stim[12] = 52'h0656e9bc3fe3a;
    stim[13] = 52'h03786146c2f6c;
    stim[14] = 52'h25b2f43e4b054;
    stim[15] = 52'h24903cb9224e7;
    stim[16] = 52'h12c0ce27ba57d;
    stim[17] = 52'h2e967701336ba;
    stim[18] = 52'h587a460353d4c;
    stim[19] = 52'h58ccec82a37d1;
    stim[20] = 52'h1d24c8f27acc7;
    stim[21] = 52'h469eb327dc7ee;
    stim[22] = 52'h2e6f50e634ee5;
    stim[23] = 52'h570192b4b67c1;
    stim[24] = 52'h5b50c66b179e8;
    stim[25] = 52'h4aa3e270b94d3;
    stim[26] = 52'h673a7f30083d5;
    stim[27] = 52'h44031729c08b6;
    stim[28] = 52'h337dba2c3a078;
    stim[29] = 52'h236aa1885b81c;
    stim[30] = 52'h493b3b776ef20;
    stim[31] = 52'h2c044c92b1572;
    stim[32] = 52'h0e303fa60f9d3;
    stim[33] = 52'h3096914cb8104;
    stim[34] = 52'h38248668beeda;
    stim[35] = 52'h2b2249a5905bb;
    stim[36] = 52'h5cfaac19e39c7;
    stim[37] = 52'h0a5894518291e;
    stim[38] = 52'h1088ec31cd6b3;
    stim[39] = 52'h0176dfcb6ed62;
    stim[40] = 52'h6767c82d52485;
    stim[41] = 52'h749aedee3ca10;
    stim[42] = 52'h6a86c8b1fd660;
    stim[43] = 52'h49f971e84e8c6;
    stim[44] = 52'h66c30a6df0d78;
    stim[45] = 52'h4c7355ac42327;
    stim[46] = 52'h0788845f5ecd3;
    stim[47] = 52'h06cd92fda203f;
    stim[48] = 52'h620034cc74631;
    stim[49] = 52'h7f29f1d553de4;
    stim[50] = 52'h3939396289300;
    stim[51] = 52'h8dbc1c0e22271;
    stim[52] = 52'h00526dfb7bb08;
    stim[53] = 52'h1b5f5943049be;
    stim[54] = 52'h456a809d1ba95;
    stim[55] = 52'h6e1adf40c36e8;
    stim[56] = 52'h4bc48cdf00a1b;
    stim[57] = 52'h35fe9431a414b;
    stim[58] = 52'h103d6fce822c3;
    stim[59] = 52'h2b1b9c044ed9e;
    stim[60] = 52'h05e90eb75104e;
    stim[61] = 52'h01e28ecda07b9;
    stim[62] = 52'h1a754c463217a;
    stim[63] = 52'h2238f3e12bb50;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
