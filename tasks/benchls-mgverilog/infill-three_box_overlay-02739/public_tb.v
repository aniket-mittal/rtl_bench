// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02739 dut (
    .video_on(in_vec[20:20]),
    .pixel_x(in_vec[19:10]),
    .pixel_y(in_vec[9:0]),
    .graph_on(out_vec[8:8]),
    .fig_RGB(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0c4032;
    stim[1] = 21'h17351c;
    stim[2] = 21'h111c8d;
    stim[3] = 21'h09b234;
    stim[4] = 21'h05fe30;
    stim[5] = 21'h14ad07;
    stim[6] = 21'h17d869;
    stim[7] = 21'h045233;
    stim[8] = 21'h19ebd6;
    stim[9] = 21'h101aef;
    stim[10] = 21'h06ed40;
    stim[11] = 21'h04110f;
    stim[12] = 21'h1d006e;
    stim[13] = 21'h08bff1;
    stim[14] = 21'h1df523;
    stim[15] = 21'h072571;
    stim[16] = 21'h0e7df7;
    stim[17] = 21'h0213f8;
    stim[18] = 21'h094c4e;
    stim[19] = 21'h104ed7;
    stim[20] = 21'h13efb4;
    stim[21] = 21'h1c1112;
    stim[22] = 21'h1c5466;
    stim[23] = 21'h0f11b9;
    stim[24] = 21'h1fc465;
    stim[25] = 21'h1536cc;
    stim[26] = 21'h17d988;
    stim[27] = 21'h06e13d;
    stim[28] = 21'h0f743c;
    stim[29] = 21'h0d3cf9;
    stim[30] = 21'h1f073c;
    stim[31] = 21'h0e5ca6;
    stim[32] = 21'h1b629f;
    stim[33] = 21'h09abb6;
    stim[34] = 21'h02a61c;
    stim[35] = 21'h0c1707;
    stim[36] = 21'h097f83;
    stim[37] = 21'h12f6c3;
    stim[38] = 21'h15ea3d;
    stim[39] = 21'h090a2a;
    stim[40] = 21'h07939f;
    stim[41] = 21'h0cc6fd;
    stim[42] = 21'h1807e9;
    stim[43] = 21'h148a6b;
    stim[44] = 21'h1c02c6;
    stim[45] = 21'h1b6162;
    stim[46] = 21'h0a89d0;
    stim[47] = 21'h19d18d;
    stim[48] = 21'h19c8f5;
    stim[49] = 21'h1b6524;
    stim[50] = 21'h0d5fe4;
    stim[51] = 21'h0db4e6;
    stim[52] = 21'h187963;
    stim[53] = 21'h036870;
    stim[54] = 21'h11e476;
    stim[55] = 21'h06b379;
    stim[56] = 21'h1a1172;
    stim[57] = 21'h1465fc;
    stim[58] = 21'h155d0a;
    stim[59] = 21'h069dea;
    stim[60] = 21'h12d007;
    stim[61] = 21'h02b86d;
    stim[62] = 21'h154307;
    stim[63] = 21'h1d594f;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
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
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h100;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h11e;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h11e;
      expv[53] = 9'h100;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h100;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
