// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_100449 dut (
    .clk_ref(clk),
    .rst_n(in_vec[13:13]),
    .i_rs232_busy(in_vec[12:12]),
    .i_tx_dat(in_vec[11:4]),
    .i_ctrl_cnt(in_vec[3:0]),
    .o_tx_pin(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h0347;
    stim[1] = 14'h116a;
    stim[2] = 14'h358c;
    stim[3] = 14'h2fb4;
    stim[4] = 14'h2e33;
    stim[5] = 14'h0ef7;
    stim[6] = 14'h278b;
    stim[7] = 14'h22f2;
    stim[8] = 14'h31c7;
    stim[9] = 14'h396f;
    stim[10] = 14'h3e3b;
    stim[11] = 14'h3939;
    stim[12] = 14'h37d4;
    stim[13] = 14'h2b15;
    stim[14] = 14'h24f5;
    stim[15] = 14'h3775;
    stim[16] = 14'h38f1;
    stim[17] = 14'h2a5c;
    stim[18] = 14'h3f53;
    stim[19] = 14'h2c1e;
    stim[20] = 14'h2821;
    stim[21] = 14'h26bb;
    stim[22] = 14'h3cc8;
    stim[23] = 14'h3224;
    stim[24] = 14'h219f;
    stim[25] = 14'h2b66;
    stim[26] = 14'h39ce;
    stim[27] = 14'h13ce;
    stim[28] = 14'h2eb8;
    stim[29] = 14'h250c;
    stim[30] = 14'h2bc7;
    stim[31] = 14'h2a06;
    stim[32] = 14'h3165;
    stim[33] = 14'h3866;
    stim[34] = 14'h3b17;
    stim[35] = 14'h315e;
    stim[36] = 14'h25bb;
    stim[37] = 14'h3f31;
    stim[38] = 14'h20cc;
    stim[39] = 14'h2e2f;
    stim[40] = 14'h2658;
    stim[41] = 14'h34ce;
    stim[42] = 14'h3030;
    stim[43] = 14'h3f5c;
    stim[44] = 14'h2187;
    stim[45] = 14'h2c8e;
    stim[46] = 14'h2bf3;
    stim[47] = 14'h3183;
    stim[48] = 14'h32cc;
    stim[49] = 14'h20ad;
    stim[50] = 14'h22fa;
    stim[51] = 14'h27c6;
    stim[52] = 14'h3863;
    stim[53] = 14'h3026;
    stim[54] = 14'h279e;
    stim[55] = 14'h271f;
    stim[56] = 14'h2928;
    stim[57] = 14'h2cc1;
    stim[58] = 14'h2651;
    stim[59] = 14'h24ef;
    stim[60] = 14'h20d3;
    stim[61] = 14'h2fbb;
    stim[62] = 14'h2201;
    stim[63] = 14'h3017;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
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
