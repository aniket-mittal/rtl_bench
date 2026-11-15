// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_042588 dut (
    .clk(clk),
    .Zero(in_vec[14:14]),
    .pc_control(in_vec[13:10]),
    .alu_control(in_vec[9:6]),
    .opcode(in_vec[5:0]),
    .JumpOP(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h4e17;
    stim[1] = 15'h1e24;
    stim[2] = 15'h16ca;
    stim[3] = 15'h0fd7;
    stim[4] = 15'h5076;
    stim[5] = 15'h2f89;
    stim[6] = 15'h1840;
    stim[7] = 15'h3116;
    stim[8] = 15'h035c;
    stim[9] = 15'h5520;
    stim[10] = 15'h7d94;
    stim[11] = 15'h61f4;
    stim[12] = 15'h4329;
    stim[13] = 15'h5e47;
    stim[14] = 15'h1b71;
    stim[15] = 15'h010c;
    stim[16] = 15'h3eab;
    stim[17] = 15'h1ac4;
    stim[18] = 15'h5b98;
    stim[19] = 15'h45c9;
    stim[20] = 15'h7368;
    stim[21] = 15'h1780;
    stim[22] = 15'h1ad3;
    stim[23] = 15'h08a5;
    stim[24] = 15'h12cd;
    stim[25] = 15'h396f;
    stim[26] = 15'h6295;
    stim[27] = 15'h5518;
    stim[28] = 15'h68c7;
    stim[29] = 15'h4468;
    stim[30] = 15'h31f6;
    stim[31] = 15'h41fd;
    stim[32] = 15'h394e;
    stim[33] = 15'h082d;
    stim[34] = 15'h5d53;
    stim[35] = 15'h3e18;
    stim[36] = 15'h09bf;
    stim[37] = 15'h6244;
    stim[38] = 15'h2793;
    stim[39] = 15'h114b;
    stim[40] = 15'h485a;
    stim[41] = 15'h482d;
    stim[42] = 15'h6228;
    stim[43] = 15'h366c;
    stim[44] = 15'h3170;
    stim[45] = 15'h5308;
    stim[46] = 15'h7c43;
    stim[47] = 15'h4bbf;
    stim[48] = 15'h532d;
    stim[49] = 15'h24a6;
    stim[50] = 15'h644d;
    stim[51] = 15'h678e;
    stim[52] = 15'h2974;
    stim[53] = 15'h3681;
    stim[54] = 15'h0f42;
    stim[55] = 15'h6031;
    stim[56] = 15'h4823;
    stim[57] = 15'h454a;
    stim[58] = 15'h1535;
    stim[59] = 15'h6ec6;
    stim[60] = 15'h0cd4;
    stim[61] = 15'h49fa;
    stim[62] = 15'h32e4;
    stim[63] = 15'h17d2;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h3;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h1;
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
