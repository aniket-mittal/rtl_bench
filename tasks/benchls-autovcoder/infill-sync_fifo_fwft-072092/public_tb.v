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

  autovcoder_072092 dut (
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
    stim[1] = 12'hfcd;
    stim[2] = 12'h3df;
    stim[3] = 12'h3a2;
    stim[4] = 12'h60c;
    stim[5] = 12'hae5;
    stim[6] = 12'h1b1;
    stim[7] = 12'h519;
    stim[8] = 12'h6b1;
    stim[9] = 12'h80f;
    stim[10] = 12'h003;
    stim[11] = 12'h253;
    stim[12] = 12'h317;
    stim[13] = 12'h422;
    stim[14] = 12'h588;
    stim[15] = 12'h1c1;
    stim[16] = 12'h6cf;
    stim[17] = 12'h630;
    stim[18] = 12'h639;
    stim[19] = 12'h03d;
    stim[20] = 12'h73b;
    stim[21] = 12'h2f7;
    stim[22] = 12'h26a;
    stim[23] = 12'h35a;
    stim[24] = 12'h3ac;
    stim[25] = 12'h213;
    stim[26] = 12'ha65;
    stim[27] = 12'h45a;
    stim[28] = 12'h2c1;
    stim[29] = 12'h475;
    stim[30] = 12'h1ce;
    stim[31] = 12'h7e1;
    stim[32] = 12'h5a3;
    stim[33] = 12'h1b3;
    stim[34] = 12'h1ca;
    stim[35] = 12'h71d;
    stim[36] = 12'h279;
    stim[37] = 12'h7d3;
    stim[38] = 12'h1e8;
    stim[39] = 12'h121;
    stim[40] = 12'h573;
    stim[41] = 12'h5ad;
    stim[42] = 12'h3cc;
    stim[43] = 12'h0ad;
    stim[44] = 12'h0fb;
    stim[45] = 12'h630;
    stim[46] = 12'h1e6;
    stim[47] = 12'h0d7;
    stim[48] = 12'h101;
    stim[49] = 12'h515;
    stim[50] = 12'h33a;
    stim[51] = 12'h717;
    stim[52] = 12'h5a6;
    stim[53] = 12'h7fd;
    stim[54] = 12'h24f;
    stim[55] = 12'h13f;
    stim[56] = 12'h595;
    stim[57] = 12'h49e;
    stim[58] = 12'h560;
    stim[59] = 12'h302;
    stim[60] = 12'h1cb;
    stim[61] = 12'h38e;
    stim[62] = 12'h413;
    stim[63] = 12'h49a;
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
      expv[5] = 10'h1cd;
      expv[6] = 10'h100;
      expv[7] = 10'h100;
      expv[8] = 10'h1cd;
      expv[9] = 10'h319;
      expv[10] = 10'h100;
      expv[11] = 10'h100;
      expv[12] = 10'h100;
      expv[13] = 10'h100;
      expv[14] = 10'h119;
      expv[15] = 10'h119;
      expv[16] = 10'h119;
      expv[17] = 10'h388;
      expv[18] = 10'h188;
      expv[19] = 10'h188;
      expv[20] = 10'h188;
      expv[21] = 10'h188;
      expv[22] = 10'h188;
      expv[23] = 10'h188;
      expv[24] = 10'h188;
      expv[25] = 10'h188;
      expv[26] = 10'h188;
      expv[27] = 10'h100;
      expv[28] = 10'h13b;
      expv[29] = 10'h13b;
      expv[30] = 10'h13b;
      expv[31] = 10'h13b;
      expv[32] = 10'h13b;
      expv[33] = 10'h3e1;
      expv[34] = 10'h3e1;
      expv[35] = 10'h3e1;
      expv[36] = 10'h3a3;
      expv[37] = 10'h3a3;
      expv[38] = 10'h31d;
      expv[39] = 10'h31d;
      expv[40] = 10'h31d;
      expv[41] = 10'h31d;
      expv[42] = 10'h31d;
      expv[43] = 10'h31d;
      expv[44] = 10'h31d;
      expv[45] = 10'h31d;
      expv[46] = 10'h3d3;
      expv[47] = 10'h3d3;
      expv[48] = 10'h3d3;
      expv[49] = 10'h3d3;
      expv[50] = 10'h3d3;
      expv[51] = 10'h3d3;
      expv[52] = 10'h373;
      expv[53] = 10'h373;
      expv[54] = 10'h3ad;
      expv[55] = 10'h3ad;
      expv[56] = 10'h3ad;
      expv[57] = 10'h3ad;
      expv[58] = 10'h3ad;
      expv[59] = 10'h3ad;
      expv[60] = 10'h3ad;
      expv[61] = 10'h3ad;
      expv[62] = 10'h3ad;
      expv[63] = 10'h3ad;
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
