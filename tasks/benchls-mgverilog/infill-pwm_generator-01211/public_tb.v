// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01211 dut (
    .clk(clk),
    .reset(in_vec[35:35]),
    .sel(in_vec[34:34]),
    .adr(in_vec[33:32]),
    .data(in_vec[31:0]),
    .pwm_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hfae8e701d;
    stim[1] = 36'hcd3f72e6f;
    stim[2] = 36'h6ee5f2cdc;
    stim[3] = 36'h0f9c4e8b1;
    stim[4] = 36'h2df8d2a53;
    stim[5] = 36'h2f13ac9eb;
    stim[6] = 36'h75f6b2a6b;
    stim[7] = 36'h77d055f45;
    stim[8] = 36'h007fef73e;
    stim[9] = 36'h0c8f0b2eb;
    stim[10] = 36'h772ff39f3;
    stim[11] = 36'h5225ba1b2;
    stim[12] = 36'h7ca936f67;
    stim[13] = 36'h26af57885;
    stim[14] = 36'h728c54a0c;
    stim[15] = 36'h4e3f3c12d;
    stim[16] = 36'h3d7870965;
    stim[17] = 36'h4d539e0fc;
    stim[18] = 36'h64f442abc;
    stim[19] = 36'h44ddde374;
    stim[20] = 36'h2b6e60a21;
    stim[21] = 36'h4547af65d;
    stim[22] = 36'h7ec5bcdcc;
    stim[23] = 36'h4eec56f5f;
    stim[24] = 36'h18e29f0e1;
    stim[25] = 36'h1b075f33e;
    stim[26] = 36'h3c67459c5;
    stim[27] = 36'h326969b5d;
    stim[28] = 36'h3f81c0fbd;
    stim[29] = 36'h3f4a51f19;
    stim[30] = 36'h2667af872;
    stim[31] = 36'h7c8d9d892;
    stim[32] = 36'h71aba7932;
    stim[33] = 36'h2448aa6a5;
    stim[34] = 36'h1cd228ebb;
    stim[35] = 36'h74bd51990;
    stim[36] = 36'h5d26b55c5;
    stim[37] = 36'h43f7483d6;
    stim[38] = 36'h1823b0c21;
    stim[39] = 36'h430f72662;
    stim[40] = 36'h501d8cf40;
    stim[41] = 36'h419de5715;
    stim[42] = 36'h5d7ff9b02;
    stim[43] = 36'h28368e482;
    stim[44] = 36'h6fdd2457a;
    stim[45] = 36'h23b2e2e15;
    stim[46] = 36'h158eac01a;
    stim[47] = 36'h3bbd22985;
    stim[48] = 36'h25c8f460a;
    stim[49] = 36'h7a25587f3;
    stim[50] = 36'h6c482592b;
    stim[51] = 36'h3b24fd983;
    stim[52] = 36'h084435384;
    stim[53] = 36'h2041470cc;
    stim[54] = 36'h0601a169c;
    stim[55] = 36'h36e2dd615;
    stim[56] = 36'h27950673f;
    stim[57] = 36'h4f3bc533e;
    stim[58] = 36'h1174c9243;
    stim[59] = 36'h62cbca6bb;
    stim[60] = 36'h7d8510828;
    stim[61] = 36'h13ba0c298;
    stim[62] = 36'h0c8d6062e;
    stim[63] = 36'h4a7da0565;
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
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
