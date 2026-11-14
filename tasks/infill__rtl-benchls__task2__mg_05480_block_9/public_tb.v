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
    stim[0] = 26'h2da9ae4;
    stim[1] = 26'h280befd;
    stim[2] = 26'h0d4c5fd;
    stim[3] = 26'h01ad59b;
    stim[4] = 26'h38ce8dd;
    stim[5] = 26'h2fa4fba;
    stim[6] = 26'h0f30240;
    stim[7] = 26'h2530b4f;
    stim[8] = 26'h386a6bf;
    stim[9] = 26'h1854bcf;
    stim[10] = 26'h0d1a94f;
    stim[11] = 26'h1268f60;
    stim[12] = 26'h21fa431;
    stim[13] = 26'h10670c8;
    stim[14] = 26'h28b1545;
    stim[15] = 26'h1288682;
    stim[16] = 26'h009f8f9;
    stim[17] = 26'h0002619;
    stim[18] = 26'h19c3846;
    stim[19] = 26'h38f4aac;
    stim[20] = 26'h396f4d0;
    stim[21] = 26'h1ff4935;
    stim[22] = 26'h19ab5fa;
    stim[23] = 26'h06a2df3;
    stim[24] = 26'h3b24956;
    stim[25] = 26'h1856d34;
    stim[26] = 26'h045d4d8;
    stim[27] = 26'h04b019c;
    stim[28] = 26'h0b83de4;
    stim[29] = 26'h1a97d77;
    stim[30] = 26'h257e126;
    stim[31] = 26'h2e2d270;
    stim[32] = 26'h18ab552;
    stim[33] = 26'h22bdc4f;
    stim[34] = 26'h161c25f;
    stim[35] = 26'h33ecad8;
    stim[36] = 26'h048e944;
    stim[37] = 26'h019b360;
    stim[38] = 26'h06e288b;
    stim[39] = 26'h0ddff26;
    stim[40] = 26'h2c39cb2;
    stim[41] = 26'h113ee3f;
    stim[42] = 26'h0fa7e5e;
    stim[43] = 26'h1322151;
    stim[44] = 26'h27008fd;
    stim[45] = 26'h24508b1;
    stim[46] = 26'h2e94247;
    stim[47] = 26'h15c74cb;
    stim[48] = 26'h2947233;
    stim[49] = 26'h0373238;
    stim[50] = 26'h0298d8b;
    stim[51] = 26'h073b437;
    stim[52] = 26'h0342cd5;
    stim[53] = 26'h0de8eda;
    stim[54] = 26'h2c155e4;
    stim[55] = 26'h214a10b;
    stim[56] = 26'h05d899c;
    stim[57] = 26'h26fc4fa;
    stim[58] = 26'h1fd56a1;
    stim[59] = 26'h05802b8;
    stim[60] = 26'h3737d71;
    stim[61] = 26'h3e4109d;
    stim[62] = 26'h1188db6;
    stim[63] = 26'h18207b3;
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
      expv[0] = 14'h3750;
      expv[1] = 14'h2190;
      expv[2] = 14'h3400;
      expv[3] = 14'h0700;
      expv[4] = 14'h2230;
      expv[5] = 14'h3ea0;
      expv[6] = 14'h3dd0;
      expv[7] = 14'h1460;
      expv[8] = 14'h2010;
      expv[9] = 14'h2060;
      expv[10] = 14'h3440;
      expv[11] = 14'h08a0;
      expv[12] = 14'h07f0;
      expv[13] = 14'h00b0;
      expv[14] = 14'h2300;
      expv[15] = 14'h0a10;
      expv[16] = 14'h0330;
      expv[17] = 14'h0010;
      expv[18] = 14'h2730;
      expv[19] = 14'h2250;
      expv[20] = 14'h24f0;
      expv[21] = 14'h3e40;
      expv[22] = 14'h2700;
      expv[23] = 14'h1a80;
      expv[24] = 14'h2c40;
      expv[25] = 14'h2080;
      expv[26] = 14'h10f0;
      expv[27] = 14'h13c0;
      expv[28] = 14'h2f80;
      expv[29] = 14'h2b80;
      expv[30] = 14'h15c0;
      expv[31] = 14'h38d0;
      expv[32] = 14'h2300;
      expv[33] = 14'h0b70;
      expv[34] = 14'h19d0;
      expv[35] = 14'h0e50;
      expv[36] = 14'h1240;
      expv[37] = 14'h06e0;
      expv[38] = 14'h1a30;
      expv[39] = 14'h37a0;
      expv[40] = 14'h3170;
      expv[41] = 14'h0490;
      expv[42] = 14'h3f90;
      expv[43] = 14'h0dc0;
      expv[44] = 14'h1c30;
      expv[45] = 14'h1030;
      expv[46] = 14'h3bd0;
      expv[47] = 14'h16f0;
      expv[48] = 14'h24d0;
      expv[49] = 14'h0cd0;
      expv[50] = 14'h0a8d;
      expv[51] = 14'h1cf0;
      expv[52] = 14'h0c70;
      expv[53] = 14'h3690;
      expv[54] = 14'h3100;
      expv[55] = 14'h05c0;
      expv[56] = 14'h1649;
      expv[57] = 14'h1bf0;
      expv[58] = 14'h3f10;
      expv[59] = 14'h17d0;
      expv[60] = 14'h1d80;
      expv[61] = 14'h38b0;
      expv[62] = 14'h0680;
      expv[63] = 14'h2020;
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
