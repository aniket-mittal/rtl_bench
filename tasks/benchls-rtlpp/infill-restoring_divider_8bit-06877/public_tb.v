// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06877 dut (
    .clk(clk),
    .reset(in_vec[14:14]),
    .n_in(in_vec[13:6]),
    .d_in(in_vec[5:0]),
    .r_out(out_vec[13:8]),
    .q_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h619e;
    stim[1] = 15'h71c7;
    stim[2] = 15'h0e55;
    stim[3] = 15'h159c;
    stim[4] = 15'h012d;
    stim[5] = 15'h1201;
    stim[6] = 15'h260e;
    stim[7] = 15'h226a;
    stim[8] = 15'h05bd;
    stim[9] = 15'h3f85;
    stim[10] = 15'h34fb;
    stim[11] = 15'h3bc8;
    stim[12] = 15'h09f5;
    stim[13] = 15'h0d6a;
    stim[14] = 15'h0896;
    stim[15] = 15'h3ea1;
    stim[16] = 15'h28ad;
    stim[17] = 15'h3e8b;
    stim[18] = 15'h0049;
    stim[19] = 15'h1aa9;
    stim[20] = 15'h2be7;
    stim[21] = 15'h1113;
    stim[22] = 15'h1e8e;
    stim[23] = 15'h2ad5;
    stim[24] = 15'h0c43;
    stim[25] = 15'h0a3e;
    stim[26] = 15'h0409;
    stim[27] = 15'h2517;
    stim[28] = 15'h2feb;
    stim[29] = 15'h3291;
    stim[30] = 15'h050e;
    stim[31] = 15'h39bb;
    stim[32] = 15'h0d9b;
    stim[33] = 15'h14ee;
    stim[34] = 15'h29e2;
    stim[35] = 15'h740f;
    stim[36] = 15'h3375;
    stim[37] = 15'h0f64;
    stim[38] = 15'h37ee;
    stim[39] = 15'h1435;
    stim[40] = 15'h24ad;
    stim[41] = 15'h3d23;
    stim[42] = 15'h1200;
    stim[43] = 15'h3461;
    stim[44] = 15'h07c2;
    stim[45] = 15'h26ad;
    stim[46] = 15'h265a;
    stim[47] = 15'h03b2;
    stim[48] = 15'h2be8;
    stim[49] = 15'h284a;
    stim[50] = 15'h2de3;
    stim[51] = 15'h113f;
    stim[52] = 15'h3ebd;
    stim[53] = 15'h090c;
    stim[54] = 15'h1da8;
    stim[55] = 15'h3a5f;
    stim[56] = 15'h3080;
    stim[57] = 15'h1396;
    stim[58] = 15'h048e;
    stim[59] = 15'h0bb0;
    stim[60] = 15'h2237;
    stim[61] = 15'h2287;
    stim[62] = 15'h0dfd;
    stim[63] = 15'h3b6d;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'hxxxx;
      expv[2] = 14'hxxxx;
      expv[3] = 14'hxxxx;
      expv[4] = 14'hxxxx;
      expv[5] = 14'hxxxx;
      expv[6] = 14'hxxxx;
      expv[7] = 14'hxxxx;
      expv[8] = 14'hxxxx;
      expv[9] = 14'hxxxx;
      expv[10] = 14'hxxxx;
      expv[11] = 14'hxxxx;
      expv[12] = 14'hxxxx;
      expv[13] = 14'hxxxx;
      expv[14] = 14'hxxxx;
      expv[15] = 14'hxxxx;
      expv[16] = 14'hxxxx;
      expv[17] = 14'hxxxx;
      expv[18] = 14'hxxxx;
      expv[19] = 14'hxxxx;
      expv[20] = 14'hxxxx;
      expv[21] = 14'hxxxx;
      expv[22] = 14'h0505;
      expv[23] = 14'h0505;
      expv[24] = 14'h0505;
      expv[25] = 14'h0505;
      expv[26] = 14'h0505;
      expv[27] = 14'h0505;
      expv[28] = 14'h0505;
      expv[29] = 14'h0505;
      expv[30] = 14'h0505;
      expv[31] = 14'h0505;
      expv[32] = 14'h0505;
      expv[33] = 14'h0505;
      expv[34] = 14'h0505;
      expv[35] = 14'h0505;
      expv[36] = 14'h0505;
      expv[37] = 14'h0505;
      expv[38] = 14'h0505;
      expv[39] = 14'h0505;
      expv[40] = 14'h0505;
      expv[41] = 14'h0505;
      expv[42] = 14'h0505;
      expv[43] = 14'h0505;
      expv[44] = 14'h0505;
      expv[45] = 14'h0505;
      expv[46] = 14'h0505;
      expv[47] = 14'h0505;
      expv[48] = 14'h0505;
      expv[49] = 14'h0505;
      expv[50] = 14'h0505;
      expv[51] = 14'h0505;
      expv[52] = 14'h0505;
      expv[53] = 14'h0505;
      expv[54] = 14'h0505;
      expv[55] = 14'h0505;
      expv[56] = 14'h1407;
      expv[57] = 14'h1407;
      expv[58] = 14'h1407;
      expv[59] = 14'h1407;
      expv[60] = 14'h1407;
      expv[61] = 14'h1407;
      expv[62] = 14'h1407;
      expv[63] = 14'h1407;
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
