// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_205408 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .dispen(in_vec[16:16]),
    .cntr(in_vec[15:0]),
    .seg(out_vec[11:4]),
    .an(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h29e71;
    stim[1] = 18'h33a24;
    stim[2] = 18'h1fe2f;
    stim[3] = 18'h19556;
    stim[4] = 18'h1c43f;
    stim[5] = 18'h0331c;
    stim[6] = 18'h025af;
    stim[7] = 18'h101f9;
    stim[8] = 18'h0eb29;
    stim[9] = 18'h06c79;
    stim[10] = 18'h10eef;
    stim[11] = 18'h07b3e;
    stim[12] = 18'h19a6c;
    stim[13] = 18'h38b83;
    stim[14] = 18'h18af7;
    stim[15] = 18'h13e45;
    stim[16] = 18'h0c1a0;
    stim[17] = 18'h00c8b;
    stim[18] = 18'h082fd;
    stim[19] = 18'h089c4;
    stim[20] = 18'h0094d;
    stim[21] = 18'h15c6f;
    stim[22] = 18'h3812f;
    stim[23] = 18'h15928;
    stim[24] = 18'h04160;
    stim[25] = 18'h1c870;
    stim[26] = 18'h1021d;
    stim[27] = 18'h0eb99;
    stim[28] = 18'h1ca16;
    stim[29] = 18'h0bdb9;
    stim[30] = 18'h1345d;
    stim[31] = 18'h1d533;
    stim[32] = 18'h14f9f;
    stim[33] = 18'h09b8b;
    stim[34] = 18'h0485d;
    stim[35] = 18'h1b625;
    stim[36] = 18'h033a4;
    stim[37] = 18'h00c92;
    stim[38] = 18'h04ceb;
    stim[39] = 18'h03ad0;
    stim[40] = 18'h0b8c4;
    stim[41] = 18'h09f39;
    stim[42] = 18'h0856b;
    stim[43] = 18'h13c77;
    stim[44] = 18'h0c2c4;
    stim[45] = 18'h02f87;
    stim[46] = 18'h1b6c6;
    stim[47] = 18'h1fa31;
    stim[48] = 18'h0d769;
    stim[49] = 18'h02cd4;
    stim[50] = 18'h1d30c;
    stim[51] = 18'h100d0;
    stim[52] = 18'h03263;
    stim[53] = 18'h1fd8e;
    stim[54] = 18'h1e5cc;
    stim[55] = 18'h18d31;
    stim[56] = 18'h11232;
    stim[57] = 18'h17fda;
    stim[58] = 18'h10742;
    stim[59] = 18'h0e9a7;
    stim[60] = 18'h18554;
    stim[61] = 18'h1e9e2;
    stim[62] = 18'h1941f;
    stim[63] = 18'h1c181;
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
      expv[0] = 12'hf9e;
      expv[1] = 12'h99e;
      expv[2] = 12'h8ee;
      expv[3] = 12'h92d;
      expv[4] = 12'h99b;
      expv[5] = 12'hb07;
      expv[6] = 12'ha47;
      expv[7] = 12'hc07;
      expv[8] = 12'h90e;
      expv[9] = 12'h90e;
      expv[10] = 12'h8ee;
      expv[11] = 12'hb0d;
      expv[12] = 12'h82d;
      expv[13] = 12'hb0e;
      expv[14] = 12'hf8e;
      expv[15] = 12'h99d;
      expv[16] = 12'hf9b;
      expv[17] = 12'hc6b;
      expv[18] = 12'ha4b;
      expv[19] = 12'h90b;
      expv[20] = 12'h90b;
      expv[21] = 12'hc6b;
      expv[22] = 12'h8ee;
      expv[23] = 12'h80e;
      expv[24] = 12'h82d;
      expv[25] = 12'hf8d;
      expv[26] = 12'ha4b;
      expv[27] = 12'h867;
      expv[28] = 12'hc67;
      expv[29] = 12'h90e;
      expv[30] = 12'ha1e;
      expv[31] = 12'hb0d;
      expv[32] = 12'h8eb;
      expv[33] = 12'h907;
      expv[34] = 12'h997;
      expv[35] = 12'h837;
      expv[36] = 12'h99e;
      expv[37] = 12'ha4e;
      expv[38] = 12'h83e;
      expv[39] = 12'hc0e;
      expv[40] = 12'h99e;
      expv[41] = 12'h90e;
      expv[42] = 12'h83e;
      expv[43] = 12'hf8e;
      expv[44] = 12'hc6d;
      expv[45] = 12'h80d;
      expv[46] = 12'hc6d;
      expv[47] = 12'h88b;
      expv[48] = 12'ha17;
      expv[49] = 12'ha47;
      expv[50] = 12'ha17;
      expv[51] = 12'hc0e;
      expv[52] = 12'h82d;
      expv[53] = 12'h80d;
      expv[54] = 12'h92b;
      expv[55] = 12'h807;
      expv[56] = 12'ha4e;
      expv[57] = 12'ha1d;
      expv[58] = 12'hf8b;
      expv[59] = 12'h867;
      expv[60] = 12'h807;
      expv[61] = 12'ha4e;
      expv[62] = 12'hf9d;
      expv[63] = 12'hf9b;
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
