// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_016414 dut (
    .clk(clk),
    .clr(in_vec[13:13]),
    .xmsel(in_vec[12:12]),
    .ymsel(in_vec[11:11]),
    .xld(in_vec[10:10]),
    .yld(in_vec[9:9]),
    .gld(in_vec[8:8]),
    .xin(in_vec[7:4]),
    .yin(in_vec[3:0]),
    .gcd(out_vec[5:2]),
    .eqflag(out_vec[1:1]),
    .ltflag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h2502;
    stim[1] = 14'h36b2;
    stim[2] = 14'h193a;
    stim[3] = 14'h12ad;
    stim[4] = 14'h1fc2;
    stim[5] = 14'h04ae;
    stim[6] = 14'h00c9;
    stim[7] = 14'h19e0;
    stim[8] = 14'h0fe6;
    stim[9] = 14'h135b;
    stim[10] = 14'h0810;
    stim[11] = 14'h1d70;
    stim[12] = 14'h0d95;
    stim[13] = 14'h0b77;
    stim[14] = 14'h181c;
    stim[15] = 14'h0302;
    stim[16] = 14'h01c4;
    stim[17] = 14'h0816;
    stim[18] = 14'h049a;
    stim[19] = 14'h1233;
    stim[20] = 14'h1296;
    stim[21] = 14'h173c;
    stim[22] = 14'h13b9;
    stim[23] = 14'h19c0;
    stim[24] = 14'h08ac;
    stim[25] = 14'h11ae;
    stim[26] = 14'h03c1;
    stim[27] = 14'h027a;
    stim[28] = 14'h1931;
    stim[29] = 14'h1a62;
    stim[30] = 14'h172a;
    stim[31] = 14'h0522;
    stim[32] = 14'h0369;
    stim[33] = 14'h1f3e;
    stim[34] = 14'h1b35;
    stim[35] = 14'h18cd;
    stim[36] = 14'h0af7;
    stim[37] = 14'h1c1e;
    stim[38] = 14'h0db6;
    stim[39] = 14'h070d;
    stim[40] = 14'h090c;
    stim[41] = 14'h04bb;
    stim[42] = 14'h1e1e;
    stim[43] = 14'h1739;
    stim[44] = 14'h0421;
    stim[45] = 14'h0d64;
    stim[46] = 14'h1067;
    stim[47] = 14'h0729;
    stim[48] = 14'h1c77;
    stim[49] = 14'h0de8;
    stim[50] = 14'h0e5d;
    stim[51] = 14'h13e3;
    stim[52] = 14'h065d;
    stim[53] = 14'h056c;
    stim[54] = 14'h1928;
    stim[55] = 14'h15dd;
    stim[56] = 14'h1ad3;
    stim[57] = 14'h1781;
    stim[58] = 14'h1905;
    stim[59] = 14'h0181;
    stim[60] = 14'h071e;
    stim[61] = 14'h09f1;
    stim[62] = 14'h0849;
    stim[63] = 14'h0bc0;
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
      expv[0] = 6'h02;
      expv[1] = 6'h02;
      expv[2] = 6'h02;
      expv[3] = 6'h02;
      expv[4] = 6'h02;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h28;
      expv[9] = 6'h28;
      expv[10] = 6'h21;
      expv[11] = 6'h21;
      expv[12] = 6'h21;
      expv[13] = 6'h1d;
      expv[14] = 6'h24;
      expv[15] = 6'h24;
      expv[16] = 6'h25;
      expv[17] = 6'h25;
      expv[18] = 6'h25;
      expv[19] = 6'h25;
      expv[20] = 6'h24;
      expv[21] = 6'h24;
      expv[22] = 6'h2d;
      expv[23] = 6'h0d;
      expv[24] = 6'h0d;
      expv[25] = 6'h0d;
      expv[26] = 6'h0d;
      expv[27] = 6'h0d;
      expv[28] = 6'h0d;
      expv[29] = 6'h0d;
      expv[30] = 6'h0c;
      expv[31] = 6'h0d;
      expv[32] = 6'h09;
      expv[33] = 6'h0d;
      expv[34] = 6'h0d;
      expv[35] = 6'h0d;
      expv[36] = 6'h0d;
      expv[37] = 6'h0d;
      expv[38] = 6'h0d;
      expv[39] = 6'h04;
      expv[40] = 6'h29;
      expv[41] = 6'h0d;
      expv[42] = 6'h0d;
      expv[43] = 6'h0d;
      expv[44] = 6'h05;
      expv[45] = 6'h05;
      expv[46] = 6'h19;
      expv[47] = 6'h19;
      expv[48] = 6'h24;
      expv[49] = 6'h24;
      expv[50] = 6'h1d;
      expv[51] = 6'h1c;
      expv[52] = 6'h3c;
      expv[53] = 6'h3d;
      expv[54] = 6'h05;
      expv[55] = 6'h09;
      expv[56] = 6'h09;
      expv[57] = 6'h08;
      expv[58] = 6'h34;
      expv[59] = 6'h20;
      expv[60] = 6'h20;
      expv[61] = 6'h21;
      expv[62] = 6'h09;
      expv[63] = 6'h09;
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
