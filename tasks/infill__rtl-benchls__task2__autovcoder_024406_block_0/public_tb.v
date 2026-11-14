// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024406 dut (
    .clock(clk),
    .io_d(in_vec[14:0]),
    .io_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h421f;
    stim[1] = 15'h30dd;
    stim[2] = 15'h68e3;
    stim[3] = 15'h5de4;
    stim[4] = 15'h0384;
    stim[5] = 15'h0a6e;
    stim[6] = 15'h3625;
    stim[7] = 15'h61db;
    stim[8] = 15'h6dba;
    stim[9] = 15'h724f;
    stim[10] = 15'h6c04;
    stim[11] = 15'h14c1;
    stim[12] = 15'h1757;
    stim[13] = 15'h6bfe;
    stim[14] = 15'h11fe;
    stim[15] = 15'h4cbd;
    stim[16] = 15'h3e57;
    stim[17] = 15'h7032;
    stim[18] = 15'h7dbd;
    stim[19] = 15'h7365;
    stim[20] = 15'h0627;
    stim[21] = 15'h5487;
    stim[22] = 15'h7e18;
    stim[23] = 15'h2290;
    stim[24] = 15'h71aa;
    stim[25] = 15'h2caa;
    stim[26] = 15'h208d;
    stim[27] = 15'h5025;
    stim[28] = 15'h1ab6;
    stim[29] = 15'h089a;
    stim[30] = 15'h007d;
    stim[31] = 15'h06e6;
    stim[32] = 15'h5485;
    stim[33] = 15'h7bd9;
    stim[34] = 15'h2d62;
    stim[35] = 15'h7afc;
    stim[36] = 15'h0ea0;
    stim[37] = 15'h2899;
    stim[38] = 15'h752c;
    stim[39] = 15'h014d;
    stim[40] = 15'h68e6;
    stim[41] = 15'h7967;
    stim[42] = 15'h6fd4;
    stim[43] = 15'h3d51;
    stim[44] = 15'h05b7;
    stim[45] = 15'h6c55;
    stim[46] = 15'h2988;
    stim[47] = 15'h1359;
    stim[48] = 15'h5f8c;
    stim[49] = 15'h3a16;
    stim[50] = 15'h3fa3;
    stim[51] = 15'h62d0;
    stim[52] = 15'h7820;
    stim[53] = 15'h43eb;
    stim[54] = 15'h4c80;
    stim[55] = 15'h7beb;
    stim[56] = 15'h7c26;
    stim[57] = 15'h2b64;
    stim[58] = 15'h164f;
    stim[59] = 15'h47f0;
    stim[60] = 15'h250a;
    stim[61] = 15'h3073;
    stim[62] = 15'h7ca5;
    stim[63] = 15'h0648;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h421f;
      expv[2] = 15'h30dd;
      expv[3] = 15'h68e3;
      expv[4] = 15'h5de4;
      expv[5] = 15'h0384;
      expv[6] = 15'h0a6e;
      expv[7] = 15'h3625;
      expv[8] = 15'h61db;
      expv[9] = 15'h6dba;
      expv[10] = 15'h724f;
      expv[11] = 15'h6c04;
      expv[12] = 15'h14c1;
      expv[13] = 15'h1757;
      expv[14] = 15'h6bfe;
      expv[15] = 15'h11fe;
      expv[16] = 15'h4cbd;
      expv[17] = 15'h3e57;
      expv[18] = 15'h7032;
      expv[19] = 15'h7dbd;
      expv[20] = 15'h7365;
      expv[21] = 15'h0627;
      expv[22] = 15'h5487;
      expv[23] = 15'h7e18;
      expv[24] = 15'h2290;
      expv[25] = 15'h71aa;
      expv[26] = 15'h2caa;
      expv[27] = 15'h208d;
      expv[28] = 15'h5025;
      expv[29] = 15'h1ab6;
      expv[30] = 15'h089a;
      expv[31] = 15'h007d;
      expv[32] = 15'h06e6;
      expv[33] = 15'h5485;
      expv[34] = 15'h7bd9;
      expv[35] = 15'h2d62;
      expv[36] = 15'h7afc;
      expv[37] = 15'h0ea0;
      expv[38] = 15'h2899;
      expv[39] = 15'h752c;
      expv[40] = 15'h014d;
      expv[41] = 15'h68e6;
      expv[42] = 15'h7967;
      expv[43] = 15'h6fd4;
      expv[44] = 15'h3d51;
      expv[45] = 15'h05b7;
      expv[46] = 15'h6c55;
      expv[47] = 15'h2988;
      expv[48] = 15'h1359;
      expv[49] = 15'h5f8c;
      expv[50] = 15'h3a16;
      expv[51] = 15'h3fa3;
      expv[52] = 15'h62d0;
      expv[53] = 15'h7820;
      expv[54] = 15'h43eb;
      expv[55] = 15'h4c80;
      expv[56] = 15'h7beb;
      expv[57] = 15'h7c26;
      expv[58] = 15'h2b64;
      expv[59] = 15'h164f;
      expv[60] = 15'h47f0;
      expv[61] = 15'h250a;
      expv[62] = 15'h3073;
      expv[63] = 15'h7ca5;
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
