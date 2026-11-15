// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072334 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2587de7d23;
    stim[1] = 38'h2c92abe419;
    stim[2] = 38'h0463ec3796;
    stim[3] = 38'h09a8615392;
    stim[4] = 38'h1fcb8c90d8;
    stim[5] = 38'h15cbfd1580;
    stim[6] = 38'h0960573476;
    stim[7] = 38'h17a96e2851;
    stim[8] = 38'h0fd35952c4;
    stim[9] = 38'h17d62160a0;
    stim[10] = 38'h1a8d61916e;
    stim[11] = 38'h1466fbbd96;
    stim[12] = 38'h0d58134980;
    stim[13] = 38'h189f28436a;
    stim[14] = 38'h0bfde4afce;
    stim[15] = 38'h1a38b1f526;
    stim[16] = 38'h1824de9a22;
    stim[17] = 38'h093221264f;
    stim[18] = 38'h0e36b97193;
    stim[19] = 38'h120fbe5cee;
    stim[20] = 38'h0462fb944d;
    stim[21] = 38'h0915d889e2;
    stim[22] = 38'h06f6154285;
    stim[23] = 38'h0739b7e2d3;
    stim[24] = 38'h1242302894;
    stim[25] = 38'h1682fffa9b;
    stim[26] = 38'h091f3476b1;
    stim[27] = 38'h0d3076d8dd;
    stim[28] = 38'h0b15412a71;
    stim[29] = 38'h0c643f88c1;
    stim[30] = 38'h112deaeb08;
    stim[31] = 38'h077330e160;
    stim[32] = 38'h0674e63995;
    stim[33] = 38'h0a2de9f0f7;
    stim[34] = 38'h080317a4ff;
    stim[35] = 38'h1bda124f5d;
    stim[36] = 38'h0e3f436c1a;
    stim[37] = 38'h1f88c2e941;
    stim[38] = 38'h01fc5e7e04;
    stim[39] = 38'h1c7ab42188;
    stim[40] = 38'h083ffc5c8e;
    stim[41] = 38'h065e1fb995;
    stim[42] = 38'h0a85254ff8;
    stim[43] = 38'h10d5f1b39b;
    stim[44] = 38'h1cacfb9964;
    stim[45] = 38'h11ae26fe75;
    stim[46] = 38'h0632a79597;
    stim[47] = 38'h1ae6297c1f;
    stim[48] = 38'h1c1bfe9302;
    stim[49] = 38'h0f4f89bcda;
    stim[50] = 38'h10d474f1ce;
    stim[51] = 38'h1c1099e408;
    stim[52] = 38'h074be9bc41;
    stim[53] = 38'h070b8b0f7b;
    stim[54] = 38'h1ca611a555;
    stim[55] = 38'h05c24df400;
    stim[56] = 38'h1141035dc9;
    stim[57] = 38'h1fa475b856;
    stim[58] = 38'h024eee29d2;
    stim[59] = 38'h0acdb7b8b9;
    stim[60] = 38'h0534db4a2b;
    stim[61] = 38'h09679aec97;
    stim[62] = 38'h0428821e4b;
    stim[63] = 38'h318b9b5fe3;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h3f2e32436;
      expv[12] = 34'h3f2e32436;
      expv[13] = 34'h3f2e32436;
      expv[14] = 34'h3f2e32436;
      expv[15] = 34'h3f2e32436;
      expv[16] = 34'h3f2e32436;
      expv[17] = 34'h3f2e32436;
      expv[18] = 34'h3f2e32436;
      expv[19] = 34'h3f2e32436;
      expv[20] = 34'h3f2e32436;
      expv[21] = 34'h3f2e32436;
      expv[22] = 34'h3f2e32436;
      expv[23] = 34'h3f2e32436;
      expv[24] = 34'h3f2e32436;
      expv[25] = 34'h3f2e32436;
      expv[26] = 34'h2f2e32436;
      expv[27] = 34'h2f2e32436;
      expv[28] = 34'h2f2e32436;
      expv[29] = 34'h2f2e32436;
      expv[30] = 34'h2f2e32436;
      expv[31] = 34'h2f2e32436;
      expv[32] = 34'h2f2e32436;
      expv[33] = 34'h2f2e32436;
      expv[34] = 34'h2f2e32436;
      expv[35] = 34'h2f2e32436;
      expv[36] = 34'h2f2e32436;
      expv[37] = 34'h2f2e32436;
      expv[38] = 34'h2f2e32436;
      expv[39] = 34'h2f2e32436;
      expv[40] = 34'h2f2e32436;
      expv[41] = 34'h2f2e32436;
      expv[42] = 34'h2f2e32436;
      expv[43] = 34'h2f2e32436;
      expv[44] = 34'h3e230ba50;
      expv[45] = 34'h3e230ba50;
      expv[46] = 34'h3e230ba50;
      expv[47] = 34'h3e230ba50;
      expv[48] = 34'h32b3ee659;
      expv[49] = 34'h32b3ee659;
      expv[50] = 34'h32b3ee659;
      expv[51] = 34'h32b3ee659;
      expv[52] = 34'h32b3ee659;
      expv[53] = 34'h32b3ee659;
      expv[54] = 34'h32b3ee659;
      expv[55] = 34'h32b3ee659;
      expv[56] = 34'h32b3ee659;
      expv[57] = 34'h32b3ee659;
      expv[58] = 34'h32b3ee659;
      expv[59] = 34'h32b3ee659;
      expv[60] = 34'h32b3ee659;
      expv[61] = 34'h32b3ee659;
      expv[62] = 34'h32b3ee659;
      expv[63] = 34'h32b3ee659;
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
