// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07229 dut (
    .Clk(clk),
    .R(in_vec[22:22]),
    .L(in_vec[21:21]),
    .U(in_vec[20:20]),
    .D(in_vec[19:19]),
    .C(in_vec[18:18]),
    .Reset(in_vec[17:17]),
    .Ack(in_vec[16:16]),
    .CheckSolu(in_vec[15:15]),
    .userIn(in_vec[14:10]),
    .disp_i(in_vec[9:5]),
    .disp_j(in_vec[4:0]),
    .q_I(out_vec[37:37]),
    .q_Solve(out_vec[36:36]),
    .q_Check(out_vec[35:35]),
    .q_Correct(out_vec[34:34]),
    .q_Incorrect(out_vec[33:33]),
    .i(out_vec[32:28]),
    .j(out_vec[27:23]),
    .row(out_vec[22:19]),
    .col(out_vec[18:15]),
    .puzzle_ij(out_vec[14:10]),
    .solu_ij(out_vec[9:5]),
    .disp_value(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h3a6cd4;
    stim[1] = 23'h137875;
    stim[2] = 23'h1809bf;
    stim[3] = 23'h19094b;
    stim[4] = 23'h40a428;
    stim[5] = 23'h0464b3;
    stim[6] = 23'h4c84be;
    stim[7] = 23'h515350;
    stim[8] = 23'h04744a;
    stim[9] = 23'h5470a3;
    stim[10] = 23'h61c3df;
    stim[11] = 23'h55e49c;
    stim[12] = 23'h688679;
    stim[13] = 23'h717b30;
    stim[14] = 23'h52948d;
    stim[15] = 23'h403965;
    stim[16] = 23'h69ef93;
    stim[17] = 23'h043183;
    stim[18] = 23'h349ea8;
    stim[19] = 23'h5ddb3e;
    stim[20] = 23'h3887b4;
    stim[21] = 23'h141f81;
    stim[22] = 23'h3180cb;
    stim[23] = 23'h24d8a0;
    stim[24] = 23'h645e4a;
    stim[25] = 23'h7cc9db;
    stim[26] = 23'h4836eb;
    stim[27] = 23'h45952c;
    stim[28] = 23'h6d03e2;
    stim[29] = 23'h3ce8a4;
    stim[30] = 23'h643f6c;
    stim[31] = 23'h61df18;
    stim[32] = 23'h3024eb;
    stim[33] = 23'h747790;
    stim[34] = 23'h6189ba;
    stim[35] = 23'h34925b;
    stim[36] = 23'h60f5da;
    stim[37] = 23'h21e609;
    stim[38] = 23'h1dfc8c;
    stim[39] = 23'h5469d9;
    stim[40] = 23'h39200f;
    stim[41] = 23'h2c5426;
    stim[42] = 23'h39d832;
    stim[43] = 23'h50de7a;
    stim[44] = 23'h1c05da;
    stim[45] = 23'h14a0b9;
    stim[46] = 23'h60e952;
    stim[47] = 23'h01988a;
    stim[48] = 23'h68f29b;
    stim[49] = 23'h35252e;
    stim[50] = 23'h60af10;
    stim[51] = 23'h646f98;
    stim[52] = 23'h001681;
    stim[53] = 23'h009896;
    stim[54] = 23'h25257e;
    stim[55] = 23'h245ae3;
    stim[56] = 23'h40c2db;
    stim[57] = 23'h38f974;
    stim[58] = 23'h2938b6;
    stim[59] = 23'h244913;
    stim[60] = 23'h74f492;
    stim[61] = 23'h2da976;
    stim[62] = 23'h74dbfd;
    stim[63] = 23'h6072a0;
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
      expv[0] = 38'h20f7ffxxxx;
      expv[1] = 38'h20f7ffxxxx;
      expv[2] = 38'h20f7ffxxxx;
      expv[3] = 38'h100000xxxx;
      expv[4] = 38'h100088xxx3;
      expv[5] = 38'h080008xxx0;
      expv[6] = 38'h0200880041;
      expv[7] = 38'h02008800xx;
      expv[8] = 38'h2000880040;
      expv[9] = 38'h1000000040;
      expv[10] = 38'h10100080xx;
      expv[11] = 38'h0800008040;
      expv[12] = 38'h02008080xx;
      expv[13] = 38'h02008080xx;
      expv[14] = 38'h20f7ff8046;
      expv[15] = 38'h20f7ff80xx;
      expv[16] = 38'h10000000xx;
      expv[17] = 38'h08000000xx;
      expv[18] = 38'h02008000xx;
      expv[19] = 38'h02008000xx;
      expv[20] = 38'h20008000xx;
      expv[21] = 38'h10000000xx;
      expv[22] = 38'h1000000044;
      expv[23] = 38'h0800000040;
      expv[24] = 38'h0200801cxx;
      expv[25] = 38'h0200801cxx;
      expv[26] = 38'h0200801cxx;
      expv[27] = 38'h0200801cxx;
      expv[28] = 38'h2000801cxx;
      expv[29] = 38'h1000001c46;
      expv[30] = 38'h0800001cxx;
      expv[31] = 38'h02008000xx;
      expv[32] = 38'h2000800040;
      expv[33] = 38'h10000000xx;
      expv[34] = 38'h10100080xx;
      expv[35] = 38'h08000080xx;
      expv[36] = 38'h02008080xx;
      expv[37] = 38'h02008080xx;
      expv[38] = 38'h2000808040;
      expv[39] = 38'h10000000xx;
      expv[40] = 38'h1010008044;
      expv[41] = 38'h1000000044;
      expv[42] = 38'h1000880040;
      expv[43] = 38'h08000800xx;
      expv[44] = 38'h02008800xx;
      expv[45] = 38'h0200880040;
      expv[46] = 38'h02008800xx;
      expv[47] = 38'h0200880042;
      expv[48] = 38'h20008800xx;
      expv[49] = 38'h10000000xx;
      expv[50] = 38'h10000000xx;
      expv[51] = 38'h08000000xx;
      expv[52] = 38'h02008024xx;
      expv[53] = 38'h0200802445;
      expv[54] = 38'h02008024xx;
      expv[55] = 38'h20008024xx;
      expv[56] = 38'h10000024xx;
      expv[57] = 38'h08000024xx;
      expv[58] = 38'h0200800049;
      expv[59] = 38'h20008000xx;
      expv[60] = 38'h1000000047;
      expv[61] = 38'h08000000xx;
      expv[62] = 38'h02008000xx;
      expv[63] = 38'h02008000xx;
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
