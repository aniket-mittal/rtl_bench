// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031602 dut (
    .advanced_sw(in_vec[24:24]),
    .VGA_HORZ_COORD(in_vec[23:12]),
    .VGA_VERT_COORD(in_vec[11:0]),
    .VGA_Red_Grid(out_vec[11:8]),
    .VGA_Green_Grid(out_vec[7:4]),
    .VGA_Blue_Grid(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h0ef4524;
    stim[1] = 25'h0833c26;
    stim[2] = 25'h17190d3;
    stim[3] = 25'h0c7328e;
    stim[4] = 25'h06d16f2;
    stim[5] = 25'h0f9c9a0;
    stim[6] = 25'h1ca8437;
    stim[7] = 25'h0161381;
    stim[8] = 25'h1daba14;
    stim[9] = 25'h1586ee7;
    stim[10] = 25'h03a4cf1;
    stim[11] = 25'h114c650;
    stim[12] = 25'h08fb4ff;
    stim[13] = 25'h0392da6;
    stim[14] = 25'h0699390;
    stim[15] = 25'h085f7ef;
    stim[16] = 25'h052d53f;
    stim[17] = 25'h01e0805;
    stim[18] = 25'h057a4cd;
    stim[19] = 25'h1ad1fc3;
    stim[20] = 25'h1e49f61;
    stim[21] = 25'h02427e8;
    stim[22] = 25'h0d02d31;
    stim[23] = 25'h0309095;
    stim[24] = 25'h14028f6;
    stim[25] = 25'h0982ba2;
    stim[26] = 25'h1ca6431;
    stim[27] = 25'h0677ce3;
    stim[28] = 25'h1598885;
    stim[29] = 25'h1e5e0a0;
    stim[30] = 25'h03f28bd;
    stim[31] = 25'h1831ab5;
    stim[32] = 25'h194ae04;
    stim[33] = 25'h1294bb8;
    stim[34] = 25'h11f569f;
    stim[35] = 25'h1bcf6df;
    stim[36] = 25'h03b2e1b;
    stim[37] = 25'h0ccd973;
    stim[38] = 25'h02edaf7;
    stim[39] = 25'h1f13154;
    stim[40] = 25'h0ee9211;
    stim[41] = 25'h17d5bc7;
    stim[42] = 25'h181940c;
    stim[43] = 25'h02bcf5c;
    stim[44] = 25'h17a97a8;
    stim[45] = 25'h19a83ff;
    stim[46] = 25'h12dbfd9;
    stim[47] = 25'h15869d0;
    stim[48] = 25'h0eb0e4f;
    stim[49] = 25'h19afc54;
    stim[50] = 25'h1d6eaa2;
    stim[51] = 25'h0d29532;
    stim[52] = 25'h1f7b8f4;
    stim[53] = 25'h1abe9a7;
    stim[54] = 25'h044e023;
    stim[55] = 25'h05bd64f;
    stim[56] = 25'h036ad97;
    stim[57] = 25'h10370bf;
    stim[58] = 25'h09cc2a0;
    stim[59] = 25'h1b20ba7;
    stim[60] = 25'h1033919;
    stim[61] = 25'h12379c7;
    stim[62] = 25'h04d56e5;
    stim[63] = 25'h08b3a06;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
