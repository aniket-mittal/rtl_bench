// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_060087 dut (
    .pos1(in_vec[18:17]),
    .pos2(in_vec[16:15]),
    .pos3(in_vec[14:13]),
    .pos4(in_vec[12:11]),
    .pos5(in_vec[10:9]),
    .pos6(in_vec[8:7]),
    .pos7(in_vec[6:5]),
    .pos8(in_vec[4:3]),
    .pos9(in_vec[2:1]),
    .no_space(in_vec[0:0]),
    .player_win(out_vec[2:2]),
    .computer_win(out_vec[1:1]),
    .drawn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h09545;
    stim[1] = 19'h66b31;
    stim[2] = 19'h3691e;
    stim[3] = 19'h7495f;
    stim[4] = 19'h3d6c5;
    stim[5] = 19'h440c3;
    stim[6] = 19'h548ac;
    stim[7] = 19'h6374a;
    stim[8] = 19'h35d74;
    stim[9] = 19'h63388;
    stim[10] = 19'h35fa1;
    stim[11] = 19'h5764f;
    stim[12] = 19'h1236f;
    stim[13] = 19'h7428f;
    stim[14] = 19'h45a36;
    stim[15] = 19'h19998;
    stim[16] = 19'h79641;
    stim[17] = 19'h2dc7a;
    stim[18] = 19'h34985;
    stim[19] = 19'h27faf;
    stim[20] = 19'h49884;
    stim[21] = 19'h51bcb;
    stim[22] = 19'h6c207;
    stim[23] = 19'h74ce6;
    stim[24] = 19'h62eaf;
    stim[25] = 19'h647df;
    stim[26] = 19'h6a4f1;
    stim[27] = 19'h09533;
    stim[28] = 19'h06db1;
    stim[29] = 19'h023ce;
    stim[30] = 19'h79c23;
    stim[31] = 19'h665b2;
    stim[32] = 19'h406f0;
    stim[33] = 19'h664de;
    stim[34] = 19'h762dc;
    stim[35] = 19'h663e3;
    stim[36] = 19'h741c8;
    stim[37] = 19'h19a51;
    stim[38] = 19'h25fb4;
    stim[39] = 19'h1695a;
    stim[40] = 19'h35cee;
    stim[41] = 19'h301f8;
    stim[42] = 19'h332a9;
    stim[43] = 19'h20343;
    stim[44] = 19'h2cb32;
    stim[45] = 19'h01cd8;
    stim[46] = 19'h50adb;
    stim[47] = 19'h5d8e8;
    stim[48] = 19'h3a9b1;
    stim[49] = 19'h56244;
    stim[50] = 19'h6a69b;
    stim[51] = 19'h0b1ad;
    stim[52] = 19'h467d8;
    stim[53] = 19'h23f68;
    stim[54] = 19'h3faa2;
    stim[55] = 19'h1560b;
    stim[56] = 19'h34fca;
    stim[57] = 19'h15f08;
    stim[58] = 19'h19666;
    stim[59] = 19'h14ca7;
    stim[60] = 19'h6ee45;
    stim[61] = 19'h64c06;
    stim[62] = 19'h32ca4;
    stim[63] = 19'h6afc6;
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
      expv[0] = 3'h2;
      expv[1] = 3'h1;
      expv[2] = 3'h0;
      expv[3] = 3'h1;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h2;
      expv[7] = 3'h0;
      expv[8] = 3'h2;
      expv[9] = 3'h0;
      expv[10] = 3'h1;
      expv[11] = 3'h2;
      expv[12] = 3'h1;
      expv[13] = 3'h1;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h1;
      expv[17] = 3'h0;
      expv[18] = 3'h1;
      expv[19] = 3'h1;
      expv[20] = 3'h0;
      expv[21] = 3'h1;
      expv[22] = 3'h1;
      expv[23] = 3'h0;
      expv[24] = 3'h1;
      expv[25] = 3'h1;
      expv[26] = 3'h1;
      expv[27] = 3'h2;
      expv[28] = 3'h1;
      expv[29] = 3'h0;
      expv[30] = 3'h1;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h1;
      expv[36] = 3'h0;
      expv[37] = 3'h1;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h0;
      expv[46] = 3'h4;
      expv[47] = 3'h0;
      expv[48] = 3'h4;
      expv[49] = 3'h0;
      expv[50] = 3'h4;
      expv[51] = 3'h1;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h4;
      expv[55] = 3'h1;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h0;
      expv[62] = 3'h4;
      expv[63] = 3'h0;
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
