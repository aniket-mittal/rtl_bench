// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02534 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .data_in(in_vec[16:16]),
    .dec_rate(in_vec[15:0]),
    .data_out(out_vec[16:1]),
    .data_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h383c2;
    stim[1] = 18'h22be5;
    stim[2] = 18'h0503b;
    stim[3] = 18'h07044;
    stim[4] = 18'h0f7aa;
    stim[5] = 18'h019e1;
    stim[6] = 18'h12a37;
    stim[7] = 18'h1d88e;
    stim[8] = 18'h085d2;
    stim[9] = 18'h0356e;
    stim[10] = 18'h11952;
    stim[11] = 18'h16391;
    stim[12] = 18'h190ee;
    stim[13] = 18'h153b1;
    stim[14] = 18'h121e7;
    stim[15] = 18'h10ff2;
    stim[16] = 18'h0d465;
    stim[17] = 18'h1ffe3;
    stim[18] = 18'h115ce;
    stim[19] = 18'h03a9a;
    stim[20] = 18'h0a383;
    stim[21] = 18'h08054;
    stim[22] = 18'h08ae2;
    stim[23] = 18'h125f4;
    stim[24] = 18'h0d29b;
    stim[25] = 18'h18e3c;
    stim[26] = 18'h03be1;
    stim[27] = 18'h03d63;
    stim[28] = 18'h1efb5;
    stim[29] = 18'h1e4d1;
    stim[30] = 18'h17233;
    stim[31] = 18'h1935a;
    stim[32] = 18'h1753a;
    stim[33] = 18'h039ff;
    stim[34] = 18'h00042;
    stim[35] = 18'h02abf;
    stim[36] = 18'h18a4d;
    stim[37] = 18'h07f35;
    stim[38] = 18'h01ec3;
    stim[39] = 18'h12501;
    stim[40] = 18'h16355;
    stim[41] = 18'h1ac22;
    stim[42] = 18'h0456c;
    stim[43] = 18'h17e34;
    stim[44] = 18'h12e4a;
    stim[45] = 18'h1ee00;
    stim[46] = 18'h0671d;
    stim[47] = 18'h1e8ae;
    stim[48] = 18'h169fa;
    stim[49] = 18'h058e1;
    stim[50] = 18'h111c1;
    stim[51] = 18'h1d0a5;
    stim[52] = 18'h094bf;
    stim[53] = 18'h23f73;
    stim[54] = 18'h1a202;
    stim[55] = 18'h14e0c;
    stim[56] = 18'h03f6b;
    stim[57] = 18'h0c913;
    stim[58] = 18'h09e40;
    stim[59] = 18'h12007;
    stim[60] = 18'h11f08;
    stim[61] = 18'h06339;
    stim[62] = 18'h16e14;
    stim[63] = 18'h1a93c;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'hxxxxx;
      expv[4] = 17'hxxxxx;
      expv[5] = 17'hxxxxx;
      expv[6] = 17'hxxxxx;
      expv[7] = 17'hxxxxx;
      expv[8] = 17'hxxxxx;
      expv[9] = 17'hxxxxx;
      expv[10] = 17'hxxxxx;
      expv[11] = 17'hxxxxx;
      expv[12] = 17'hxxxxx;
      expv[13] = 17'hxxxxx;
      expv[14] = 17'hxxxxx;
      expv[15] = 17'hxxxxx;
      expv[16] = 17'hxxxxx;
      expv[17] = 17'hxxxxx;
      expv[18] = 17'hxxxxx;
      expv[19] = 17'hxxxxx;
      expv[20] = 17'hxxxxx;
      expv[21] = 17'hxxxxx;
      expv[22] = 17'hxxxxx;
      expv[23] = 17'hxxxxx;
      expv[24] = 17'hxxxxx;
      expv[25] = 17'hxxxxx;
      expv[26] = 17'hxxxxx;
      expv[27] = 17'hxxxxx;
      expv[28] = 17'hxxxxx;
      expv[29] = 17'hxxxxx;
      expv[30] = 17'hxxxxx;
      expv[31] = 17'hxxxxx;
      expv[32] = 17'hxxxxx;
      expv[33] = 17'hxxxxx;
      expv[34] = 17'hxxxxx;
      expv[35] = 17'h00001;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
