// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07292 dut (
    .d1(in_vec[17:14]),
    .d2(in_vec[13:10]),
    .d3(in_vec[9:6]),
    .d4(in_vec[5:2]),
    .control(in_vec[1:0]),
    .digit(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h1acbb;
    stim[1] = 18'h1f650;
    stim[2] = 18'h28107;
    stim[3] = 18'h06173;
    stim[4] = 18'h188c7;
    stim[5] = 18'h09196;
    stim[6] = 18'h13634;
    stim[7] = 18'h0029f;
    stim[8] = 18'h3e6d6;
    stim[9] = 18'h31b14;
    stim[10] = 18'h10950;
    stim[11] = 18'h1cb9a;
    stim[12] = 18'h225e9;
    stim[13] = 18'h2c531;
    stim[14] = 18'h33e18;
    stim[15] = 18'h26ba1;
    stim[16] = 18'h3e0f3;
    stim[17] = 18'h273d9;
    stim[18] = 18'h37c9a;
    stim[19] = 18'h3607f;
    stim[20] = 18'h3ec01;
    stim[21] = 18'h203bf;
    stim[22] = 18'h2daa6;
    stim[23] = 18'h09d5b;
    stim[24] = 18'h21d8d;
    stim[25] = 18'h0dbf9;
    stim[26] = 18'h19332;
    stim[27] = 18'h05272;
    stim[28] = 18'h3bffc;
    stim[29] = 18'h13f3c;
    stim[30] = 18'h38634;
    stim[31] = 18'h052b4;
    stim[32] = 18'h07767;
    stim[33] = 18'h17970;
    stim[34] = 18'h3848f;
    stim[35] = 18'h1f305;
    stim[36] = 18'h0d561;
    stim[37] = 18'h38f20;
    stim[38] = 18'h31aff;
    stim[39] = 18'h06722;
    stim[40] = 18'h3f5fb;
    stim[41] = 18'h1dddc;
    stim[42] = 18'h2983e;
    stim[43] = 18'h1cbb8;
    stim[44] = 18'h2b0e1;
    stim[45] = 18'h3758a;
    stim[46] = 18'h218cc;
    stim[47] = 18'h343cf;
    stim[48] = 18'h376ca;
    stim[49] = 18'h07841;
    stim[50] = 18'h33358;
    stim[51] = 18'h375cc;
    stim[52] = 18'h33127;
    stim[53] = 18'h1bf5e;
    stim[54] = 18'h15fc1;
    stim[55] = 18'h39384;
    stim[56] = 18'h19fff;
    stim[57] = 18'h0ffbe;
    stim[58] = 18'h1d10a;
    stim[59] = 18'h01e36;
    stim[60] = 18'h16ec9;
    stim[61] = 18'h0da71;
    stim[62] = 18'h11c69;
    stim[63] = 18'h29fa2;
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
      expv[0] = 4'h6;
      expv[1] = 4'h4;
      expv[2] = 4'ha;
      expv[3] = 4'h1;
      expv[4] = 4'h6;
      expv[5] = 4'h4;
      expv[6] = 4'hd;
      expv[7] = 4'h0;
      expv[8] = 4'h9;
      expv[9] = 4'h5;
      expv[10] = 4'h4;
      expv[11] = 4'h2;
      expv[12] = 4'h7;
      expv[13] = 4'h4;
      expv[14] = 4'h6;
      expv[15] = 4'he;
      expv[16] = 4'hf;
      expv[17] = 4'hf;
      expv[18] = 4'hf;
      expv[19] = 4'hd;
      expv[20] = 4'h0;
      expv[21] = 4'h8;
      expv[22] = 4'h6;
      expv[23] = 4'h2;
      expv[24] = 4'h6;
      expv[25] = 4'hf;
      expv[26] = 4'h4;
      expv[27] = 4'h4;
      expv[28] = 4'hf;
      expv[29] = 4'hf;
      expv[30] = 4'hd;
      expv[31] = 4'hd;
      expv[32] = 4'h1;
      expv[33] = 4'hc;
      expv[34] = 4'he;
      expv[35] = 4'hc;
      expv[36] = 4'h5;
      expv[37] = 4'h8;
      expv[38] = 4'hc;
      expv[39] = 4'h9;
      expv[40] = 4'hf;
      expv[41] = 4'h7;
      expv[42] = 4'h6;
      expv[43] = 4'he;
      expv[44] = 4'h3;
      expv[45] = 4'hd;
      expv[46] = 4'h3;
      expv[47] = 4'hd;
      expv[48] = 4'hd;
      expv[49] = 4'h1;
      expv[50] = 4'h6;
      expv[51] = 4'h3;
      expv[52] = 4'hc;
      expv[53] = 4'hf;
      expv[54] = 4'hf;
      expv[55] = 4'h1;
      expv[56] = 4'h6;
      expv[57] = 4'hf;
      expv[58] = 4'h4;
      expv[59] = 4'h7;
      expv[60] = 4'hb;
      expv[61] = 4'h9;
      expv[62] = 4'h1;
      expv[63] = 4'h7;
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
