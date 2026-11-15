// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08189 dut (
    .CLK(clk),
    .process_CE(in_vec[16:16]),
    .inp(in_vec[15:0]),
    .process_output(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h121df;
    stim[1] = 17'h115c2;
    stim[2] = 17'h18649;
    stim[3] = 17'h0fc8e;
    stim[4] = 17'h0a9c4;
    stim[5] = 17'h18ccd;
    stim[6] = 17'h15e36;
    stim[7] = 17'h07911;
    stim[8] = 17'h1c308;
    stim[9] = 17'h1d3db;
    stim[10] = 17'h02b74;
    stim[11] = 17'h06c10;
    stim[12] = 17'h1fd0d;
    stim[13] = 17'h0b08a;
    stim[14] = 17'h02c65;
    stim[15] = 17'h0615d;
    stim[16] = 17'h130f1;
    stim[17] = 17'h0ae6e;
    stim[18] = 17'h081c1;
    stim[19] = 17'h10212;
    stim[20] = 17'h0a109;
    stim[21] = 17'h040de;
    stim[22] = 17'h0be35;
    stim[23] = 17'h1bf37;
    stim[24] = 17'h0e180;
    stim[25] = 17'h1409f;
    stim[26] = 17'h11404;
    stim[27] = 17'h10501;
    stim[28] = 17'h0a2a4;
    stim[29] = 17'h08965;
    stim[30] = 17'h0b962;
    stim[31] = 17'h002ca;
    stim[32] = 17'h015f3;
    stim[33] = 17'h15c30;
    stim[34] = 17'h1f370;
    stim[35] = 17'h07273;
    stim[36] = 17'h00da0;
    stim[37] = 17'h1bc30;
    stim[38] = 17'h1995f;
    stim[39] = 17'h14119;
    stim[40] = 17'h0a406;
    stim[41] = 17'h17896;
    stim[42] = 17'h01597;
    stim[43] = 17'h0b6d2;
    stim[44] = 17'h05f18;
    stim[45] = 17'h16027;
    stim[46] = 17'h1cb4b;
    stim[47] = 17'h07897;
    stim[48] = 17'h1869f;
    stim[49] = 17'h1ccb2;
    stim[50] = 17'h01da6;
    stim[51] = 17'h1c837;
    stim[52] = 17'h0f161;
    stim[53] = 17'h1cea3;
    stim[54] = 17'h05040;
    stim[55] = 17'h0a0ea;
    stim[56] = 17'h0b269;
    stim[57] = 17'h0990f;
    stim[58] = 17'h0e301;
    stim[59] = 17'h14a3d;
    stim[60] = 17'h084b4;
    stim[61] = 17'h07ed8;
    stim[62] = 17'h0ecb9;
    stim[63] = 17'h08afd;
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
      expv[1] = 16'h1cbf;
      expv[2] = 16'h0fea;
      expv[3] = 16'h2636;
      expv[4] = 16'h2636;
      expv[5] = 16'h2636;
      expv[6] = 16'h701c;
      expv[7] = 16'h13d4;
      expv[8] = 16'h13d4;
      expv[9] = 16'h0618;
      expv[10] = 16'hb481;
      expv[11] = 16'hb481;
      expv[12] = 16'hb481;
      expv[13] = 16'h0cd9;
      expv[14] = 16'h0cd9;
      expv[15] = 16'h0cd9;
      expv[16] = 16'h0cd9;
      expv[17] = 16'h2d30;
      expv[18] = 16'h2d30;
      expv[19] = 16'h2d30;
      expv[20] = 16'h0024;
      expv[21] = 16'h0024;
      expv[22] = 16'h0024;
      expv[23] = 16'h0024;
      expv[24] = 16'h2909;
      expv[25] = 16'h2909;
      expv[26] = 16'h27c0;
      expv[27] = 16'h0050;
      expv[28] = 16'h0005;
      expv[29] = 16'h0005;
      expv[30] = 16'h0005;
      expv[31] = 16'h0005;
      expv[32] = 16'h0005;
      expv[33] = 16'h0005;
      expv[34] = 16'h1140;
      expv[35] = 16'h6a50;
      expv[36] = 16'h6a50;
      expv[37] = 16'h6a50;
      expv[38] = 16'h2340;
      expv[39] = 16'h38c7;
      expv[40] = 16'h0659;
      expv[41] = 16'h0659;
      expv[42] = 16'h4650;
      expv[43] = 16'h4650;
      expv[44] = 16'h4650;
      expv[45] = 16'h4650;
      expv[46] = 16'h0ea0;
      expv[47] = 16'h3b79;
      expv[48] = 16'h3b79;
      expv[49] = 16'h533a;
      expv[50] = 16'h8dd8;
      expv[51] = 16'h8dd8;
      expv[52] = 16'h2af8;
      expv[53] = 16'h2af8;
      expv[54] = 16'h832a;
      expv[55] = 16'h832a;
      expv[56] = 16'h832a;
      expv[57] = 16'h832a;
      expv[58] = 16'h832a;
      expv[59] = 16'h832a;
      expv[60] = 16'h11a2;
      expv[61] = 16'h11a2;
      expv[62] = 16'h11a2;
      expv[63] = 16'h11a2;
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
