// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[10:10]),
    .state(in_vec[9:0]),
    .next_state(out_vec[11:2]),
    .out1(out_vec[1:1]),
    .out2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h007;
    stim[1] = 11'h7a3;
    stim[2] = 11'h0a5;
    stim[3] = 11'h4cf;
    stim[4] = 11'h4f7;
    stim[5] = 11'h681;
    stim[6] = 11'h3a2;
    stim[7] = 11'h133;
    stim[8] = 11'h5b4;
    stim[9] = 11'h1b7;
    stim[10] = 11'h131;
    stim[11] = 11'h0be;
    stim[12] = 11'h5f1;
    stim[13] = 11'h779;
    stim[14] = 11'h3aa;
    stim[15] = 11'h3e5;
    stim[16] = 11'h1c0;
    stim[17] = 11'h400;
    stim[18] = 11'h45a;
    stim[19] = 11'h46a;
    stim[20] = 11'h789;
    stim[21] = 11'h7c1;
    stim[22] = 11'h3e6;
    stim[23] = 11'h332;
    stim[24] = 11'h766;
    stim[25] = 11'h058;
    stim[26] = 11'h4c7;
    stim[27] = 11'h12c;
    stim[28] = 11'h3e7;
    stim[29] = 11'h365;
    stim[30] = 11'h4d2;
    stim[31] = 11'h59b;
    stim[32] = 11'h3d2;
    stim[33] = 11'h56d;
    stim[34] = 11'h42a;
    stim[35] = 11'h0c1;
    stim[36] = 11'h3fd;
    stim[37] = 11'h57f;
    stim[38] = 11'h393;
    stim[39] = 11'h38d;
    stim[40] = 11'h45b;
    stim[41] = 11'h1e8;
    stim[42] = 11'h21e;
    stim[43] = 11'h0c4;
    stim[44] = 11'h0e4;
    stim[45] = 11'h536;
    stim[46] = 11'h040;
    stim[47] = 11'h330;
    stim[48] = 11'h727;
    stim[49] = 11'h206;
    stim[50] = 11'h025;
    stim[51] = 11'h257;
    stim[52] = 11'h49c;
    stim[53] = 11'h4e2;
    stim[54] = 11'h55b;
    stim[55] = 11'h103;
    stim[56] = 11'h6e4;
    stim[57] = 11'h25c;
    stim[58] = 11'h589;
    stim[59] = 11'h400;
    stim[60] = 11'h7b4;
    stim[61] = 11'h3d5;
    stim[62] = 11'h24c;
    stim[63] = 11'h19e;
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
      expv[0] = 12'h004;
      expv[1] = 12'h31b;
      expv[2] = 12'h405;
      expv[3] = 12'h279;
      expv[4] = 12'h3b9;
      expv[5] = 12'h209;
      expv[6] = 12'h407;
      expv[7] = 12'h406;
      expv[8] = 12'h3ab;
      expv[9] = 12'h407;
      expv[10] = 12'h406;
      expv[11] = 12'h405;
      expv[12] = 12'h38b;
      expv[13] = 12'h3cb;
      expv[14] = 12'h407;
      expv[15] = 12'hc07;
      expv[16] = 12'h807;
      expv[17] = 12'h000;
      expv[18] = 12'h2d0;
      expv[19] = 12'h350;
      expv[20] = 12'h24b;
      expv[21] = 12'h20b;
      expv[22] = 12'hc07;
      expv[23] = 12'h407;
      expv[24] = 12'h33b;
      expv[25] = 12'h804;
      expv[26] = 12'h239;
      expv[27] = 12'h406;
      expv[28] = 12'hc07;
      expv[29] = 12'hc07;
      expv[30] = 12'h291;
      expv[31] = 12'h2db;
      expv[32] = 12'h807;
      expv[33] = 12'h36a;
      expv[34] = 12'h150;
      expv[35] = 12'h805;
      expv[36] = 12'hc07;
      expv[37] = 12'h3fa;
      expv[38] = 12'h007;
      expv[39] = 12'h007;
      expv[40] = 12'h2d8;
      expv[41] = 12'hc07;
      expv[42] = 12'h005;
      expv[43] = 12'h805;
      expv[44] = 12'hc05;
      expv[45] = 12'h1ba;
      expv[46] = 12'h800;
      expv[47] = 12'h407;
      expv[48] = 12'h13b;
      expv[49] = 12'h005;
      expv[50] = 12'h404;
      expv[51] = 12'h805;
      expv[52] = 12'h2e1;
      expv[53] = 12'h311;
      expv[54] = 12'h2da;
      expv[55] = 12'h006;
      expv[56] = 12'h329;
      expv[57] = 12'h805;
      expv[58] = 12'h24b;
      expv[59] = 12'h000;
      expv[60] = 12'h3ab;
      expv[61] = 12'h807;
      expv[62] = 12'h805;
      expv[63] = 12'h007;
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
