// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_084686 dut (
    .i0(in_vec[19:19]),
    .i1(in_vec[18:18]),
    .i2(in_vec[17:17]),
    .i3(in_vec[16:16]),
    .i4(in_vec[15:15]),
    .i5(in_vec[14:14]),
    .i6(in_vec[13:13]),
    .i7(in_vec[12:12]),
    .i8(in_vec[11:11]),
    .i9(in_vec[10:10]),
    .i10(in_vec[9:9]),
    .i11(in_vec[8:8]),
    .i12(in_vec[7:7]),
    .i13(in_vec[6:6]),
    .i14(in_vec[5:5]),
    .i15(in_vec[4:4]),
    .s0(in_vec[3:3]),
    .s1(in_vec[2:2]),
    .s2(in_vec[1:1]),
    .s3(in_vec[0:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h0b4f0;
    stim[1] = 20'h705ee;
    stim[2] = 20'he2984;
    stim[3] = 20'h7d4ac;
    stim[4] = 20'h6f6fe;
    stim[5] = 20'h49210;
    stim[6] = 20'h57408;
    stim[7] = 20'h098f3;
    stim[8] = 20'he9150;
    stim[9] = 20'h8a83b;
    stim[10] = 20'h3c2a4;
    stim[11] = 20'h274a5;
    stim[12] = 20'h41123;
    stim[13] = 20'h965e1;
    stim[14] = 20'hb6ce4;
    stim[15] = 20'h4c640;
    stim[16] = 20'hbc2ac;
    stim[17] = 20'h350a0;
    stim[18] = 20'h47704;
    stim[19] = 20'h73f32;
    stim[20] = 20'h33e20;
    stim[21] = 20'h39f93;
    stim[22] = 20'h252e1;
    stim[23] = 20'hd0138;
    stim[24] = 20'h8e301;
    stim[25] = 20'h6abbc;
    stim[26] = 20'hb492e;
    stim[27] = 20'h751e9;
    stim[28] = 20'h16d45;
    stim[29] = 20'h0bd44;
    stim[30] = 20'h982ca;
    stim[31] = 20'hea08e;
    stim[32] = 20'hcbfd6;
    stim[33] = 20'h56840;
    stim[34] = 20'h8a47f;
    stim[35] = 20'hd47d9;
    stim[36] = 20'h900a5;
    stim[37] = 20'hdd0fd;
    stim[38] = 20'hb3b8e;
    stim[39] = 20'h4d2c8;
    stim[40] = 20'hdddfd;
    stim[41] = 20'hcaffa;
    stim[42] = 20'hff45d;
    stim[43] = 20'hea92a;
    stim[44] = 20'hcf999;
    stim[45] = 20'hce06f;
    stim[46] = 20'hc1600;
    stim[47] = 20'h67f03;
    stim[48] = 20'h70d3d;
    stim[49] = 20'heea39;
    stim[50] = 20'h647d7;
    stim[51] = 20'hb79df;
    stim[52] = 20'hcb143;
    stim[53] = 20'ha847c;
    stim[54] = 20'h1bc92;
    stim[55] = 20'he21d9;
    stim[56] = 20'h3ea83;
    stim[57] = 20'h2c0f8;
    stim[58] = 20'hba64c;
    stim[59] = 20'h08408;
    stim[60] = 20'h933f5;
    stim[61] = 20'hf7705;
    stim[62] = 20'h64b97;
    stim[63] = 20'h183d5;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
