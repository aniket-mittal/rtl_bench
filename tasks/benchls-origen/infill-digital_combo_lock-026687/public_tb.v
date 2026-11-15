// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026687 dut (
    .clk(clk),
    .inputs(in_vec[13:6]),
    .reset(in_vec[5:5]),
    .set(in_vec[4:4]),
    .change(in_vec[3:3]),
    .shut(in_vec[2:2]),
    .enter1(in_vec[1:1]),
    .enter2(in_vec[0:0]),
    .open(out_vec[18:18]),
    .close(out_vec[17:17]),
    .workstatus(out_vec[16:16]),
    .temp(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h0d6b;
    stim[1] = 14'h163d;
    stim[2] = 14'h3bc0;
    stim[3] = 14'h2e15;
    stim[4] = 14'h390f;
    stim[5] = 14'h130c;
    stim[6] = 14'h3818;
    stim[7] = 14'h1e97;
    stim[8] = 14'h2557;
    stim[9] = 14'h2905;
    stim[10] = 14'h069c;
    stim[11] = 14'h23de;
    stim[12] = 14'h1149;
    stim[13] = 14'h0286;
    stim[14] = 14'h1b86;
    stim[15] = 14'h120d;
    stim[16] = 14'h3e0c;
    stim[17] = 14'h1bd0;
    stim[18] = 14'h1687;
    stim[19] = 14'h14d9;
    stim[20] = 14'h0cc0;
    stim[21] = 14'h10cb;
    stim[22] = 14'h1617;
    stim[23] = 14'h3b93;
    stim[24] = 14'h1edf;
    stim[25] = 14'h2694;
    stim[26] = 14'h0b14;
    stim[27] = 14'h3955;
    stim[28] = 14'h2f1c;
    stim[29] = 14'h11d9;
    stim[30] = 14'h3b53;
    stim[31] = 14'h1d5a;
    stim[32] = 14'h2996;
    stim[33] = 14'h2614;
    stim[34] = 14'h1540;
    stim[35] = 14'h0414;
    stim[36] = 14'h339d;
    stim[37] = 14'h3807;
    stim[38] = 14'h3bdd;
    stim[39] = 14'h1ac5;
    stim[40] = 14'h205e;
    stim[41] = 14'h2c97;
    stim[42] = 14'h1599;
    stim[43] = 14'h1f10;
    stim[44] = 14'h2653;
    stim[45] = 14'h30de;
    stim[46] = 14'h2a17;
    stim[47] = 14'h1648;
    stim[48] = 14'h3052;
    stim[49] = 14'h1c8e;
    stim[50] = 14'h3088;
    stim[51] = 14'h3ac2;
    stim[52] = 14'h361d;
    stim[53] = 14'h349a;
    stim[54] = 14'h2d9e;
    stim[55] = 14'h25de;
    stim[56] = 14'h335c;
    stim[57] = 14'h1210;
    stim[58] = 14'h2f1c;
    stim[59] = 14'h0f5f;
    stim[60] = 14'h01db;
    stim[61] = 14'h2b86;
    stim[62] = 14'h06da;
    stim[63] = 14'h1fde;
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
      expv[0] = 19'h10000;
      expv[1] = 19'h10000;
      expv[2] = 19'h10000;
      expv[3] = 19'h10000;
      expv[4] = 19'h10000;
      expv[5] = 19'h10000;
      expv[6] = 19'h10000;
      expv[7] = 19'h10000;
      expv[8] = 19'h10000;
      expv[9] = 19'h10000;
      expv[10] = 19'h10000;
      expv[11] = 19'h10000;
      expv[12] = 19'h10000;
      expv[13] = 19'h10000;
      expv[14] = 19'h10000;
      expv[15] = 19'h10000;
      expv[16] = 19'h10000;
      expv[17] = 19'h10000;
      expv[18] = 19'h10000;
      expv[19] = 19'h10000;
      expv[20] = 19'h10000;
      expv[21] = 19'h10000;
      expv[22] = 19'h10000;
      expv[23] = 19'h10000;
      expv[24] = 19'h10000;
      expv[25] = 19'h10000;
      expv[26] = 19'h10000;
      expv[27] = 19'h10000;
      expv[28] = 19'h10000;
      expv[29] = 19'h10000;
      expv[30] = 19'h10000;
      expv[31] = 19'h10000;
      expv[32] = 19'h10000;
      expv[33] = 19'h10000;
      expv[34] = 19'h10000;
      expv[35] = 19'h10000;
      expv[36] = 19'h10000;
      expv[37] = 19'h10000;
      expv[38] = 19'h10000;
      expv[39] = 19'h10000;
      expv[40] = 19'h10000;
      expv[41] = 19'h10000;
      expv[42] = 19'h10000;
      expv[43] = 19'h10000;
      expv[44] = 19'h10000;
      expv[45] = 19'h10000;
      expv[46] = 19'h10000;
      expv[47] = 19'h10000;
      expv[48] = 19'h10000;
      expv[49] = 19'h10000;
      expv[50] = 19'h10000;
      expv[51] = 19'h10000;
      expv[52] = 19'h10000;
      expv[53] = 19'h10000;
      expv[54] = 19'h10000;
      expv[55] = 19'h10000;
      expv[56] = 19'h10000;
      expv[57] = 19'h10000;
      expv[58] = 19'h10000;
      expv[59] = 19'h10000;
      expv[60] = 19'h10000;
      expv[61] = 19'h10000;
      expv[62] = 19'h10000;
      expv[63] = 19'h10000;
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
