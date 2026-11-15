// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_141063 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .data_in(in_vec[8:1]),
    .valid_in(in_vec[0:0]),
    .data_out(out_vec[10:3]),
    .valid_out(out_vec[2:2]),
    .tx_busy(out_vec[1:1]),
    .rx_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3a6;
    stim[1] = 10'h2ce;
    stim[2] = 10'h03a;
    stim[3] = 10'h189;
    stim[4] = 10'h18b;
    stim[5] = 10'h10b;
    stim[6] = 10'h1d3;
    stim[7] = 10'h047;
    stim[8] = 10'h071;
    stim[9] = 10'h0bf;
    stim[10] = 10'h0cb;
    stim[11] = 10'h095;
    stim[12] = 10'h1d3;
    stim[13] = 10'h0df;
    stim[14] = 10'h025;
    stim[15] = 10'h184;
    stim[16] = 10'h162;
    stim[17] = 10'h16f;
    stim[18] = 10'h035;
    stim[19] = 10'h022;
    stim[20] = 10'h086;
    stim[21] = 10'h033;
    stim[22] = 10'h0d6;
    stim[23] = 10'h135;
    stim[24] = 10'h01f;
    stim[25] = 10'h287;
    stim[26] = 10'h0c9;
    stim[27] = 10'h1ee;
    stim[28] = 10'h05b;
    stim[29] = 10'h052;
    stim[30] = 10'h014;
    stim[31] = 10'h159;
    stim[32] = 10'h08d;
    stim[33] = 10'h099;
    stim[34] = 10'h042;
    stim[35] = 10'h0e6;
    stim[36] = 10'h13e;
    stim[37] = 10'h1d4;
    stim[38] = 10'h164;
    stim[39] = 10'h0f1;
    stim[40] = 10'h1dc;
    stim[41] = 10'h10a;
    stim[42] = 10'h086;
    stim[43] = 10'h084;
    stim[44] = 10'h1d7;
    stim[45] = 10'h1cd;
    stim[46] = 10'h02e;
    stim[47] = 10'h034;
    stim[48] = 10'h14b;
    stim[49] = 10'h103;
    stim[50] = 10'h02c;
    stim[51] = 10'h188;
    stim[52] = 10'h0c9;
    stim[53] = 10'h0ca;
    stim[54] = 10'h03f;
    stim[55] = 10'h248;
    stim[56] = 10'h15c;
    stim[57] = 10'h103;
    stim[58] = 10'h1dd;
    stim[59] = 10'h1c0;
    stim[60] = 10'h1a9;
    stim[61] = 10'h0dd;
    stim[62] = 10'h183;
    stim[63] = 10'h138;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h002;
      expv[5] = 11'h624;
      expv[6] = 11'h620;
      expv[7] = 11'h622;
      expv[8] = 11'h74c;
      expv[9] = 11'h748;
      expv[10] = 11'h74a;
      expv[11] = 11'h2fc;
      expv[12] = 11'h2f8;
      expv[13] = 11'h2fa;
      expv[14] = 11'h74c;
      expv[15] = 11'h748;
      expv[16] = 11'h748;
      expv[17] = 11'h748;
      expv[18] = 11'h74a;
      expv[19] = 11'h5bc;
      expv[20] = 11'h5b8;
      expv[21] = 11'h5b8;
      expv[22] = 11'h5ba;
      expv[23] = 11'h0cc;
      expv[24] = 11'h0c8;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h002;
      expv[28] = 11'h324;
      expv[29] = 11'h320;
      expv[30] = 11'h320;
      expv[31] = 11'h320;
      expv[32] = 11'h322;
      expv[33] = 11'h564;
      expv[34] = 11'h560;
      expv[35] = 11'h560;
      expv[36] = 11'h560;
      expv[37] = 11'h560;
      expv[38] = 11'h560;
      expv[39] = 11'h560;
      expv[40] = 11'h562;
      expv[41] = 11'h3c4;
      expv[42] = 11'h3c0;
      expv[43] = 11'h3c0;
      expv[44] = 11'h3c0;
      expv[45] = 11'h3c2;
      expv[46] = 11'h75c;
      expv[47] = 11'h758;
      expv[48] = 11'h758;
      expv[49] = 11'h75a;
      expv[50] = 11'h52c;
      expv[51] = 11'h528;
      expv[52] = 11'h528;
      expv[53] = 11'h52a;
      expv[54] = 11'h324;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h002;
      expv[59] = 11'h40c;
      expv[60] = 11'h408;
      expv[61] = 11'h40a;
      expv[62] = 11'h6a4;
      expv[63] = 11'h6a0;
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
