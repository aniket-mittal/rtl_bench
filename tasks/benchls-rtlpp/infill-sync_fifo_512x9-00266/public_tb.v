// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00266 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .din(in_vec[10:2]),
    .wr_en(in_vec[1:1]),
    .rd_en(in_vec[0:0]),
    .dout(out_vec[11:3]),
    .full(out_vec[2:2]),
    .empty(out_vec[1:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb9d;
    stim[1] = 12'hb48;
    stim[2] = 12'h247;
    stim[3] = 12'h7db;
    stim[4] = 12'h24d;
    stim[5] = 12'h210;
    stim[6] = 12'h3b9;
    stim[7] = 12'h336;
    stim[8] = 12'h719;
    stim[9] = 12'h66f;
    stim[10] = 12'h491;
    stim[11] = 12'h242;
    stim[12] = 12'h577;
    stim[13] = 12'h407;
    stim[14] = 12'h219;
    stim[15] = 12'h489;
    stim[16] = 12'h2c2;
    stim[17] = 12'h01a;
    stim[18] = 12'h271;
    stim[19] = 12'h06b;
    stim[20] = 12'h099;
    stim[21] = 12'h1f1;
    stim[22] = 12'h13f;
    stim[23] = 12'h459;
    stim[24] = 12'h54a;
    stim[25] = 12'h6be;
    stim[26] = 12'h5a2;
    stim[27] = 12'h5fe;
    stim[28] = 12'h78d;
    stim[29] = 12'h2a0;
    stim[30] = 12'h021;
    stim[31] = 12'h011;
    stim[32] = 12'h4b2;
    stim[33] = 12'h7eb;
    stim[34] = 12'h281;
    stim[35] = 12'h255;
    stim[36] = 12'h667;
    stim[37] = 12'h4de;
    stim[38] = 12'h502;
    stim[39] = 12'h3e8;
    stim[40] = 12'h67e;
    stim[41] = 12'h009;
    stim[42] = 12'h55c;
    stim[43] = 12'h41d;
    stim[44] = 12'h055;
    stim[45] = 12'h31f;
    stim[46] = 12'h727;
    stim[47] = 12'h4a1;
    stim[48] = 12'h473;
    stim[49] = 12'h6f6;
    stim[50] = 12'h017;
    stim[51] = 12'h491;
    stim[52] = 12'h260;
    stim[53] = 12'h752;
    stim[54] = 12'h318;
    stim[55] = 12'h1db;
    stim[56] = 12'h013;
    stim[57] = 12'h254;
    stim[58] = 12'ha94;
    stim[59] = 12'h52c;
    stim[60] = 12'h40c;
    stim[61] = 12'h2e3;
    stim[62] = 12'h294;
    stim[63] = 12'h000;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'hxxx;
      expv[7] = 12'hxxx;
      expv[8] = 12'hxxx;
      expv[9] = 12'hxxx;
      expv[10] = 12'hxxx;
      expv[11] = 12'hxxx;
      expv[12] = 12'hxxx;
      expv[13] = 12'hxxx;
      expv[14] = 12'hxxx;
      expv[15] = 12'hxxx;
      expv[16] = 12'hxxx;
      expv[17] = 12'hxxx;
      expv[18] = 12'hxxx;
      expv[19] = 12'hxxx;
      expv[20] = 12'hxxx;
      expv[21] = 12'hxxx;
      expv[22] = 12'hxxx;
      expv[23] = 12'hxxx;
      expv[24] = 12'hxxx;
      expv[25] = 12'hxxx;
      expv[26] = 12'hxxx;
      expv[27] = 12'hxxx;
      expv[28] = 12'hxxx;
      expv[29] = 12'hxxx;
      expv[30] = 12'hxxx;
      expv[31] = 12'hxxx;
      expv[32] = 12'hxxx;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxxx;
      expv[35] = 12'hxxx;
      expv[36] = 12'hxxx;
      expv[37] = 12'hxxx;
      expv[38] = 12'hxxx;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'hxxx;
      expv[42] = 12'hxxx;
      expv[43] = 12'hxxx;
      expv[44] = 12'hxxx;
      expv[45] = 12'hxxx;
      expv[46] = 12'hxxx;
      expv[47] = 12'hxxx;
      expv[48] = 12'hxxx;
      expv[49] = 12'hxxx;
      expv[50] = 12'hxxx;
      expv[51] = 12'hxxx;
      expv[52] = 12'hxxx;
      expv[53] = 12'hxxx;
      expv[54] = 12'hxxx;
      expv[55] = 12'hxxx;
      expv[56] = 12'hxxx;
      expv[57] = 12'hxxx;
      expv[58] = 12'hxxx;
      expv[59] = 12'hxxx;
      expv[60] = 12'hxxx;
      expv[61] = 12'hxxx;
      expv[62] = 12'h48a;
      expv[63] = 12'h48a;
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
