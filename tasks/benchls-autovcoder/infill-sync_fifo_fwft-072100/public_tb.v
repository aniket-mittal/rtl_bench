// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072100 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h94e;
    stim[1] = 12'hb9d;
    stim[2] = 12'h283;
    stim[3] = 12'h308;
    stim[4] = 12'h719;
    stim[5] = 12'h1a5;
    stim[6] = 12'h00f;
    stim[7] = 12'h023;
    stim[8] = 12'h000;
    stim[9] = 12'h576;
    stim[10] = 12'h5ec;
    stim[11] = 12'h1ec;
    stim[12] = 12'h4da;
    stim[13] = 12'h6a1;
    stim[14] = 12'h606;
    stim[15] = 12'h4d3;
    stim[16] = 12'h61d;
    stim[17] = 12'h024;
    stim[18] = 12'h4a1;
    stim[19] = 12'h74b;
    stim[20] = 12'h220;
    stim[21] = 12'h67a;
    stim[22] = 12'h30d;
    stim[23] = 12'h704;
    stim[24] = 12'h5bb;
    stim[25] = 12'h1d9;
    stim[26] = 12'h291;
    stim[27] = 12'h051;
    stim[28] = 12'h6ee;
    stim[29] = 12'h5d4;
    stim[30] = 12'h79d;
    stim[31] = 12'h381;
    stim[32] = 12'h51f;
    stim[33] = 12'h0ff;
    stim[34] = 12'h27a;
    stim[35] = 12'h237;
    stim[36] = 12'h3c9;
    stim[37] = 12'h6e0;
    stim[38] = 12'h04a;
    stim[39] = 12'h028;
    stim[40] = 12'h4e6;
    stim[41] = 12'h721;
    stim[42] = 12'h292;
    stim[43] = 12'h358;
    stim[44] = 12'h774;
    stim[45] = 12'h123;
    stim[46] = 12'h409;
    stim[47] = 12'h197;
    stim[48] = 12'h2b4;
    stim[49] = 12'h257;
    stim[50] = 12'h64f;
    stim[51] = 12'h42d;
    stim[52] = 12'h0f0;
    stim[53] = 12'h76d;
    stim[54] = 12'h122;
    stim[55] = 12'h428;
    stim[56] = 12'h317;
    stim[57] = 12'h4d8;
    stim[58] = 12'h1f2;
    stim[59] = 12'h7bf;
    stim[60] = 12'h7b9;
    stim[61] = 12'h718;
    stim[62] = 12'h7c2;
    stim[63] = 12'h748;
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
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h1xx;
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h1xx;
      expv[9] = 10'h1xx;
      expv[10] = 10'h319;
      expv[11] = 10'h319;
      expv[12] = 10'h319;
      expv[13] = 10'h319;
      expv[14] = 10'h376;
      expv[15] = 10'h3ec;
      expv[16] = 10'h3ec;
      expv[17] = 10'h1ec;
      expv[18] = 10'h1ec;
      expv[19] = 10'h1ec;
      expv[20] = 10'h1ec;
      expv[21] = 10'h1ec;
      expv[22] = 10'h34b;
      expv[23] = 10'h34b;
      expv[24] = 10'h14b;
      expv[25] = 10'h304;
      expv[26] = 10'h304;
      expv[27] = 10'h304;
      expv[28] = 10'h304;
      expv[29] = 10'h3bb;
      expv[30] = 10'h3bb;
      expv[31] = 10'h3d4;
      expv[32] = 10'h3d4;
      expv[33] = 10'h3d4;
      expv[34] = 10'h3d4;
      expv[35] = 10'h3d4;
      expv[36] = 10'h3d4;
      expv[37] = 10'h3d4;
      expv[38] = 10'h39d;
      expv[39] = 10'h39d;
      expv[40] = 10'h39d;
      expv[41] = 10'h39d;
      expv[42] = 10'h31f;
      expv[43] = 10'h31f;
      expv[44] = 10'h31f;
      expv[45] = 10'h321;
      expv[46] = 10'h321;
      expv[47] = 10'h321;
      expv[48] = 10'h321;
      expv[49] = 10'h321;
      expv[50] = 10'h321;
      expv[51] = 10'h374;
      expv[52] = 10'h374;
      expv[53] = 10'h374;
      expv[54] = 10'h174;
      expv[55] = 10'h174;
      expv[56] = 10'h36d;
      expv[57] = 10'h36d;
      expv[58] = 10'h36d;
      expv[59] = 10'h36d;
      expv[60] = 10'h16d;
      expv[61] = 10'h3bf;
      expv[62] = 10'h3b9;
      expv[63] = 10'h318;
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
