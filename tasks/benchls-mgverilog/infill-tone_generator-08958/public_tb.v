// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08958 dut (
    .clk(clk),
    .rst(in_vec[14:14]),
    .divider(in_vec[13:0]),
    .snd(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h63c4;
    stim[1] = 15'h447e;
    stim[2] = 15'h29cc;
    stim[3] = 15'h3651;
    stim[4] = 15'h00e2;
    stim[5] = 15'h1f69;
    stim[6] = 15'h3d10;
    stim[7] = 15'h1259;
    stim[8] = 15'h3736;
    stim[9] = 15'h18c4;
    stim[10] = 15'h14a9;
    stim[11] = 15'h1c27;
    stim[12] = 15'h2b76;
    stim[13] = 15'h0afd;
    stim[14] = 15'h37e5;
    stim[15] = 15'h2207;
    stim[16] = 15'h2f49;
    stim[17] = 15'h3910;
    stim[18] = 15'h0083;
    stim[19] = 15'h3e99;
    stim[20] = 15'h0beb;
    stim[21] = 15'h3286;
    stim[22] = 15'h00b1;
    stim[23] = 15'h2186;
    stim[24] = 15'h2806;
    stim[25] = 15'h18d2;
    stim[26] = 15'h2e23;
    stim[27] = 15'h196e;
    stim[28] = 15'h1080;
    stim[29] = 15'h0997;
    stim[30] = 15'h2b9d;
    stim[31] = 15'h0524;
    stim[32] = 15'h214e;
    stim[33] = 15'h1bf0;
    stim[34] = 15'h04a3;
    stim[35] = 15'h147e;
    stim[36] = 15'h3f4b;
    stim[37] = 15'h01b9;
    stim[38] = 15'h2a53;
    stim[39] = 15'h38a9;
    stim[40] = 15'h27e6;
    stim[41] = 15'h396b;
    stim[42] = 15'h3b59;
    stim[43] = 15'h37f2;
    stim[44] = 15'h27e4;
    stim[45] = 15'h040d;
    stim[46] = 15'h316e;
    stim[47] = 15'h25df;
    stim[48] = 15'h1052;
    stim[49] = 15'h3e67;
    stim[50] = 15'h12ed;
    stim[51] = 15'h295b;
    stim[52] = 15'h0afd;
    stim[53] = 15'h34c5;
    stim[54] = 15'h27b5;
    stim[55] = 15'h28c5;
    stim[56] = 15'h1862;
    stim[57] = 15'h0fcb;
    stim[58] = 15'h2c0d;
    stim[59] = 15'h2330;
    stim[60] = 15'h2b83;
    stim[61] = 15'h18c5;
    stim[62] = 15'h32f0;
    stim[63] = 15'h0884;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
