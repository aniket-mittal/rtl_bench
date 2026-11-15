// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020697 dut (
    .branch(in_vec[17:14]),
    .morethree(in_vec[13:13]),
    .fmulovf(in_vec[12:12]),
    .rsge64(in_vec[11:11]),
    .absign(in_vec[10:10]),
    .addsub(in_vec[9:9]),
    .manzero(in_vec[8:8]),
    .rs32(in_vec[7:7]),
    .eadd(in_vec[6:6]),
    .amsb(in_vec[5:5]),
    .rem_op(in_vec[4:4]),
    .qmsb(in_vec[3:3]),
    .a2func(in_vec[2:0]),
    .romselp_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h3dbd1;
    stim[1] = 18'h128bb;
    stim[2] = 18'h2238a;
    stim[3] = 18'h37af1;
    stim[4] = 18'h1e3af;
    stim[5] = 18'h368b6;
    stim[6] = 18'h20bb3;
    stim[7] = 18'h346aa;
    stim[8] = 18'h36a51;
    stim[9] = 18'h3dccf;
    stim[10] = 18'h08c8d;
    stim[11] = 18'h37f19;
    stim[12] = 18'h1be76;
    stim[13] = 18'h154df;
    stim[14] = 18'h20ebc;
    stim[15] = 18'h15cb9;
    stim[16] = 18'h03b5b;
    stim[17] = 18'h01f9c;
    stim[18] = 18'h337e9;
    stim[19] = 18'h15c3b;
    stim[20] = 18'h26ce3;
    stim[21] = 18'h0809e;
    stim[22] = 18'h159b5;
    stim[23] = 18'h2d3a4;
    stim[24] = 18'h13436;
    stim[25] = 18'h09fd7;
    stim[26] = 18'h29663;
    stim[27] = 18'h38ab3;
    stim[28] = 18'h18c9c;
    stim[29] = 18'h19e21;
    stim[30] = 18'h11547;
    stim[31] = 18'h395f4;
    stim[32] = 18'h0a1b7;
    stim[33] = 18'h01e56;
    stim[34] = 18'h2af80;
    stim[35] = 18'h012ba;
    stim[36] = 18'h0b30c;
    stim[37] = 18'h14533;
    stim[38] = 18'h18dd8;
    stim[39] = 18'h3ea17;
    stim[40] = 18'h0dedd;
    stim[41] = 18'h1f408;
    stim[42] = 18'h3ae36;
    stim[43] = 18'h1b98c;
    stim[44] = 18'h3802e;
    stim[45] = 18'h03d77;
    stim[46] = 18'h232cd;
    stim[47] = 18'h3d0f0;
    stim[48] = 18'h0712c;
    stim[49] = 18'h38b03;
    stim[50] = 18'h1d2f4;
    stim[51] = 18'h0b063;
    stim[52] = 18'h2f62c;
    stim[53] = 18'h3ddb6;
    stim[54] = 18'h1d0a2;
    stim[55] = 18'h03271;
    stim[56] = 18'h2692b;
    stim[57] = 18'h248a0;
    stim[58] = 18'h03278;
    stim[59] = 18'h3d580;
    stim[60] = 18'h0fed5;
    stim[61] = 18'h1ba1f;
    stim[62] = 18'h3cbd0;
    stim[63] = 18'h305e8;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
