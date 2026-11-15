// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03051 dut (
    .c(clk),
    .d(in_vec[9:2]),
    .dv(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .crc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h281;
    stim[1] = 10'h11b;
    stim[2] = 10'h0ce;
    stim[3] = 10'h200;
    stim[4] = 10'h210;
    stim[5] = 10'h170;
    stim[6] = 10'h00a;
    stim[7] = 10'h044;
    stim[8] = 10'h22a;
    stim[9] = 10'h05c;
    stim[10] = 10'h3ca;
    stim[11] = 10'h138;
    stim[12] = 10'h36f;
    stim[13] = 10'h10c;
    stim[14] = 10'h1f0;
    stim[15] = 10'h142;
    stim[16] = 10'h08a;
    stim[17] = 10'h098;
    stim[18] = 10'h006;
    stim[19] = 10'h21e;
    stim[20] = 10'h224;
    stim[21] = 10'h176;
    stim[22] = 10'h1aa;
    stim[23] = 10'h124;
    stim[24] = 10'h21b;
    stim[25] = 10'h2fe;
    stim[26] = 10'h266;
    stim[27] = 10'h184;
    stim[28] = 10'h234;
    stim[29] = 10'h280;
    stim[30] = 10'h032;
    stim[31] = 10'h0d6;
    stim[32] = 10'h040;
    stim[33] = 10'h152;
    stim[34] = 10'h0dc;
    stim[35] = 10'h38a;
    stim[36] = 10'h1e2;
    stim[37] = 10'h072;
    stim[38] = 10'h080;
    stim[39] = 10'h116;
    stim[40] = 10'h32e;
    stim[41] = 10'h086;
    stim[42] = 10'h300;
    stim[43] = 10'h032;
    stim[44] = 10'h244;
    stim[45] = 10'h29e;
    stim[46] = 10'h1fe;
    stim[47] = 10'h160;
    stim[48] = 10'h158;
    stim[49] = 10'h178;
    stim[50] = 10'h002;
    stim[51] = 10'h059;
    stim[52] = 10'h272;
    stim[53] = 10'h29c;
    stim[54] = 10'h356;
    stim[55] = 10'h154;
    stim[56] = 10'h0d0;
    stim[57] = 10'h392;
    stim[58] = 10'h090;
    stim[59] = 10'h172;
    stim[60] = 10'h01c;
    stim[61] = 10'h138;
    stim[62] = 10'h222;
    stim[63] = 10'h126;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'haa00;
      expv[4] = 16'haa00;
      expv[5] = 16'haa00;
      expv[6] = 16'haa00;
      expv[7] = 16'h7e6b;
      expv[8] = 16'h7e6b;
      expv[9] = 16'hf7fe;
      expv[10] = 16'hf7fe;
      expv[11] = 16'hbab7;
      expv[12] = 16'hbab7;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h8340;
      expv[17] = 16'h5642;
      expv[18] = 16'h5642;
      expv[19] = 16'h4e57;
      expv[20] = 16'h230f;
      expv[21] = 16'h230f;
      expv[22] = 16'h42e2;
      expv[23] = 16'hd902;
      expv[24] = 16'hd902;
      expv[25] = 16'h0000;
      expv[26] = 16'h0f01;
      expv[27] = 16'h154e;
      expv[28] = 16'h154e;
      expv[29] = 16'h154e;
      expv[30] = 16'h154e;
      expv[31] = 16'h8ed5;
      expv[32] = 16'h37cf;
      expv[33] = 16'h37cf;
      expv[34] = 16'h1436;
      expv[35] = 16'h1436;
      expv[36] = 16'he054;
      expv[37] = 16'h62a1;
      expv[38] = 16'hcee2;
      expv[39] = 16'hcee2;
      expv[40] = 16'h05cf;
      expv[41] = 16'h7c44;
      expv[42] = 16'h94fc;
      expv[43] = 16'h94fc;
      expv[44] = 16'hfbd4;
      expv[45] = 16'hfbd4;
      expv[46] = 16'h5afa;
      expv[47] = 16'h1cdb;
      expv[48] = 16'h1cdb;
      expv[49] = 16'h1cdb;
      expv[50] = 16'h1cdb;
      expv[51] = 16'he41c;
      expv[52] = 16'h0000;
      expv[53] = 16'hd640;
      expv[54] = 16'hd640;
      expv[55] = 16'hd056;
      expv[56] = 16'hd056;
      expv[57] = 16'hd056;
      expv[58] = 16'hca10;
      expv[59] = 16'hca10;
      expv[60] = 16'h4a8b;
      expv[61] = 16'h4a8b;
      expv[62] = 16'h4a8b;
      expv[63] = 16'hbe4a;
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
