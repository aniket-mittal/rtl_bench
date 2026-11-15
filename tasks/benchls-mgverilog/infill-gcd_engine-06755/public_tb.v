// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06755 dut (
    .CLK(clk),
    .nRST(in_vec[66:66]),
    .request$say__ENA(in_vec[65:65]),
    .request$say$va(in_vec[64:33]),
    .request$say$vb(in_vec[32:1]),
    .indication$gcd__RDY(in_vec[0:0]),
    .request$say__RDY(out_vec[33:33]),
    .indication$gcd__ENA(out_vec[32:32]),
    .indication$gcd$v(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h6fb0d01c113931a34;
    stim[1] = 67'h53ce453b2b48cdc3a;
    stim[2] = 67'h176f5408be5c4261d;
    stim[3] = 67'h3c73ca98eaa1869b1;
    stim[4] = 67'h267fa8df9f12718de;
    stim[5] = 67'h15e7ee29e682ff9fb;
    stim[6] = 67'h1fea74a95f7f7f688;
    stim[7] = 67'h0883f351b8c29178d;
    stim[8] = 67'h321cadd3e3b6a69e7;
    stim[9] = 67'h25ee90f1d6cb25e60;
    stim[10] = 67'h2a9235ace23da750e;
    stim[11] = 67'h144cfc257b7717536;
    stim[12] = 67'h022f5d1189382a4c8;
    stim[13] = 67'h3962ec5264269e57b;
    stim[14] = 67'h305f06ec71347b90c;
    stim[15] = 67'h2cb1a1bf2032469e2;
    stim[16] = 67'h0f12843751f099518;
    stim[17] = 67'h13c6edff9edb0949d;
    stim[18] = 67'h29d26639e97ee9a96;
    stim[19] = 67'h0496aa65604219660;
    stim[20] = 67'h13334698307de84ee;
    stim[21] = 67'h0b849758b2d0e48f5;
    stim[22] = 67'h3c87f56cc403f6624;
    stim[23] = 67'h1980e0d5794b81e7a;
    stim[24] = 67'h2c520e0e15454c3ec;
    stim[25] = 67'h0799aab2986be591d;
    stim[26] = 67'h0c8236385dc7b54fe;
    stim[27] = 67'h1e2f90d17f655ba90;
    stim[28] = 67'h2ea165c4e61a52be6;
    stim[29] = 67'h14e0b5c39ee24dbbc;
    stim[30] = 67'h13992c5780c30a588;
    stim[31] = 67'h2037ded4d677f5182;
    stim[32] = 67'h151101c55ab547955;
    stim[33] = 67'h098813e7ac9ec94f0;
    stim[34] = 67'h106942d11c3e33be2;
    stim[35] = 67'h0ee4669badd49c597;
    stim[36] = 67'h72ae30675caa13ba3;
    stim[37] = 67'h2bf958a1286124d7a;
    stim[38] = 67'h0ae41a359d073adbc;
    stim[39] = 67'h15dca40542fe53cb7;
    stim[40] = 67'h0b7e16f4dca0198af;
    stim[41] = 67'h3dbc04b4b72de4d93;
    stim[42] = 67'h2bf2afbc752e5f887;
    stim[43] = 67'h33d2d130de396a9aa;
    stim[44] = 67'h21eb7ef14e92da6d3;
    stim[45] = 67'h1f5db216121c79ed7;
    stim[46] = 67'h1b978177030b9efd2;
    stim[47] = 67'h34aa75a9d57a09c14;
    stim[48] = 67'h0434f7aac07b2f6ab;
    stim[49] = 67'h02c8a6c89de47877e;
    stim[50] = 67'h02c9635e67115d13a;
    stim[51] = 67'h1f62b835744d27408;
    stim[52] = 67'h18aea3090a9d7e96a;
    stim[53] = 67'h05eb3f850be4e3dff;
    stim[54] = 67'h24105d5e83f8670bf;
    stim[55] = 67'h2751379883eb368b4;
    stim[56] = 67'h108e3194d6fc60867;
    stim[57] = 67'h2bc4326e99ee22aaa;
    stim[58] = 67'h2db99fcc671304ef1;
    stim[59] = 67'h098e3a891944cdc2e;
    stim[60] = 67'h37d7df61413f93631;
    stim[61] = 67'h23a3b7196ec21d6ba;
    stim[62] = 67'h07e9560dfa85ee2a3;
    stim[63] = 67'h3cf554b20c7c5bbad;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h200000000;
      expv[22] = 34'h200000000;
      expv[23] = 34'h200000000;
      expv[24] = 34'h200000000;
      expv[25] = 34'h200000000;
      expv[26] = 34'h200000000;
      expv[27] = 34'h200000000;
      expv[28] = 34'h200000000;
      expv[29] = 34'h200000000;
      expv[30] = 34'h200000000;
      expv[31] = 34'h200000000;
      expv[32] = 34'h200000000;
      expv[33] = 34'h200000000;
      expv[34] = 34'h200000000;
      expv[35] = 34'h200000000;
      expv[36] = 34'h200000000;
      expv[37] = 34'h09571833a;
      expv[38] = 34'h200000000;
      expv[39] = 34'h200000000;
      expv[40] = 34'h200000000;
      expv[41] = 34'h200000000;
      expv[42] = 34'h200000000;
      expv[43] = 34'h200000000;
      expv[44] = 34'h200000000;
      expv[45] = 34'h200000000;
      expv[46] = 34'h200000000;
      expv[47] = 34'h200000000;
      expv[48] = 34'h200000000;
      expv[49] = 34'h200000000;
      expv[50] = 34'h200000000;
      expv[51] = 34'h200000000;
      expv[52] = 34'h200000000;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h200000000;
      expv[60] = 34'h200000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
