// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08255 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .idata(in_vec[16:9]),
    .ivalid(in_vec[8:8]),
    .strobe(in_vec[7:0]),
    .odata(out_vec[8:1]),
    .ovalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h39d40;
    stim[1] = 18'h38c4e;
    stim[2] = 18'h05954;
    stim[3] = 18'h1ff8f;
    stim[4] = 18'h24cec;
    stim[5] = 18'h0eb35;
    stim[6] = 18'h1e47d;
    stim[7] = 18'h08950;
    stim[8] = 18'h1d36d;
    stim[9] = 18'h18d25;
    stim[10] = 18'h05e69;
    stim[11] = 18'h06f75;
    stim[12] = 18'h173bc;
    stim[13] = 18'h104d7;
    stim[14] = 18'h11e96;
    stim[15] = 18'h0fbb5;
    stim[16] = 18'h05c5c;
    stim[17] = 18'h02c5d;
    stim[18] = 18'h3131d;
    stim[19] = 18'h1bea0;
    stim[20] = 18'h0c28e;
    stim[21] = 18'h10ba8;
    stim[22] = 18'h1fe5b;
    stim[23] = 18'h1846e;
    stim[24] = 18'h10387;
    stim[25] = 18'h184bd;
    stim[26] = 18'h0dfb1;
    stim[27] = 18'h1e8ff;
    stim[28] = 18'h02e16;
    stim[29] = 18'h16b33;
    stim[30] = 18'h161f9;
    stim[31] = 18'h1cc1f;
    stim[32] = 18'h1dfc3;
    stim[33] = 18'h181ef;
    stim[34] = 18'h1797a;
    stim[35] = 18'h08b54;
    stim[36] = 18'h0543a;
    stim[37] = 18'h01c2b;
    stim[38] = 18'h1db8d;
    stim[39] = 18'h13cf1;
    stim[40] = 18'h0f1ce;
    stim[41] = 18'h05b09;
    stim[42] = 18'h0f070;
    stim[43] = 18'h1d5b9;
    stim[44] = 18'h0e774;
    stim[45] = 18'h0507a;
    stim[46] = 18'h0b83d;
    stim[47] = 18'h142ee;
    stim[48] = 18'h09ceb;
    stim[49] = 18'h08fe0;
    stim[50] = 18'h15d39;
    stim[51] = 18'h0e559;
    stim[52] = 18'h10157;
    stim[53] = 18'h1bb0f;
    stim[54] = 18'h19318;
    stim[55] = 18'h1df0f;
    stim[56] = 18'h16936;
    stim[57] = 18'h039d8;
    stim[58] = 18'h0837c;
    stim[59] = 18'h2de6e;
    stim[60] = 18'h082a7;
    stim[61] = 18'h123f2;
    stim[62] = 18'h1c1c9;
    stim[63] = 18'h12112;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'h000;
      expv[3] = 9'h001;
      expv[4] = 9'h059;
      expv[5] = 9'h1fe;
      expv[6] = 9'h001;
      expv[7] = 9'h0ea;
      expv[8] = 9'h0eb;
      expv[9] = 9'h089;
      expv[10] = 9'h1d3;
      expv[11] = 9'h18c;
      expv[12] = 9'h18d;
      expv[13] = 9'h06f;
      expv[14] = 9'h172;
      expv[15] = 9'h172;
      expv[16] = 9'h173;
      expv[17] = 9'h0fa;
      expv[18] = 9'h0fa;
      expv[19] = 9'h0fa;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h001;
      expv[23] = 9'h10a;
      expv[24] = 9'h10a;
      expv[25] = 9'h10b;
      expv[26] = 9'h102;
      expv[27] = 9'h103;
      expv[28] = 9'h0de;
      expv[29] = 9'h0de;
      expv[30] = 9'h0df;
      expv[31] = 9'h16b;
      expv[32] = 9'h160;
      expv[33] = 9'h161;
      expv[34] = 9'h1df;
      expv[35] = 9'h181;
      expv[36] = 9'h179;
      expv[37] = 9'h08a;
      expv[38] = 9'h08a;
      expv[39] = 9'h08b;
      expv[40] = 9'h1da;
      expv[41] = 9'h1db;
      expv[42] = 9'h0f1;
      expv[43] = 9'h05a;
      expv[44] = 9'h05b;
      expv[45] = 9'h1d5;
      expv[46] = 9'h0e6;
      expv[47] = 9'h0e6;
      expv[48] = 9'h0e6;
      expv[49] = 9'h0e6;
      expv[50] = 9'h0e7;
      expv[51] = 9'h08f;
      expv[52] = 9'h15d;
      expv[53] = 9'h0e5;
      expv[54] = 9'h101;
      expv[55] = 9'h1bb;
      expv[56] = 9'h193;
      expv[57] = 9'h1df;
      expv[58] = 9'h169;
      expv[59] = 9'h039;
      expv[60] = 9'h082;
      expv[61] = 9'h000;
      expv[62] = 9'h001;
      expv[63] = 9'h123;
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
