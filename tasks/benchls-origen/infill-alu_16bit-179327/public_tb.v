// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_179327 dut (
    .A(in_vec[35:20]),
    .B(in_vec[19:4]),
    .ICNT(in_vec[3:0]),
    .OUT(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hb3d6a2186;
    stim[1] = 36'hb4e15142c;
    stim[2] = 36'h467399234;
    stim[3] = 36'he534898eb;
    stim[4] = 36'hf9710233f;
    stim[5] = 36'hb5b14efda;
    stim[6] = 36'hcabd94c9d;
    stim[7] = 36'h0d248a67b;
    stim[8] = 36'h3d5308b26;
    stim[9] = 36'hb1cceeb05;
    stim[10] = 36'h8a0dc89ac;
    stim[11] = 36'hbd314389e;
    stim[12] = 36'h1ac0e0716;
    stim[13] = 36'h6a560e903;
    stim[14] = 36'hb2deaaaee;
    stim[15] = 36'h9c1892098;
    stim[16] = 36'habb54fcaf;
    stim[17] = 36'h158dce9ba;
    stim[18] = 36'hbc77c31df;
    stim[19] = 36'h02443eefe;
    stim[20] = 36'h234517857;
    stim[21] = 36'h838fbd390;
    stim[22] = 36'ha2ed3acfb;
    stim[23] = 36'h65f3eb741;
    stim[24] = 36'h8b98a7fa7;
    stim[25] = 36'hf8ddfab2d;
    stim[26] = 36'ha30a73984;
    stim[27] = 36'h004572fad;
    stim[28] = 36'h26ae23355;
    stim[29] = 36'h862f96d16;
    stim[30] = 36'h8606ec4c1;
    stim[31] = 36'h95b778ce0;
    stim[32] = 36'he48d20ef1;
    stim[33] = 36'had3b70995;
    stim[34] = 36'h3d3b0fd7e;
    stim[35] = 36'h746fd00c6;
    stim[36] = 36'h3ebe20b0c;
    stim[37] = 36'h7fff548eb;
    stim[38] = 36'hdca84c676;
    stim[39] = 36'h244ab2f99;
    stim[40] = 36'h6a67f91d4;
    stim[41] = 36'hc70337b0e;
    stim[42] = 36'hff48952aa;
    stim[43] = 36'h8237ea6b7;
    stim[44] = 36'h4017ef5c8;
    stim[45] = 36'h2b0555c92;
    stim[46] = 36'hc3791f28b;
    stim[47] = 36'hb854668b0;
    stim[48] = 36'h8c26900cd;
    stim[49] = 36'h5ab9de872;
    stim[50] = 36'h24a43c333;
    stim[51] = 36'hb9c59abe5;
    stim[52] = 36'h848219e9b;
    stim[53] = 36'hadfdba757;
    stim[54] = 36'hf81e98417;
    stim[55] = 36'ha8a01b23d;
    stim[56] = 36'h089f93c08;
    stim[57] = 36'h6d133e9c8;
    stim[58] = 36'h648f4c299;
    stim[59] = 36'h5dcd99bbf;
    stim[60] = 36'hbed112608;
    stim[61] = 36'hc4227d693;
    stim[62] = 36'hf508f6caa;
    stim[63] = 36'h83e6fdaf5;
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
      expv[13] = 16'h6ed6;
      expv[14] = 16'h6ed6;
      expv[15] = 16'h6ed6;
      expv[16] = 16'h6ed6;
      expv[17] = 16'h6ed6;
      expv[18] = 16'h6ed6;
      expv[19] = 16'h6ed6;
      expv[20] = 16'h6ed6;
      expv[21] = 16'h40c8;
      expv[22] = 16'h40c8;
      expv[23] = 16'h7a7f;
      expv[24] = 16'h7a7f;
      expv[25] = 16'h7a7f;
      expv[26] = 16'h7a7f;
      expv[27] = 16'h7a7f;
      expv[28] = 16'h7a7f;
      expv[29] = 16'h7a7f;
      expv[30] = 16'h99ba;
      expv[31] = 16'h0e85;
      expv[32] = 16'hc39e;
      expv[33] = 16'hc39e;
      expv[34] = 16'hc39e;
      expv[35] = 16'hc39e;
      expv[36] = 16'hc39e;
      expv[37] = 16'hc39e;
      expv[38] = 16'hc39e;
      expv[39] = 16'hc39e;
      expv[40] = 16'hc39e;
      expv[41] = 16'hc39e;
      expv[42] = 16'hc39e;
      expv[43] = 16'hc39e;
      expv[44] = 16'hc39e;
      expv[45] = 16'h0101;
      expv[46] = 16'h0101;
      expv[47] = 16'h1edf;
      expv[48] = 16'h1edf;
      expv[49] = 16'h5a81;
      expv[50] = 16'h3cb7;
      expv[51] = 16'h3cb7;
      expv[52] = 16'h3cb7;
      expv[53] = 16'h3cb7;
      expv[54] = 16'h3cb7;
      expv[55] = 16'h3cb7;
      expv[56] = 16'h3cb7;
      expv[57] = 16'h3cb7;
      expv[58] = 16'h3cb7;
      expv[59] = 16'h3cb7;
      expv[60] = 16'h3cb7;
      expv[61] = 16'hfd6b;
      expv[62] = 16'hfd6b;
      expv[63] = 16'hfd6b;
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
