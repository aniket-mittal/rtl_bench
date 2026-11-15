// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062183 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h46a1291a196;
    stim[1] = 43'h1aaef419897;
    stim[2] = 43'h53adf52299d;
    stim[3] = 43'h43d5c766a93;
    stim[4] = 43'h5f1cadc4a03;
    stim[5] = 43'h1a4c853d786;
    stim[6] = 43'h37cd3dedf21;
    stim[7] = 43'h200e41a4d8f;
    stim[8] = 43'h5d02d7d5ff1;
    stim[9] = 43'h2899dfb4b16;
    stim[10] = 43'h57d8bdfb55b;
    stim[11] = 43'h5f498ba10ca;
    stim[12] = 43'h768200d8315;
    stim[13] = 43'h78616f1b734;
    stim[14] = 43'h34e8c95c103;
    stim[15] = 43'h3a2e27143a3;
    stim[16] = 43'h1ec58853a93;
    stim[17] = 43'h7d9bd6d7636;
    stim[18] = 43'h32748a1d62a;
    stim[19] = 43'h67923819750;
    stim[20] = 43'h5139524f184;
    stim[21] = 43'h1a1808c15bc;
    stim[22] = 43'h71604f14ff8;
    stim[23] = 43'h7090da22d83;
    stim[24] = 43'h31fb869c76b;
    stim[25] = 43'h266be830525;
    stim[26] = 43'h2b38e181fd8;
    stim[27] = 43'h363073f9828;
    stim[28] = 43'h2163f409dad;
    stim[29] = 43'h3d87a94c24e;
    stim[30] = 43'h663597aa732;
    stim[31] = 43'h69010e44428;
    stim[32] = 43'h0567a7af8bd;
    stim[33] = 43'h1f35db6782b;
    stim[34] = 43'h3a18519ba6a;
    stim[35] = 43'h59eb1bc8633;
    stim[36] = 43'h5e21e645e92;
    stim[37] = 43'h4650fb2a4f3;
    stim[38] = 43'h37a2d298aa0;
    stim[39] = 43'h4360deeabea;
    stim[40] = 43'h65e6445ca9d;
    stim[41] = 43'h20d69e526c0;
    stim[42] = 43'h7406568b4bd;
    stim[43] = 43'h34202054705;
    stim[44] = 43'h1e4a440ece2;
    stim[45] = 43'h0a8e4c9a9ca;
    stim[46] = 43'h7dada4e3c84;
    stim[47] = 43'h4d8bc69d49a;
    stim[48] = 43'h293b7113424;
    stim[49] = 43'h6f3bfacf481;
    stim[50] = 43'h3cea8a7b7cd;
    stim[51] = 43'h02a90d8bd2f;
    stim[52] = 43'h71e0d7bb962;
    stim[53] = 43'h6b5972486a2;
    stim[54] = 43'h24dee291da0;
    stim[55] = 43'h07106acf5d0;
    stim[56] = 43'h5ef95e4535b;
    stim[57] = 43'h146185482ca;
    stim[58] = 43'h033359cb3fa;
    stim[59] = 43'h0fb72af5513;
    stim[60] = 43'h196437ad3fa;
    stim[61] = 43'h4cf32d0a03f;
    stim[62] = 43'h24b5ecd1f1b;
    stim[63] = 43'h4735f971a69;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h46a1291a196;
      expv[2] = 43'h1aaef419897;
      expv[3] = 43'h53adf52299d;
      expv[4] = 43'h43d5c766a93;
      expv[5] = 43'h5f1cadc4a03;
      expv[6] = 43'h1a4c853d786;
      expv[7] = 43'h37cd3dedf21;
      expv[8] = 43'h200e41a4d8f;
      expv[9] = 43'h5d02d7d5ff1;
      expv[10] = 43'h2899dfb4b16;
      expv[11] = 43'h57d8bdfb55b;
      expv[12] = 43'h5f498ba10ca;
      expv[13] = 43'h768200d8315;
      expv[14] = 43'h78616f1b734;
      expv[15] = 43'h34e8c95c103;
      expv[16] = 43'h3a2e27143a3;
      expv[17] = 43'h1ec58853a93;
      expv[18] = 43'h7d9bd6d7636;
      expv[19] = 43'h32748a1d62a;
      expv[20] = 43'h67923819750;
      expv[21] = 43'h5139524f184;
      expv[22] = 43'h1a1808c15bc;
      expv[23] = 43'h71604f14ff8;
      expv[24] = 43'h7090da22d83;
      expv[25] = 43'h31fb869c76b;
      expv[26] = 43'h266be830525;
      expv[27] = 43'h2b38e181fd8;
      expv[28] = 43'h363073f9828;
      expv[29] = 43'h2163f409dad;
      expv[30] = 43'h3d87a94c24e;
      expv[31] = 43'h663597aa732;
      expv[32] = 43'h69010e44428;
      expv[33] = 43'h0567a7af8bd;
      expv[34] = 43'h1f35db6782b;
      expv[35] = 43'h3a18519ba6a;
      expv[36] = 43'h59eb1bc8633;
      expv[37] = 43'h5e21e645e92;
      expv[38] = 43'h4650fb2a4f3;
      expv[39] = 43'h37a2d298aa0;
      expv[40] = 43'h4360deeabea;
      expv[41] = 43'h65e6445ca9d;
      expv[42] = 43'h20d69e526c0;
      expv[43] = 43'h7406568b4bd;
      expv[44] = 43'h34202054705;
      expv[45] = 43'h1e4a440ece2;
      expv[46] = 43'h0a8e4c9a9ca;
      expv[47] = 43'h7dada4e3c84;
      expv[48] = 43'h4d8bc69d49a;
      expv[49] = 43'h293b7113424;
      expv[50] = 43'h6f3bfacf481;
      expv[51] = 43'h3cea8a7b7cd;
      expv[52] = 43'h02a90d8bd2f;
      expv[53] = 43'h71e0d7bb962;
      expv[54] = 43'h6b5972486a2;
      expv[55] = 43'h24dee291da0;
      expv[56] = 43'h07106acf5d0;
      expv[57] = 43'h5ef95e4535b;
      expv[58] = 43'h146185482ca;
      expv[59] = 43'h033359cb3fa;
      expv[60] = 43'h0fb72af5513;
      expv[61] = 43'h196437ad3fa;
      expv[62] = 43'h4cf32d0a03f;
      expv[63] = 43'h24b5ecd1f1b;
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
