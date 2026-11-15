// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_088967 dut (
    .EN(in_vec[23:23]),
    .Src1_EXE(in_vec[22:19]),
    .Src2_EXE(in_vec[18:15]),
    .Dest_EXE(in_vec[14:11]),
    .Dest_MEM(in_vec[10:7]),
    .Dest_WB(in_vec[6:3]),
    .WB_EN_MEM(in_vec[2:2]),
    .WB_EN_WB(in_vec[1:1]),
    .Forward_Dest_EN(in_vec[0:0]),
    .Forward_Val1(out_vec[3:2]),
    .Forward_Val2(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h1b094f;
    stim[1] = 24'h2e16c4;
    stim[2] = 24'h4c0aa4;
    stim[3] = 24'h4924a7;
    stim[4] = 24'hdc494d;
    stim[5] = 24'h56ad83;
    stim[6] = 24'h864cc0;
    stim[7] = 24'hdb7c52;
    stim[8] = 24'h542360;
    stim[9] = 24'h540b16;
    stim[10] = 24'h064cc5;
    stim[11] = 24'h3091a9;
    stim[12] = 24'hde439f;
    stim[13] = 24'h54ad46;
    stim[14] = 24'hf2d673;
    stim[15] = 24'hd1b873;
    stim[16] = 24'hd37e50;
    stim[17] = 24'h7a50df;
    stim[18] = 24'h726945;
    stim[19] = 24'h9a945c;
    stim[20] = 24'h507c71;
    stim[21] = 24'h5e94b2;
    stim[22] = 24'he3a868;
    stim[23] = 24'h6bc606;
    stim[24] = 24'h5e2fa0;
    stim[25] = 24'he714c7;
    stim[26] = 24'h648543;
    stim[27] = 24'hbffcfd;
    stim[28] = 24'hd6ebf3;
    stim[29] = 24'h657a39;
    stim[30] = 24'h70bcdf;
    stim[31] = 24'h9aba66;
    stim[32] = 24'h3995f0;
    stim[33] = 24'h365387;
    stim[34] = 24'ha7b083;
    stim[35] = 24'h681cf0;
    stim[36] = 24'h8d869d;
    stim[37] = 24'hed7b19;
    stim[38] = 24'hd63cf1;
    stim[39] = 24'h522ca4;
    stim[40] = 24'h6fb758;
    stim[41] = 24'hffcd6d;
    stim[42] = 24'h2e151a;
    stim[43] = 24'hf0c00f;
    stim[44] = 24'h30a186;
    stim[45] = 24'h6c1dac;
    stim[46] = 24'h19523b;
    stim[47] = 24'hbfe430;
    stim[48] = 24'hdd39da;
    stim[49] = 24'hc5c85a;
    stim[50] = 24'hd07fdd;
    stim[51] = 24'h9f6703;
    stim[52] = 24'hb54650;
    stim[53] = 24'h83b0c4;
    stim[54] = 24'hf1fcb5;
    stim[55] = 24'h646f26;
    stim[56] = 24'h593683;
    stim[57] = 24'hecc3b3;
    stim[58] = 24'hbf320d;
    stim[59] = 24'h372b01;
    stim[60] = 24'h794963;
    stim[61] = 24'h28fc5d;
    stim[62] = 24'hcbfece;
    stim[63] = 24'h5606a9;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h8;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h8;
      expv[49] = 4'h2;
      expv[50] = 4'h1;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h8;
      expv[63] = 4'h0;
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
