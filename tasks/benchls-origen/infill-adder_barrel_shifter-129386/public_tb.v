// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129386 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .input_a(in_vec[18:15]),
    .input_b(in_vec[14:11]),
    .input_select(in_vec[10:10]),
    .shift_enable(in_vec[9:9]),
    .shift_direction(in_vec[8:8]),
    .bit_select(in_vec[7:0]),
    .result(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h9689a;
    stim[1] = 20'hea1be;
    stim[2] = 20'h2d920;
    stim[3] = 20'h13088;
    stim[4] = 20'h2f590;
    stim[5] = 20'h022fa;
    stim[6] = 20'h6f670;
    stim[7] = 20'h41b92;
    stim[8] = 20'h78a35;
    stim[9] = 20'h05002;
    stim[10] = 20'h5a864;
    stim[11] = 20'h49729;
    stim[12] = 20'h18618;
    stim[13] = 20'h06655;
    stim[14] = 20'h77086;
    stim[15] = 20'h6b2cf;
    stim[16] = 20'h0fbf2;
    stim[17] = 20'h17669;
    stim[18] = 20'h567a0;
    stim[19] = 20'h366b5;
    stim[20] = 20'h1f2ba;
    stim[21] = 20'h0636b;
    stim[22] = 20'h0247e;
    stim[23] = 20'h3a672;
    stim[24] = 20'h45286;
    stim[25] = 20'h3670d;
    stim[26] = 20'h24ac9;
    stim[27] = 20'h77741;
    stim[28] = 20'hda737;
    stim[29] = 20'h63a8a;
    stim[30] = 20'h77dcc;
    stim[31] = 20'h41fbe;
    stim[32] = 20'h73904;
    stim[33] = 20'hf3968;
    stim[34] = 20'h1c5f5;
    stim[35] = 20'h69d71;
    stim[36] = 20'h20a9a;
    stim[37] = 20'h5ef84;
    stim[38] = 20'h0172a;
    stim[39] = 20'h7e838;
    stim[40] = 20'h12bce;
    stim[41] = 20'h0fbc1;
    stim[42] = 20'h74db3;
    stim[43] = 20'h38c35;
    stim[44] = 20'h5eec4;
    stim[45] = 20'h0fe34;
    stim[46] = 20'h00ee7;
    stim[47] = 20'h66beb;
    stim[48] = 20'h5f5d5;
    stim[49] = 20'h020e6;
    stim[50] = 20'h5f0b8;
    stim[51] = 20'h5d119;
    stim[52] = 20'h4959f;
    stim[53] = 20'h697c0;
    stim[54] = 20'h571a4;
    stim[55] = 20'h5b5ef;
    stim[56] = 20'h65284;
    stim[57] = 20'h1219b;
    stim[58] = 20'h3340c;
    stim[59] = 20'h5c8aa;
    stim[60] = 20'h17586;
    stim[61] = 20'h6ca25;
    stim[62] = 20'h2926a;
    stim[63] = 20'h49e17;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
