// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05595 dut (
    .CLK(clk),
    .A(in_vec[20:10]),
    .DIN(in_vec[9:2]),
    .EN(in_vec[1:1]),
    .WE(in_vec[0:0]),
    .DOUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h16780f;
    stim[1] = 21'h13efaa;
    stim[2] = 21'h1e0d8b;
    stim[3] = 21'h10f9e3;
    stim[4] = 21'h09704c;
    stim[5] = 21'h1df82f;
    stim[6] = 21'h08ce30;
    stim[7] = 21'h07ac5b;
    stim[8] = 21'h1ef3ab;
    stim[9] = 21'h098edb;
    stim[10] = 21'h1ffa15;
    stim[11] = 21'h1a98e5;
    stim[12] = 21'h1d7baa;
    stim[13] = 21'h177faf;
    stim[14] = 21'h1b2702;
    stim[15] = 21'h01aed9;
    stim[16] = 21'h0fee40;
    stim[17] = 21'h070470;
    stim[18] = 21'h02aef2;
    stim[19] = 21'h1abb23;
    stim[20] = 21'h1a0145;
    stim[21] = 21'h083d56;
    stim[22] = 21'h16d30c;
    stim[23] = 21'h113ebe;
    stim[24] = 21'h0dce2c;
    stim[25] = 21'h07c544;
    stim[26] = 21'h03ec8f;
    stim[27] = 21'h0e07ef;
    stim[28] = 21'h084b3c;
    stim[29] = 21'h0cd886;
    stim[30] = 21'h175095;
    stim[31] = 21'h094928;
    stim[32] = 21'h06cf92;
    stim[33] = 21'h02d023;
    stim[34] = 21'h06d52c;
    stim[35] = 21'h11c276;
    stim[36] = 21'h011669;
    stim[37] = 21'h0b7e80;
    stim[38] = 21'h0151ab;
    stim[39] = 21'h087234;
    stim[40] = 21'h0da1f2;
    stim[41] = 21'h1b42b0;
    stim[42] = 21'h1f54b7;
    stim[43] = 21'h146c63;
    stim[44] = 21'h0a3d23;
    stim[45] = 21'h14cc2a;
    stim[46] = 21'h1cc960;
    stim[47] = 21'h133ada;
    stim[48] = 21'h1e3ac0;
    stim[49] = 21'h0e3747;
    stim[50] = 21'h0bfb0f;
    stim[51] = 21'h1a45fa;
    stim[52] = 21'h00f38b;
    stim[53] = 21'h1934f6;
    stim[54] = 21'h040729;
    stim[55] = 21'h13721c;
    stim[56] = 21'h1654fb;
    stim[57] = 21'h0785be;
    stim[58] = 21'h1da41a;
    stim[59] = 21'h175097;
    stim[60] = 21'h12444f;
    stim[61] = 21'h1cc0c4;
    stim[62] = 21'h02f9c7;
    stim[63] = 21'h0375a1;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
