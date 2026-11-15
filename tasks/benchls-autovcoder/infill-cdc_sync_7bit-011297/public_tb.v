// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011297 dut (
    .iclk_i(clk),
    .iclk_reset_i(in_vec[8:8]),
    .oclk_i(in_vec[7:7]),
    .iclk_data_i(in_vec[6:0]),
    .iclk_data_o(out_vec[13:7]),
    .oclk_data_o(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1ba;
    stim[1] = 9'h121;
    stim[2] = 9'h0ca;
    stim[3] = 9'h094;
    stim[4] = 9'h0aa;
    stim[5] = 9'h032;
    stim[6] = 9'h0c1;
    stim[7] = 9'h0f7;
    stim[8] = 9'h0a5;
    stim[9] = 9'h000;
    stim[10] = 9'h038;
    stim[11] = 9'h083;
    stim[12] = 9'h05e;
    stim[13] = 9'h0eb;
    stim[14] = 9'h080;
    stim[15] = 9'h023;
    stim[16] = 9'h0e1;
    stim[17] = 9'h0dc;
    stim[18] = 9'h04f;
    stim[19] = 9'h0e4;
    stim[20] = 9'h0c4;
    stim[21] = 9'h071;
    stim[22] = 9'h03b;
    stim[23] = 9'h08f;
    stim[24] = 9'h023;
    stim[25] = 9'h0f7;
    stim[26] = 9'h0b3;
    stim[27] = 9'h0c2;
    stim[28] = 9'h06f;
    stim[29] = 9'h0d7;
    stim[30] = 9'h01c;
    stim[31] = 9'h046;
    stim[32] = 9'h0b8;
    stim[33] = 9'h014;
    stim[34] = 9'h03b;
    stim[35] = 9'h0ee;
    stim[36] = 9'h0e2;
    stim[37] = 9'h0a4;
    stim[38] = 9'h043;
    stim[39] = 9'h033;
    stim[40] = 9'h09d;
    stim[41] = 9'h010;
    stim[42] = 9'h0a0;
    stim[43] = 9'h012;
    stim[44] = 9'h051;
    stim[45] = 9'h0ac;
    stim[46] = 9'h0b6;
    stim[47] = 9'h084;
    stim[48] = 9'h070;
    stim[49] = 9'h0c8;
    stim[50] = 9'h001;
    stim[51] = 9'h0b6;
    stim[52] = 9'h0a7;
    stim[53] = 9'h014;
    stim[54] = 9'h031;
    stim[55] = 9'h0f9;
    stim[56] = 9'h095;
    stim[57] = 9'h0df;
    stim[58] = 9'h046;
    stim[59] = 9'h0ef;
    stim[60] = 9'h02e;
    stim[61] = 9'h007;
    stim[62] = 9'h0c5;
    stim[63] = 9'h08e;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'h00xx;
      expv[2] = 14'h00xx;
      expv[3] = 14'h25xx;
      expv[4] = 14'h0axx;
      expv[5] = 14'h15xx;
      expv[6] = 14'h1900;
      expv[7] = 14'h2080;
      expv[8] = 14'h3b80;
      expv[9] = 14'h1280;
      expv[10] = 14'h0000;
      expv[11] = 14'h1c32;
      expv[12] = 14'h01b2;
      expv[13] = 14'h2f38;
      expv[14] = 14'h35b8;
      expv[15] = 14'h0038;
      expv[16] = 14'h11de;
      expv[17] = 14'h30de;
      expv[18] = 14'h2e5e;
      expv[19] = 14'h27a3;
      expv[20] = 14'h3223;
      expv[21] = 14'h2223;
      expv[22] = 14'h38a3;
      expv[23] = 14'h1dcf;
      expv[24] = 14'h07cf;
      expv[25] = 14'h11bb;
      expv[26] = 14'h3bbb;
      expv[27] = 14'h19bb;
      expv[28] = 14'h213b;
      expv[29] = 14'h37a3;
      expv[30] = 14'h2ba3;
      expv[31] = 14'h0e23;
      expv[32] = 14'h236f;
      expv[33] = 14'h1c6f;
      expv[34] = 14'h0a6f;
      expv[35] = 14'h1dc6;
      expv[36] = 14'h3746;
      expv[37] = 14'h3146;
      expv[38] = 14'h1246;
      expv[39] = 14'h21c6;
      expv[40] = 14'h19bb;
      expv[41] = 14'h0ebb;
      expv[42] = 14'h0833;
      expv[43] = 14'h1033;
      expv[44] = 14'h0933;
      expv[45] = 14'h2890;
      expv[46] = 14'h1610;
      expv[47] = 14'h1b10;
      expv[48] = 14'h0210;
      expv[49] = 14'h3851;
      expv[50] = 14'h2451;
      expv[51] = 14'h00f0;
      expv[52] = 14'h1b70;
      expv[53] = 14'h13f0;
      expv[54] = 14'h0a70;
      expv[55] = 14'h1881;
      expv[56] = 14'h3c81;
      expv[57] = 14'h0a81;
      expv[58] = 14'h2f81;
      expv[59] = 14'h2331;
      expv[60] = 14'h37b1;
      expv[61] = 14'h1731;
      expv[62] = 14'h03c6;
      expv[63] = 14'h22c6;
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
