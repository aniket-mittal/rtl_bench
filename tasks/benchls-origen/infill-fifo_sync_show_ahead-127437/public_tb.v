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

  origen_127437 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .data_in(in_vec[9:2]),
    .data_in_start(in_vec[1:1]),
    .data_in_end(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .data_out_start(out_vec[1:1]),
    .data_out_end(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h497;
    stim[1] = 11'h4c0;
    stim[2] = 11'h1d9;
    stim[3] = 11'h3b2;
    stim[4] = 11'h250;
    stim[5] = 11'h1cb;
    stim[6] = 11'h3bb;
    stim[7] = 11'h164;
    stim[8] = 11'h1d2;
    stim[9] = 11'h389;
    stim[10] = 11'h2ed;
    stim[11] = 11'h06a;
    stim[12] = 11'h19a;
    stim[13] = 11'h16c;
    stim[14] = 11'h305;
    stim[15] = 11'h1c4;
    stim[16] = 11'h3e4;
    stim[17] = 11'h21f;
    stim[18] = 11'h179;
    stim[19] = 11'h3ed;
    stim[20] = 11'h19d;
    stim[21] = 11'h0d6;
    stim[22] = 11'h255;
    stim[23] = 11'h22e;
    stim[24] = 11'h36f;
    stim[25] = 11'h03c;
    stim[26] = 11'h09f;
    stim[27] = 11'h329;
    stim[28] = 11'h3f8;
    stim[29] = 11'h1a4;
    stim[30] = 11'h186;
    stim[31] = 11'h1ed;
    stim[32] = 11'h17d;
    stim[33] = 11'h1bc;
    stim[34] = 11'h264;
    stim[35] = 11'h19e;
    stim[36] = 11'h254;
    stim[37] = 11'h217;
    stim[38] = 11'h009;
    stim[39] = 11'h1b4;
    stim[40] = 11'h3e2;
    stim[41] = 11'h12a;
    stim[42] = 11'h01e;
    stim[43] = 11'h3b9;
    stim[44] = 11'h0a4;
    stim[45] = 11'h029;
    stim[46] = 11'h321;
    stim[47] = 11'h01a;
    stim[48] = 11'h0d9;
    stim[49] = 11'h143;
    stim[50] = 11'h3a4;
    stim[51] = 11'h30b;
    stim[52] = 11'h372;
    stim[53] = 11'h31e;
    stim[54] = 11'h06e;
    stim[55] = 11'h00a;
    stim[56] = 11'h150;
    stim[57] = 11'h26c;
    stim[58] = 11'h39a;
    stim[59] = 11'h16b;
    stim[60] = 11'h1fd;
    stim[61] = 11'h2df;
    stim[62] = 11'h1f0;
    stim[63] = 11'h20d;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h3b1;
      expv[6] = 10'h000;
      expv[7] = 10'h1c9;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h3b9;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h1d1;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h069;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h199;
      expv[24] = 10'h000;
      expv[25] = 10'h21d;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h0d5;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h22d;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h36d;
      expv[38] = 10'h000;
      expv[39] = 10'h09d;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h185;
      expv[43] = 10'h000;
      expv[44] = 10'h19d;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h215;
      expv[50] = 10'h000;
      expv[51] = 10'h3e1;
      expv[52] = 10'h000;
      expv[53] = 10'h129;
      expv[54] = 10'h000;
      expv[55] = 10'h01d;
      expv[56] = 10'h000;
      expv[57] = 10'h019;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h141;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h309;
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
