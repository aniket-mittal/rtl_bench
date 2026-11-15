// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_202818 dut (
    .clk(clk),
    .rst(in_vec[3:3]),
    .player_1_win(in_vec[2:2]),
    .player_2_win(in_vec[1:1]),
    .restart(in_vec[0:0]),
    .game_over(out_vec[18:18]),
    .who_win(out_vec[17:16]),
    .player_1_score(out_vec[15:8]),
    .player_2_score(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hb;
    stim[1] = 4'he;
    stim[2] = 4'h4;
    stim[3] = 4'h1;
    stim[4] = 4'h4;
    stim[5] = 4'h0;
    stim[6] = 4'h2;
    stim[7] = 4'h2;
    stim[8] = 4'h6;
    stim[9] = 4'h4;
    stim[10] = 4'h7;
    stim[11] = 4'h1;
    stim[12] = 4'h3;
    stim[13] = 4'h4;
    stim[14] = 4'h7;
    stim[15] = 4'h6;
    stim[16] = 4'h5;
    stim[17] = 4'h5;
    stim[18] = 4'h7;
    stim[19] = 4'h2;
    stim[20] = 4'h7;
    stim[21] = 4'h4;
    stim[22] = 4'h0;
    stim[23] = 4'h2;
    stim[24] = 4'h0;
    stim[25] = 4'h3;
    stim[26] = 4'h3;
    stim[27] = 4'h1;
    stim[28] = 4'h3;
    stim[29] = 4'h2;
    stim[30] = 4'h4;
    stim[31] = 4'h6;
    stim[32] = 4'h3;
    stim[33] = 4'h7;
    stim[34] = 4'h6;
    stim[35] = 4'h5;
    stim[36] = 4'h3;
    stim[37] = 4'h7;
    stim[38] = 4'h6;
    stim[39] = 4'h0;
    stim[40] = 4'h3;
    stim[41] = 4'h5;
    stim[42] = 4'h0;
    stim[43] = 4'h5;
    stim[44] = 4'h2;
    stim[45] = 4'h2;
    stim[46] = 4'hf;
    stim[47] = 4'h7;
    stim[48] = 4'h3;
    stim[49] = 4'hf;
    stim[50] = 4'h4;
    stim[51] = 4'h6;
    stim[52] = 4'h6;
    stim[53] = 4'h0;
    stim[54] = 4'h3;
    stim[55] = 4'h4;
    stim[56] = 4'h4;
    stim[57] = 4'h4;
    stim[58] = 4'h0;
    stim[59] = 4'hd;
    stim[60] = 4'h6;
    stim[61] = 4'h1;
    stim[62] = 4'h3;
    stim[63] = 4'h6;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00100;
      expv[4] = 19'h00000;
      expv[5] = 19'h00100;
      expv[6] = 19'h00100;
      expv[7] = 19'h00101;
      expv[8] = 19'h00102;
      expv[9] = 19'h00203;
      expv[10] = 19'h00303;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00100;
      expv[15] = 19'h00000;
      expv[16] = 19'h00101;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h00000;
      expv[20] = 19'h00001;
      expv[21] = 19'h00000;
      expv[22] = 19'h00100;
      expv[23] = 19'h00100;
      expv[24] = 19'h00101;
      expv[25] = 19'h00101;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00001;
      expv[31] = 19'h00101;
      expv[32] = 19'h00202;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00101;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00101;
      expv[40] = 19'h00101;
      expv[41] = 19'h00000;
      expv[42] = 19'h00000;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00001;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00100;
      expv[52] = 19'h00201;
      expv[53] = 19'h00302;
      expv[54] = 19'h00302;
      expv[55] = 19'h00000;
      expv[56] = 19'h00100;
      expv[57] = 19'h00200;
      expv[58] = 19'h00300;
      expv[59] = 19'h00000;
      expv[60] = 19'h00000;
      expv[61] = 19'h00101;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
