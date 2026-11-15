// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061837 dut (
    .a1(in_vec[10:6]),
    .a2(in_vec[5:1]),
    .s(in_vec[0:0]),
    .res(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h1bb;
    stim[1] = 11'h33e;
    stim[2] = 11'h3ae;
    stim[3] = 11'h646;
    stim[4] = 11'h536;
    stim[5] = 11'h66d;
    stim[6] = 11'h6ac;
    stim[7] = 11'h4ad;
    stim[8] = 11'h26d;
    stim[9] = 11'h064;
    stim[10] = 11'h269;
    stim[11] = 11'h567;
    stim[12] = 11'h37c;
    stim[13] = 11'h2d4;
    stim[14] = 11'h19c;
    stim[15] = 11'h7b5;
    stim[16] = 11'h73d;
    stim[17] = 11'h0d3;
    stim[18] = 11'h151;
    stim[19] = 11'h54d;
    stim[20] = 11'h625;
    stim[21] = 11'h6bd;
    stim[22] = 11'h6e5;
    stim[23] = 11'h5af;
    stim[24] = 11'h1a8;
    stim[25] = 11'h7ea;
    stim[26] = 11'h2b7;
    stim[27] = 11'h48a;
    stim[28] = 11'h6df;
    stim[29] = 11'h7c6;
    stim[30] = 11'h69e;
    stim[31] = 11'h251;
    stim[32] = 11'h07a;
    stim[33] = 11'h220;
    stim[34] = 11'h6d7;
    stim[35] = 11'h4aa;
    stim[36] = 11'h033;
    stim[37] = 11'h347;
    stim[38] = 11'h0a1;
    stim[39] = 11'h0fb;
    stim[40] = 11'h024;
    stim[41] = 11'h0d2;
    stim[42] = 11'h0c6;
    stim[43] = 11'h2d1;
    stim[44] = 11'h799;
    stim[45] = 11'h345;
    stim[46] = 11'h4f3;
    stim[47] = 11'h54d;
    stim[48] = 11'h2b7;
    stim[49] = 11'h5eb;
    stim[50] = 11'h668;
    stim[51] = 11'h6cd;
    stim[52] = 11'h0fd;
    stim[53] = 11'h40a;
    stim[54] = 11'h600;
    stim[55] = 11'h4ad;
    stim[56] = 11'h46d;
    stim[57] = 11'h39d;
    stim[58] = 11'h2fb;
    stim[59] = 11'h745;
    stim[60] = 11'h3ec;
    stim[61] = 11'h1ba;
    stim[62] = 11'h0b6;
    stim[63] = 11'h131;
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
      expv[0] = 5'h1d;
      expv[1] = 5'h0c;
      expv[2] = 5'h0e;
      expv[3] = 5'h19;
      expv[4] = 5'h14;
      expv[5] = 5'h16;
      expv[6] = 5'h1a;
      expv[7] = 5'h16;
      expv[8] = 5'h16;
      expv[9] = 5'h01;
      expv[10] = 5'h14;
      expv[11] = 5'h13;
      expv[12] = 5'h0d;
      expv[13] = 5'h0b;
      expv[14] = 5'h06;
      expv[15] = 5'h1a;
      expv[16] = 5'h1e;
      expv[17] = 5'h09;
      expv[18] = 5'h08;
      expv[19] = 5'h06;
      expv[20] = 5'h12;
      expv[21] = 5'h1e;
      expv[22] = 5'h12;
      expv[23] = 5'h17;
      expv[24] = 5'h06;
      expv[25] = 5'h1f;
      expv[26] = 5'h1b;
      expv[27] = 5'h12;
      expv[28] = 5'h0f;
      expv[29] = 5'h1f;
      expv[30] = 5'h1a;
      expv[31] = 5'h08;
      expv[32] = 5'h01;
      expv[33] = 5'h08;
      expv[34] = 5'h0b;
      expv[35] = 5'h12;
      expv[36] = 5'h19;
      expv[37] = 5'h03;
      expv[38] = 5'h10;
      expv[39] = 5'h1d;
      expv[40] = 5'h00;
      expv[41] = 5'h03;
      expv[42] = 5'h03;
      expv[43] = 5'h08;
      expv[44] = 5'h0c;
      expv[45] = 5'h02;
      expv[46] = 5'h19;
      expv[47] = 5'h06;
      expv[48] = 5'h1b;
      expv[49] = 5'h15;
      expv[50] = 5'h19;
      expv[51] = 5'h06;
      expv[52] = 5'h1e;
      expv[53] = 5'h10;
      expv[54] = 5'h18;
      expv[55] = 5'h16;
      expv[56] = 5'h16;
      expv[57] = 5'h0e;
      expv[58] = 5'h1d;
      expv[59] = 5'h02;
      expv[60] = 5'h0f;
      expv[61] = 5'h06;
      expv[62] = 5'h02;
      expv[63] = 5'h18;
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
