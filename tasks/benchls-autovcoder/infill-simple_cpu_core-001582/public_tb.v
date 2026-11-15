// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_001582 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1b2814a99;
    stim[1] = 33'h12b98349a;
    stim[2] = 33'h0cc0739de;
    stim[3] = 33'h0495ec723;
    stim[4] = 33'h0729e788c;
    stim[5] = 33'h03756b4bf;
    stim[6] = 33'h05a5f001e;
    stim[7] = 33'h088cd7fc2;
    stim[8] = 33'h061282c46;
    stim[9] = 33'h0af3cd6a3;
    stim[10] = 33'h0ba0da7ad;
    stim[11] = 33'h0f19a5e80;
    stim[12] = 33'h10246f2f1;
    stim[13] = 33'h0f0bbba28;
    stim[14] = 33'h003e34928;
    stim[15] = 33'h0aa794bcb;
    stim[16] = 33'h0c511b11c;
    stim[17] = 33'h0e232a8d8;
    stim[18] = 33'h03e2d3058;
    stim[19] = 33'h0ae914b4e;
    stim[20] = 33'h0f4e8b873;
    stim[21] = 33'h0265c85c7;
    stim[22] = 33'h0e16b9a7b;
    stim[23] = 33'h05e67b202;
    stim[24] = 33'h0cbba912b;
    stim[25] = 33'h097dd0c34;
    stim[26] = 33'h0fa8a54a3;
    stim[27] = 33'h0daff0ffa;
    stim[28] = 33'h0e033b6d4;
    stim[29] = 33'h09111584b;
    stim[30] = 33'h00c95a684;
    stim[31] = 33'h036e11083;
    stim[32] = 33'h05b75a82f;
    stim[33] = 33'h0466ef3e9;
    stim[34] = 33'h0897bf98d;
    stim[35] = 33'h09bec583f;
    stim[36] = 33'h0c93fbca5;
    stim[37] = 33'h08d6c8d7e;
    stim[38] = 33'h0afef2b65;
    stim[39] = 33'h0a253b972;
    stim[40] = 33'h037860647;
    stim[41] = 33'h0f5b2f2d5;
    stim[42] = 33'h0f6adc3fc;
    stim[43] = 33'h0965ff662;
    stim[44] = 33'h0741a40ef;
    stim[45] = 33'h03f87d095;
    stim[46] = 33'h009724092;
    stim[47] = 33'h085b60c89;
    stim[48] = 33'h0c57024e1;
    stim[49] = 33'h0b43c0afa;
    stim[50] = 33'h017c6fc0e;
    stim[51] = 33'h0141b82a1;
    stim[52] = 33'h039043adc;
    stim[53] = 33'h064859831;
    stim[54] = 33'h0c15c2b43;
    stim[55] = 33'h02c9af3ec;
    stim[56] = 33'h0792f8604;
    stim[57] = 33'h030072e6e;
    stim[58] = 33'h08b63ff7d;
    stim[59] = 33'h0dcce5a70;
    stim[60] = 33'h090637157;
    stim[61] = 33'h037a09355;
    stim[62] = 33'h0a2adc826;
    stim[63] = 33'h0a4f78b72;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxx9a;
      expv[3] = 74'h00000000xxxxxxxxxde;
      expv[4] = 74'h00000000xxxxxxxxxde;
      expv[5] = 74'h00000000000000000de;
      expv[6] = 74'h00000000000000000de;
      expv[7] = 74'h00000000400000001de;
      expv[8] = 74'h00000000000000000c2;
      expv[9] = 74'h00000000000000000c2;
      expv[10] = 74'h00000000000000000c2;
      expv[11] = 74'h00000000000000000c2;
      expv[12] = 74'h00000000800000001c2;
      expv[13] = 74'h00000000000000001f1;
      expv[14] = 74'h0000000000000000028;
      expv[15] = 74'h0000000000000000028;
      expv[16] = 74'h0000000000000000028;
      expv[17] = 74'h0000000000000000028;
      expv[18] = 74'h0000000040000000128;
      expv[19] = 74'h0000000000000000058;
      expv[20] = 74'h0000000000000000058;
      expv[21] = 74'h0000000000000000058;
      expv[22] = 74'h0000000000000000058;
      expv[23] = 74'h0000000080000000158;
      expv[24] = 74'h0000000000000000002;
      expv[25] = 74'h0000000000000000002;
      expv[26] = 74'h0000000000000000002;
      expv[27] = 74'h0000000000000000002;
      expv[28] = 74'h00000000c0000000102;
      expv[29] = 74'h00000000000000000d4;
      expv[30] = 74'h00000000000000000d4;
      expv[31] = 74'h00000000000000000d4;
      expv[32] = 74'h00000000000000000d4;
      expv[33] = 74'h00000001000000001d4;
      expv[34] = 74'h00000000000000000e9;
      expv[35] = 74'h00000000000000000e9;
      expv[36] = 74'h00000000000000000e9;
      expv[37] = 74'h00000000000000000e9;
      expv[38] = 74'h00000001400000001e9;
      expv[39] = 74'h0000000000000000065;
      expv[40] = 74'h0000000000000000065;
      expv[41] = 74'h0000000000000000065;
      expv[42] = 74'h0000000000000000065;
      expv[43] = 74'h0000000180000000165;
      expv[44] = 74'h0000000000000000062;
      expv[45] = 74'h0000000000000000062;
      expv[46] = 74'h0000000000000000062;
      expv[47] = 74'h0000000000000000062;
      expv[48] = 74'h00000001c0000000162;
      expv[49] = 74'h00000000000000000e1;
      expv[50] = 74'h00000000000000000e1;
      expv[51] = 74'h00000000000000000e1;
      expv[52] = 74'h00000000000000000e1;
      expv[53] = 74'h00000002000000001e1;
      expv[54] = 74'h0000000000000000031;
      expv[55] = 74'h0000000000000000031;
      expv[56] = 74'h0000000000000000031;
      expv[57] = 74'h0000000000000000031;
      expv[58] = 74'h0000000240000000131;
      expv[59] = 74'h000000000000000007d;
      expv[60] = 74'h000000000000000007d;
      expv[61] = 74'h000000000000000007d;
      expv[62] = 74'h000000000000000007d;
      expv[63] = 74'h000000028000000017d;
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
