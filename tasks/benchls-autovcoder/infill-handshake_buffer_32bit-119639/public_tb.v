// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119639 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h7061353e6;
    stim[1] = 35'h638686e01;
    stim[2] = 35'h0a6eb4039;
    stim[3] = 35'h1fe97a802;
    stim[4] = 35'h067a93b48;
    stim[5] = 35'h0429c3472;
    stim[6] = 35'h1b2264d15;
    stim[7] = 35'h25435268e;
    stim[8] = 35'h29256beba;
    stim[9] = 35'h3d5edb7fd;
    stim[10] = 35'h382124c51;
    stim[11] = 35'h1e56b983f;
    stim[12] = 35'h294ef33d9;
    stim[13] = 35'h28741b863;
    stim[14] = 35'h34e229128;
    stim[15] = 35'h08bf4f1fa;
    stim[16] = 35'h2f6e615ff;
    stim[17] = 35'h2dfb4a6e9;
    stim[18] = 35'h26a8fd1c7;
    stim[19] = 35'h32feeacdc;
    stim[20] = 35'h106961809;
    stim[21] = 35'h0a3fd7184;
    stim[22] = 35'h01255ef00;
    stim[23] = 35'h3036cfba3;
    stim[24] = 35'h350ce8306;
    stim[25] = 35'h1a1713cc4;
    stim[26] = 35'h0c5bd09b0;
    stim[27] = 35'h1514b6e8f;
    stim[28] = 35'h044a51812;
    stim[29] = 35'h39f219d4e;
    stim[30] = 35'h0a383add3;
    stim[31] = 35'h3d6570b74;
    stim[32] = 35'h343556d02;
    stim[33] = 35'h1202a0d35;
    stim[34] = 35'h337ba3d74;
    stim[35] = 35'h0aa56cf12;
    stim[36] = 35'h3ad65b249;
    stim[37] = 35'h0655c96be;
    stim[38] = 35'h30a4d24c5;
    stim[39] = 35'h34e1e5a19;
    stim[40] = 35'h0012dcca6;
    stim[41] = 35'h3692bbdf8;
    stim[42] = 35'h24a0251d3;
    stim[43] = 35'h1ac990c60;
    stim[44] = 35'h150374497;
    stim[45] = 35'h18d66f02f;
    stim[46] = 35'h1ef86651a;
    stim[47] = 35'h093152748;
    stim[48] = 35'h240d21cae;
    stim[49] = 35'h038455f78;
    stim[50] = 35'h096f26cca;
    stim[51] = 35'h35ee782e0;
    stim[52] = 35'h325ee38d2;
    stim[53] = 35'h0ebb92a8e;
    stim[54] = 35'h1201d2e09;
    stim[55] = 35'h31eec63c9;
    stim[56] = 35'h2a47a8035;
    stim[57] = 35'h104621a91;
    stim[58] = 35'h06a852c40;
    stim[59] = 35'h0764442f2;
    stim[60] = 35'h280f07689;
    stim[61] = 35'h1b294fdf0;
    stim[62] = 35'h356c31141;
    stim[63] = 35'h19737d9e3;
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
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h238686e00;
      expv[3] = 35'h4a6eb4038;
      expv[4] = 35'h5fe97a803;
      expv[5] = 35'h5fe97a803;
      expv[6] = 35'h1fe97a803;
      expv[7] = 35'h4429c3473;
      expv[8] = 35'h0429c3473;
      expv[9] = 35'h0429c3473;
      expv[10] = 35'h65435268e;
      expv[11] = 35'h782124c50;
      expv[12] = 35'h5e56b983e;
      expv[13] = 35'h694ef33d8;
      expv[14] = 35'h68741b863;
      expv[15] = 35'h68741b863;
      expv[16] = 35'h28741b863;
      expv[17] = 35'h48bf4f1fa;
      expv[18] = 35'h6dfb4a6e8;
      expv[19] = 35'h66a8fd1c7;
      expv[20] = 35'h66a8fd1c6;
      expv[21] = 35'h506961808;
      expv[22] = 35'h4a3fd7184;
      expv[23] = 35'h41255ef00;
      expv[24] = 35'h7036cfba3;
      expv[25] = 35'h3036cfba3;
      expv[26] = 35'h3036cfba3;
      expv[27] = 35'h3036cfba3;
      expv[28] = 35'h750ce8307;
      expv[29] = 35'h350ce8307;
      expv[30] = 35'h350ce8307;
      expv[31] = 35'h444a51813;
      expv[32] = 35'h444a51813;
      expv[33] = 35'h044a51813;
      expv[34] = 35'h743556d03;
      expv[35] = 35'h743556d03;
      expv[36] = 35'h343556d03;
      expv[37] = 35'h4aa56cf13;
      expv[38] = 35'h0aa56cf13;
      expv[39] = 35'h4655c96be;
      expv[40] = 35'h74e1e5a18;
      expv[41] = 35'h4012dcca7;
      expv[42] = 35'h4012dcca6;
      expv[43] = 35'h64a0251d3;
      expv[44] = 35'h64a0251d2;
      expv[45] = 35'h550374496;
      expv[46] = 35'h58d66f02f;
      expv[47] = 35'h18d66f02f;
      expv[48] = 35'h18d66f02f;
      expv[49] = 35'h18d66f02f;
      expv[50] = 35'h18d66f02f;
      expv[51] = 35'h18d66f02f;
      expv[52] = 35'h18d66f02f;
      expv[53] = 35'h18d66f02f;
      expv[54] = 35'h18d66f02f;
      expv[55] = 35'h5ef86651a;
      expv[56] = 35'h71eec63c8;
      expv[57] = 35'h6a47a8034;
      expv[58] = 35'h504621a90;
      expv[59] = 35'h46a852c40;
      expv[60] = 35'h4764442f2;
      expv[61] = 35'h680f07688;
      expv[62] = 35'h5b294fdf0;
      expv[63] = 35'h756c31140;
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
