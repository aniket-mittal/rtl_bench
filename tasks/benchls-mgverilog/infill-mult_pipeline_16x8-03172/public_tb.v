// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03172 dut (
    .clk(clk),
    .ce(in_vec[24:24]),
    .a(in_vec[23:8]),
    .b(in_vec[7:0]),
    .p(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1f6c6df;
    stim[1] = 25'h1c8b281;
    stim[2] = 25'h0f44a6c;
    stim[3] = 25'h15e05d7;
    stim[4] = 25'h0bb6a83;
    stim[5] = 25'h0dc5c88;
    stim[6] = 25'h0340f2a;
    stim[7] = 25'h151b2de;
    stim[8] = 25'h0a5c619;
    stim[9] = 25'h10cc4ad;
    stim[10] = 25'h1c4be1a;
    stim[11] = 25'h0b5113d;
    stim[12] = 25'h1a9b70a;
    stim[13] = 25'h011a5af;
    stim[14] = 25'h0ce1ca0;
    stim[15] = 25'h1b0d6af;
    stim[16] = 25'h19af360;
    stim[17] = 25'h1cd7b63;
    stim[18] = 25'h075492a;
    stim[19] = 25'h094b65a;
    stim[20] = 25'h11f2536;
    stim[21] = 25'h1032687;
    stim[22] = 25'h090d617;
    stim[23] = 25'h06babb3;
    stim[24] = 25'h0404cb1;
    stim[25] = 25'h0b16e24;
    stim[26] = 25'h15e5d17;
    stim[27] = 25'h1336b10;
    stim[28] = 25'h1e8f1d9;
    stim[29] = 25'h06ac9f2;
    stim[30] = 25'h0e9643a;
    stim[31] = 25'h119745d;
    stim[32] = 25'h0b21319;
    stim[33] = 25'h102002d;
    stim[34] = 25'h0f0a2a8;
    stim[35] = 25'h00c4d8d;
    stim[36] = 25'h0a2d04d;
    stim[37] = 25'h0a39e04;
    stim[38] = 25'h129795f;
    stim[39] = 25'h0745174;
    stim[40] = 25'h0ff77a2;
    stim[41] = 25'h0f9697f;
    stim[42] = 25'h0be0e4c;
    stim[43] = 25'h16ca9f8;
    stim[44] = 25'h1a96a02;
    stim[45] = 25'h13e0d19;
    stim[46] = 25'h1609383;
    stim[47] = 25'h0895285;
    stim[48] = 25'h14f6019;
    stim[49] = 25'h1d8d3b2;
    stim[50] = 25'h0c165d0;
    stim[51] = 25'h1abd1ad;
    stim[52] = 25'h1be6f0e;
    stim[53] = 25'h06e36ba;
    stim[54] = 25'h12360a3;
    stim[55] = 25'h0ba3a7f;
    stim[56] = 25'h01bb0ea;
    stim[57] = 25'h1313bae;
    stim[58] = 25'h060f6ea;
    stim[59] = 25'h11e5b48;
    stim[60] = 25'h1289c31;
    stim[61] = 25'h1e68783;
    stim[62] = 25'h120b03f;
    stim[63] = 25'h1c2ddc1;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'hxxxxxx;
      expv[3] = 24'hxxxxxx;
      expv[4] = 24'hd6f67a;
      expv[5] = 24'hd6f67a;
      expv[6] = 24'hd6f67a;
      expv[7] = 24'hd6f67a;
      expv[8] = 24'h6521b2;
      expv[9] = 24'h6521b2;
      expv[10] = 24'h4ef633;
      expv[11] = 24'h46d85c;
      expv[12] = 24'h46d85c;
      expv[13] = 24'h08a074;
      expv[14] = 24'h08a074;
      expv[15] = 24'h08a074;
      expv[16] = 24'h13fb4c;
      expv[17] = 24'h06a126;
      expv[18] = 24'h78e24a;
      expv[19] = 24'h78e24a;
      expv[20] = 24'h78e24a;
      expv[21] = 24'h3a1b20;
      expv[22] = 24'h4f7691;
      expv[23] = 24'h4f7691;
      expv[24] = 24'h4f7691;
      expv[25] = 24'h4f7691;
      expv[26] = 24'h4f7691;
      expv[27] = 24'h0691ce;
      expv[28] = 24'h01a90a;
      expv[29] = 24'h087a5b;
      expv[30] = 24'h087a5b;
      expv[31] = 24'h087a5b;
      expv[32] = 24'h0336b0;
      expv[33] = 24'h0336b0;
      expv[34] = 24'hc57449;
      expv[35] = 24'hc57449;
      expv[36] = 24'hc57449;
      expv[37] = 24'hc57449;
      expv[38] = 24'hc57449;
      expv[39] = 24'h093f24;
      expv[40] = 24'h093f24;
      expv[41] = 24'h093f24;
      expv[42] = 24'h093f24;
      expv[43] = 24'h093f24;
      expv[44] = 24'h005a00;
      expv[45] = 24'h0f63e7;
      expv[46] = 24'h6943b8;
      expv[47] = 24'h0152d4;
      expv[48] = 24'h0152d4;
      expv[49] = 24'h060f45;
      expv[50] = 24'h316b39;
      expv[51] = 24'h316b39;
      expv[52] = 24'h07c060;
      expv[53] = 24'h96c2b6;
      expv[54] = 24'h96c2b6;
      expv[55] = 24'h741c3d;
      expv[56] = 24'h741c3d;
      expv[57] = 24'h741c3d;
      expv[58] = 24'h0a6a12;
      expv[59] = 24'h0a6a12;
      expv[60] = 24'h168620;
      expv[61] = 24'h21761a;
      expv[62] = 24'h088998;
      expv[63] = 24'h07c5dc;
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
