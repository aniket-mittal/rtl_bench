// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_007894 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .iStart(in_vec[17:17]),
    .iDataIn(in_vec[16:9]),
    .iNtxB(in_vec[8:0]),
    .oByteCnt(out_vec[9:2]),
    .oTx(out_vec[1:1]),
    .oStop(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h7ab2b;
    stim[1] = 19'h7e476;
    stim[2] = 19'h1e535;
    stim[3] = 19'h2d54b;
    stim[4] = 19'h05e21;
    stim[5] = 19'h07408;
    stim[6] = 19'h01612;
    stim[7] = 19'h2c9b1;
    stim[8] = 19'h2e844;
    stim[9] = 19'h2bffd;
    stim[10] = 19'h1d4d6;
    stim[11] = 19'h07085;
    stim[12] = 19'h1b7ba;
    stim[13] = 19'h1cbe0;
    stim[14] = 19'h05459;
    stim[15] = 19'h151e5;
    stim[16] = 19'h0a9c7;
    stim[17] = 19'h3ef53;
    stim[18] = 19'h0445d;
    stim[19] = 19'h1f003;
    stim[20] = 19'h21c3f;
    stim[21] = 19'h0ffa8;
    stim[22] = 19'h267c0;
    stim[23] = 19'h2fff0;
    stim[24] = 19'h130fb;
    stim[25] = 19'h0de07;
    stim[26] = 19'h2a772;
    stim[27] = 19'h1557c;
    stim[28] = 19'h32528;
    stim[29] = 19'h2d3bf;
    stim[30] = 19'h10808;
    stim[31] = 19'h07be6;
    stim[32] = 19'h173be;
    stim[33] = 19'h0fe52;
    stim[34] = 19'h39cdd;
    stim[35] = 19'h1579a;
    stim[36] = 19'h2dc27;
    stim[37] = 19'h10433;
    stim[38] = 19'h0c2c1;
    stim[39] = 19'h3bbc9;
    stim[40] = 19'h0ee93;
    stim[41] = 19'h08236;
    stim[42] = 19'h1464a;
    stim[43] = 19'h3aad0;
    stim[44] = 19'h1cff7;
    stim[45] = 19'h35910;
    stim[46] = 19'h1c734;
    stim[47] = 19'h09e09;
    stim[48] = 19'h2cdf5;
    stim[49] = 19'h3a710;
    stim[50] = 19'h04902;
    stim[51] = 19'h3aaaa;
    stim[52] = 19'h2b8f6;
    stim[53] = 19'h3833e;
    stim[54] = 19'h0ccc5;
    stim[55] = 19'h00775;
    stim[56] = 19'h05084;
    stim[57] = 19'h201ee;
    stim[58] = 19'h3dce7;
    stim[59] = 19'h0eaed;
    stim[60] = 19'h396d0;
    stim[61] = 19'h1b53e;
    stim[62] = 19'h1807b;
    stim[63] = 19'h1369d;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h002;
      expv[3] = 10'h002;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
