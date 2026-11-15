// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01114 dut (
    .clock(clk),
    .d(in_vec[25:18]),
    .y(in_vec[17:2]),
    .enable(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .done_errorcheck(out_vec[16:16]),
    .z(out_vec[15:8]),
    .e(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h1309ab3;
    stim[1] = 26'h23d2437;
    stim[2] = 26'h04f316a;
    stim[3] = 26'h2a64818;
    stim[4] = 26'h14ba74a;
    stim[5] = 26'h198b970;
    stim[6] = 26'h2a509c6;
    stim[7] = 26'h2212894;
    stim[8] = 26'h29d7774;
    stim[9] = 26'h0c7ac58;
    stim[10] = 26'h09cd584;
    stim[11] = 26'h040f954;
    stim[12] = 26'h1ebdba4;
    stim[13] = 26'h1f59328;
    stim[14] = 26'h25e5e8a;
    stim[15] = 26'h2a971a6;
    stim[16] = 26'h32a6f96;
    stim[17] = 26'h216c354;
    stim[18] = 26'h00e13dc;
    stim[19] = 26'h0ed5ca8;
    stim[20] = 26'h0434662;
    stim[21] = 26'h03d026c;
    stim[22] = 26'h219d1b0;
    stim[23] = 26'h18d39fe;
    stim[24] = 26'h152d1b6;
    stim[25] = 26'h3aad4b0;
    stim[26] = 26'h38bec78;
    stim[27] = 26'h2194f1e;
    stim[28] = 26'h3d3f312;
    stim[29] = 26'h0a9e822;
    stim[30] = 26'h3f7665a;
    stim[31] = 26'h11c74de;
    stim[32] = 26'h0632720;
    stim[33] = 26'h0e632e8;
    stim[34] = 26'h0c8231c;
    stim[35] = 26'h1850192;
    stim[36] = 26'h3a8cebc;
    stim[37] = 26'h2e5b532;
    stim[38] = 26'h0e3ab1a;
    stim[39] = 26'h0d54ea8;
    stim[40] = 26'h293f00a;
    stim[41] = 26'h2a4ed46;
    stim[42] = 26'h3fe7202;
    stim[43] = 26'h3925910;
    stim[44] = 26'h38a8bf6;
    stim[45] = 26'h2c0bdac;
    stim[46] = 26'h2912e18;
    stim[47] = 26'h01dcce6;
    stim[48] = 26'h39ff07a;
    stim[49] = 26'h15e529c;
    stim[50] = 26'h1c89c50;
    stim[51] = 26'h244b58c;
    stim[52] = 26'h20299f0;
    stim[53] = 26'h3addc7c;
    stim[54] = 26'h2d21652;
    stim[55] = 26'h2b29988;
    stim[56] = 26'h35397fa;
    stim[57] = 26'h06445d0;
    stim[58] = 26'h244602c;
    stim[59] = 26'h2b0d3ea;
    stim[60] = 26'h2ce87e2;
    stim[61] = 26'h079df46;
    stim[62] = 26'h1d7eee2;
    stim[63] = 26'h3b3262a;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h113df;
      expv[4] = 17'h113df;
      expv[5] = 17'h1523b;
      expv[6] = 17'h1523b;
      expv[7] = 17'h1a9eb;
      expv[8] = 17'h1a9eb;
      expv[9] = 17'h1a9eb;
      expv[10] = 17'h1a9eb;
      expv[11] = 17'h1a9eb;
      expv[12] = 17'h1a9eb;
      expv[13] = 17'h1a9eb;
      expv[14] = 17'h1a9eb;
      expv[15] = 17'h1972e;
      expv[16] = 17'h1aa06;
      expv[17] = 17'h1ca65;
      expv[18] = 17'h1ca65;
      expv[19] = 17'h1ca65;
      expv[20] = 17'h1ca65;
      expv[21] = 17'h110e1;
      expv[22] = 17'h110e1;
      expv[23] = 17'h110e1;
      expv[24] = 17'h163b1;
      expv[25] = 17'h15408;
      expv[26] = 17'h15408;
      expv[27] = 17'h15408;
      expv[28] = 17'h186d9;
      expv[29] = 17'h1f4f0;
      expv[30] = 17'h12aa4;
      expv[31] = 17'h1fdd6;
      expv[32] = 17'h14764;
      expv[33] = 17'h14764;
      expv[34] = 17'h14764;
      expv[35] = 17'h14764;
      expv[36] = 17'h161a1;
      expv[37] = 17'h161a1;
      expv[38] = 17'h1b926;
      expv[39] = 17'h13822;
      expv[40] = 17'h13822;
      expv[41] = 17'h1a4a0;
      expv[42] = 17'h1a9e4;
      expv[43] = 17'h1ff9b;
      expv[44] = 17'h1ff9b;
      expv[45] = 17'h1e284;
      expv[46] = 17'h1e284;
      expv[47] = 17'h1e284;
      expv[48] = 17'h1077a;
      expv[49] = 17'h1e7e3;
      expv[50] = 17'h1e7e3;
      expv[51] = 17'h1e7e3;
      expv[52] = 17'h1e7e3;
      expv[53] = 17'h1e7e3;
      expv[54] = 17'h1e7e3;
      expv[55] = 17'h1b439;
      expv[56] = 17'h1b439;
      expv[57] = 17'h1d4b9;
      expv[58] = 17'h1d4b9;
      expv[59] = 17'h1d4b9;
      expv[60] = 17'h1ace0;
      expv[61] = 17'h1b354;
      expv[62] = 17'h11e95;
      expv[63] = 17'h17570;
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
