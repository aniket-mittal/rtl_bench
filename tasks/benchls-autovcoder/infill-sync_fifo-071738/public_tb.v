// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071738 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hacc;
    stim[1] = 12'h81c;
    stim[2] = 12'h156;
    stim[3] = 12'h4aa;
    stim[4] = 12'h55c;
    stim[5] = 12'h52b;
    stim[6] = 12'h532;
    stim[7] = 12'h39e;
    stim[8] = 12'h5ad;
    stim[9] = 12'h7bf;
    stim[10] = 12'h09a;
    stim[11] = 12'h32a;
    stim[12] = 12'h098;
    stim[13] = 12'h59c;
    stim[14] = 12'h11b;
    stim[15] = 12'h791;
    stim[16] = 12'h762;
    stim[17] = 12'h7c7;
    stim[18] = 12'h661;
    stim[19] = 12'h3cd;
    stim[20] = 12'h697;
    stim[21] = 12'h714;
    stim[22] = 12'h304;
    stim[23] = 12'h754;
    stim[24] = 12'h6cd;
    stim[25] = 12'h1f9;
    stim[26] = 12'h148;
    stim[27] = 12'h1f9;
    stim[28] = 12'h744;
    stim[29] = 12'h1ba;
    stim[30] = 12'h4f0;
    stim[31] = 12'h200;
    stim[32] = 12'h37c;
    stim[33] = 12'h765;
    stim[34] = 12'h150;
    stim[35] = 12'h133;
    stim[36] = 12'h463;
    stim[37] = 12'hfb5;
    stim[38] = 12'h55f;
    stim[39] = 12'h2ed;
    stim[40] = 12'h4fa;
    stim[41] = 12'h0ef;
    stim[42] = 12'h605;
    stim[43] = 12'h484;
    stim[44] = 12'h27e;
    stim[45] = 12'h730;
    stim[46] = 12'h39c;
    stim[47] = 12'h03b;
    stim[48] = 12'h2b3;
    stim[49] = 12'h0af;
    stim[50] = 12'h39d;
    stim[51] = 12'h790;
    stim[52] = 12'h494;
    stim[53] = 12'h321;
    stim[54] = 12'h302;
    stim[55] = 12'h2d2;
    stim[56] = 12'h5bc;
    stim[57] = 12'h396;
    stim[58] = 12'h2a2;
    stim[59] = 12'h3d5;
    stim[60] = 12'h656;
    stim[61] = 12'h49b;
    stim[62] = 12'h5e2;
    stim[63] = 12'hb3f;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h35c;
      expv[7] = 10'h35c;
      expv[8] = 10'h35c;
      expv[9] = 10'h35c;
      expv[10] = 10'h32b;
      expv[11] = 10'h32b;
      expv[12] = 10'h32b;
      expv[13] = 10'h32b;
      expv[14] = 10'h32b;
      expv[15] = 10'h32b;
      expv[16] = 10'h332;
      expv[17] = 10'h3ad;
      expv[18] = 10'h3bf;
      expv[19] = 10'h39c;
      expv[20] = 10'h39c;
      expv[21] = 10'h391;
      expv[22] = 10'h362;
      expv[23] = 10'h362;
      expv[24] = 10'h3c7;
      expv[25] = 10'h314;
      expv[26] = 10'h314;
      expv[27] = 10'h314;
      expv[28] = 10'h314;
      expv[29] = 10'h354;
      expv[30] = 10'h354;
      expv[31] = 10'h354;
      expv[32] = 10'h354;
      expv[33] = 10'h354;
      expv[34] = 10'h344;
      expv[35] = 10'h344;
      expv[36] = 10'h344;
      expv[37] = 10'h344;
      expv[38] = 10'h100;
      expv[39] = 10'h1b5;
      expv[40] = 10'h1b5;
      expv[41] = 10'h35f;
      expv[42] = 10'h35f;
      expv[43] = 10'h15f;
      expv[44] = 10'h15f;
      expv[45] = 10'h15f;
      expv[46] = 10'h15f;
      expv[47] = 10'h15f;
      expv[48] = 10'h15f;
      expv[49] = 10'h15f;
      expv[50] = 10'h15f;
      expv[51] = 10'h15f;
      expv[52] = 10'h330;
      expv[53] = 10'h330;
      expv[54] = 10'h330;
      expv[55] = 10'h330;
      expv[56] = 10'h330;
      expv[57] = 10'h330;
      expv[58] = 10'h330;
      expv[59] = 10'h330;
      expv[60] = 10'h330;
      expv[61] = 10'h390;
      expv[62] = 10'h390;
      expv[63] = 10'h390;
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
