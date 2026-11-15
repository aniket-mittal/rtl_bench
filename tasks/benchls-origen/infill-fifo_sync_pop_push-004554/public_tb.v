// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004554 dut (
    .i_clk(clk),
    .i_reset(in_vec[10:10]),
    .i_dat(in_vec[9:2]),
    .i_push(in_vec[1:1]),
    .i_pop(in_vec[0:0]),
    .o_dat(out_vec[9:2]),
    .o_empty(out_vec[1:1]),
    .o_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4a9;
    stim[1] = 11'h503;
    stim[2] = 11'h1fa;
    stim[3] = 11'h13a;
    stim[4] = 11'h1fa;
    stim[5] = 11'h25f;
    stim[6] = 11'h053;
    stim[7] = 11'h24d;
    stim[8] = 11'h2a7;
    stim[9] = 11'h15f;
    stim[10] = 11'h08b;
    stim[11] = 11'h0b0;
    stim[12] = 11'h3d4;
    stim[13] = 11'h1eb;
    stim[14] = 11'h12d;
    stim[15] = 11'h1fb;
    stim[16] = 11'h001;
    stim[17] = 11'h4d7;
    stim[18] = 11'h00c;
    stim[19] = 11'h0ea;
    stim[20] = 11'h2d8;
    stim[21] = 11'h01a;
    stim[22] = 11'h39e;
    stim[23] = 11'h326;
    stim[24] = 11'h2aa;
    stim[25] = 11'h464;
    stim[26] = 11'h226;
    stim[27] = 11'h3f3;
    stim[28] = 11'h3bf;
    stim[29] = 11'h2b8;
    stim[30] = 11'h36e;
    stim[31] = 11'h179;
    stim[32] = 11'h326;
    stim[33] = 11'h265;
    stim[34] = 11'h3da;
    stim[35] = 11'h0f2;
    stim[36] = 11'h24f;
    stim[37] = 11'h1e1;
    stim[38] = 11'h001;
    stim[39] = 11'h394;
    stim[40] = 11'h05d;
    stim[41] = 11'h3c6;
    stim[42] = 11'h2ec;
    stim[43] = 11'h289;
    stim[44] = 11'h0de;
    stim[45] = 11'h246;
    stim[46] = 11'h23f;
    stim[47] = 11'h286;
    stim[48] = 11'h367;
    stim[49] = 11'h004;
    stim[50] = 11'h250;
    stim[51] = 11'h38e;
    stim[52] = 11'h2a6;
    stim[53] = 11'h7d6;
    stim[54] = 11'h136;
    stim[55] = 11'h291;
    stim[56] = 11'h07d;
    stim[57] = 11'h0fe;
    stim[58] = 11'h3ce;
    stim[59] = 11'h301;
    stim[60] = 11'h33a;
    stim[61] = 11'h1ee;
    stim[62] = 11'h2cb;
    stim[63] = 11'h107;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'h1f8;
      expv[5] = 10'h1f8;
      expv[6] = 10'h1f9;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'hxxx;
      expv[18] = 10'h1fa;
      expv[19] = 10'h1fa;
      expv[20] = 10'h1f8;
      expv[21] = 10'h0e8;
      expv[22] = 10'h0e8;
      expv[23] = 10'h0e8;
      expv[24] = 10'h0e8;
      expv[25] = 10'h0ea;
      expv[26] = 10'h0ea;
      expv[27] = 10'h0e8;
      expv[28] = 10'h225;
      expv[29] = 10'h019;
      expv[30] = 10'h019;
      expv[31] = 10'h019;
      expv[32] = 10'h01a;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'h226;
      expv[39] = 10'h226;
      expv[40] = 10'h226;
      expv[41] = 10'h226;
      expv[42] = 10'h225;
      expv[43] = 10'h225;
      expv[44] = 10'h226;
      expv[45] = 10'h325;
      expv[46] = 10'h325;
      expv[47] = 10'h326;
      expv[48] = 10'h3da;
      expv[49] = 10'h3da;
      expv[50] = 10'h3da;
      expv[51] = 10'h3da;
      expv[52] = 10'h3d9;
      expv[53] = 10'h3da;
      expv[54] = 10'h0de;
      expv[55] = 10'h0dc;
      expv[56] = 10'h135;
      expv[57] = 10'h38d;
      expv[58] = 10'h38d;
      expv[59] = 10'h38d;
      expv[60] = 10'h38e;
      expv[61] = 10'h3d9;
      expv[62] = 10'h3d9;
      expv[63] = 10'h3da;
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
