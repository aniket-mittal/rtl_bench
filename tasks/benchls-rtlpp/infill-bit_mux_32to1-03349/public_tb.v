// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03349 dut (
    .selector(in_vec[36:32]),
    .data_input(in_vec[31:0]),
    .selected_output(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h005ea3caca;
    stim[1] = 37'h181c0fafd4;
    stim[2] = 37'h127875cb4f;
    stim[3] = 37'h0a87dc5705;
    stim[4] = 37'h1e4273b59e;
    stim[5] = 37'h041ae13063;
    stim[6] = 37'h06b31b9f15;
    stim[7] = 37'h19f9eeaac2;
    stim[8] = 37'h00c8688244;
    stim[9] = 37'h1a31c4f2bb;
    stim[10] = 37'h0584ed6fbf;
    stim[11] = 37'h04f8f94367;
    stim[12] = 37'h1a4f3a429d;
    stim[13] = 37'h070bc55daf;
    stim[14] = 37'h111fc1b5a9;
    stim[15] = 37'h0a458a7472;
    stim[16] = 37'h1cdf661281;
    stim[17] = 37'h1c2d393dfb;
    stim[18] = 37'h143215fd00;
    stim[19] = 37'h1c45f893c5;
    stim[20] = 37'h0b2049d65e;
    stim[21] = 37'h0113c79c02;
    stim[22] = 37'h05fa70f414;
    stim[23] = 37'h1aebfb4e3a;
    stim[24] = 37'h1a46324763;
    stim[25] = 37'h15edc637d4;
    stim[26] = 37'h1f514dc90d;
    stim[27] = 37'h15e16c80f7;
    stim[28] = 37'h015d07ce4c;
    stim[29] = 37'h1177011c54;
    stim[30] = 37'h136f1caf85;
    stim[31] = 37'h07075c329f;
    stim[32] = 37'h0a1f665d66;
    stim[33] = 37'h0686907015;
    stim[34] = 37'h14374bb9f4;
    stim[35] = 37'h06c1c6d756;
    stim[36] = 37'h15eeab019b;
    stim[37] = 37'h100c802b58;
    stim[38] = 37'h1ed4472521;
    stim[39] = 37'h0437cd708c;
    stim[40] = 37'h1ebc9843a3;
    stim[41] = 37'h11bf489772;
    stim[42] = 37'h0435799c07;
    stim[43] = 37'h18c073fb5a;
    stim[44] = 37'h02ab4bddab;
    stim[45] = 37'h1ad03ae606;
    stim[46] = 37'h168dfe005f;
    stim[47] = 37'h1859ad984c;
    stim[48] = 37'h002ef2a68b;
    stim[49] = 37'h00d45beb7a;
    stim[50] = 37'h1eecfbc5d7;
    stim[51] = 37'h033078ece2;
    stim[52] = 37'h00eba2236f;
    stim[53] = 37'h0442dfd14b;
    stim[54] = 37'h1a4480aa5d;
    stim[55] = 37'h1fb1842f13;
    stim[56] = 37'h0da988d332;
    stim[57] = 37'h05ecad361c;
    stim[58] = 37'h19a07e095b;
    stim[59] = 37'h08a6ab483b;
    stim[60] = 37'h04e5e4c694;
    stim[61] = 37'h0a4335dd97;
    stim[62] = 37'h0b8bbc472c;
    stim[63] = 37'h0ee760f978;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
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
