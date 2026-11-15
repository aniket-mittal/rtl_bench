// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07109 dut (
    .ad(in_vec[16:9]),
    .bd(in_vec[8:8]),
    .z(in_vec[7:0]),
    .d(out_vec[16:9]),
    .az(out_vec[8:1]),
    .bz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h148be;
    stim[1] = 17'h197ba;
    stim[2] = 17'h16926;
    stim[3] = 17'h1890c;
    stim[4] = 17'h0df98;
    stim[5] = 17'h016a9;
    stim[6] = 17'h047a2;
    stim[7] = 17'h193a8;
    stim[8] = 17'h0f7c4;
    stim[9] = 17'h18121;
    stim[10] = 17'h0171e;
    stim[11] = 17'h17f91;
    stim[12] = 17'h128b6;
    stim[13] = 17'h0e140;
    stim[14] = 17'h19f9e;
    stim[15] = 17'h1f556;
    stim[16] = 17'h1eda9;
    stim[17] = 17'h03a3f;
    stim[18] = 17'h07455;
    stim[19] = 17'h11754;
    stim[20] = 17'h034ba;
    stim[21] = 17'h17e3e;
    stim[22] = 17'h10bc1;
    stim[23] = 17'h03ec3;
    stim[24] = 17'h06ef5;
    stim[25] = 17'h0384f;
    stim[26] = 17'h03bad;
    stim[27] = 17'h13dac;
    stim[28] = 17'h126e3;
    stim[29] = 17'h102ca;
    stim[30] = 17'h17bdd;
    stim[31] = 17'h14b1e;
    stim[32] = 17'h045c3;
    stim[33] = 17'h13f8c;
    stim[34] = 17'h14340;
    stim[35] = 17'h18265;
    stim[36] = 17'h15784;
    stim[37] = 17'h057a0;
    stim[38] = 17'h05db2;
    stim[39] = 17'h05cb6;
    stim[40] = 17'h04ad7;
    stim[41] = 17'h14547;
    stim[42] = 17'h1a8b6;
    stim[43] = 17'h1ce0b;
    stim[44] = 17'h0d1e9;
    stim[45] = 17'h0097f;
    stim[46] = 17'h0cbd7;
    stim[47] = 17'h0a27e;
    stim[48] = 17'h0f062;
    stim[49] = 17'h04c45;
    stim[50] = 17'h1d583;
    stim[51] = 17'h0bf88;
    stim[52] = 17'h03cd1;
    stim[53] = 17'h1d00a;
    stim[54] = 17'h069b7;
    stim[55] = 17'h060a2;
    stim[56] = 17'h0bfef;
    stim[57] = 17'h1c563;
    stim[58] = 17'h0f9b7;
    stim[59] = 17'h0d030;
    stim[60] = 17'h1c5ab;
    stim[61] = 17'h1e677;
    stim[62] = 17'h14685;
    stim[63] = 17'h1ca0e;
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
      expv[0] = 17'h17d48;
      expv[1] = 17'h17597;
      expv[2] = 17'h04d69;
      expv[3] = 17'h01989;
      expv[4] = 17'h130df;
      expv[5] = 17'h15216;
      expv[6] = 17'h14447;
      expv[7] = 17'h15193;
      expv[8] = 17'h188f7;
      expv[9] = 17'h04381;
      expv[10] = 17'h03c17;
      expv[11] = 17'h1237f;
      expv[12] = 17'h16d28;
      expv[13] = 17'h080e1;
      expv[14] = 17'h13d9f;
      expv[15] = 17'h0adf5;
      expv[16] = 17'h153ed;
      expv[17] = 17'h07e3a;
      expv[18] = 17'h0aa74;
      expv[19] = 17'h0a917;
      expv[20] = 17'h17434;
      expv[21] = 17'h07d7e;
      expv[22] = 17'h1830b;
      expv[23] = 17'h1863e;
      expv[24] = 17'h1ea6e;
      expv[25] = 17'h09e38;
      expv[26] = 17'h15a3b;
      expv[27] = 17'h1593d;
      expv[28] = 17'h1c726;
      expv[29] = 17'h19502;
      expv[30] = 17'h1bb7b;
      expv[31] = 17'h03d4b;
      expv[32] = 17'h18645;
      expv[33] = 17'h1193f;
      expv[34] = 17'h08143;
      expv[35] = 17'h0cb82;
      expv[36] = 17'h10957;
      expv[37] = 17'h14057;
      expv[38] = 17'h1645d;
      expv[39] = 17'h16c5c;
      expv[40] = 17'h1ae4a;
      expv[41] = 17'h08f45;
      expv[42] = 17'h16da8;
      expv[43] = 17'h017ce;
      expv[44] = 17'h1d2d1;
      expv[45] = 17'h0fe09;
      expv[46] = 17'h1aecb;
      expv[47] = 17'h0fca2;
      expv[48] = 17'h0c4f0;
      expv[49] = 17'h08a4c;
      expv[50] = 17'h107d5;
      expv[51] = 17'h110bf;
      expv[52] = 17'h1a23c;
      expv[53] = 17'h015d0;
      expv[54] = 17'h16e69;
      expv[55] = 17'h14460;
      expv[56] = 17'h1debf;
      expv[57] = 17'h0c7c5;
      expv[58] = 17'h16ef9;
      expv[59] = 17'h060d0;
      expv[60] = 17'h157c5;
      expv[61] = 17'h0efe6;
      expv[62] = 17'h10b46;
      expv[63] = 17'h01dca;
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
