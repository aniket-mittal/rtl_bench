// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .resetn(in_vec[18:18]),
    .byteena(in_vec[17:16]),
    .d(in_vec[15:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h17f02;
    stim[1] = 19'h0f904;
    stim[2] = 19'h7ea0b;
    stim[3] = 19'h5954d;
    stim[4] = 19'h5c8a0;
    stim[5] = 19'h7e023;
    stim[6] = 19'h5f734;
    stim[7] = 19'h50710;
    stim[8] = 19'h7a624;
    stim[9] = 19'h6b8a5;
    stim[10] = 19'h4737d;
    stim[11] = 19'h67272;
    stim[12] = 19'h56c8f;
    stim[13] = 19'h54dcd;
    stim[14] = 19'h57f2a;
    stim[15] = 19'h596c4;
    stim[16] = 19'h75849;
    stim[17] = 19'h6941e;
    stim[18] = 19'h4009d;
    stim[19] = 19'h5a69d;
    stim[20] = 19'h648a7;
    stim[21] = 19'h443a8;
    stim[22] = 19'h0868a;
    stim[23] = 19'h6119a;
    stim[24] = 19'h69596;
    stim[25] = 19'h5754d;
    stim[26] = 19'h78a8f;
    stim[27] = 19'h73745;
    stim[28] = 19'h42e93;
    stim[29] = 19'h3496a;
    stim[30] = 19'h5485f;
    stim[31] = 19'h4defb;
    stim[32] = 19'h4fb81;
    stim[33] = 19'h708ac;
    stim[34] = 19'h799bd;
    stim[35] = 19'h7fb40;
    stim[36] = 19'h5cb54;
    stim[37] = 19'h6869d;
    stim[38] = 19'h4d949;
    stim[39] = 19'h519c4;
    stim[40] = 19'h46fec;
    stim[41] = 19'h5eb91;
    stim[42] = 19'h7144f;
    stim[43] = 19'h77912;
    stim[44] = 19'h53166;
    stim[45] = 19'h6c5d6;
    stim[46] = 19'h53f6d;
    stim[47] = 19'h57c76;
    stim[48] = 19'h741cd;
    stim[49] = 19'h50c52;
    stim[50] = 19'h41125;
    stim[51] = 19'h7b350;
    stim[52] = 19'h6e17d;
    stim[53] = 19'h4da8a;
    stim[54] = 19'h5aa78;
    stim[55] = 19'h6dfe5;
    stim[56] = 19'h77036;
    stim[57] = 19'h7dc82;
    stim[58] = 19'h49c56;
    stim[59] = 19'h658ea;
    stim[60] = 19'h7a5e8;
    stim[61] = 19'h4786d;
    stim[62] = 19'h498f6;
    stim[63] = 19'h4eb40;
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
      expv[1] = 16'hxx02;
      expv[2] = 16'hxx02;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h496a;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
