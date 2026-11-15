// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_144596 dut (
    .A(in_vec[9:6]),
    .B(in_vec[5:2]),
    .shift(in_vec[1:0]),
    .OUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h069;
    stim[1] = 10'h25e;
    stim[2] = 10'h215;
    stim[3] = 10'h091;
    stim[4] = 10'h350;
    stim[5] = 10'h073;
    stim[6] = 10'h3b0;
    stim[7] = 10'h0a6;
    stim[8] = 10'h1f0;
    stim[9] = 10'h25d;
    stim[10] = 10'h302;
    stim[11] = 10'h2be;
    stim[12] = 10'h20e;
    stim[13] = 10'h0d1;
    stim[14] = 10'h0eb;
    stim[15] = 10'h20a;
    stim[16] = 10'h044;
    stim[17] = 10'h042;
    stim[18] = 10'h18f;
    stim[19] = 10'h224;
    stim[20] = 10'h2d7;
    stim[21] = 10'h2e5;
    stim[22] = 10'h162;
    stim[23] = 10'h33f;
    stim[24] = 10'h1f8;
    stim[25] = 10'h167;
    stim[26] = 10'h221;
    stim[27] = 10'h180;
    stim[28] = 10'h1c5;
    stim[29] = 10'h310;
    stim[30] = 10'h3f1;
    stim[31] = 10'h34c;
    stim[32] = 10'h25b;
    stim[33] = 10'h2c9;
    stim[34] = 10'h3a3;
    stim[35] = 10'h236;
    stim[36] = 10'h31f;
    stim[37] = 10'h15e;
    stim[38] = 10'h12e;
    stim[39] = 10'h134;
    stim[40] = 10'h273;
    stim[41] = 10'h234;
    stim[42] = 10'h2ef;
    stim[43] = 10'h1fe;
    stim[44] = 10'h27e;
    stim[45] = 10'h280;
    stim[46] = 10'h0d5;
    stim[47] = 10'h2e8;
    stim[48] = 10'h3c8;
    stim[49] = 10'h148;
    stim[50] = 10'h2fc;
    stim[51] = 10'h251;
    stim[52] = 10'h154;
    stim[53] = 10'h04c;
    stim[54] = 10'h3df;
    stim[55] = 10'h37b;
    stim[56] = 10'h06b;
    stim[57] = 10'h373;
    stim[58] = 10'h3a1;
    stim[59] = 10'h209;
    stim[60] = 10'h32a;
    stim[61] = 10'h11e;
    stim[62] = 10'h196;
    stim[63] = 10'h1d4;
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
      expv[0] = 8'h14;
      expv[1] = 8'hfc;
      expv[2] = 8'h50;
      expv[3] = 8'h10;
      expv[4] = 8'h34;
      expv[5] = 8'h06;
      expv[6] = 8'ha8;
      expv[7] = 8'h48;
      expv[8] = 8'h54;
      expv[9] = 8'h7e;
      expv[10] = 8'h00;
      expv[11] = 8'h5a;
      expv[12] = 8'h60;
      expv[13] = 8'h18;
      expv[14] = 8'h0f;
      expv[15] = 8'h40;
      expv[16] = 8'h01;
      expv[17] = 8'h00;
      expv[18] = 8'h09;
      expv[19] = 8'h48;
      expv[20] = 8'h9b;
      expv[21] = 8'hc6;
      expv[22] = 8'ha0;
      expv[23] = 8'h5a;
      expv[24] = 8'h62;
      expv[25] = 8'h96;
      expv[26] = 8'h80;
      expv[27] = 8'h00;
      expv[28] = 8'h0e;
      expv[29] = 8'h30;
      expv[30] = 8'h69;
      expv[31] = 8'h27;
      expv[32] = 8'h1b;
      expv[33] = 8'h2c;
      expv[34] = 8'h38;
      expv[35] = 8'ha1;
      expv[36] = 8'h2a;
      expv[37] = 8'h8c;
      expv[38] = 8'hb0;
      expv[39] = 8'h34;
      expv[40] = 8'h36;
      expv[41] = 8'h68;
      expv[42] = 8'hbc;
      expv[43] = 8'ha5;
      expv[44] = 8'h1e;
      expv[45] = 8'h00;
      expv[46] = 8'h1e;
      expv[47] = 8'h6e;
      expv[48] = 8'h1e;
      expv[49] = 8'h0a;
      expv[50] = 8'ha5;
      expv[51] = 8'h48;
      expv[52] = 8'h19;
      expv[53] = 8'h03;
      expv[54] = 8'hb4;
      expv[55] = 8'h5b;
      expv[56] = 8'h05;
      expv[57] = 8'h4e;
      expv[58] = 8'he0;
      expv[59] = 8'h20;
      expv[60] = 8'he1;
      expv[61] = 8'h70;
      expv[62] = 8'h78;
      expv[63] = 8'h23;
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
