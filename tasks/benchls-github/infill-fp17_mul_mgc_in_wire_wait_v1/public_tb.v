// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  FP17_MUL_mgc_in_wire_wait_v1 dut (
    .ld(in_vec[9:9]),
    .vz(in_vec[8:8]),
    .z(in_vec[7:0]),
    .vd(out_vec[9:9]),
    .d(out_vec[8:1]),
    .lz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h334;
    stim[1] = 10'h1a8;
    stim[2] = 10'h2bf;
    stim[3] = 10'h0ec;
    stim[4] = 10'h149;
    stim[5] = 10'h0e4;
    stim[6] = 10'h000;
    stim[7] = 10'h31f;
    stim[8] = 10'h109;
    stim[9] = 10'h153;
    stim[10] = 10'h10e;
    stim[11] = 10'h15c;
    stim[12] = 10'h23f;
    stim[13] = 10'h084;
    stim[14] = 10'h3ac;
    stim[15] = 10'h017;
    stim[16] = 10'h025;
    stim[17] = 10'h04b;
    stim[18] = 10'h3c2;
    stim[19] = 10'h0d8;
    stim[20] = 10'h3c0;
    stim[21] = 10'h02f;
    stim[22] = 10'h0fc;
    stim[23] = 10'h247;
    stim[24] = 10'h038;
    stim[25] = 10'h0ad;
    stim[26] = 10'h1f0;
    stim[27] = 10'h240;
    stim[28] = 10'h33d;
    stim[29] = 10'h3d4;
    stim[30] = 10'h2f0;
    stim[31] = 10'h334;
    stim[32] = 10'h1be;
    stim[33] = 10'h375;
    stim[34] = 10'h017;
    stim[35] = 10'h17f;
    stim[36] = 10'h1fe;
    stim[37] = 10'h05c;
    stim[38] = 10'h288;
    stim[39] = 10'h24c;
    stim[40] = 10'h39a;
    stim[41] = 10'h2c2;
    stim[42] = 10'h3c4;
    stim[43] = 10'h3a7;
    stim[44] = 10'h19f;
    stim[45] = 10'h049;
    stim[46] = 10'h18b;
    stim[47] = 10'h248;
    stim[48] = 10'h3f3;
    stim[49] = 10'h3f1;
    stim[50] = 10'h1c6;
    stim[51] = 10'h3d9;
    stim[52] = 10'h1a1;
    stim[53] = 10'h15e;
    stim[54] = 10'h310;
    stim[55] = 10'h2c8;
    stim[56] = 10'h18b;
    stim[57] = 10'h2ed;
    stim[58] = 10'h324;
    stim[59] = 10'h1a2;
    stim[60] = 10'h344;
    stim[61] = 10'h2cf;
    stim[62] = 10'h05a;
    stim[63] = 10'h0b0;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 10'h269;
      expv[1] = 10'h350;
      expv[2] = 10'h17f;
      expv[3] = 10'h1d8;
      expv[4] = 10'h292;
      expv[5] = 10'h1c8;
      expv[6] = 10'h000;
      expv[7] = 10'h23f;
      expv[8] = 10'h212;
      expv[9] = 10'h2a6;
      expv[10] = 10'h21c;
      expv[11] = 10'h2b8;
      expv[12] = 10'h07f;
      expv[13] = 10'h108;
      expv[14] = 10'h359;
      expv[15] = 10'h02e;
      expv[16] = 10'h04a;
      expv[17] = 10'h096;
      expv[18] = 10'h385;
      expv[19] = 10'h1b0;
      expv[20] = 10'h381;
      expv[21] = 10'h05e;
      expv[22] = 10'h1f8;
      expv[23] = 10'h08f;
      expv[24] = 10'h070;
      expv[25] = 10'h15a;
      expv[26] = 10'h3e0;
      expv[27] = 10'h081;
      expv[28] = 10'h27b;
      expv[29] = 10'h3a9;
      expv[30] = 10'h1e1;
      expv[31] = 10'h269;
      expv[32] = 10'h37c;
      expv[33] = 10'h2eb;
      expv[34] = 10'h02e;
      expv[35] = 10'h2fe;
      expv[36] = 10'h3fc;
      expv[37] = 10'h0b8;
      expv[38] = 10'h111;
      expv[39] = 10'h099;
      expv[40] = 10'h335;
      expv[41] = 10'h185;
      expv[42] = 10'h389;
      expv[43] = 10'h34f;
      expv[44] = 10'h33e;
      expv[45] = 10'h092;
      expv[46] = 10'h316;
      expv[47] = 10'h091;
      expv[48] = 10'h3e7;
      expv[49] = 10'h3e3;
      expv[50] = 10'h38c;
      expv[51] = 10'h3b3;
      expv[52] = 10'h342;
      expv[53] = 10'h2bc;
      expv[54] = 10'h221;
      expv[55] = 10'h191;
      expv[56] = 10'h316;
      expv[57] = 10'h1db;
      expv[58] = 10'h249;
      expv[59] = 10'h344;
      expv[60] = 10'h289;
      expv[61] = 10'h19f;
      expv[62] = 10'h0b4;
      expv[63] = 10'h160;
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
