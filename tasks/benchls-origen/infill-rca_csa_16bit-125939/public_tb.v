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

  origen_125939 dut (
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
    stim[0] = 16'h219e;
    stim[1] = 16'hbf97;
    stim[2] = 16'hf4a1;
    stim[3] = 16'h56a3;
    stim[4] = 16'h49b0;
    stim[5] = 16'haa2b;
    stim[6] = 16'hc623;
    stim[7] = 16'h720c;
    stim[8] = 16'he5b6;
    stim[9] = 16'hcdd0;
    stim[10] = 16'h09b7;
    stim[11] = 16'h223a;
    stim[12] = 16'ha8f6;
    stim[13] = 16'hb974;
    stim[14] = 16'h5e31;
    stim[15] = 16'h335c;
    stim[16] = 16'ha675;
    stim[17] = 16'hc027;
    stim[18] = 16'hca2a;
    stim[19] = 16'h4091;
    stim[20] = 16'h16d3;
    stim[21] = 16'h92c2;
    stim[22] = 16'h7281;
    stim[23] = 16'hac66;
    stim[24] = 16'h96cd;
    stim[25] = 16'hea6e;
    stim[26] = 16'h009a;
    stim[27] = 16'h90cc;
    stim[28] = 16'h6626;
    stim[29] = 16'hd0e4;
    stim[30] = 16'hec6d;
    stim[31] = 16'h0249;
    stim[32] = 16'h6d5c;
    stim[33] = 16'hcb12;
    stim[34] = 16'h3012;
    stim[35] = 16'h321f;
    stim[36] = 16'h9d03;
    stim[37] = 16'h6059;
    stim[38] = 16'hda09;
    stim[39] = 16'h13ef;
    stim[40] = 16'hff89;
    stim[41] = 16'hd307;
    stim[42] = 16'h8f51;
    stim[43] = 16'hdcc4;
    stim[44] = 16'h9f0e;
    stim[45] = 16'h8cc7;
    stim[46] = 16'h449c;
    stim[47] = 16'hfeeb;
    stim[48] = 16'hf4b4;
    stim[49] = 16'hcfbb;
    stim[50] = 16'he3f6;
    stim[51] = 16'ha462;
    stim[52] = 16'h73a2;
    stim[53] = 16'h881d;
    stim[54] = 16'h9a9d;
    stim[55] = 16'hbfe1;
    stim[56] = 16'h4ac2;
    stim[57] = 16'h479b;
    stim[58] = 16'h9a20;
    stim[59] = 16'h1cbb;
    stim[60] = 16'h3223;
    stim[61] = 16'h2011;
    stim[62] = 16'h3c8a;
    stim[63] = 16'hcadb;
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
      expv[0] = 16'ha09f;
      expv[1] = 16'ha2a6;
      expv[2] = 16'hb0a5;
      expv[3] = 16'ha8a9;
      expv[4] = 16'hb4b9;
      expv[5] = 16'h3535;
      expv[6] = 16'h2f29;
      expv[7] = 16'h130e;
      expv[8] = 16'hc4bb;
      expv[9] = 16'hdcdd;
      expv[10] = 16'hb7c0;
      expv[11] = 16'h3c3c;
      expv[12] = 16'h00fe;
      expv[13] = 16'h7f7d;
      expv[14] = 16'h363f;
      expv[15] = 16'h5f5f;
      expv[16] = 16'h7f7b;
      expv[17] = 16'h3327;
      expv[18] = 16'h3634;
      expv[19] = 16'h9591;
      expv[20] = 16'hd4d9;
      expv[21] = 16'hcbc4;
      expv[22] = 16'h8883;
      expv[23] = 16'h7072;
      expv[24] = 16'hd6d3;
      expv[25] = 16'h7c78;
      expv[26] = 16'h9a9a;
      expv[27] = 16'hd5cc;
      expv[28] = 16'h2c2c;
      expv[29] = 16'hf1e4;
      expv[30] = 16'h7b79;
      expv[31] = 16'h494b;
      expv[32] = 16'h6269;
      expv[33] = 16'h1e1d;
      expv[34] = 16'h1512;
      expv[35] = 16'h2221;
      expv[36] = 16'h0c10;
      expv[37] = 16'h5f59;
      expv[38] = 16'h1613;
      expv[39] = 16'hf0f2;
      expv[40] = 16'h9898;
      expv[41] = 16'h140a;
      expv[42] = 16'h5960;
      expv[43] = 16'hd1d0;
      expv[44] = 16'h171d;
      expv[45] = 16'hcfd3;
      expv[46] = 16'ha0a0;
      expv[47] = 16'hfaf9;
      expv[48] = 16'hc3b8;
      expv[49] = 16'hc7ca;
      expv[50] = 16'h04f9;
      expv[51] = 16'h6c66;
      expv[52] = 16'ha9a5;
      expv[53] = 16'h2525;
      expv[54] = 16'ha6a7;
      expv[55] = 16'hecf0;
      expv[56] = 16'hc6cc;
      expv[57] = 16'h9fa2;
      expv[58] = 16'h292a;
      expv[59] = 16'hbcc7;
      expv[60] = 16'h2625;
      expv[61] = 16'h1311;
      expv[62] = 16'h8d96;
      expv[63] = 16'he7e5;
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
