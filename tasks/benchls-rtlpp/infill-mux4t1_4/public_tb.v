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

  MUX4T1_4 dut (
    .I0(in_vec[17:14]),
    .I1(in_vec[13:10]),
    .I2(in_vec[9:6]),
    .I3(in_vec[5:2]),
    .s(in_vec[1:0]),
    .o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h39128;
    stim[1] = 18'h3d755;
    stim[2] = 18'h2aeea;
    stim[3] = 18'h22a06;
    stim[4] = 18'h2efab;
    stim[5] = 18'h19eb7;
    stim[6] = 18'h288c6;
    stim[7] = 18'h1aff6;
    stim[8] = 18'h005ae;
    stim[9] = 18'h19528;
    stim[10] = 18'h308b1;
    stim[11] = 18'h32a58;
    stim[12] = 18'h1e295;
    stim[13] = 18'h2660b;
    stim[14] = 18'h384dd;
    stim[15] = 18'h0699f;
    stim[16] = 18'h3532e;
    stim[17] = 18'h170f2;
    stim[18] = 18'h0ed44;
    stim[19] = 18'h183e4;
    stim[20] = 18'h167b7;
    stim[21] = 18'h1bd2a;
    stim[22] = 18'h15165;
    stim[23] = 18'h3eaa9;
    stim[24] = 18'h22501;
    stim[25] = 18'h199ac;
    stim[26] = 18'h23d1d;
    stim[27] = 18'h321ba;
    stim[28] = 18'h2909c;
    stim[29] = 18'h2eee5;
    stim[30] = 18'h16aba;
    stim[31] = 18'h30230;
    stim[32] = 18'h07f99;
    stim[33] = 18'h1700a;
    stim[34] = 18'h162f1;
    stim[35] = 18'h19f3b;
    stim[36] = 18'h1e505;
    stim[37] = 18'h092e6;
    stim[38] = 18'h0f955;
    stim[39] = 18'h22009;
    stim[40] = 18'h2549e;
    stim[41] = 18'h22020;
    stim[42] = 18'h2fdb2;
    stim[43] = 18'h17b9a;
    stim[44] = 18'h38222;
    stim[45] = 18'h33663;
    stim[46] = 18'h0edcc;
    stim[47] = 18'h3f812;
    stim[48] = 18'h195c4;
    stim[49] = 18'h36496;
    stim[50] = 18'h18f3f;
    stim[51] = 18'h062b5;
    stim[52] = 18'h0733e;
    stim[53] = 18'h1b646;
    stim[54] = 18'h2883a;
    stim[55] = 18'h2aed2;
    stim[56] = 18'h3c2ce;
    stim[57] = 18'h29628;
    stim[58] = 18'h1bf96;
    stim[59] = 18'h2b268;
    stim[60] = 18'h3bf35;
    stim[61] = 18'h2d9f8;
    stim[62] = 18'h365ef;
    stim[63] = 18'h371c4;
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
      expv[0] = 4'he;
      expv[1] = 4'h5;
      expv[2] = 4'hb;
      expv[3] = 4'h8;
      expv[4] = 4'ha;
      expv[5] = 4'hd;
      expv[6] = 4'h3;
      expv[7] = 4'hf;
      expv[8] = 4'h6;
      expv[9] = 4'h6;
      expv[10] = 4'h2;
      expv[11] = 4'hc;
      expv[12] = 4'h8;
      expv[13] = 4'h2;
      expv[14] = 4'h1;
      expv[15] = 4'h7;
      expv[16] = 4'hc;
      expv[17] = 4'h3;
      expv[18] = 4'h3;
      expv[19] = 4'h6;
      expv[20] = 4'hd;
      expv[21] = 4'h4;
      expv[22] = 4'h4;
      expv[23] = 4'ha;
      expv[24] = 4'h9;
      expv[25] = 4'h6;
      expv[26] = 4'hf;
      expv[27] = 4'h6;
      expv[28] = 4'ha;
      expv[29] = 4'hb;
      expv[30] = 4'ha;
      expv[31] = 4'hc;
      expv[32] = 4'hf;
      expv[33] = 4'h0;
      expv[34] = 4'h8;
      expv[35] = 4'he;
      expv[36] = 4'h9;
      expv[37] = 4'hb;
      expv[38] = 4'he;
      expv[39] = 4'h8;
      expv[40] = 4'h2;
      expv[41] = 4'h8;
      expv[42] = 4'h6;
      expv[43] = 4'he;
      expv[44] = 4'h8;
      expv[45] = 4'h8;
      expv[46] = 4'h3;
      expv[47] = 4'h0;
      expv[48] = 4'h6;
      expv[49] = 4'h2;
      expv[50] = 4'hf;
      expv[51] = 4'h8;
      expv[52] = 4'hc;
      expv[53] = 4'h9;
      expv[54] = 4'h0;
      expv[55] = 4'hb;
      expv[56] = 4'hb;
      expv[57] = 4'ha;
      expv[58] = 4'he;
      expv[59] = 4'ha;
      expv[60] = 4'hf;
      expv[61] = 4'hb;
      expv[62] = 4'hb;
      expv[63] = 4'hd;
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
