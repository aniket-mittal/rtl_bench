// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093600 dut (
    .clk(clk),
    .reset(in_vec[14:14]),
    .enable(in_vec[13:13]),
    .load(in_vec[12:12]),
    .loadbits(in_vec[11:0]),
    .count(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h4bf2;
    stim[1] = 15'h7a5c;
    stim[2] = 15'h36aa;
    stim[3] = 15'h297f;
    stim[4] = 15'h36ca;
    stim[5] = 15'h3cc7;
    stim[6] = 15'h14d6;
    stim[7] = 15'h2574;
    stim[8] = 15'h0b17;
    stim[9] = 15'h02a3;
    stim[10] = 15'h18f4;
    stim[11] = 15'h0900;
    stim[12] = 15'h16ef;
    stim[13] = 15'h3932;
    stim[14] = 15'h1320;
    stim[15] = 15'h1492;
    stim[16] = 15'h27fc;
    stim[17] = 15'h39ae;
    stim[18] = 15'h063b;
    stim[19] = 15'h1f2c;
    stim[20] = 15'h2cd2;
    stim[21] = 15'h0aae;
    stim[22] = 15'h2c45;
    stim[23] = 15'h35b9;
    stim[24] = 15'h31ea;
    stim[25] = 15'h3b82;
    stim[26] = 15'h3cfc;
    stim[27] = 15'h0e71;
    stim[28] = 15'h14b8;
    stim[29] = 15'h2a75;
    stim[30] = 15'h11a9;
    stim[31] = 15'h2423;
    stim[32] = 15'h0296;
    stim[33] = 15'h0e2f;
    stim[34] = 15'h36f2;
    stim[35] = 15'h2986;
    stim[36] = 15'h2bc9;
    stim[37] = 15'h2a6a;
    stim[38] = 15'h3cc5;
    stim[39] = 15'h342e;
    stim[40] = 15'h326e;
    stim[41] = 15'h2770;
    stim[42] = 15'h3232;
    stim[43] = 15'h3bff;
    stim[44] = 15'h0cf3;
    stim[45] = 15'h2aae;
    stim[46] = 15'h3c0c;
    stim[47] = 15'h2ca7;
    stim[48] = 15'h1b1d;
    stim[49] = 15'h39b6;
    stim[50] = 15'h3fd0;
    stim[51] = 15'h15e0;
    stim[52] = 15'h0d1c;
    stim[53] = 15'h23c3;
    stim[54] = 15'h3af3;
    stim[55] = 15'h3e99;
    stim[56] = 15'h1e6f;
    stim[57] = 15'h1560;
    stim[58] = 15'h26e6;
    stim[59] = 15'h1974;
    stim[60] = 15'h2126;
    stim[61] = 15'h0350;
    stim[62] = 15'h0d7a;
    stim[63] = 15'h140a;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h6aa;
      expv[4] = 12'h6ab;
      expv[5] = 12'h6ca;
      expv[6] = 12'hcc7;
      expv[7] = 12'h4d6;
      expv[8] = 12'h4d7;
      expv[9] = 12'h4d7;
      expv[10] = 12'h4d7;
      expv[11] = 12'h8f4;
      expv[12] = 12'h8f4;
      expv[13] = 12'h6ef;
      expv[14] = 12'h932;
      expv[15] = 12'h320;
      expv[16] = 12'h492;
      expv[17] = 12'h493;
      expv[18] = 12'h9ae;
      expv[19] = 12'h9ae;
      expv[20] = 12'hf2c;
      expv[21] = 12'hf2d;
      expv[22] = 12'hf2d;
      expv[23] = 12'hf2e;
      expv[24] = 12'h5b9;
      expv[25] = 12'h1ea;
      expv[26] = 12'hb82;
      expv[27] = 12'hcfc;
      expv[28] = 12'hcfc;
      expv[29] = 12'h4b8;
      expv[30] = 12'h4b9;
      expv[31] = 12'h1a9;
      expv[32] = 12'h1aa;
      expv[33] = 12'h1aa;
      expv[34] = 12'h1aa;
      expv[35] = 12'h6f2;
      expv[36] = 12'h6f3;
      expv[37] = 12'h6f4;
      expv[38] = 12'h6f5;
      expv[39] = 12'hcc5;
      expv[40] = 12'h42e;
      expv[41] = 12'h26e;
      expv[42] = 12'h26f;
      expv[43] = 12'h232;
      expv[44] = 12'hbff;
      expv[45] = 12'hbff;
      expv[46] = 12'hc00;
      expv[47] = 12'hc0c;
      expv[48] = 12'hc0d;
      expv[49] = 12'hb1d;
      expv[50] = 12'h9b6;
      expv[51] = 12'hfd0;
      expv[52] = 12'h5e0;
      expv[53] = 12'h5e0;
      expv[54] = 12'h5e1;
      expv[55] = 12'haf3;
      expv[56] = 12'he99;
      expv[57] = 12'he6f;
      expv[58] = 12'h560;
      expv[59] = 12'h561;
      expv[60] = 12'h974;
      expv[61] = 12'h975;
      expv[62] = 12'h975;
      expv[63] = 12'h975;
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
