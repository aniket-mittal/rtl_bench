// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04303 dut (
    .clk(clk),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .y(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h1dfc;
    stim[1] = 16'hf534;
    stim[2] = 16'hb75b;
    stim[3] = 16'h210c;
    stim[4] = 16'he9cd;
    stim[5] = 16'hcc95;
    stim[6] = 16'h2a5b;
    stim[7] = 16'h0e62;
    stim[8] = 16'hbbe5;
    stim[9] = 16'h9d39;
    stim[10] = 16'h87a0;
    stim[11] = 16'h71c1;
    stim[12] = 16'hec21;
    stim[13] = 16'h4e5b;
    stim[14] = 16'h71ab;
    stim[15] = 16'h9125;
    stim[16] = 16'h0f40;
    stim[17] = 16'h51ff;
    stim[18] = 16'h8447;
    stim[19] = 16'h4173;
    stim[20] = 16'hd7bd;
    stim[21] = 16'h8a77;
    stim[22] = 16'h7daf;
    stim[23] = 16'h187d;
    stim[24] = 16'hd641;
    stim[25] = 16'hfa83;
    stim[26] = 16'hf7ba;
    stim[27] = 16'h8634;
    stim[28] = 16'h176a;
    stim[29] = 16'h2292;
    stim[30] = 16'h3d44;
    stim[31] = 16'hcfd7;
    stim[32] = 16'hde9b;
    stim[33] = 16'h92fb;
    stim[34] = 16'h1339;
    stim[35] = 16'hfcaf;
    stim[36] = 16'h3fe9;
    stim[37] = 16'hdb21;
    stim[38] = 16'ha6ef;
    stim[39] = 16'h7a75;
    stim[40] = 16'h3122;
    stim[41] = 16'ha670;
    stim[42] = 16'hb1f5;
    stim[43] = 16'h6514;
    stim[44] = 16'h4347;
    stim[45] = 16'h2dd2;
    stim[46] = 16'hee33;
    stim[47] = 16'h0d1b;
    stim[48] = 16'h7e92;
    stim[49] = 16'haee0;
    stim[50] = 16'hcf03;
    stim[51] = 16'h80e0;
    stim[52] = 16'hd376;
    stim[53] = 16'h8b94;
    stim[54] = 16'h4274;
    stim[55] = 16'heba7;
    stim[56] = 16'ha581;
    stim[57] = 16'h5ba5;
    stim[58] = 16'h6aef;
    stim[59] = 16'h483d;
    stim[60] = 16'hcf17;
    stim[61] = 16'h21b2;
    stim[62] = 16'h1607;
    stim[63] = 16'hc57c;
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
      expv[1] = 9'h119;
      expv[2] = 9'h129;
      expv[3] = 9'h112;
      expv[4] = 9'h02d;
      expv[5] = 9'h1b6;
      expv[6] = 9'h161;
      expv[7] = 9'h085;
      expv[8] = 9'h070;
      expv[9] = 9'h1a0;
      expv[10] = 9'h0d6;
      expv[11] = 9'h127;
      expv[12] = 9'h132;
      expv[13] = 9'h10d;
      expv[14] = 9'h0a9;
      expv[15] = 9'h11c;
      expv[16] = 9'h0b6;
      expv[17] = 9'h04f;
      expv[18] = 9'h150;
      expv[19] = 9'h0cb;
      expv[20] = 9'h0b4;
      expv[21] = 9'h194;
      expv[22] = 9'h101;
      expv[23] = 9'h12c;
      expv[24] = 9'h095;
      expv[25] = 9'h117;
      expv[26] = 9'h17d;
      expv[27] = 9'h1b1;
      expv[28] = 9'h0ba;
      expv[29] = 9'h081;
      expv[30] = 9'h0b4;
      expv[31] = 9'h081;
      expv[32] = 9'h1a6;
      expv[33] = 9'h179;
      expv[34] = 9'h18d;
      expv[35] = 9'h04c;
      expv[36] = 9'h1ab;
      expv[37] = 9'h128;
      expv[38] = 9'h0fc;
      expv[39] = 9'h195;
      expv[40] = 9'h0ef;
      expv[41] = 9'h053;
      expv[42] = 9'h116;
      expv[43] = 9'h1a6;
      expv[44] = 9'h079;
      expv[45] = 9'h08a;
      expv[46] = 9'h0ff;
      expv[47] = 9'h121;
      expv[48] = 9'h028;
      expv[49] = 9'h110;
      expv[50] = 9'h18e;
      expv[51] = 9'h0d2;
      expv[52] = 9'h160;
      expv[53] = 9'h149;
      expv[54] = 9'h11f;
      expv[55] = 9'h0b6;
      expv[56] = 9'h192;
      expv[57] = 9'h126;
      expv[58] = 9'h100;
      expv[59] = 9'h159;
      expv[60] = 9'h085;
      expv[61] = 9'h0e6;
      expv[62] = 9'h0d3;
      expv[63] = 9'h01d;
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
