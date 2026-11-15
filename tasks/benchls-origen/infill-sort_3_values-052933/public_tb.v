// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052933 dut (
    .clk(clk),
    .rst(in_vec[24:24]),
    .data1(in_vec[23:16]),
    .data2(in_vec[15:8]),
    .data3(in_vec[7:0]),
    .min(out_vec[23:16]),
    .middle(out_vec[15:8]),
    .max(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h15a13c9;
    stim[1] = 25'h1d4a485;
    stim[2] = 25'h04ee4be;
    stim[3] = 25'h0376bfe;
    stim[4] = 25'h0e9e2f7;
    stim[5] = 25'h006eeb4;
    stim[6] = 25'h085ec49;
    stim[7] = 25'h027dc71;
    stim[8] = 25'h09d3867;
    stim[9] = 25'h0d413a9;
    stim[10] = 25'h0be4134;
    stim[11] = 25'h01149c3;
    stim[12] = 25'h01d13b7;
    stim[13] = 25'h0aa7291;
    stim[14] = 25'h04e9af8;
    stim[15] = 25'h016fbce;
    stim[16] = 25'h0a958ce;
    stim[17] = 25'h0150db2;
    stim[18] = 25'h036f6ea;
    stim[19] = 25'h0bf55e5;
    stim[20] = 25'h0f786d8;
    stim[21] = 25'h037daa0;
    stim[22] = 25'h0a6636b;
    stim[23] = 25'h09abb64;
    stim[24] = 25'h0f3712f;
    stim[25] = 25'h0147c88;
    stim[26] = 25'h0cf3ce8;
    stim[27] = 25'h081e794;
    stim[28] = 25'h03fe1b6;
    stim[29] = 25'h0e7eba3;
    stim[30] = 25'h05a034b;
    stim[31] = 25'h0f2b879;
    stim[32] = 25'h035ca52;
    stim[33] = 25'h02609f1;
    stim[34] = 25'h0e7f195;
    stim[35] = 25'h0c9e4ac;
    stim[36] = 25'h04a9667;
    stim[37] = 25'h0451440;
    stim[38] = 25'h04cabe7;
    stim[39] = 25'h0d8246a;
    stim[40] = 25'h0c502d4;
    stim[41] = 25'h0c3b56f;
    stim[42] = 25'h006f533;
    stim[43] = 25'h0979472;
    stim[44] = 25'h0405301;
    stim[45] = 25'h0ff1b2f;
    stim[46] = 25'h0f68a16;
    stim[47] = 25'h03c3a4e;
    stim[48] = 25'h0d786f3;
    stim[49] = 25'h004ca2b;
    stim[50] = 25'h067c3f1;
    stim[51] = 25'h0ed50e4;
    stim[52] = 25'h09e5f17;
    stim[53] = 25'h000b937;
    stim[54] = 25'h002dcb8;
    stim[55] = 25'h0520959;
    stim[56] = 25'h0fd6662;
    stim[57] = 25'h0b8bd23;
    stim[58] = 25'h0c376c4;
    stim[59] = 25'h09ee92a;
    stim[60] = 25'h0128aa0;
    stim[61] = 25'h0dbaab8;
    stim[62] = 25'h00d11c6;
    stim[63] = 25'h074f0b6;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h4ebee4;
      expv[4] = 24'h376bfe;
      expv[5] = 24'he2e9f7;
      expv[6] = 24'h06b4ee;
      expv[7] = 24'h4985ec;
      expv[8] = 24'h2771dc;
      expv[9] = 24'h38679d;
      expv[10] = 24'h13a9d4;
      expv[11] = 24'h3441be;
      expv[12] = 24'h1149c3;
      expv[13] = 24'h131db7;
      expv[14] = 24'h7291aa;
      expv[15] = 24'h4e9af8;
      expv[16] = 24'h16cefb;
      expv[17] = 24'h58a9ce;
      expv[18] = 24'h0d15b2;
      expv[19] = 24'h36eaf6;
      expv[20] = 24'h55bfe5;
      expv[21] = 24'h86d8f7;
      expv[22] = 24'h37a0da;
      expv[23] = 24'h636ba6;
      expv[24] = 24'h649abb;
      expv[25] = 24'h2f71f3;
      expv[26] = 24'h147c88;
      expv[27] = 24'h3ccfe8;
      expv[28] = 24'h8194e7;
      expv[29] = 24'h3fb6e1;
      expv[30] = 24'ha3e7eb;
      expv[31] = 24'h034b5a;
      expv[32] = 24'h79b8f2;
      expv[33] = 24'h3552ca;
      expv[34] = 24'h0926f1;
      expv[35] = 24'h95e7f1;
      expv[36] = 24'hacc9e4;
      expv[37] = 24'h4a6796;
      expv[38] = 24'h144045;
      expv[39] = 24'h4cabe7;
      expv[40] = 24'h246ad8;
      expv[41] = 24'h02c5d4;
      expv[42] = 24'h6fb5c3;
      expv[43] = 24'h0633f5;
      expv[44] = 24'h729497;
      expv[45] = 24'h014053;
      expv[46] = 24'h1b2fff;
      expv[47] = 24'h168af6;
      expv[48] = 24'h3a3c4e;
      expv[49] = 24'h86d7f3;
      expv[50] = 24'h042bca;
      expv[51] = 24'h67c3f1;
      expv[52] = 24'h50e4ed;
      expv[53] = 24'h175f9e;
      expv[54] = 24'h0037b9;
      expv[55] = 24'h02b8dc;
      expv[56] = 24'h095259;
      expv[57] = 24'h6266fd;
      expv[58] = 24'h23b8bd;
      expv[59] = 24'h76c3c4;
      expv[60] = 24'h2a9ee9;
      expv[61] = 24'h128aa0;
      expv[62] = 24'haab8db;
      expv[63] = 24'h0d11c6;
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
