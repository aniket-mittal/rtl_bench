// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_168275 dut (
    .clk_in(clk),
    .rst_in(in_vec[25:25]),
    .cpumc_a_in(in_vec[24:9]),
    .cpumc_din_in(in_vec[8:1]),
    .cpu_r_nw_in(in_vec[0:0]),
    .cpumc_dout_in(out_vec[33:26]),
    .active_out(out_vec[25:25]),
    .cpumc_a_out(out_vec[24:9]),
    .cpumc_d_out(out_vec[8:1]),
    .cpumc_r_nw_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h0520e75;
    stim[1] = 26'h0ce8e02;
    stim[2] = 26'h3dc81a6;
    stim[3] = 26'h3a68985;
    stim[4] = 26'h3a78a79;
    stim[5] = 26'h22da15b;
    stim[6] = 26'h3f0b72b;
    stim[7] = 26'h3a835cb;
    stim[8] = 26'h3f9d885;
    stim[9] = 26'h34314dc;
    stim[10] = 26'h2325c94;
    stim[11] = 26'h2d6f7e4;
    stim[12] = 26'h365fa47;
    stim[13] = 26'h3bddcd2;
    stim[14] = 26'h3d3d3a0;
    stim[15] = 26'h3f29724;
    stim[16] = 26'h2851719;
    stim[17] = 26'h30a3a73;
    stim[18] = 26'h2b838e9;
    stim[19] = 26'h207cd59;
    stim[20] = 26'h2fba4c5;
    stim[21] = 26'h11696e7;
    stim[22] = 26'h3cabdaf;
    stim[23] = 26'h24110fd;
    stim[24] = 26'h2c23a6b;
    stim[25] = 26'h3664e81;
    stim[26] = 26'h3ef86a6;
    stim[27] = 26'h360a3c1;
    stim[28] = 26'h2803b86;
    stim[29] = 26'h249106c;
    stim[30] = 26'h30ac56e;
    stim[31] = 26'h21b5078;
    stim[32] = 26'h2fe4c93;
    stim[33] = 26'h371422d;
    stim[34] = 26'h2b66570;
    stim[35] = 26'h3e7c2c7;
    stim[36] = 26'h2964e88;
    stim[37] = 26'h2241c43;
    stim[38] = 26'h2678bfa;
    stim[39] = 26'h33fbdbe;
    stim[40] = 26'h2a871e7;
    stim[41] = 26'h296a587;
    stim[42] = 26'h374db3c;
    stim[43] = 26'h2c712dc;
    stim[44] = 26'h38eafd7;
    stim[45] = 26'h2a15895;
    stim[46] = 26'h3be54d4;
    stim[47] = 26'h0c09172;
    stim[48] = 26'h2120c27;
    stim[49] = 26'h279d93d;
    stim[50] = 26'h24ef9ba;
    stim[51] = 26'h335b0e0;
    stim[52] = 26'h3065321;
    stim[53] = 26'h29fba10;
    stim[54] = 26'h225a0c8;
    stim[55] = 26'h2da342e;
    stim[56] = 26'h3017d8a;
    stim[57] = 26'h3b5ca7c;
    stim[58] = 26'h381d6f8;
    stim[59] = 26'h2ad3682;
    stim[60] = 26'h3f6592e;
    stim[61] = 26'h2a6f7c7;
    stim[62] = 26'h23b33b1;
    stim[63] = 26'h36f81ec;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxx000xxx;
      expv[3] = 34'hxxx000xxx;
      expv[4] = 34'hxxx000xxx;
      expv[5] = 34'hxxx000xxx;
      expv[6] = 34'hxxx000xxx;
      expv[7] = 34'hxxx000xxx;
      expv[8] = 34'hxxx000xxx;
      expv[9] = 34'hxxx000xxx;
      expv[10] = 34'hxxx000xxx;
      expv[11] = 34'hxxx000xxx;
      expv[12] = 34'hxxx000xxx;
      expv[13] = 34'hxxx000xxx;
      expv[14] = 34'hxxx000xxx;
      expv[15] = 34'hxxx000xxx;
      expv[16] = 34'hxxx000xxx;
      expv[17] = 34'hxxx000xxx;
      expv[18] = 34'hxxx000xxx;
      expv[19] = 34'hxxx000xxx;
      expv[20] = 34'hxxx000xxx;
      expv[21] = 34'hxxx000xxx;
      expv[22] = 34'hxxx000xxx;
      expv[23] = 34'hxxx000xxx;
      expv[24] = 34'hxxx000xxx;
      expv[25] = 34'hxxx000xxx;
      expv[26] = 34'hxxx000xxx;
      expv[27] = 34'hxxx000xxx;
      expv[28] = 34'hxxx000xxx;
      expv[29] = 34'hxxx000xxx;
      expv[30] = 34'hxxx000xxx;
      expv[31] = 34'hxxx000xxx;
      expv[32] = 34'hxxx000xxx;
      expv[33] = 34'hxxx000xxx;
      expv[34] = 34'hxxx000xxx;
      expv[35] = 34'hxxx000xxx;
      expv[36] = 34'hxxx000xxx;
      expv[37] = 34'hxxx000xxx;
      expv[38] = 34'hxxx000xxx;
      expv[39] = 34'hxxx000xxx;
      expv[40] = 34'hxxx000xxx;
      expv[41] = 34'hxxx000xxx;
      expv[42] = 34'hxxx000xxx;
      expv[43] = 34'hxxx000xxx;
      expv[44] = 34'hxxx000xxx;
      expv[45] = 34'hxxx000xxx;
      expv[46] = 34'hxxx000xxx;
      expv[47] = 34'hxxx000xxx;
      expv[48] = 34'hxxx000xxx;
      expv[49] = 34'hxxx000xxx;
      expv[50] = 34'hxxx000xxx;
      expv[51] = 34'hxxx000xxx;
      expv[52] = 34'hxxx000xxx;
      expv[53] = 34'hxxx000xxx;
      expv[54] = 34'hxxx000xxx;
      expv[55] = 34'hxxx000xxx;
      expv[56] = 34'hxxx000xxx;
      expv[57] = 34'hxxx000xxx;
      expv[58] = 34'hxxx000xxx;
      expv[59] = 34'hxxx000xxx;
      expv[60] = 34'hxxx000xxx;
      expv[61] = 34'hxxx000xxx;
      expv[62] = 34'hxxx000xxx;
      expv[63] = 34'hxxx000xxx;
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
