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

  autovcoder_000122 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .wr(in_vec[9:9]),
    .rd(in_vec[8:8]),
    .din(in_vec[7:0]),
    .dout(out_vec[9:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h2af;
    stim[1] = 11'h178;
    stim[2] = 11'h665;
    stim[3] = 11'h4cc;
    stim[4] = 11'h480;
    stim[5] = 11'h553;
    stim[6] = 11'h58b;
    stim[7] = 11'h7c6;
    stim[8] = 11'h6a7;
    stim[9] = 11'h6b5;
    stim[10] = 11'h6ea;
    stim[11] = 11'h592;
    stim[12] = 11'h624;
    stim[13] = 11'h7b5;
    stim[14] = 11'h5a6;
    stim[15] = 11'h5e1;
    stim[16] = 11'h61a;
    stim[17] = 11'h437;
    stim[18] = 11'h667;
    stim[19] = 11'h500;
    stim[20] = 11'h7f3;
    stim[21] = 11'h6c9;
    stim[22] = 11'h6bd;
    stim[23] = 11'h40c;
    stim[24] = 11'h5dd;
    stim[25] = 11'h654;
    stim[26] = 11'h7a8;
    stim[27] = 11'h776;
    stim[28] = 11'h425;
    stim[29] = 11'h5a4;
    stim[30] = 11'h60a;
    stim[31] = 11'h6de;
    stim[32] = 11'h64c;
    stim[33] = 11'h4a4;
    stim[34] = 11'h605;
    stim[35] = 11'h6e7;
    stim[36] = 11'h655;
    stim[37] = 11'h56f;
    stim[38] = 11'h5b2;
    stim[39] = 11'h595;
    stim[40] = 11'h4d9;
    stim[41] = 11'h6f7;
    stim[42] = 11'h795;
    stim[43] = 11'h7d9;
    stim[44] = 11'h4c2;
    stim[45] = 11'h0be;
    stim[46] = 11'h5a7;
    stim[47] = 11'h500;
    stim[48] = 11'h575;
    stim[49] = 11'h6cc;
    stim[50] = 11'h52f;
    stim[51] = 11'h7de;
    stim[52] = 11'h49d;
    stim[53] = 11'h480;
    stim[54] = 11'h5e7;
    stim[55] = 11'h514;
    stim[56] = 11'h5c3;
    stim[57] = 11'h797;
    stim[58] = 11'h4e1;
    stim[59] = 11'h7f7;
    stim[60] = 11'h792;
    stim[61] = 11'h41a;
    stim[62] = 11'h202;
    stim[63] = 11'h750;
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
      expv[2] = 10'h2bc;
      expv[3] = 10'h2bc;
      expv[4] = 10'h2bc;
      expv[5] = 10'h2bc;
      expv[6] = 10'h195;
      expv[7] = 10'h194;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'h29c;
      expv[13] = 10'h29c;
      expv[14] = 10'h2d4;
      expv[15] = 10'h3a8;
      expv[16] = 10'h090;
      expv[17] = 10'h090;
      expv[18] = 10'h090;
      expv[19] = 10'h090;
      expv[20] = 10'h2d4;
      expv[21] = 10'h068;
      expv[22] = 10'h068;
      expv[23] = 10'h068;
      expv[24] = 10'h068;
      expv[25] = 10'h19c;
      expv[26] = 10'h19c;
      expv[27] = 10'h3cc;
      expv[28] = 10'h324;
      expv[29] = 10'h324;
      expv[30] = 10'h2f4;
      expv[31] = 10'h2f4;
      expv[32] = 10'h2f4;
      expv[33] = 10'h2f4;
      expv[34] = 10'h2f4;
      expv[35] = 10'h2f4;
      expv[36] = 10'h2f4;
      expv[37] = 10'h2f4;
      expv[38] = 10'h150;
      expv[39] = 10'h2a0;
      expv[40] = 10'h1d8;
      expv[41] = 10'h1d8;
      expv[42] = 10'h1d8;
      expv[43] = 10'h028;
      expv[44] = 10'h378;
      expv[45] = 10'h378;
      expv[46] = 10'h378;
      expv[47] = 10'h378;
      expv[48] = 10'h130;
      expv[49] = 10'h014;
      expv[50] = 10'h014;
      expv[51] = 10'h39c;
      expv[52] = 10'h154;
      expv[53] = 10'h154;
      expv[54] = 10'h154;
      expv[55] = 10'h3dc;
      expv[56] = 10'h254;
      expv[57] = 10'h364;
      expv[58] = 10'h19c;
      expv[59] = 10'h19c;
      expv[60] = 10'h3cc;
      expv[61] = 10'h324;
      expv[62] = 10'h324;
      expv[63] = 10'h324;
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
