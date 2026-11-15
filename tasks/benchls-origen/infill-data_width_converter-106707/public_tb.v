// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_106707 dut (
    .clk(clk),
    .cs(in_vec[17:17]),
    .rw(in_vec[16:16]),
    .p_i(in_vec[15:0]),
    .flow(out_vec[4:4]),
    .p_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h03380;
    stim[1] = 18'h1261f;
    stim[2] = 18'h14abb;
    stim[3] = 18'h1226a;
    stim[4] = 18'h052b4;
    stim[5] = 18'h00949;
    stim[6] = 18'h00e32;
    stim[7] = 18'h11414;
    stim[8] = 18'h06147;
    stim[9] = 18'h3b30d;
    stim[10] = 18'h1a773;
    stim[11] = 18'h1903c;
    stim[12] = 18'h1fc56;
    stim[13] = 18'h3433f;
    stim[14] = 18'h305e7;
    stim[15] = 18'h2124b;
    stim[16] = 18'h3bf8a;
    stim[17] = 18'h321c5;
    stim[18] = 18'h29b7e;
    stim[19] = 18'h0c5fc;
    stim[20] = 18'h3d08e;
    stim[21] = 18'h0e819;
    stim[22] = 18'h294b9;
    stim[23] = 18'h3d133;
    stim[24] = 18'h0f4d4;
    stim[25] = 18'h32cf0;
    stim[26] = 18'h093e4;
    stim[27] = 18'h00c85;
    stim[28] = 18'h2a66a;
    stim[29] = 18'h1b425;
    stim[30] = 18'h2d8e6;
    stim[31] = 18'h3878d;
    stim[32] = 18'h0b944;
    stim[33] = 18'h2708a;
    stim[34] = 18'h07581;
    stim[35] = 18'h1d59c;
    stim[36] = 18'h05075;
    stim[37] = 18'h26e5d;
    stim[38] = 18'h24442;
    stim[39] = 18'h173ff;
    stim[40] = 18'h0e2b6;
    stim[41] = 18'h0233c;
    stim[42] = 18'h14daf;
    stim[43] = 18'h0adea;
    stim[44] = 18'h21232;
    stim[45] = 18'h06b36;
    stim[46] = 18'h1cc3c;
    stim[47] = 18'h09d1e;
    stim[48] = 18'h3f104;
    stim[49] = 18'h27dc3;
    stim[50] = 18'h0bb00;
    stim[51] = 18'h043d2;
    stim[52] = 18'h11449;
    stim[53] = 18'h3f1e7;
    stim[54] = 18'h13917;
    stim[55] = 18'h19b13;
    stim[56] = 18'h28d4b;
    stim[57] = 18'h240dc;
    stim[58] = 18'h174b1;
    stim[59] = 18'h3b9d2;
    stim[60] = 18'h0048d;
    stim[61] = 18'h39cbd;
    stim[62] = 18'h2b0f8;
    stim[63] = 18'h3150f;
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
      expv[0] = 5'hxx;
      expv[1] = 5'hxx;
      expv[2] = 5'hxx;
      expv[3] = 5'hxx;
      expv[4] = 5'hxx;
      expv[5] = 5'hxx;
      expv[6] = 5'hxx;
      expv[7] = 5'hxx;
      expv[8] = 5'hxx;
      expv[9] = 5'hxx;
      expv[10] = 5'h0x;
      expv[11] = 5'h0x;
      expv[12] = 5'h0x;
      expv[13] = 5'h0x;
      expv[14] = 5'h0x;
      expv[15] = 5'h0x;
      expv[16] = 5'h0x;
      expv[17] = 5'h0x;
      expv[18] = 5'h0x;
      expv[19] = 5'h0x;
      expv[20] = 5'h0x;
      expv[21] = 5'h0x;
      expv[22] = 5'h0x;
      expv[23] = 5'h0d;
      expv[24] = 5'h0d;
      expv[25] = 5'h0d;
      expv[26] = 5'h0d;
      expv[27] = 5'h0d;
      expv[28] = 5'h0d;
      expv[29] = 5'h02;
      expv[30] = 5'h02;
      expv[31] = 5'h0c;
      expv[32] = 5'h0c;
      expv[33] = 5'h0c;
      expv[34] = 5'h0f;
      expv[35] = 5'h0f;
      expv[36] = 5'h0f;
      expv[37] = 5'h0f;
      expv[38] = 5'h10;
      expv[39] = 5'h10;
      expv[40] = 5'h10;
      expv[41] = 5'h10;
      expv[42] = 5'h10;
      expv[43] = 5'h10;
      expv[44] = 5'h10;
      expv[45] = 5'h10;
      expv[46] = 5'h10;
      expv[47] = 5'h10;
      expv[48] = 5'h10;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h0f;
      expv[58] = 5'h0f;
      expv[59] = 5'h0f;
      expv[60] = 5'h0f;
      expv[61] = 5'h0f;
      expv[62] = 5'h0f;
      expv[63] = 5'h0f;
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
