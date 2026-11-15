// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06963 dut (
    .din(in_vec[15:0]),
    .bcd(out_vec[19:16]),
    .resttemp(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h6c28;
    stim[1] = 16'h8c37;
    stim[2] = 16'h0f46;
    stim[3] = 16'h3627;
    stim[4] = 16'h1a49;
    stim[5] = 16'ha8ac;
    stim[6] = 16'h1c19;
    stim[7] = 16'h5e03;
    stim[8] = 16'h9513;
    stim[9] = 16'h066e;
    stim[10] = 16'h0665;
    stim[11] = 16'h79b8;
    stim[12] = 16'h5e6d;
    stim[13] = 16'hd9fe;
    stim[14] = 16'h7b36;
    stim[15] = 16'h18e9;
    stim[16] = 16'hb729;
    stim[17] = 16'h0246;
    stim[18] = 16'h2d0a;
    stim[19] = 16'hfb92;
    stim[20] = 16'hb6b5;
    stim[21] = 16'h298f;
    stim[22] = 16'hd132;
    stim[23] = 16'hf137;
    stim[24] = 16'hee11;
    stim[25] = 16'h9a0d;
    stim[26] = 16'haee9;
    stim[27] = 16'h509b;
    stim[28] = 16'h642c;
    stim[29] = 16'hc8fb;
    stim[30] = 16'he9e4;
    stim[31] = 16'h77f7;
    stim[32] = 16'h4eb8;
    stim[33] = 16'hf620;
    stim[34] = 16'h1fb2;
    stim[35] = 16'h47e8;
    stim[36] = 16'h7312;
    stim[37] = 16'h3627;
    stim[38] = 16'hd747;
    stim[39] = 16'ha664;
    stim[40] = 16'hfbe9;
    stim[41] = 16'hb1e2;
    stim[42] = 16'h5121;
    stim[43] = 16'h35cd;
    stim[44] = 16'hf615;
    stim[45] = 16'h1ad2;
    stim[46] = 16'h9588;
    stim[47] = 16'h3649;
    stim[48] = 16'hb102;
    stim[49] = 16'h7f1b;
    stim[50] = 16'h5b9d;
    stim[51] = 16'h7403;
    stim[52] = 16'he172;
    stim[53] = 16'hd0a9;
    stim[54] = 16'hd1c7;
    stim[55] = 16'h42e8;
    stim[56] = 16'h6aea;
    stim[57] = 16'h1796;
    stim[58] = 16'h76d1;
    stim[59] = 16'hf0c5;
    stim[60] = 16'h9f13;
    stim[61] = 16'hb0f7;
    stim[62] = 16'h73e4;
    stim[63] = 16'h8a25;
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
      expv[0] = 20'h43990;
      expv[1] = 20'h57a26;
      expv[2] = 20'h098bc;
      expv[3] = 20'h21d86;
      expv[4] = 20'h106da;
      expv[5] = 20'h696b8;
      expv[6] = 20'h118fa;
      expv[7] = 20'h3ac1e;
      expv[8] = 20'h5d2be;
      expv[9] = 20'h0404c;
      expv[10] = 20'h03ff2;
      expv[11] = 20'h4c130;
      expv[12] = 20'h3b042;
      expv[13] = 20'h883ec;
      expv[14] = 20'h4d01c;
      expv[15] = 20'h0f91a;
      expv[16] = 20'h7279a;
      expv[17] = 20'h016bc;
      expv[18] = 20'h1c264;
      expv[19] = 20'h9d3b4;
      expv[20] = 20'h72312;
      expv[21] = 20'h19f96;
      expv[22] = 20'h82bf4;
      expv[23] = 20'h96c26;
      expv[24] = 20'h94caa;
      expv[25] = 20'h60482;
      expv[26] = 20'h6d51a;
      expv[27] = 20'h3260e;
      expv[28] = 20'h3e9b8;
      expv[29] = 20'h7d9ce;
      expv[30] = 20'h922e8;
      expv[31] = 20'h4afa6;
      expv[32] = 20'h31330;
      expv[33] = 20'h99d40;
      expv[34] = 20'h13cf4;
      expv[35] = 20'h2cf10;
      expv[36] = 20'h47eb4;
      expv[37] = 20'h21d86;
      expv[38] = 20'h868c6;
      expv[39] = 20'h67fe8;
      expv[40] = 20'h9d71a;
      expv[41] = 20'h6f2d4;
      expv[42] = 20'h32b4a;
      expv[43] = 20'h21a02;
      expv[44] = 20'h99cd2;
      expv[45] = 20'h10c34;
      expv[46] = 20'h5d750;
      expv[47] = 20'h21eda;
      expv[48] = 20'h6ea14;
      expv[49] = 20'h4f70e;
      expv[50] = 20'h39422;
      expv[51] = 20'h4881e;
      expv[52] = 20'h8ce74;
      expv[53] = 20'h8269a;
      expv[54] = 20'h831c6;
      expv[55] = 20'h29d10;
      expv[56] = 20'h42d24;
      expv[57] = 20'h0ebdc;
      expv[58] = 20'h4a42a;
      expv[59] = 20'h967b2;
      expv[60] = 20'h636be;
      expv[61] = 20'h6e9a6;
      expv[62] = 20'h486e8;
      expv[63] = 20'h56572;
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
