// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05480 dut (
    .clock(clk),
    .vcounter(in_vec[25:15]),
    .hcounter(in_vec[14:3]),
    .block(in_vec[2:0]),
    .sel_row(out_vec[13:9]),
    .sel_col(out_vec[8:4]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h07c9dac;
    stim[1] = 26'h15fbbc5;
    stim[2] = 26'h30988ff;
    stim[3] = 26'h0e66c0a;
    stim[4] = 26'h1414587;
    stim[5] = 26'h1bcc3d1;
    stim[6] = 26'h1e05712;
    stim[7] = 26'h07547d3;
    stim[8] = 26'h0b2fded;
    stim[9] = 26'h2a3ff9f;
    stim[10] = 26'h1405e83;
    stim[11] = 26'h20f630f;
    stim[12] = 26'h072567e;
    stim[13] = 26'h28a86b8;
    stim[14] = 26'h3d04514;
    stim[15] = 26'h1a65b4b;
    stim[16] = 26'h2f2f940;
    stim[17] = 26'h32a615b;
    stim[18] = 26'h3abfbda;
    stim[19] = 26'h3f83d12;
    stim[20] = 26'h0bfed71;
    stim[21] = 26'h02a5ce4;
    stim[22] = 26'h1015c0c;
    stim[23] = 26'h0821001;
    stim[24] = 26'h1472de2;
    stim[25] = 26'h3564209;
    stim[26] = 26'h0945e6c;
    stim[27] = 26'h341e41d;
    stim[28] = 26'h3c583a3;
    stim[29] = 26'h29ae4fb;
    stim[30] = 26'h3893892;
    stim[31] = 26'h1b662f4;
    stim[32] = 26'h340f474;
    stim[33] = 26'h319e795;
    stim[34] = 26'h2949174;
    stim[35] = 26'h04b2bf4;
    stim[36] = 26'h198e212;
    stim[37] = 26'h2cfaff7;
    stim[38] = 26'h1117268;
    stim[39] = 26'h0229be8;
    stim[40] = 26'h2fa7c43;
    stim[41] = 26'h3b89bfd;
    stim[42] = 26'h26025e5;
    stim[43] = 26'h3229ef1;
    stim[44] = 26'h1b4f59a;
    stim[45] = 26'h0936933;
    stim[46] = 26'h039ce6c;
    stim[47] = 26'h2995fa3;
    stim[48] = 26'h27bb391;
    stim[49] = 26'h21ce6ec;
    stim[50] = 26'h1be43d1;
    stim[51] = 26'h1819ade;
    stim[52] = 26'h1e41496;
    stim[53] = 26'h21fabe8;
    stim[54] = 26'h01a3064;
    stim[55] = 26'h14632f6;
    stim[56] = 26'h2be4f53;
    stim[57] = 26'h19e30cc;
    stim[58] = 26'h21e05eb;
    stim[59] = 26'h1ca1e01;
    stim[60] = 26'h0fba272;
    stim[61] = 26'h3e4302b;
    stim[62] = 26'h3dc5619;
    stim[63] = 26'h1e9e22b;
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
      expv[0] = 14'h1f80;
      expv[1] = 14'h1760;
      expv[2] = 14'h0230;
      expv[3] = 14'h3870;
      expv[4] = 14'h1000;
      expv[5] = 14'h2fe0;
      expv[6] = 14'h3920;
      expv[7] = 14'h1c20;
      expv[8] = 14'h2d80;
      expv[9] = 14'h29a0;
      expv[10] = 14'h1190;
      expv[11] = 14'h03e0;
      expv[12] = 14'h1d10;
      expv[13] = 14'h2210;
      expv[14] = 14'h3400;
      expv[15] = 14'h2960;
      expv[16] = 14'h3d40;
      expv[17] = 14'h0bc0;
      expv[18] = 14'h2b60;
      expv[19] = 14'h3f80;
      expv[20] = 14'h2e80;
      expv[21] = 14'h0b70;
      expv[22] = 14'h0170;
      expv[23] = 14'h20b0;
      expv[24] = 14'h1080;
      expv[25] = 14'h15d0;
      expv[26] = 14'h2590;
      expv[27] = 14'h11f0;
      expv[28] = 14'h31e0;
      expv[29] = 14'h27f0;
      expv[30] = 14'h2330;
      expv[31] = 14'h2dd0;
      expv[32] = 14'h10f0;
      expv[33] = 14'h0620;
      expv[34] = 14'h24c0;
      expv[35] = 14'h1260;
      expv[36] = 14'h27d0;
      expv[37] = 14'h32a0;
      expv[38] = 14'h04d0;
      expv[39] = 14'h0960;
      expv[40] = 14'h3f70;
      expv[41] = 14'h2f60;
      expv[42] = 14'h1800;
      expv[43] = 14'h0990;
      expv[44] = 14'h2d00;
      expv[45] = 14'h2440;
      expv[46] = 14'h0e90;
      expv[47] = 14'h27a0;
      expv[48] = 14'h1ee0;
      expv[49] = 14'h0610;
      expv[50] = 14'h2fe0;
      expv[51] = 14'h2150;
      expv[52] = 14'h38f0;
      expv[53] = 14'h0660;
      expv[54] = 14'h06b0;
      expv[55] = 14'h10d0;
      expv[56] = 14'h2ea0;
      expv[57] = 14'h26b0;
      expv[58] = 14'h0600;
      expv[59] = 14'h3390;
      expv[60] = 14'h3fd0;
      expv[61] = 14'h38b0;
      expv[62] = 14'h3710;
      expv[63] = 14'h3bd0;
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
