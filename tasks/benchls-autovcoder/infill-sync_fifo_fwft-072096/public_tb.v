// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072096 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hd29;
    stim[1] = 12'h959;
    stim[2] = 12'h1c7;
    stim[3] = 12'h7e3;
    stim[4] = 12'h2a4;
    stim[5] = 12'h495;
    stim[6] = 12'h69a;
    stim[7] = 12'h652;
    stim[8] = 12'h47d;
    stim[9] = 12'h1f8;
    stim[10] = 12'h1f7;
    stim[11] = 12'h2d7;
    stim[12] = 12'h529;
    stim[13] = 12'h68b;
    stim[14] = 12'h6ea;
    stim[15] = 12'h399;
    stim[16] = 12'h5e9;
    stim[17] = 12'h4ea;
    stim[18] = 12'h477;
    stim[19] = 12'h6bb;
    stim[20] = 12'h7bb;
    stim[21] = 12'h4db;
    stim[22] = 12'h65d;
    stim[23] = 12'h7bf;
    stim[24] = 12'h36c;
    stim[25] = 12'h5e3;
    stim[26] = 12'h3fd;
    stim[27] = 12'h45c;
    stim[28] = 12'h3bc;
    stim[29] = 12'h101;
    stim[30] = 12'h7d2;
    stim[31] = 12'h42c;
    stim[32] = 12'h703;
    stim[33] = 12'h771;
    stim[34] = 12'h1de;
    stim[35] = 12'h74a;
    stim[36] = 12'h2ed;
    stim[37] = 12'h70c;
    stim[38] = 12'h27b;
    stim[39] = 12'h25f;
    stim[40] = 12'h5ce;
    stim[41] = 12'h138;
    stim[42] = 12'h5cb;
    stim[43] = 12'h2ce;
    stim[44] = 12'h297;
    stim[45] = 12'h4cf;
    stim[46] = 12'h706;
    stim[47] = 12'h665;
    stim[48] = 12'h7ac;
    stim[49] = 12'h07e;
    stim[50] = 12'h0f9;
    stim[51] = 12'h726;
    stim[52] = 12'h169;
    stim[53] = 12'h671;
    stim[54] = 12'h3c0;
    stim[55] = 12'h3fe;
    stim[56] = 12'h694;
    stim[57] = 12'h2b4;
    stim[58] = 12'h69d;
    stim[59] = 12'h04f;
    stim[60] = 12'h517;
    stim[61] = 12'h077;
    stim[62] = 12'h146;
    stim[63] = 12'h418;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h3e3;
      expv[7] = 10'h1e3;
      expv[8] = 10'h1e3;
      expv[9] = 10'h1e3;
      expv[10] = 10'h1e3;
      expv[11] = 10'h1e3;
      expv[12] = 10'h1e3;
      expv[13] = 10'h1e3;
      expv[14] = 10'h329;
      expv[15] = 10'h129;
      expv[16] = 10'h129;
      expv[17] = 10'h129;
      expv[18] = 10'h3e9;
      expv[19] = 10'h3e9;
      expv[20] = 10'h1e9;
      expv[21] = 10'h1e9;
      expv[22] = 10'h3bb;
      expv[23] = 10'h1bb;
      expv[24] = 10'h1bb;
      expv[25] = 10'h1bb;
      expv[26] = 10'h3bf;
      expv[27] = 10'h3bf;
      expv[28] = 10'h3bf;
      expv[29] = 10'h3bf;
      expv[30] = 10'h3bf;
      expv[31] = 10'h3e3;
      expv[32] = 10'h3e3;
      expv[33] = 10'h3d2;
      expv[34] = 10'h303;
      expv[35] = 10'h303;
      expv[36] = 10'h371;
      expv[37] = 10'h371;
      expv[38] = 10'h34a;
      expv[39] = 10'h34a;
      expv[40] = 10'h34a;
      expv[41] = 10'h34a;
      expv[42] = 10'h34a;
      expv[43] = 10'h34a;
      expv[44] = 10'h34a;
      expv[45] = 10'h34a;
      expv[46] = 10'h34a;
      expv[47] = 10'h30c;
      expv[48] = 10'h3ce;
      expv[49] = 10'h3cb;
      expv[50] = 10'h3cb;
      expv[51] = 10'h3cb;
      expv[52] = 10'h306;
      expv[53] = 10'h306;
      expv[54] = 10'h3ac;
      expv[55] = 10'h3ac;
      expv[56] = 10'h3ac;
      expv[57] = 10'h326;
      expv[58] = 10'h326;
      expv[59] = 10'h126;
      expv[60] = 10'h126;
      expv[61] = 10'h126;
      expv[62] = 10'h126;
      expv[63] = 10'h126;
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
