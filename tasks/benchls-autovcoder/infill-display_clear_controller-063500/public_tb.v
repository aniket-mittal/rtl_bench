// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063500 dut (
    .iCLOCK(clk),
    .inRESET(in_vec[35:35]),
    .iRESET_SYNC(in_vec[34:34]),
    .iIF_VALID(in_vec[33:33]),
    .iIF_DATA(in_vec[32:1]),
    .iIF_BUSY(in_vec[0:0]),
    .oIF_BUSY(out_vec[49:49]),
    .oIF_FINISH(out_vec[48:48]),
    .oIF_VALID(out_vec[47:47]),
    .oIF_ADDR(out_vec[46:24]),
    .oIF_DATA(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hfbcac8c28;
    stim[1] = 36'hdcb573b15;
    stim[2] = 36'h21ec3a62b;
    stim[3] = 36'h05aac82d8;
    stim[4] = 36'h489e4616e;
    stim[5] = 36'h6194280c7;
    stim[6] = 36'h3cea31f8c;
    stim[7] = 36'h6f33adadb;
    stim[8] = 36'h645782714;
    stim[9] = 36'ha12cc1253;
    stim[10] = 36'h33b8be9ef;
    stim[11] = 36'h40ac324ed;
    stim[12] = 36'h51f0c48ab;
    stim[13] = 36'h2a37de64c;
    stim[14] = 36'h5974d36cb;
    stim[15] = 36'h36942a3d6;
    stim[16] = 36'h6d3c1aa3b;
    stim[17] = 36'h2512ade19;
    stim[18] = 36'h2b6a8a5c2;
    stim[19] = 36'h5a2ff965f;
    stim[20] = 36'h081f97929;
    stim[21] = 36'h6e0ecc005;
    stim[22] = 36'h305e7f9b3;
    stim[23] = 36'h4e7c3da2d;
    stim[24] = 36'h4392513a8;
    stim[25] = 36'h298d72793;
    stim[26] = 36'h43d6513d4;
    stim[27] = 36'h3d786965b;
    stim[28] = 36'h31114de08;
    stim[29] = 36'h264822aca;
    stim[30] = 36'h394d89654;
    stim[31] = 36'h4e8dda1e2;
    stim[32] = 36'h4766c3186;
    stim[33] = 36'h756dea5e2;
    stim[34] = 36'h38b1bd7ed;
    stim[35] = 36'h761720072;
    stim[36] = 36'h2ae90bea6;
    stim[37] = 36'h16c4fe3bf;
    stim[38] = 36'h764b60101;
    stim[39] = 36'h4d9cec441;
    stim[40] = 36'h200080703;
    stim[41] = 36'h7b22213e5;
    stim[42] = 36'h52c6d8896;
    stim[43] = 36'h14360f41d;
    stim[44] = 36'h4570734e5;
    stim[45] = 36'h10eefbe04;
    stim[46] = 36'h1cbce389b;
    stim[47] = 36'h3237f5520;
    stim[48] = 36'h3af0cdf56;
    stim[49] = 36'h260bb966f;
    stim[50] = 36'h7b8fbd1ca;
    stim[51] = 36'h606a7c564;
    stim[52] = 36'h69114822a;
    stim[53] = 36'h6ca256e01;
    stim[54] = 36'h5530dc92a;
    stim[55] = 36'h75bdca1f2;
    stim[56] = 36'h33a0172c6;
    stim[57] = 36'h39952c03c;
    stim[58] = 36'h219797491;
    stim[59] = 36'h5b77f7656;
    stim[60] = 36'h58667c8bf;
    stim[61] = 36'h1108a631f;
    stim[62] = 36'h51159528d;
    stim[63] = 36'h44be2b879;
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
      expv[0] = 50'h0000000000000;
      expv[1] = 50'h0000000000000;
      expv[2] = 50'h0000000000000;
      expv[3] = 50'h0000000000000;
      expv[4] = 50'h0000000000000;
      expv[5] = 50'h0000000000000;
      expv[6] = 50'h0000000000000;
      expv[7] = 50'h0000000000000;
      expv[8] = 50'h0000000000000;
      expv[9] = 50'h0000000000000;
      expv[10] = 50'h0000000000000;
      expv[11] = 50'h0000000000000;
      expv[12] = 50'h0000000000000;
      expv[13] = 50'h0000000000000;
      expv[14] = 50'h0000000000000;
      expv[15] = 50'h0000000000000;
      expv[16] = 50'h0000000000000;
      expv[17] = 50'h0000000000000;
      expv[18] = 50'h0000000000000;
      expv[19] = 50'h0000000000000;
      expv[20] = 50'h0000000000000;
      expv[21] = 50'h0000000000000;
      expv[22] = 50'h0000000000000;
      expv[23] = 50'h0000000000000;
      expv[24] = 50'h0000000000000;
      expv[25] = 50'h0000000000000;
      expv[26] = 50'h0000000000000;
      expv[27] = 50'h0000000000000;
      expv[28] = 50'h0000000000000;
      expv[29] = 50'h0000000000000;
      expv[30] = 50'h0000000000000;
      expv[31] = 50'h0000000000000;
      expv[32] = 50'h0000000000000;
      expv[33] = 50'h0000000000000;
      expv[34] = 50'h0000000000000;
      expv[35] = 50'h0000000000000;
      expv[36] = 50'h0000000000000;
      expv[37] = 50'h0000000000000;
      expv[38] = 50'h0000000000000;
      expv[39] = 50'h0000000000000;
      expv[40] = 50'h0000000000000;
      expv[41] = 50'h0000000000000;
      expv[42] = 50'h0000000000000;
      expv[43] = 50'h0000000000000;
      expv[44] = 50'h0000000000000;
      expv[45] = 50'h0000000000000;
      expv[46] = 50'h0000000000000;
      expv[47] = 50'h0000000000000;
      expv[48] = 50'h0000000000000;
      expv[49] = 50'h0000000000000;
      expv[50] = 50'h0000000000000;
      expv[51] = 50'h0000000000000;
      expv[52] = 50'h0000000000000;
      expv[53] = 50'h0000000000000;
      expv[54] = 50'h0000000000000;
      expv[55] = 50'h0000000000000;
      expv[56] = 50'h0000000000000;
      expv[57] = 50'h0000000000000;
      expv[58] = 50'h0000000000000;
      expv[59] = 50'h0000000000000;
      expv[60] = 50'h0000000000000;
      expv[61] = 50'h0000000000000;
      expv[62] = 50'h0000000000000;
      expv[63] = 50'h0000000000000;
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
