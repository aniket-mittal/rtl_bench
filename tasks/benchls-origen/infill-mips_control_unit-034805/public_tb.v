// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034805 dut (
    .zero(in_vec[12:12]),
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .alusrcb(out_vec[9:9]),
    .writereg(out_vec[8:8]),
    .branch(out_vec[7:7]),
    .jump(out_vec[6:6]),
    .memtoreg(out_vec[5:5]),
    .regdes(out_vec[4:4]),
    .writemem(out_vec[3:3]),
    .aluc(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h020e;
    stim[1] = 13'h0aba;
    stim[2] = 13'h1b59;
    stim[3] = 13'h1b9e;
    stim[4] = 13'h00fc;
    stim[5] = 13'h1772;
    stim[6] = 13'h16be;
    stim[7] = 13'h0100;
    stim[8] = 13'h0202;
    stim[9] = 13'h068a;
    stim[10] = 13'h0119;
    stim[11] = 13'h0907;
    stim[12] = 13'h0023;
    stim[13] = 13'h1e57;
    stim[14] = 13'h15f6;
    stim[15] = 13'h02c9;
    stim[16] = 13'h12d9;
    stim[17] = 13'h17f9;
    stim[18] = 13'h0f2a;
    stim[19] = 13'h0d11;
    stim[20] = 13'h077c;
    stim[21] = 13'h1293;
    stim[22] = 13'h1442;
    stim[23] = 13'h0013;
    stim[24] = 13'h19ac;
    stim[25] = 13'h03ff;
    stim[26] = 13'h064b;
    stim[27] = 13'h05fb;
    stim[28] = 13'h034e;
    stim[29] = 13'h1fde;
    stim[30] = 13'h159b;
    stim[31] = 13'h0d44;
    stim[32] = 13'h1cde;
    stim[33] = 13'h1e18;
    stim[34] = 13'h1943;
    stim[35] = 13'h1060;
    stim[36] = 13'h0d31;
    stim[37] = 13'h0ead;
    stim[38] = 13'h078d;
    stim[39] = 13'h1fd7;
    stim[40] = 13'h09f5;
    stim[41] = 13'h1456;
    stim[42] = 13'h1971;
    stim[43] = 13'h193b;
    stim[44] = 13'h17c2;
    stim[45] = 13'h1f71;
    stim[46] = 13'h17e6;
    stim[47] = 13'h1102;
    stim[48] = 13'h1362;
    stim[49] = 13'h06bf;
    stim[50] = 13'h17b8;
    stim[51] = 13'h124a;
    stim[52] = 13'h1696;
    stim[53] = 13'h187c;
    stim[54] = 13'h1691;
    stim[55] = 13'h1a54;
    stim[56] = 13'h1cdc;
    stim[57] = 13'h1d7a;
    stim[58] = 13'h1a12;
    stim[59] = 13'h1655;
    stim[60] = 13'h1b9b;
    stim[61] = 13'h145c;
    stim[62] = 13'h084a;
    stim[63] = 13'h163c;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h006;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h006;
      expv[11] = 10'h000;
      expv[12] = 10'h100;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h100;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h086;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
