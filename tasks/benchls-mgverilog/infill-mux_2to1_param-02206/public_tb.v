// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02206 dut (
    .sel(in_vec[32:32]),
    .a_in(in_vec[31:16]),
    .b_in(in_vec[15:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1dcc960b4;
    stim[1] = 33'h14353d791;
    stim[2] = 33'h07d99db5f;
    stim[3] = 33'h17dd6e3f2;
    stim[4] = 33'h172e9f1e2;
    stim[5] = 33'h08a718607;
    stim[6] = 33'h192d9e5c7;
    stim[7] = 33'h16ea84179;
    stim[8] = 33'h04a7c9fdf;
    stim[9] = 33'h0689f50e2;
    stim[10] = 33'h14586fced;
    stim[11] = 33'h17c0e7c1c;
    stim[12] = 33'h1955b4ee6;
    stim[13] = 33'h1a4616cb0;
    stim[14] = 33'h0880596b9;
    stim[15] = 33'h10de8fd3e;
    stim[16] = 33'h100986ea8;
    stim[17] = 33'h162c30b3e;
    stim[18] = 33'h006d2f04d;
    stim[19] = 33'h17af78b4e;
    stim[20] = 33'h05107bd26;
    stim[21] = 33'h11554450d;
    stim[22] = 33'h01def1c91;
    stim[23] = 33'h1e59ef505;
    stim[24] = 33'h118e35626;
    stim[25] = 33'h1bc120151;
    stim[26] = 33'h0b3122512;
    stim[27] = 33'h1269cf42c;
    stim[28] = 33'h195a362b1;
    stim[29] = 33'h16dc00335;
    stim[30] = 33'h091a31512;
    stim[31] = 33'h120c17208;
    stim[32] = 33'h16d96c36b;
    stim[33] = 33'h11f62bad0;
    stim[34] = 33'h1bbd1f7e5;
    stim[35] = 33'h113fd663b;
    stim[36] = 33'h065176087;
    stim[37] = 33'h1fc3c4852;
    stim[38] = 33'h1bda7b813;
    stim[39] = 33'h065f75b88;
    stim[40] = 33'h199fa77e4;
    stim[41] = 33'h1b290b27a;
    stim[42] = 33'h1fe8b093f;
    stim[43] = 33'h11ccc7da4;
    stim[44] = 33'h19c3cd296;
    stim[45] = 33'h0447cac7a;
    stim[46] = 33'h09e4f51d8;
    stim[47] = 33'h118bdd5ce;
    stim[48] = 33'h1f33bf76c;
    stim[49] = 33'h15cd4efd8;
    stim[50] = 33'h15c6467c0;
    stim[51] = 33'h03b439459;
    stim[52] = 33'h062306250;
    stim[53] = 33'h0a347a54d;
    stim[54] = 33'h0667e1d09;
    stim[55] = 33'h0522f6715;
    stim[56] = 33'h09ba40014;
    stim[57] = 33'h01ea03e34;
    stim[58] = 33'h15738eb3d;
    stim[59] = 33'h0a71b325d;
    stim[60] = 33'h1bb7662b7;
    stim[61] = 33'h1d8b30ab0;
    stim[62] = 33'h004fd905a;
    stim[63] = 33'h0e1a5b3a0;
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
      expv[0] = 16'h60b4;
      expv[1] = 16'hd791;
      expv[2] = 16'h7d99;
      expv[3] = 16'he3f2;
      expv[4] = 16'hf1e2;
      expv[5] = 16'h8a71;
      expv[6] = 16'he5c7;
      expv[7] = 16'h4179;
      expv[8] = 16'h4a7c;
      expv[9] = 16'h689f;
      expv[10] = 16'hfced;
      expv[11] = 16'h7c1c;
      expv[12] = 16'h4ee6;
      expv[13] = 16'h6cb0;
      expv[14] = 16'h8805;
      expv[15] = 16'hfd3e;
      expv[16] = 16'h6ea8;
      expv[17] = 16'h0b3e;
      expv[18] = 16'h06d2;
      expv[19] = 16'h8b4e;
      expv[20] = 16'h5107;
      expv[21] = 16'h450d;
      expv[22] = 16'h1def;
      expv[23] = 16'hf505;
      expv[24] = 16'h5626;
      expv[25] = 16'h0151;
      expv[26] = 16'hb312;
      expv[27] = 16'hf42c;
      expv[28] = 16'h62b1;
      expv[29] = 16'h0335;
      expv[30] = 16'h91a3;
      expv[31] = 16'h7208;
      expv[32] = 16'hc36b;
      expv[33] = 16'hbad0;
      expv[34] = 16'hf7e5;
      expv[35] = 16'h663b;
      expv[36] = 16'h6517;
      expv[37] = 16'h4852;
      expv[38] = 16'hb813;
      expv[39] = 16'h65f7;
      expv[40] = 16'h77e4;
      expv[41] = 16'hb27a;
      expv[42] = 16'h093f;
      expv[43] = 16'h7da4;
      expv[44] = 16'hd296;
      expv[45] = 16'h447c;
      expv[46] = 16'h9e4f;
      expv[47] = 16'hd5ce;
      expv[48] = 16'hf76c;
      expv[49] = 16'hefd8;
      expv[50] = 16'h67c0;
      expv[51] = 16'h3b43;
      expv[52] = 16'h6230;
      expv[53] = 16'ha347;
      expv[54] = 16'h667e;
      expv[55] = 16'h522f;
      expv[56] = 16'h9ba4;
      expv[57] = 16'h1ea0;
      expv[58] = 16'heb3d;
      expv[59] = 16'ha71b;
      expv[60] = 16'h62b7;
      expv[61] = 16'h0ab0;
      expv[62] = 16'h04fd;
      expv[63] = 16'he1a5;
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
