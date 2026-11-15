// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_182715 dut (
    .pclk(clk),
    .rst(in_vec[46:46]),
    .button(in_vec[45:45]),
    .transfer(in_vec[44:44]),
    .mouse_xpos(in_vec[43:33]),
    .mouse_ypos(in_vec[32:22]),
    .column_in(in_vec[21:11]),
    .row_in(in_vec[10:0]),
    .x_out(out_vec[21:11]),
    .y_out(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h7d9506361124;
    stim[1] = 47'h4ec10a2090aa;
    stim[2] = 47'h079329a4c900;
    stim[3] = 47'h76db392b6612;
    stim[4] = 47'h1ccc0ba78567;
    stim[5] = 47'h1dcddcf563f1;
    stim[6] = 47'h0620fa0bd591;
    stim[7] = 47'h3c32b31bd689;
    stim[8] = 47'h2d98400444aa;
    stim[9] = 47'h202953360ba2;
    stim[10] = 47'h2ba7fb72a949;
    stim[11] = 47'h078aa70333d6;
    stim[12] = 47'h3358b4a2fcf5;
    stim[13] = 47'h0cb0020faff2;
    stim[14] = 47'h26eaa70fec05;
    stim[15] = 47'h1c7d1ce62e51;
    stim[16] = 47'h2ee56731fef2;
    stim[17] = 47'h35d6ec88a2a2;
    stim[18] = 47'h06f4a0f68d87;
    stim[19] = 47'h0dcd381eeddf;
    stim[20] = 47'h154532c19a82;
    stim[21] = 47'h0950688daab6;
    stim[22] = 47'h21afeb313597;
    stim[23] = 47'h1f7f4b6d1ce3;
    stim[24] = 47'h2fde47c0b939;
    stim[25] = 47'h2170b001dabc;
    stim[26] = 47'h3b44fa4a7b3b;
    stim[27] = 47'h2df83fbdcd45;
    stim[28] = 47'h1e1331bc3b95;
    stim[29] = 47'h0ef38b68105e;
    stim[30] = 47'h3d948302a2a5;
    stim[31] = 47'h3e2f7d220b76;
    stim[32] = 47'h063401e6b424;
    stim[33] = 47'h16f6f7a96aca;
    stim[34] = 47'h05270e582511;
    stim[35] = 47'h1e720b0b77b9;
    stim[36] = 47'h02f59cbab20b;
    stim[37] = 47'h24c20ff87c32;
    stim[38] = 47'h3bdb41e51b63;
    stim[39] = 47'h1a613ac2325f;
    stim[40] = 47'h3ff08ed7fdbb;
    stim[41] = 47'h2596342b1e02;
    stim[42] = 47'h2d2e851cadb8;
    stim[43] = 47'h26d23dc084cc;
    stim[44] = 47'h03d980c8be4a;
    stim[45] = 47'h01f62b8667e3;
    stim[46] = 47'h13bb16c0ebe6;
    stim[47] = 47'h38efc3f194fc;
    stim[48] = 47'h24f8d5161ab6;
    stim[49] = 47'h3d009e14e1e9;
    stim[50] = 47'h27cc1cbc84c9;
    stim[51] = 47'h1e66bd609126;
    stim[52] = 47'h25a77c47c9f2;
    stim[53] = 47'h2b953738c6bc;
    stim[54] = 47'h14287beebe80;
    stim[55] = 47'h2b447294c038;
    stim[56] = 47'h33a5bf7b7ef7;
    stim[57] = 47'h202b14b04ee6;
    stim[58] = 47'h19ff003e59c6;
    stim[59] = 47'h200a66358fb3;
    stim[60] = 47'h07237c83afa8;
    stim[61] = 47'h0fc8871045ef;
    stim[62] = 47'h3d0a9051dd01;
    stim[63] = 47'h01bd06f71cde;
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
      expv[0] = 22'h01b837;
      expv[1] = 22'h01b837;
      expv[2] = 22'h01b837;
      expv[3] = 22'h01b837;
      expv[4] = 22'h01b837;
      expv[5] = 22'h12901a;
      expv[6] = 22'h16935f;
      expv[7] = 22'h17e3d4;
      expv[8] = 22'h17e3d4;
      expv[9] = 22'h17e3d4;
      expv[10] = 22'h17e3d4;
      expv[11] = 22'h17e3d4;
      expv[12] = 22'h17e3d4;
      expv[13] = 22'h17e3d4;
      expv[14] = 22'h17e3d4;
      expv[15] = 22'h17e3d4;
      expv[16] = 22'h17e3d4;
      expv[17] = 22'h17e3d4;
      expv[18] = 22'h17e3d4;
      expv[19] = 22'h17e3d4;
      expv[20] = 22'h17e3d4;
      expv[21] = 22'h17e3d4;
      expv[22] = 22'h17e3d4;
      expv[23] = 22'h17e3d4;
      expv[24] = 22'h17e3d4;
      expv[25] = 22'h17e3d4;
      expv[26] = 22'h17e3d4;
      expv[27] = 22'h17e3d4;
      expv[28] = 22'h17e3d4;
      expv[29] = 22'h17e3d4;
      expv[30] = 22'h17e3d4;
      expv[31] = 22'h17e3d4;
      expv[32] = 22'h17e3d4;
      expv[33] = 22'h17e3d4;
      expv[34] = 22'h17e3d4;
      expv[35] = 22'h17e3d4;
      expv[36] = 22'h17e3d4;
      expv[37] = 22'h17e3d4;
      expv[38] = 22'h17e3d4;
      expv[39] = 22'h17e3d4;
      expv[40] = 22'h17e3d4;
      expv[41] = 22'h17e3d4;
      expv[42] = 22'h17e3d4;
      expv[43] = 22'h17e3d4;
      expv[44] = 22'h17e3d4;
      expv[45] = 22'h17e3d4;
      expv[46] = 22'h17e3d4;
      expv[47] = 22'h17e3d4;
      expv[48] = 22'h17e3d4;
      expv[49] = 22'h17e3d4;
      expv[50] = 22'h17e3d4;
      expv[51] = 22'h17e3d4;
      expv[52] = 22'h17e3d4;
      expv[53] = 22'h17e3d4;
      expv[54] = 22'h17e3d4;
      expv[55] = 22'h17e3d4;
      expv[56] = 22'h17e3d4;
      expv[57] = 22'h17e3d4;
      expv[58] = 22'h17e3d4;
      expv[59] = 22'h17e3d4;
      expv[60] = 22'h17e3d4;
      expv[61] = 22'h17e3d4;
      expv[62] = 22'h17e3d4;
      expv[63] = 22'h17e3d4;
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
