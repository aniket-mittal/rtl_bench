// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_176396 dut (
    .clk(clk),
    .rst(in_vec[23:23]),
    .EXRs(in_vec[22:18]),
    .EXRt(in_vec[17:13]),
    .MEMRd(in_vec[12:8]),
    .WBRd(in_vec[7:3]),
    .EXControl(in_vec[2:2]),
    .MEMControl(in_vec[1:1]),
    .WBRegWrite(in_vec[0:0]),
    .Fwd1(out_vec[3:2]),
    .Fwd2(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hc3eb09;
    stim[1] = 24'hb1803b;
    stim[2] = 24'h7ee488;
    stim[3] = 24'h6587e9;
    stim[4] = 24'h477eba;
    stim[5] = 24'h6ca873;
    stim[6] = 24'hf1b626;
    stim[7] = 24'h734db6;
    stim[8] = 24'h145626;
    stim[9] = 24'h7b8063;
    stim[10] = 24'h57bd57;
    stim[11] = 24'h1278f5;
    stim[12] = 24'h536007;
    stim[13] = 24'hcd22d9;
    stim[14] = 24'h3bbc32;
    stim[15] = 24'h67ebcb;
    stim[16] = 24'h4ffe29;
    stim[17] = 24'h68977f;
    stim[18] = 24'h77d2ee;
    stim[19] = 24'h0d78af;
    stim[20] = 24'h104432;
    stim[21] = 24'h4b0062;
    stim[22] = 24'h76edc6;
    stim[23] = 24'h5d2172;
    stim[24] = 24'h70b76b;
    stim[25] = 24'h38debf;
    stim[26] = 24'h446357;
    stim[27] = 24'h5a2816;
    stim[28] = 24'h73f762;
    stim[29] = 24'h4c02a5;
    stim[30] = 24'h76aecb;
    stim[31] = 24'h6b1706;
    stim[32] = 24'h74a854;
    stim[33] = 24'h7ef754;
    stim[34] = 24'h405a4f;
    stim[35] = 24'h5194ee;
    stim[36] = 24'h4e0698;
    stim[37] = 24'h2d8e24;
    stim[38] = 24'h723d27;
    stim[39] = 24'h20be42;
    stim[40] = 24'h233071;
    stim[41] = 24'h6df898;
    stim[42] = 24'h24c5b5;
    stim[43] = 24'h3bb356;
    stim[44] = 24'h4b39c2;
    stim[45] = 24'h035216;
    stim[46] = 24'h5d3b09;
    stim[47] = 24'h493b08;
    stim[48] = 24'h4f060b;
    stim[49] = 24'h5f8212;
    stim[50] = 24'h1271f4;
    stim[51] = 24'h69bc13;
    stim[52] = 24'h3c9e99;
    stim[53] = 24'h707245;
    stim[54] = 24'h7f178e;
    stim[55] = 24'h516f3a;
    stim[56] = 24'h47ee71;
    stim[57] = 24'h4fc294;
    stim[58] = 24'h462475;
    stim[59] = 24'h416b0f;
    stim[60] = 24'h2a37f7;
    stim[61] = 24'h0f0d6a;
    stim[62] = 24'h4d4880;
    stim[63] = 24'h1ad29d;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h2;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h2;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h8;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h2;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
