// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  srl16x16e dut (
    .clk(clk),
    .d(in_vec[20:5]),
    .a(in_vec[4:1]),
    .ce(in_vec[0:0]),
    .y(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1d77cc;
    stim[1] = 21'h064c52;
    stim[2] = 21'h150270;
    stim[3] = 21'h018d95;
    stim[4] = 21'h12fed5;
    stim[5] = 21'h07958a;
    stim[6] = 21'h138d45;
    stim[7] = 21'h18e15b;
    stim[8] = 21'h0cd82d;
    stim[9] = 21'h0c48f3;
    stim[10] = 21'h036a32;
    stim[11] = 21'h1ee9dd;
    stim[12] = 21'h0e049d;
    stim[13] = 21'h0c78b6;
    stim[14] = 21'h19665c;
    stim[15] = 21'h13edd4;
    stim[16] = 21'h125f5f;
    stim[17] = 21'h17e435;
    stim[18] = 21'h1753b4;
    stim[19] = 21'h06fb96;
    stim[20] = 21'h18b0ca;
    stim[21] = 21'h010f4c;
    stim[22] = 21'h118f70;
    stim[23] = 21'h1a6ab8;
    stim[24] = 21'h0aae79;
    stim[25] = 21'h174193;
    stim[26] = 21'h1e6731;
    stim[27] = 21'h1c199c;
    stim[28] = 21'h081e93;
    stim[29] = 21'h108864;
    stim[30] = 21'h1d3593;
    stim[31] = 21'h1ba971;
    stim[32] = 21'h17d17e;
    stim[33] = 21'h19d1af;
    stim[34] = 21'h0983be;
    stim[35] = 21'h0a28cc;
    stim[36] = 21'h0d359b;
    stim[37] = 21'h0b9383;
    stim[38] = 21'h112b5d;
    stim[39] = 21'h196602;
    stim[40] = 21'h07d0dd;
    stim[41] = 21'h062bc2;
    stim[42] = 21'h132a36;
    stim[43] = 21'h042d5e;
    stim[44] = 21'h1e6dc8;
    stim[45] = 21'h051fda;
    stim[46] = 21'h194453;
    stim[47] = 21'h189660;
    stim[48] = 21'h0dc9c2;
    stim[49] = 21'h0205fa;
    stim[50] = 21'h1453bf;
    stim[51] = 21'h010d9e;
    stim[52] = 21'h199503;
    stim[53] = 21'h1d55cf;
    stim[54] = 21'h081878;
    stim[55] = 21'h12a4bb;
    stim[56] = 21'h143240;
    stim[57] = 21'h1572ec;
    stim[58] = 21'h10501e;
    stim[59] = 21'h13bde3;
    stim[60] = 21'h08a752;
    stim[61] = 21'h050b33;
    stim[62] = 21'h0ee385;
    stim[63] = 21'h0aca0e;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'h66c1;
      expv[21] = 16'hc70a;
      expv[22] = 16'h97f6;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'h97f6;
      expv[26] = 16'hc70a;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hc70a;
      expv[29] = 16'hba0c;
      expv[30] = 16'h66c1;
      expv[31] = 16'hf74e;
      expv[32] = 16'h0c6c;
      expv[33] = 16'h92fa;
      expv[34] = 16'h97f6;
      expv[35] = 16'h5573;
      expv[36] = 16'hc70a;
      expv[37] = 16'hce8d;
      expv[38] = 16'h66c1;
      expv[39] = 16'h5c9c;
      expv[40] = 16'h6247;
      expv[41] = 16'h895a;
      expv[42] = 16'hbf21;
      expv[43] = 16'h6247;
      expv[44] = 16'hce8d;
      expv[45] = 16'h7024;
      expv[46] = 16'hba0c;
      expv[47] = 16'hca22;
      expv[48] = 16'h3e86;
      expv[49] = 16'h92fa;
      expv[50] = 16'hf74e;
      expv[51] = 16'h7024;
      expv[52] = 16'hca22;
      expv[53] = 16'hce8d;
      expv[54] = 16'hf339;
      expv[55] = 16'hba0c;
      expv[56] = 16'h9525;
      expv[57] = 16'h895a;
      expv[58] = 16'h5573;
      expv[59] = 16'heaae;
      expv[60] = 16'h69ac;
      expv[61] = 16'h69ac;
      expv[62] = 16'h9525;
      expv[63] = 16'hca22;
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
