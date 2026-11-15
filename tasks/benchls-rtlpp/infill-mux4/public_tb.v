// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  MUX4 dut (
    .I0(in_vec[17:14]),
    .I1(in_vec[13:10]),
    .I2(in_vec[9:6]),
    .I3(in_vec[5:2]),
    .s(in_vec[1:0]),
    .o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h36fc0;
    stim[1] = 18'h24123;
    stim[2] = 18'h2c1af;
    stim[3] = 18'h35a92;
    stim[4] = 18'h0a894;
    stim[5] = 18'h29f06;
    stim[6] = 18'h234c8;
    stim[7] = 18'h03a81;
    stim[8] = 18'h05cea;
    stim[9] = 18'h3020a;
    stim[10] = 18'h029fa;
    stim[11] = 18'h3e333;
    stim[12] = 18'h14b88;
    stim[13] = 18'h1e66f;
    stim[14] = 18'h115fa;
    stim[15] = 18'h25e01;
    stim[16] = 18'h25373;
    stim[17] = 18'h00798;
    stim[18] = 18'h0126d;
    stim[19] = 18'h3486f;
    stim[20] = 18'h0d6e5;
    stim[21] = 18'h3a36e;
    stim[22] = 18'h19451;
    stim[23] = 18'h226de;
    stim[24] = 18'h3176f;
    stim[25] = 18'h370d2;
    stim[26] = 18'h36d79;
    stim[27] = 18'h2fc18;
    stim[28] = 18'h0c92f;
    stim[29] = 18'h09d9e;
    stim[30] = 18'h1ba40;
    stim[31] = 18'h26509;
    stim[32] = 18'h1fc46;
    stim[33] = 18'h0a26e;
    stim[34] = 18'h16317;
    stim[35] = 18'h3c730;
    stim[36] = 18'h282da;
    stim[37] = 18'h1359b;
    stim[38] = 18'h1307e;
    stim[39] = 18'h3880d;
    stim[40] = 18'h31f26;
    stim[41] = 18'h25374;
    stim[42] = 18'h19666;
    stim[43] = 18'h31b4a;
    stim[44] = 18'h0d523;
    stim[45] = 18'h2875e;
    stim[46] = 18'h3b337;
    stim[47] = 18'h1530d;
    stim[48] = 18'h1dc77;
    stim[49] = 18'h23356;
    stim[50] = 18'h3ef26;
    stim[51] = 18'h0e158;
    stim[52] = 18'h1b28e;
    stim[53] = 18'h26ec8;
    stim[54] = 18'h2c8e3;
    stim[55] = 18'h1aa32;
    stim[56] = 18'h1b6ea;
    stim[57] = 18'h2673b;
    stim[58] = 18'h2bad3;
    stim[59] = 18'h04fda;
    stim[60] = 18'h29272;
    stim[61] = 18'h098cf;
    stim[62] = 18'h03ef1;
    stim[63] = 18'h2f8a5;
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
      expv[0] = 4'hd;
      expv[1] = 4'h8;
      expv[2] = 4'hb;
      expv[3] = 4'ha;
      expv[4] = 4'h2;
      expv[5] = 4'hc;
      expv[6] = 4'h8;
      expv[7] = 4'he;
      expv[8] = 4'h3;
      expv[9] = 4'h8;
      expv[10] = 4'h7;
      expv[11] = 4'hc;
      expv[12] = 4'h5;
      expv[13] = 4'hb;
      expv[14] = 4'h7;
      expv[15] = 4'h7;
      expv[16] = 4'hc;
      expv[17] = 4'h0;
      expv[18] = 4'h4;
      expv[19] = 4'hb;
      expv[20] = 4'h5;
      expv[21] = 4'hd;
      expv[22] = 4'h5;
      expv[23] = 4'hb;
      expv[24] = 4'hb;
      expv[25] = 4'h3;
      expv[26] = 4'hb;
      expv[27] = 4'hb;
      expv[28] = 4'hb;
      expv[29] = 4'h6;
      expv[30] = 4'h6;
      expv[31] = 4'h9;
      expv[32] = 4'h1;
      expv[33] = 4'h9;
      expv[34] = 4'h5;
      expv[35] = 4'hf;
      expv[36] = 4'hb;
      expv[37] = 4'h6;
      expv[38] = 4'h1;
      expv[39] = 4'h2;
      expv[40] = 4'hc;
      expv[41] = 4'h9;
      expv[42] = 4'h9;
      expv[43] = 4'hd;
      expv[44] = 4'h8;
      expv[45] = 4'hd;
      expv[46] = 4'hd;
      expv[47] = 4'h4;
      expv[48] = 4'hd;
      expv[49] = 4'hd;
      expv[50] = 4'hc;
      expv[51] = 4'h3;
      expv[52] = 4'ha;
      expv[53] = 4'h9;
      expv[54] = 4'h8;
      expv[55] = 4'h8;
      expv[56] = 4'hb;
      expv[57] = 4'he;
      expv[58] = 4'h4;
      expv[59] = 4'hf;
      expv[60] = 4'h9;
      expv[61] = 4'h3;
      expv[62] = 4'hf;
      expv[63] = 4'he;
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
