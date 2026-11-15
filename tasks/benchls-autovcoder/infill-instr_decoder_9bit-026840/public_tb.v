// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_026840 dut (
    .i_Instruction(in_vec[8:0]),
    .ControlJump(out_vec[18:16]),
    .Sel_Mux(out_vec[15:13]),
    .Sel_RY(out_vec[12:10]),
    .Sel_RX(out_vec[9:7]),
    .Load_Store(out_vec[6:6]),
    .Sel_ALU(out_vec[5:2]),
    .Sel_Salidas(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h08a;
    stim[1] = 9'h070;
    stim[2] = 9'h1f7;
    stim[3] = 9'h131;
    stim[4] = 9'h188;
    stim[5] = 9'h1d9;
    stim[6] = 9'h004;
    stim[7] = 9'h02c;
    stim[8] = 9'h03d;
    stim[9] = 9'h1d9;
    stim[10] = 9'h04c;
    stim[11] = 9'h142;
    stim[12] = 9'h0a7;
    stim[13] = 9'h1c0;
    stim[14] = 9'h0ed;
    stim[15] = 9'h008;
    stim[16] = 9'h1e1;
    stim[17] = 9'h0bf;
    stim[18] = 9'h067;
    stim[19] = 9'h0f5;
    stim[20] = 9'h0d6;
    stim[21] = 9'h1ed;
    stim[22] = 9'h103;
    stim[23] = 9'h11a;
    stim[24] = 9'h13e;
    stim[25] = 9'h085;
    stim[26] = 9'h1a8;
    stim[27] = 9'h164;
    stim[28] = 9'h06e;
    stim[29] = 9'h0d5;
    stim[30] = 9'h1e2;
    stim[31] = 9'h131;
    stim[32] = 9'h161;
    stim[33] = 9'h150;
    stim[34] = 9'h0e6;
    stim[35] = 9'h184;
    stim[36] = 9'h15e;
    stim[37] = 9'h1c5;
    stim[38] = 9'h054;
    stim[39] = 9'h1b5;
    stim[40] = 9'h1fe;
    stim[41] = 9'h02e;
    stim[42] = 9'h101;
    stim[43] = 9'h02c;
    stim[44] = 9'h038;
    stim[45] = 9'h1cf;
    stim[46] = 9'h15e;
    stim[47] = 9'h1a6;
    stim[48] = 9'h05a;
    stim[49] = 9'h148;
    stim[50] = 9'h149;
    stim[51] = 9'h035;
    stim[52] = 9'h102;
    stim[53] = 9'h0e7;
    stim[54] = 9'h024;
    stim[55] = 9'h152;
    stim[56] = 9'h1f9;
    stim[57] = 9'h0c7;
    stim[58] = 9'h14a;
    stim[59] = 9'h0f7;
    stim[60] = 9'h1d1;
    stim[61] = 9'h04d;
    stim[62] = 9'h116;
    stim[63] = 9'h04d;
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
      expv[0] = 19'h0057d;
      expv[1] = 19'h0837c;
      expv[2] = 19'h7a33c;
      expv[3] = 19'h0473f;
      expv[4] = 19'h04080;
      expv[5] = 19'h1a1bc;
      expv[6] = 19'h0003c;
      expv[7] = 19'h0003c;
      expv[8] = 19'h0003c;
      expv[9] = 19'h1a1bc;
      expv[10] = 19'h080fc;
      expv[11] = 19'h0417c;
      expv[12] = 19'h013fd;
      expv[13] = 19'h0a03c;
      expv[14] = 19'h082be;
      expv[15] = 19'h0003c;
      expv[16] = 19'h1a23c;
      expv[17] = 19'h01ffd;
      expv[18] = 19'h0827c;
      expv[19] = 19'h0833e;
      expv[20] = 19'h0813e;
      expv[21] = 19'h5a2bc;
      expv[22] = 19'h04c3f;
      expv[23] = 19'h049bf;
      expv[24] = 19'h05bbf;
      expv[25] = 19'h002fd;
      expv[26] = 19'h04280;
      expv[27] = 19'h0527c;
      expv[28] = 19'h082fc;
      expv[29] = 19'h0813e;
      expv[30] = 19'h2a23c;
      expv[31] = 19'h0473f;
      expv[32] = 19'h050fc;
      expv[33] = 19'h0487c;
      expv[34] = 19'h0823e;
      expv[35] = 19'h04010;
      expv[36] = 19'h04f7c;
      expv[37] = 19'h5a03c;
      expv[38] = 19'h0817c;
      expv[39] = 19'h04314;
      expv[40] = 19'h6a3bc;
      expv[41] = 19'h0003c;
      expv[42] = 19'h0443f;
      expv[43] = 19'h0003c;
      expv[44] = 19'h0003c;
      expv[45] = 19'h7a0bc;
      expv[46] = 19'h04f7c;
      expv[47] = 19'h04218;
      expv[48] = 19'h081fc;
      expv[49] = 19'h0447c;
      expv[50] = 19'h044fc;
      expv[51] = 19'h0003c;
      expv[52] = 19'h0483f;
      expv[53] = 19'h0823e;
      expv[54] = 19'h0003c;
      expv[55] = 19'h0497c;
      expv[56] = 19'h1a3bc;
      expv[57] = 19'h0803e;
      expv[58] = 19'h0457c;
      expv[59] = 19'h0833e;
      expv[60] = 19'h1a13c;
      expv[61] = 19'h080fc;
      expv[62] = 19'h0593f;
      expv[63] = 19'h080fc;
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
