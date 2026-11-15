// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00681 dut (
    .in(in_vec[15:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hb1b6;
    stim[1] = 16'hca21;
    stim[2] = 16'h3d1f;
    stim[3] = 16'he073;
    stim[4] = 16'hac6f;
    stim[5] = 16'h3720;
    stim[6] = 16'h392f;
    stim[7] = 16'h213b;
    stim[8] = 16'h5617;
    stim[9] = 16'h1e6e;
    stim[10] = 16'h104c;
    stim[11] = 16'h9ee7;
    stim[12] = 16'h77cf;
    stim[13] = 16'h0a4d;
    stim[14] = 16'hb48b;
    stim[15] = 16'ha1d6;
    stim[16] = 16'h1a5b;
    stim[17] = 16'h969e;
    stim[18] = 16'h1b0e;
    stim[19] = 16'haf7d;
    stim[20] = 16'he181;
    stim[21] = 16'h6db8;
    stim[22] = 16'h2492;
    stim[23] = 16'h8ddc;
    stim[24] = 16'hd032;
    stim[25] = 16'h2dc1;
    stim[26] = 16'h69a0;
    stim[27] = 16'h7560;
    stim[28] = 16'h10f2;
    stim[29] = 16'h5620;
    stim[30] = 16'he963;
    stim[31] = 16'hc0f3;
    stim[32] = 16'h43cb;
    stim[33] = 16'h058d;
    stim[34] = 16'hfeff;
    stim[35] = 16'h2610;
    stim[36] = 16'h5b3d;
    stim[37] = 16'h8f79;
    stim[38] = 16'h3480;
    stim[39] = 16'h0ed2;
    stim[40] = 16'h606c;
    stim[41] = 16'h1136;
    stim[42] = 16'h94a5;
    stim[43] = 16'hfeba;
    stim[44] = 16'h9c05;
    stim[45] = 16'habd6;
    stim[46] = 16'h3d01;
    stim[47] = 16'hb4c3;
    stim[48] = 16'h7540;
    stim[49] = 16'h614c;
    stim[50] = 16'h40ad;
    stim[51] = 16'h57f1;
    stim[52] = 16'h241c;
    stim[53] = 16'he0d6;
    stim[54] = 16'h268d;
    stim[55] = 16'h3353;
    stim[56] = 16'h99e1;
    stim[57] = 16'h5166;
    stim[58] = 16'hd444;
    stim[59] = 16'h5e41;
    stim[60] = 16'h217c;
    stim[61] = 16'h56e5;
    stim[62] = 16'h6f19;
    stim[63] = 16'haa7e;
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
      expv[0] = 16'hb1b7;
      expv[1] = 16'hca22;
      expv[2] = 16'h3d20;
      expv[3] = 16'he074;
      expv[4] = 16'hac70;
      expv[5] = 16'h3721;
      expv[6] = 16'h3930;
      expv[7] = 16'h213c;
      expv[8] = 16'h5618;
      expv[9] = 16'h1e6f;
      expv[10] = 16'h104d;
      expv[11] = 16'h9ee8;
      expv[12] = 16'h77d0;
      expv[13] = 16'h0a4e;
      expv[14] = 16'hb48c;
      expv[15] = 16'ha1d7;
      expv[16] = 16'h1a5c;
      expv[17] = 16'h969f;
      expv[18] = 16'h1b0f;
      expv[19] = 16'haf7e;
      expv[20] = 16'he182;
      expv[21] = 16'h6db9;
      expv[22] = 16'h2493;
      expv[23] = 16'h8ddd;
      expv[24] = 16'hd033;
      expv[25] = 16'h2dc2;
      expv[26] = 16'h69a1;
      expv[27] = 16'h7561;
      expv[28] = 16'h10f3;
      expv[29] = 16'h5621;
      expv[30] = 16'he964;
      expv[31] = 16'hc0f4;
      expv[32] = 16'h43cc;
      expv[33] = 16'h058e;
      expv[34] = 16'hff00;
      expv[35] = 16'h2611;
      expv[36] = 16'h5b3e;
      expv[37] = 16'h8f7a;
      expv[38] = 16'h3481;
      expv[39] = 16'h0ed3;
      expv[40] = 16'h606d;
      expv[41] = 16'h1137;
      expv[42] = 16'h94a6;
      expv[43] = 16'hfebb;
      expv[44] = 16'h9c06;
      expv[45] = 16'habd7;
      expv[46] = 16'h3d02;
      expv[47] = 16'hb4c4;
      expv[48] = 16'h7541;
      expv[49] = 16'h614d;
      expv[50] = 16'h40ae;
      expv[51] = 16'h57f2;
      expv[52] = 16'h241d;
      expv[53] = 16'he0d7;
      expv[54] = 16'h268e;
      expv[55] = 16'h3354;
      expv[56] = 16'h99e2;
      expv[57] = 16'h5167;
      expv[58] = 16'hd445;
      expv[59] = 16'h5e42;
      expv[60] = 16'h217d;
      expv[61] = 16'h56e6;
      expv[62] = 16'h6f1a;
      expv[63] = 16'haa7f;
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
