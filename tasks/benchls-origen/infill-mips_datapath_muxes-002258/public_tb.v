// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_002258 dut (
    .R2(in_vec[11:7]),
    .RD(in_vec[6:2]),
    .RegDst(in_vec[1:0]),
    .RegAddr(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h5ba;
    stim[1] = 12'h208;
    stim[2] = 12'h74c;
    stim[3] = 12'h693;
    stim[4] = 12'h25c;
    stim[5] = 12'h3a5;
    stim[6] = 12'ha0c;
    stim[7] = 12'h004;
    stim[8] = 12'h322;
    stim[9] = 12'hbc9;
    stim[10] = 12'h44a;
    stim[11] = 12'h340;
    stim[12] = 12'hd8a;
    stim[13] = 12'h41c;
    stim[14] = 12'hd03;
    stim[15] = 12'h531;
    stim[16] = 12'h006;
    stim[17] = 12'hfce;
    stim[18] = 12'h1ad;
    stim[19] = 12'hff7;
    stim[20] = 12'h62c;
    stim[21] = 12'h4a3;
    stim[22] = 12'h19d;
    stim[23] = 12'h6d8;
    stim[24] = 12'h3d6;
    stim[25] = 12'hfaf;
    stim[26] = 12'h363;
    stim[27] = 12'h4cd;
    stim[28] = 12'h4d3;
    stim[29] = 12'hf0e;
    stim[30] = 12'hbf5;
    stim[31] = 12'h372;
    stim[32] = 12'h021;
    stim[33] = 12'h85e;
    stim[34] = 12'h657;
    stim[35] = 12'h314;
    stim[36] = 12'h5b4;
    stim[37] = 12'h4aa;
    stim[38] = 12'h386;
    stim[39] = 12'h6fc;
    stim[40] = 12'h552;
    stim[41] = 12'h8cb;
    stim[42] = 12'hf0c;
    stim[43] = 12'hd88;
    stim[44] = 12'hcd4;
    stim[45] = 12'hc30;
    stim[46] = 12'hd68;
    stim[47] = 12'h50d;
    stim[48] = 12'h4cf;
    stim[49] = 12'ha87;
    stim[50] = 12'h627;
    stim[51] = 12'hefe;
    stim[52] = 12'hc1f;
    stim[53] = 12'hb58;
    stim[54] = 12'h915;
    stim[55] = 12'h2db;
    stim[56] = 12'h667;
    stim[57] = 12'h760;
    stim[58] = 12'hbc9;
    stim[59] = 12'h33b;
    stim[60] = 12'hb0d;
    stim[61] = 12'h2b4;
    stim[62] = 12'hca5;
    stim[63] = 12'h3e9;
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
      expv[0] = 5'h1f;
      expv[1] = 5'h04;
      expv[2] = 5'h0e;
      expv[3] = 5'hxx;
      expv[4] = 5'h04;
      expv[5] = 5'h09;
      expv[6] = 5'h14;
      expv[7] = 5'h00;
      expv[8] = 5'h1f;
      expv[9] = 5'h12;
      expv[10] = 5'h1f;
      expv[11] = 5'h06;
      expv[12] = 5'h1f;
      expv[13] = 5'h08;
      expv[14] = 5'hxx;
      expv[15] = 5'h0c;
      expv[16] = 5'h1f;
      expv[17] = 5'h1f;
      expv[18] = 5'h0b;
      expv[19] = 5'hxx;
      expv[20] = 5'h0c;
      expv[21] = 5'hxx;
      expv[22] = 5'h07;
      expv[23] = 5'h0d;
      expv[24] = 5'h1f;
      expv[25] = 5'hxx;
      expv[26] = 5'hxx;
      expv[27] = 5'h13;
      expv[28] = 5'hxx;
      expv[29] = 5'h1f;
      expv[30] = 5'h1d;
      expv[31] = 5'h1f;
      expv[32] = 5'h08;
      expv[33] = 5'h1f;
      expv[34] = 5'hxx;
      expv[35] = 5'h06;
      expv[36] = 5'h0b;
      expv[37] = 5'h1f;
      expv[38] = 5'h1f;
      expv[39] = 5'h0d;
      expv[40] = 5'h1f;
      expv[41] = 5'hxx;
      expv[42] = 5'h1e;
      expv[43] = 5'h1b;
      expv[44] = 5'h19;
      expv[45] = 5'h18;
      expv[46] = 5'h1a;
      expv[47] = 5'h03;
      expv[48] = 5'hxx;
      expv[49] = 5'hxx;
      expv[50] = 5'hxx;
      expv[51] = 5'h1f;
      expv[52] = 5'hxx;
      expv[53] = 5'h16;
      expv[54] = 5'h05;
      expv[55] = 5'hxx;
      expv[56] = 5'hxx;
      expv[57] = 5'h0e;
      expv[58] = 5'h12;
      expv[59] = 5'hxx;
      expv[60] = 5'h03;
      expv[61] = 5'h05;
      expv[62] = 5'h09;
      expv[63] = 5'h1a;
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
