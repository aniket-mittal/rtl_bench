// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04827 dut (
    .clk(clk),
    .load(in_vec[32:32]),
    .din(in_vec[31:0]),
    .sout(out_vec[1:1]),
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
    stim[0] = 33'h02c95c62d;
    stim[1] = 33'h0eefb35a2;
    stim[2] = 33'h1f960ccfc;
    stim[3] = 33'h0e64e58fd;
    stim[4] = 33'h1183c9fc8;
    stim[5] = 33'h1962cfeac;
    stim[6] = 33'h186a5e8e8;
    stim[7] = 33'h176059e28;
    stim[8] = 33'h17f8e068c;
    stim[9] = 33'h118a6d079;
    stim[10] = 33'h0264f139f;
    stim[11] = 33'h07a2219f3;
    stim[12] = 33'h0259de935;
    stim[13] = 33'h0d85160ce;
    stim[14] = 33'h0040d786c;
    stim[15] = 33'h1fde4811d;
    stim[16] = 33'h0d7f9dde4;
    stim[17] = 33'h1334b7569;
    stim[18] = 33'h1bc869207;
    stim[19] = 33'h1e67e5027;
    stim[20] = 33'h04fdfe02c;
    stim[21] = 33'h0771a58d2;
    stim[22] = 33'h191cbfc07;
    stim[23] = 33'h1893d4074;
    stim[24] = 33'h0bc454f63;
    stim[25] = 33'h18aa2dc94;
    stim[26] = 33'h1ac516d2b;
    stim[27] = 33'h1f396e0c7;
    stim[28] = 33'h1f5a4a23a;
    stim[29] = 33'h12b7fdc31;
    stim[30] = 33'h09f707314;
    stim[31] = 33'h182ef5d85;
    stim[32] = 33'h1df098e60;
    stim[33] = 33'h10b9ba899;
    stim[34] = 33'h02c73a48c;
    stim[35] = 33'h0fdb3454e;
    stim[36] = 33'h140d897b7;
    stim[37] = 33'h1a6c07a4a;
    stim[38] = 33'h09d30716f;
    stim[39] = 33'h131ecd92d;
    stim[40] = 33'h17b63906c;
    stim[41] = 33'h0407aae11;
    stim[42] = 33'h042ad4a95;
    stim[43] = 33'h0ec7f1cd0;
    stim[44] = 33'h06e26d4ef;
    stim[45] = 33'h1756eb28a;
    stim[46] = 33'h1880bf9d4;
    stim[47] = 33'h062ccb6c9;
    stim[48] = 33'h106b13d3a;
    stim[49] = 33'h0fc987818;
    stim[50] = 33'h0307081c2;
    stim[51] = 33'h0e6219890;
    stim[52] = 33'h15712c020;
    stim[53] = 33'h1b03b99c5;
    stim[54] = 33'h0f238bcc8;
    stim[55] = 33'h159318465;
    stim[56] = 33'h053b1801c;
    stim[57] = 33'h1132d0d03;
    stim[58] = 33'h03c9a146d;
    stim[59] = 33'h108988f53;
    stim[60] = 33'h0686f505e;
    stim[61] = 33'h0342e2d5b;
    stim[62] = 33'h0dc2f1673;
    stim[63] = 33'h0c80f772e;
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
      expv[0] = 2'hx;
      expv[1] = 2'hx;
      expv[2] = 2'hx;
      expv[3] = 2'h2;
      expv[4] = 2'h2;
      expv[5] = 2'h0;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h0;
      expv[16] = 2'h2;
      expv[17] = 2'h2;
      expv[18] = 2'h0;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h0;
      expv[26] = 2'h2;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h2;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h2;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h0;
      expv[47] = 2'h2;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h2;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h2;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
