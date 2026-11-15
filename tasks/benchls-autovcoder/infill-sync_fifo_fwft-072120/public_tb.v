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

  autovcoder_072120 dut (
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
    stim[0] = 12'heed;
    stim[1] = 12'hc8b;
    stim[2] = 12'h7e6;
    stim[3] = 12'h2b8;
    stim[4] = 12'hfa0;
    stim[5] = 12'h0ba;
    stim[6] = 12'h6b0;
    stim[7] = 12'h2e6;
    stim[8] = 12'h14a;
    stim[9] = 12'h3cb;
    stim[10] = 12'h075;
    stim[11] = 12'h401;
    stim[12] = 12'h67a;
    stim[13] = 12'h4a5;
    stim[14] = 12'h46a;
    stim[15] = 12'h77e;
    stim[16] = 12'h78c;
    stim[17] = 12'h32f;
    stim[18] = 12'h04e;
    stim[19] = 12'h7e7;
    stim[20] = 12'h6a2;
    stim[21] = 12'h671;
    stim[22] = 12'h71b;
    stim[23] = 12'h13a;
    stim[24] = 12'h6a8;
    stim[25] = 12'h59d;
    stim[26] = 12'h684;
    stim[27] = 12'h3a5;
    stim[28] = 12'h69c;
    stim[29] = 12'h2d2;
    stim[30] = 12'h0df;
    stim[31] = 12'h606;
    stim[32] = 12'h747;
    stim[33] = 12'h0ee;
    stim[34] = 12'h47d;
    stim[35] = 12'h3e1;
    stim[36] = 12'h39c;
    stim[37] = 12'h5c1;
    stim[38] = 12'h73d;
    stim[39] = 12'h5cd;
    stim[40] = 12'h167;
    stim[41] = 12'h702;
    stim[42] = 12'h08e;
    stim[43] = 12'h4fb;
    stim[44] = 12'h6dc;
    stim[45] = 12'h6c0;
    stim[46] = 12'h5dc;
    stim[47] = 12'h060;
    stim[48] = 12'h438;
    stim[49] = 12'h1a1;
    stim[50] = 12'h247;
    stim[51] = 12'h4bb;
    stim[52] = 12'h17a;
    stim[53] = 12'h7e6;
    stim[54] = 12'h111;
    stim[55] = 12'h3eb;
    stim[56] = 12'h688;
    stim[57] = 12'h76f;
    stim[58] = 12'h4a7;
    stim[59] = 12'h65a;
    stim[60] = 12'h5d4;
    stim[61] = 12'h3f2;
    stim[62] = 12'h7d6;
    stim[63] = 12'h20b;
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
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h1a0;
      expv[8] = 10'h1a0;
      expv[9] = 10'h1a0;
      expv[10] = 10'h1a0;
      expv[11] = 10'h1a0;
      expv[12] = 10'h1a0;
      expv[13] = 10'h1a0;
      expv[14] = 10'h1a0;
      expv[15] = 10'h1a0;
      expv[16] = 10'h1a0;
      expv[17] = 10'h37e;
      expv[18] = 10'h37e;
      expv[19] = 10'h37e;
      expv[20] = 10'h38c;
      expv[21] = 10'h3e7;
      expv[22] = 10'h1e7;
      expv[23] = 10'h1e7;
      expv[24] = 10'h1e7;
      expv[25] = 10'h31b;
      expv[26] = 10'h31b;
      expv[27] = 10'h39d;
      expv[28] = 10'h39d;
      expv[29] = 10'h19d;
      expv[30] = 10'h19d;
      expv[31] = 10'h19d;
      expv[32] = 10'h19d;
      expv[33] = 10'h19d;
      expv[34] = 10'h19d;
      expv[35] = 10'h347;
      expv[36] = 10'h347;
      expv[37] = 10'h347;
      expv[38] = 10'h347;
      expv[39] = 10'h3c1;
      expv[40] = 10'h3c1;
      expv[41] = 10'h3c1;
      expv[42] = 10'h33d;
      expv[43] = 10'h33d;
      expv[44] = 10'h33d;
      expv[45] = 10'h3cd;
      expv[46] = 10'h302;
      expv[47] = 10'h302;
      expv[48] = 10'h302;
      expv[49] = 10'h302;
      expv[50] = 10'h302;
      expv[51] = 10'h302;
      expv[52] = 10'h302;
      expv[53] = 10'h302;
      expv[54] = 10'h3dc;
      expv[55] = 10'h3dc;
      expv[56] = 10'h3dc;
      expv[57] = 10'h3e6;
      expv[58] = 10'h1e6;
      expv[59] = 10'h36f;
      expv[60] = 10'h16f;
      expv[61] = 10'h16f;
      expv[62] = 10'h16f;
      expv[63] = 10'h3d4;
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
