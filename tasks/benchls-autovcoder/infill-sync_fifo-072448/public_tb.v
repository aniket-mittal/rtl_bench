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

  autovcoder_072448 dut (
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
    stim[0] = 12'hd5e;
    stim[1] = 12'hfe4;
    stim[2] = 12'h327;
    stim[3] = 12'h289;
    stim[4] = 12'h536;
    stim[5] = 12'h0a5;
    stim[6] = 12'h1f6;
    stim[7] = 12'h1c5;
    stim[8] = 12'h5b8;
    stim[9] = 12'h193;
    stim[10] = 12'h45c;
    stim[11] = 12'h617;
    stim[12] = 12'h44e;
    stim[13] = 12'h27b;
    stim[14] = 12'h11b;
    stim[15] = 12'h582;
    stim[16] = 12'h4cc;
    stim[17] = 12'h517;
    stim[18] = 12'h654;
    stim[19] = 12'h4d1;
    stim[20] = 12'h4d9;
    stim[21] = 12'h723;
    stim[22] = 12'h733;
    stim[23] = 12'h2f4;
    stim[24] = 12'h5f9;
    stim[25] = 12'h3a5;
    stim[26] = 12'h063;
    stim[27] = 12'h50c;
    stim[28] = 12'h7db;
    stim[29] = 12'h271;
    stim[30] = 12'h2fc;
    stim[31] = 12'h7a2;
    stim[32] = 12'h741;
    stim[33] = 12'h363;
    stim[34] = 12'h019;
    stim[35] = 12'h6f9;
    stim[36] = 12'hde8;
    stim[37] = 12'h468;
    stim[38] = 12'h036;
    stim[39] = 12'h431;
    stim[40] = 12'h055;
    stim[41] = 12'h504;
    stim[42] = 12'h2dc;
    stim[43] = 12'h74d;
    stim[44] = 12'h6cc;
    stim[45] = 12'h0c2;
    stim[46] = 12'h5ed;
    stim[47] = 12'h680;
    stim[48] = 12'h6ed;
    stim[49] = 12'h3df;
    stim[50] = 12'h02e;
    stim[51] = 12'h16c;
    stim[52] = 12'h479;
    stim[53] = 12'h2c0;
    stim[54] = 12'h7bc;
    stim[55] = 12'h5e8;
    stim[56] = 12'h128;
    stim[57] = 12'h509;
    stim[58] = 12'h2fe;
    stim[59] = 12'h5ab;
    stim[60] = 12'h54f;
    stim[61] = 12'h6b2;
    stim[62] = 12'h2c1;
    stim[63] = 12'h099;
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
      expv[4] = 10'h100;
      expv[5] = 10'h1e4;
      expv[6] = 10'h1e4;
      expv[7] = 10'h1e4;
      expv[8] = 10'h1e4;
      expv[9] = 10'h336;
      expv[10] = 10'h336;
      expv[11] = 10'h336;
      expv[12] = 10'h3b8;
      expv[13] = 10'h3b8;
      expv[14] = 10'h3b8;
      expv[15] = 10'h3b8;
      expv[16] = 10'h3b8;
      expv[17] = 10'h3b8;
      expv[18] = 10'h3b8;
      expv[19] = 10'h382;
      expv[20] = 10'h382;
      expv[21] = 10'h382;
      expv[22] = 10'h317;
      expv[23] = 10'h323;
      expv[24] = 10'h323;
      expv[25] = 10'h323;
      expv[26] = 10'h323;
      expv[27] = 10'h323;
      expv[28] = 10'h323;
      expv[29] = 10'h333;
      expv[30] = 10'h333;
      expv[31] = 10'h333;
      expv[32] = 10'h3f9;
      expv[33] = 10'h30c;
      expv[34] = 10'h30c;
      expv[35] = 10'h30c;
      expv[36] = 10'h3db;
      expv[37] = 10'h100;
      expv[38] = 10'h1e8;
      expv[39] = 10'h1e8;
      expv[40] = 10'h1e8;
      expv[41] = 10'h1e8;
      expv[42] = 10'h1e8;
      expv[43] = 10'h1e8;
      expv[44] = 10'h304;
      expv[45] = 10'h34d;
      expv[46] = 10'h34d;
      expv[47] = 10'h34d;
      expv[48] = 10'h3ed;
      expv[49] = 10'h1ed;
      expv[50] = 10'h1ed;
      expv[51] = 10'h1ed;
      expv[52] = 10'h1ed;
      expv[53] = 10'h1ed;
      expv[54] = 10'h1ed;
      expv[55] = 10'h1ed;
      expv[56] = 10'h3bc;
      expv[57] = 10'h3bc;
      expv[58] = 10'h3bc;
      expv[59] = 10'h3bc;
      expv[60] = 10'h3bc;
      expv[61] = 10'h3bc;
      expv[62] = 10'h3e8;
      expv[63] = 10'h3e8;
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
