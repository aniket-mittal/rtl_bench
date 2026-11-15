// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210271 dut (
    .clk(clk),
    .clear(in_vec[10:10]),
    .wr(in_vec[9:9]),
    .data_in(in_vec[8:1]),
    .rd(in_vec[0:0]),
    .data_out(out_vec[10:3]),
    .data_out_valid(out_vec[2:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h73a;
    stim[1] = 11'h719;
    stim[2] = 11'h0fd;
    stim[3] = 11'h215;
    stim[4] = 11'h3e9;
    stim[5] = 11'h25b;
    stim[6] = 11'h3c4;
    stim[7] = 11'h319;
    stim[8] = 11'h0c8;
    stim[9] = 11'h2c9;
    stim[10] = 11'h07a;
    stim[11] = 11'h1fb;
    stim[12] = 11'h229;
    stim[13] = 11'h385;
    stim[14] = 11'h20e;
    stim[15] = 11'h0e9;
    stim[16] = 11'h095;
    stim[17] = 11'h005;
    stim[18] = 11'h216;
    stim[19] = 11'h16e;
    stim[20] = 11'h08b;
    stim[21] = 11'h1e1;
    stim[22] = 11'h216;
    stim[23] = 11'h075;
    stim[24] = 11'h393;
    stim[25] = 11'h281;
    stim[26] = 11'h065;
    stim[27] = 11'h3b9;
    stim[28] = 11'h3f7;
    stim[29] = 11'h3e4;
    stim[30] = 11'h27e;
    stim[31] = 11'h284;
    stim[32] = 11'h209;
    stim[33] = 11'h1b6;
    stim[34] = 11'h27e;
    stim[35] = 11'h200;
    stim[36] = 11'h1f4;
    stim[37] = 11'h298;
    stim[38] = 11'h2d6;
    stim[39] = 11'h003;
    stim[40] = 11'h246;
    stim[41] = 11'h61a;
    stim[42] = 11'h320;
    stim[43] = 11'h2b2;
    stim[44] = 11'h19a;
    stim[45] = 11'h29a;
    stim[46] = 11'h26a;
    stim[47] = 11'h12b;
    stim[48] = 11'h113;
    stim[49] = 11'h0a1;
    stim[50] = 11'h1a9;
    stim[51] = 11'h326;
    stim[52] = 11'h220;
    stim[53] = 11'h2ed;
    stim[54] = 11'h3b9;
    stim[55] = 11'h23e;
    stim[56] = 11'h395;
    stim[57] = 11'h3ba;
    stim[58] = 11'h0c2;
    stim[59] = 11'h205;
    stim[60] = 11'h154;
    stim[61] = 11'h32e;
    stim[62] = 11'h3ec;
    stim[63] = 11'h054;
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
      expv[0] = 11'h002;
      expv[1] = 11'h002;
      expv[2] = 11'h002;
      expv[3] = 11'h002;
      expv[4] = 11'h000;
      expv[5] = 11'h056;
      expv[6] = 11'h050;
      expv[7] = 11'h050;
      expv[8] = 11'h7a4;
      expv[9] = 11'h7a0;
      expv[10] = 11'h16e;
      expv[11] = 11'h16a;
      expv[12] = 11'h16a;
      expv[13] = 11'h168;
      expv[14] = 11'h716;
      expv[15] = 11'h710;
      expv[16] = 11'h466;
      expv[17] = 11'h462;
      expv[18] = 11'h462;
      expv[19] = 11'h460;
      expv[20] = 11'h460;
      expv[21] = 11'h326;
      expv[22] = 11'h322;
      expv[23] = 11'h320;
      expv[24] = 11'h0a6;
      expv[25] = 11'h0a0;
      expv[26] = 11'h616;
      expv[27] = 11'h612;
      expv[28] = 11'h610;
      expv[29] = 11'h03e;
      expv[30] = 11'h038;
      expv[31] = 11'h038;
      expv[32] = 11'h038;
      expv[33] = 11'h214;
      expv[34] = 11'h210;
      expv[35] = 11'h210;
      expv[36] = 11'h210;
      expv[37] = 11'h210;
      expv[38] = 11'h210;
      expv[39] = 11'h210;
      expv[40] = 11'h024;
      expv[41] = 11'h002;
      expv[42] = 11'h002;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h484;
      expv[49] = 11'h2cc;
      expv[50] = 11'h26c;
      expv[51] = 11'h1ae;
      expv[52] = 11'h1a8;
      expv[53] = 11'h1a8;
      expv[54] = 11'h49c;
      expv[55] = 11'h086;
      expv[56] = 11'h080;
      expv[57] = 11'h3b6;
      expv[58] = 11'h3b0;
      expv[59] = 11'h3b0;
      expv[60] = 11'h6e6;
      expv[61] = 11'h6e2;
      expv[62] = 11'h6e0;
      expv[63] = 11'h6e0;
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
