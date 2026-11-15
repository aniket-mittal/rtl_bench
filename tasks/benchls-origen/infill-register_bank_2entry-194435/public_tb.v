// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_194435 dut (
    .clk(clk),
    .reset(in_vec[14:14]),
    .instr(in_vec[13:6]),
    .data_result(in_vec[5:2]),
    .rd(in_vec[1:1]),
    .init(in_vec[0:0]),
    .data_A(out_vec[8:5]),
    .data_B(out_vec[4:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h769d;
    stim[1] = 15'h6f70;
    stim[2] = 15'h3abb;
    stim[3] = 15'h1024;
    stim[4] = 15'h12d8;
    stim[5] = 15'h004c;
    stim[6] = 15'h2080;
    stim[7] = 15'h0567;
    stim[8] = 15'h0260;
    stim[9] = 15'h33ee;
    stim[10] = 15'h017b;
    stim[11] = 15'h0e32;
    stim[12] = 15'h026a;
    stim[13] = 15'h1385;
    stim[14] = 15'h2ee6;
    stim[15] = 15'h3d39;
    stim[16] = 15'h3db8;
    stim[17] = 15'h395e;
    stim[18] = 15'h0dd7;
    stim[19] = 15'h09ac;
    stim[20] = 15'h2d32;
    stim[21] = 15'h01ba;
    stim[22] = 15'h2561;
    stim[23] = 15'h36e3;
    stim[24] = 15'h3967;
    stim[25] = 15'h21da;
    stim[26] = 15'h2949;
    stim[27] = 15'h1ec8;
    stim[28] = 15'h3c84;
    stim[29] = 15'h0c8a;
    stim[30] = 15'h28f4;
    stim[31] = 15'h327d;
    stim[32] = 15'h0ae1;
    stim[33] = 15'h1720;
    stim[34] = 15'h27c8;
    stim[35] = 15'h27c1;
    stim[36] = 15'h1aad;
    stim[37] = 15'h33a6;
    stim[38] = 15'h2a32;
    stim[39] = 15'h2378;
    stim[40] = 15'h2d75;
    stim[41] = 15'h3aac;
    stim[42] = 15'h151c;
    stim[43] = 15'h0583;
    stim[44] = 15'h294d;
    stim[45] = 15'h3ab2;
    stim[46] = 15'h0717;
    stim[47] = 15'h07e0;
    stim[48] = 15'h2a5a;
    stim[49] = 15'h0192;
    stim[50] = 15'h2f60;
    stim[51] = 15'h024c;
    stim[52] = 15'h2605;
    stim[53] = 15'h2329;
    stim[54] = 15'h1d4b;
    stim[55] = 15'h7695;
    stim[56] = 15'h304e;
    stim[57] = 15'h244e;
    stim[58] = 15'h09b6;
    stim[59] = 15'h060b;
    stim[60] = 15'h07c4;
    stim[61] = 15'h273f;
    stim[62] = 15'h3436;
    stim[63] = 15'h2f25;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'hxxx;
      expv[7] = 9'hxxx;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h001;
      expv[11] = 9'h161;
      expv[12] = 9'h181;
      expv[13] = 9'h141;
      expv[14] = 9'h1xx;
      expv[15] = 9'h1xx;
      expv[16] = 9'hxx3;
      expv[17] = 9'hxx2;
      expv[18] = 9'hxx3;
      expv[19] = 9'hxx3;
      expv[20] = 9'hxx2;
      expv[21] = 9'hxx3;
      expv[22] = 9'hxx3;
      expv[23] = 9'h133;
      expv[24] = 9'h1xx;
      expv[25] = 9'hxx3;
      expv[26] = 9'hxx3;
      expv[27] = 9'hxx3;
      expv[28] = 9'hxx2;
      expv[29] = 9'hxx2;
      expv[30] = 9'hxx3;
      expv[31] = 9'hxx2;
      expv[32] = 9'h1xx;
      expv[33] = 9'hxxx;
      expv[34] = 9'hxxx;
      expv[35] = 9'hxxx;
      expv[36] = 9'h1xx;
      expv[37] = 9'hxxx;
      expv[38] = 9'hxxx;
      expv[39] = 9'hxxx;
      expv[40] = 9'hxxx;
      expv[41] = 9'hxx8;
      expv[42] = 9'hxx8;
      expv[43] = 9'hxx8;
      expv[44] = 9'h198;
      expv[45] = 9'hxx8;
      expv[46] = 9'hxx9;
      expv[47] = 9'h1xx;
      expv[48] = 9'h1xx;
      expv[49] = 9'h1xx;
      expv[50] = 9'h1xx;
      expv[51] = 9'h1xx;
      expv[52] = 9'h1xx;
      expv[53] = 9'h1xx;
      expv[54] = 9'h0xx;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h067;
      expv[58] = 9'h067;
      expv[59] = 9'h1bb;
      expv[60] = 9'h0xx;
      expv[61] = 9'h0xx;
      expv[62] = 9'h0xx;
      expv[63] = 9'h0xx;
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
