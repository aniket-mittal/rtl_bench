// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .s(out_vec[8:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h3c4c;
    stim[1] = 16'hcc7f;
    stim[2] = 16'h3bcb;
    stim[3] = 16'h593b;
    stim[4] = 16'hd792;
    stim[5] = 16'h1977;
    stim[6] = 16'h672e;
    stim[7] = 16'h5d15;
    stim[8] = 16'ha968;
    stim[9] = 16'h47fa;
    stim[10] = 16'hd004;
    stim[11] = 16'hfb26;
    stim[12] = 16'h3a9d;
    stim[13] = 16'h085a;
    stim[14] = 16'hd423;
    stim[15] = 16'h73c3;
    stim[16] = 16'h9838;
    stim[17] = 16'he741;
    stim[18] = 16'hedaf;
    stim[19] = 16'h458c;
    stim[20] = 16'h3859;
    stim[21] = 16'h7263;
    stim[22] = 16'h928f;
    stim[23] = 16'h0224;
    stim[24] = 16'hedeb;
    stim[25] = 16'hbcad;
    stim[26] = 16'h56f1;
    stim[27] = 16'h2954;
    stim[28] = 16'h1891;
    stim[29] = 16'h0801;
    stim[30] = 16'h420d;
    stim[31] = 16'hfc52;
    stim[32] = 16'h4c00;
    stim[33] = 16'hbb65;
    stim[34] = 16'hf238;
    stim[35] = 16'hf016;
    stim[36] = 16'hf189;
    stim[37] = 16'h1a65;
    stim[38] = 16'h7130;
    stim[39] = 16'he111;
    stim[40] = 16'h1536;
    stim[41] = 16'h32eb;
    stim[42] = 16'h07d5;
    stim[43] = 16'h696d;
    stim[44] = 16'hf6a0;
    stim[45] = 16'hfbf7;
    stim[46] = 16'h1c14;
    stim[47] = 16'h2606;
    stim[48] = 16'h90cb;
    stim[49] = 16'hf4ed;
    stim[50] = 16'h51f5;
    stim[51] = 16'he1a7;
    stim[52] = 16'h93de;
    stim[53] = 16'hba75;
    stim[54] = 16'h86d2;
    stim[55] = 16'h766e;
    stim[56] = 16'h9bb3;
    stim[57] = 16'hac81;
    stim[58] = 16'hc22c;
    stim[59] = 16'h3435;
    stim[60] = 16'hf73d;
    stim[61] = 16'h2362;
    stim[62] = 16'h19f7;
    stim[63] = 16'h2302;
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
      expv[0] = 9'h111;
      expv[1] = 9'h196;
      expv[2] = 9'h10c;
      expv[3] = 9'h129;
      expv[4] = 9'h0d3;
      expv[5] = 9'h121;
      expv[6] = 9'h12b;
      expv[7] = 9'h0e4;
      expv[8] = 9'h122;
      expv[9] = 9'h182;
      expv[10] = 9'h0a8;
      expv[11] = 9'h142;
      expv[12] = 9'h0ae;
      expv[13] = 9'h0c4;
      expv[14] = 9'h0ee;
      expv[15] = 9'h16c;
      expv[16] = 9'h0a0;
      expv[17] = 9'h150;
      expv[18] = 9'h138;
      expv[19] = 9'h0a2;
      expv[20] = 9'h123;
      expv[21] = 9'h1ab;
      expv[22] = 9'h043;
      expv[23] = 9'h04c;
      expv[24] = 9'h1b0;
      expv[25] = 9'h0d3;
      expv[26] = 9'h18e;
      expv[27] = 9'h0fa;
      expv[28] = 9'h052;
      expv[29] = 9'h012;
      expv[30] = 9'h09e;
      expv[31] = 9'h19c;
      expv[32] = 9'h098;
      expv[33] = 9'h140;
      expv[34] = 9'h154;
      expv[35] = 9'h10c;
      expv[36] = 9'h0f5;
      expv[37] = 9'h0fe;
      expv[38] = 9'h143;
      expv[39] = 9'h0e4;
      expv[40] = 9'h096;
      expv[41] = 9'h13a;
      expv[42] = 9'h0b8;
      expv[43] = 9'h1ad;
      expv[44] = 9'h12c;
      expv[45] = 9'h1e4;
      expv[46] = 9'h060;
      expv[47] = 9'h058;
      expv[48] = 9'h0b7;
      expv[49] = 9'h1c2;
      expv[50] = 9'h18c;
      expv[51] = 9'h110;
      expv[52] = 9'h0e3;
      expv[53] = 9'h15e;
      expv[54] = 9'h0b1;
      expv[55] = 9'h1c9;
      expv[56] = 9'h09d;
      expv[57] = 9'h05b;
      expv[58] = 9'h0dc;
      expv[59] = 9'h0d2;
      expv[60] = 9'h168;
      expv[61] = 9'h10b;
      expv[62] = 9'h120;
      expv[63] = 9'h04a;
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
