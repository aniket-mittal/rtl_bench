// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099631 dut (
    .in1(in_vec[21:14]),
    .in2(in_vec[13:6]),
    .cin(in_vec[5:5]),
    .m(in_vec[4:4]),
    .s(in_vec[3:0]),
    .out(out_vec[9:2]),
    .aeb(out_vec[1:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h370e06;
    stim[1] = 22'h33dd55;
    stim[2] = 22'h23594b;
    stim[3] = 22'h022e45;
    stim[4] = 22'h30a162;
    stim[5] = 22'h323e2c;
    stim[6] = 22'h0c3d66;
    stim[7] = 22'h3bf907;
    stim[8] = 22'h184925;
    stim[9] = 22'h34573f;
    stim[10] = 22'h1846c7;
    stim[11] = 22'h10e9a9;
    stim[12] = 22'h2ce9c1;
    stim[13] = 22'h182446;
    stim[14] = 22'h3837ee;
    stim[15] = 22'h3b672d;
    stim[16] = 22'h1b3d4f;
    stim[17] = 22'h18a41c;
    stim[18] = 22'h2e231b;
    stim[19] = 22'h2c1960;
    stim[20] = 22'h02abd7;
    stim[21] = 22'h1ee8e6;
    stim[22] = 22'h32ccb8;
    stim[23] = 22'h34f7a0;
    stim[24] = 22'h2998b1;
    stim[25] = 22'h085809;
    stim[26] = 22'h05a27f;
    stim[27] = 22'h210e30;
    stim[28] = 22'h3f44ed;
    stim[29] = 22'h2c6c68;
    stim[30] = 22'h26ef77;
    stim[31] = 22'h0aee29;
    stim[32] = 22'h14c2d2;
    stim[33] = 22'h17cc3e;
    stim[34] = 22'h354f43;
    stim[35] = 22'h0f7c70;
    stim[36] = 22'h277134;
    stim[37] = 22'h178e44;
    stim[38] = 22'h2725b3;
    stim[39] = 22'h0d4297;
    stim[40] = 22'h3e9ebd;
    stim[41] = 22'h046a8b;
    stim[42] = 22'h299309;
    stim[43] = 22'h3f690f;
    stim[44] = 22'h139c44;
    stim[45] = 22'h356bfd;
    stim[46] = 22'h17ba8a;
    stim[47] = 22'h237035;
    stim[48] = 22'h28ae57;
    stim[49] = 22'h25109f;
    stim[50] = 22'h0c1752;
    stim[51] = 22'h08ca03;
    stim[52] = 22'h353560;
    stim[53] = 22'h21eefd;
    stim[54] = 22'h0d640a;
    stim[55] = 22'h0e8ad8;
    stim[56] = 22'h2180cb;
    stim[57] = 22'h2978d2;
    stim[58] = 22'h2b4426;
    stim[59] = 22'h2cee20;
    stim[60] = 22'h251ec0;
    stim[61] = 22'h2bb8ea;
    stim[62] = 22'h26bf7a;
    stim[63] = 22'h1ff370;
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
      expv[0] = 10'h050;
      expv[1] = 10'h000;
      expv[2] = 10'h134;
      expv[3] = 10'h2e0;
      expv[4] = 10'h001;
      expv[5] = 10'h001;
      expv[6] = 10'h000;
      expv[7] = 10'h02d;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h118;
      expv[11] = 10'h000;
      expv[12] = 10'h031;
      expv[13] = 10'h3c4;
      expv[14] = 10'h001;
      expv[15] = 10'h001;
      expv[16] = 10'h308;
      expv[17] = 10'h180;
      expv[18] = 10'h231;
      expv[19] = 10'h000;
      expv[20] = 10'h028;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h001;
      expv[24] = 10'h000;
      expv[25] = 10'h384;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h003;
      expv[30] = 10'h001;
      expv[31] = 10'h000;
      expv[32] = 10'h16c;
      expv[33] = 10'h000;
      expv[34] = 10'h350;
      expv[35] = 10'h000;
      expv[36] = 10'h001;
      expv[37] = 10'h0e8;
      expv[38] = 10'h001;
      expv[39] = 10'h0d4;
      expv[40] = 10'h000;
      expv[41] = 10'h334;
      expv[42] = 10'h178;
      expv[43] = 10'h109;
      expv[44] = 10'h1c8;
      expv[45] = 10'h001;
      expv[46] = 10'h058;
      expv[47] = 10'h001;
      expv[48] = 10'h289;
      expv[49] = 10'h128;
      expv[50] = 10'h1f4;
      expv[51] = 10'h088;
      expv[52] = 10'h001;
      expv[53] = 10'h001;
      expv[54] = 10'h3c0;
      expv[55] = 10'h350;
      expv[56] = 10'h200;
      expv[57] = 10'h39d;
      expv[58] = 10'h000;
      expv[59] = 10'h001;
      expv[60] = 10'h03c;
      expv[61] = 10'h001;
      expv[62] = 10'h001;
      expv[63] = 10'h000;
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
