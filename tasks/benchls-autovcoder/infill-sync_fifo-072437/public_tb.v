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

  autovcoder_072437 dut (
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
    stim[0] = 12'h862;
    stim[1] = 12'hee5;
    stim[2] = 12'h02b;
    stim[3] = 12'h3ca;
    stim[4] = 12'h2aa;
    stim[5] = 12'h33b;
    stim[6] = 12'h0f7;
    stim[7] = 12'h19e;
    stim[8] = 12'h4b2;
    stim[9] = 12'h6b3;
    stim[10] = 12'h0b8;
    stim[11] = 12'h342;
    stim[12] = 12'h5d8;
    stim[13] = 12'h270;
    stim[14] = 12'h10f;
    stim[15] = 12'h2bb;
    stim[16] = 12'h3b1;
    stim[17] = 12'h04f;
    stim[18] = 12'h2b7;
    stim[19] = 12'h691;
    stim[20] = 12'h390;
    stim[21] = 12'h07f;
    stim[22] = 12'h574;
    stim[23] = 12'h0e5;
    stim[24] = 12'h1cb;
    stim[25] = 12'h1b3;
    stim[26] = 12'h2c2;
    stim[27] = 12'h2c5;
    stim[28] = 12'h371;
    stim[29] = 12'h5ce;
    stim[30] = 12'h037;
    stim[31] = 12'h500;
    stim[32] = 12'h100;
    stim[33] = 12'h63f;
    stim[34] = 12'h4d1;
    stim[35] = 12'h6ba;
    stim[36] = 12'h33c;
    stim[37] = 12'h2cc;
    stim[38] = 12'h2b7;
    stim[39] = 12'h30a;
    stim[40] = 12'h733;
    stim[41] = 12'h1f6;
    stim[42] = 12'h7f6;
    stim[43] = 12'h714;
    stim[44] = 12'h04c;
    stim[45] = 12'h611;
    stim[46] = 12'h458;
    stim[47] = 12'h491;
    stim[48] = 12'h28e;
    stim[49] = 12'h1cb;
    stim[50] = 12'h6d3;
    stim[51] = 12'h1a7;
    stim[52] = 12'h551;
    stim[53] = 12'h2b5;
    stim[54] = 12'h399;
    stim[55] = 12'h64e;
    stim[56] = 12'h577;
    stim[57] = 12'h1d4;
    stim[58] = 12'h1db;
    stim[59] = 12'h564;
    stim[60] = 12'h774;
    stim[61] = 12'h481;
    stim[62] = 12'h30e;
    stim[63] = 12'h041;
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
      expv[4] = 10'h100;
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h100;
      expv[8] = 10'h100;
      expv[9] = 10'h1xx;
      expv[10] = 10'h1xx;
      expv[11] = 10'h1xx;
      expv[12] = 10'h1xx;
      expv[13] = 10'h1xx;
      expv[14] = 10'h1xx;
      expv[15] = 10'h1xx;
      expv[16] = 10'h1xx;
      expv[17] = 10'h1xx;
      expv[18] = 10'h1xx;
      expv[19] = 10'h1xx;
      expv[20] = 10'h3d8;
      expv[21] = 10'h3d8;
      expv[22] = 10'h3d8;
      expv[23] = 10'h3d8;
      expv[24] = 10'h3d8;
      expv[25] = 10'h3d8;
      expv[26] = 10'h3d8;
      expv[27] = 10'h3d8;
      expv[28] = 10'h3d8;
      expv[29] = 10'h3d8;
      expv[30] = 10'h3d8;
      expv[31] = 10'h3d8;
      expv[32] = 10'h3d8;
      expv[33] = 10'h3d8;
      expv[34] = 10'h374;
      expv[35] = 10'h374;
      expv[36] = 10'h3ce;
      expv[37] = 10'h3ce;
      expv[38] = 10'h3ce;
      expv[39] = 10'h3ce;
      expv[40] = 10'h3ce;
      expv[41] = 10'h300;
      expv[42] = 10'h300;
      expv[43] = 10'h333;
      expv[44] = 10'h3f6;
      expv[45] = 10'h3f6;
      expv[46] = 10'h314;
      expv[47] = 10'h314;
      expv[48] = 10'h314;
      expv[49] = 10'h314;
      expv[50] = 10'h314;
      expv[51] = 10'h114;
      expv[52] = 10'h114;
      expv[53] = 10'h114;
      expv[54] = 10'h114;
      expv[55] = 10'h114;
      expv[56] = 10'h351;
      expv[57] = 10'h351;
      expv[58] = 10'h351;
      expv[59] = 10'h351;
      expv[60] = 10'h351;
      expv[61] = 10'h377;
      expv[62] = 10'h377;
      expv[63] = 10'h377;
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
