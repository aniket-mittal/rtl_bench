// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071065 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .bus_cs(in_vec[17:17]),
    .bus_busy(in_vec[16:16]),
    .bus_legit(in_vec[15:15]),
    .ASn(in_vec[14:14]),
    .DSn(in_vec[13:12]),
    .num(in_vec[11:8]),
    .den(in_vec[7:3]),
    .wait2(in_vec[2:2]),
    .wait3(in_vec[1:1]),
    .frst(in_vec[0:0]),
    .cpu_cen(out_vec[34:34]),
    .cpu_cenb(out_vec[33:33]),
    .DTACKn(out_vec[32:32]),
    .fave(out_vec[31:16]),
    .fworst(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h55d2a;
    stim[1] = 19'h484d1;
    stim[2] = 19'h02f0f;
    stim[3] = 19'h12c1d;
    stim[4] = 19'h04a91;
    stim[5] = 19'h2bad2;
    stim[6] = 19'h08a4d;
    stim[7] = 19'h334bf;
    stim[8] = 19'h33608;
    stim[9] = 19'h12a97;
    stim[10] = 19'h3e3d8;
    stim[11] = 19'h1d076;
    stim[12] = 19'h03d1f;
    stim[13] = 19'h3fb2e;
    stim[14] = 19'h39edc;
    stim[15] = 19'h115bd;
    stim[16] = 19'h15e13;
    stim[17] = 19'h3c730;
    stim[18] = 19'h02609;
    stim[19] = 19'h07798;
    stim[20] = 19'h16d1b;
    stim[21] = 19'h0c893;
    stim[22] = 19'h19647;
    stim[23] = 19'h396ae;
    stim[24] = 19'h3e618;
    stim[25] = 19'h3c410;
    stim[26] = 19'h1b1ac;
    stim[27] = 19'h29260;
    stim[28] = 19'h1c3d1;
    stim[29] = 19'h03916;
    stim[30] = 19'h25496;
    stim[31] = 19'h110de;
    stim[32] = 19'h0ced9;
    stim[33] = 19'h31523;
    stim[34] = 19'h104e0;
    stim[35] = 19'h0ad1e;
    stim[36] = 19'h193f3;
    stim[37] = 19'h39b44;
    stim[38] = 19'h1f978;
    stim[39] = 19'h3f493;
    stim[40] = 19'h121af;
    stim[41] = 19'h29d78;
    stim[42] = 19'h357db;
    stim[43] = 19'h561a5;
    stim[44] = 19'h2d371;
    stim[45] = 19'h18b9d;
    stim[46] = 19'h110ea;
    stim[47] = 19'h27251;
    stim[48] = 19'h08609;
    stim[49] = 19'h05513;
    stim[50] = 19'h2b703;
    stim[51] = 19'h12444;
    stim[52] = 19'h178ee;
    stim[53] = 19'h278d5;
    stim[54] = 19'h0e384;
    stim[55] = 19'h72159;
    stim[56] = 19'h1ff0d;
    stim[57] = 19'h01401;
    stim[58] = 19'h072ff;
    stim[59] = 19'h2f267;
    stim[60] = 19'h196c7;
    stim[61] = 19'h19d9d;
    stim[62] = 19'h006ce;
    stim[63] = 19'h2aa1b;
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
      expv[0] = 35'hxxxxxffff;
      expv[1] = 35'h1xxxxffff;
      expv[2] = 35'h3xxxxffff;
      expv[3] = 35'h1xxxxffff;
      expv[4] = 35'h1xxxxffff;
      expv[5] = 35'h1xxxxffff;
      expv[6] = 35'h5xxxxffff;
      expv[7] = 35'h1xxxxffff;
      expv[8] = 35'h3xxxxffff;
      expv[9] = 35'h1xxxxffff;
      expv[10] = 35'h1xxxxffff;
      expv[11] = 35'h5xxxxffff;
      expv[12] = 35'h3xxxxffff;
      expv[13] = 35'h1xxxxffff;
      expv[14] = 35'h1xxxxffff;
      expv[15] = 35'h1xxxxffff;
      expv[16] = 35'h5xxxxffff;
      expv[17] = 35'h1xxxxffff;
      expv[18] = 35'h1xxxxffff;
      expv[19] = 35'h1xxxxffff;
      expv[20] = 35'h3xxxxffff;
      expv[21] = 35'h1xxxxffff;
      expv[22] = 35'h5xxxxffff;
      expv[23] = 35'h1xxxxffff;
      expv[24] = 35'h3xxxxffff;
      expv[25] = 35'h1xxxxffff;
      expv[26] = 35'h1xxxxffff;
      expv[27] = 35'h5xxxxffff;
      expv[28] = 35'h3xxxxffff;
      expv[29] = 35'h5xxxxffff;
      expv[30] = 35'h1xxxxffff;
      expv[31] = 35'h3xxxxffff;
      expv[32] = 35'h5xxxxffff;
      expv[33] = 35'h1xxxxffff;
      expv[34] = 35'h1xxxxffff;
      expv[35] = 35'h3xxxxffff;
      expv[36] = 35'h1xxxxffff;
      expv[37] = 35'h5xxxxffff;
      expv[38] = 35'h1xxxxffff;
      expv[39] = 35'h1xxxxffff;
      expv[40] = 35'h3xxxxffff;
      expv[41] = 35'h5xxxxffff;
      expv[42] = 35'h1xxxxffff;
      expv[43] = 35'h3xxxxffff;
      expv[44] = 35'h5xxxxffff;
      expv[45] = 35'h3xxxxffff;
      expv[46] = 35'h1xxxxffff;
      expv[47] = 35'h5xxxxffff;
      expv[48] = 35'h3xxxxffff;
      expv[49] = 35'h1xxxxffff;
      expv[50] = 35'h1xxxxffff;
      expv[51] = 35'h1xxxxffff;
      expv[52] = 35'h5xxxxffff;
      expv[53] = 35'h3xxxxffff;
      expv[54] = 35'h5xxxxffff;
      expv[55] = 35'h3xxxxffff;
      expv[56] = 35'h5xxxxffff;
      expv[57] = 35'h1xxxxffff;
      expv[58] = 35'h1xxxxffff;
      expv[59] = 35'h3xxxxffff;
      expv[60] = 35'h5xxxxffff;
      expv[61] = 35'h3xxxxffff;
      expv[62] = 35'h1xxxxffff;
      expv[63] = 35'h5xxxxffff;
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
