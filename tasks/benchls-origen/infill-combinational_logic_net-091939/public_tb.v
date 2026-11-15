// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_091939 dut (
    .x00(in_vec[24:24]),
    .x01(in_vec[23:23]),
    .x02(in_vec[22:22]),
    .x03(in_vec[21:21]),
    .x04(in_vec[20:20]),
    .x05(in_vec[19:19]),
    .x06(in_vec[18:18]),
    .x07(in_vec[17:17]),
    .x08(in_vec[16:16]),
    .x09(in_vec[15:15]),
    .x10(in_vec[14:14]),
    .x11(in_vec[13:13]),
    .x12(in_vec[12:12]),
    .x13(in_vec[11:11]),
    .x14(in_vec[10:10]),
    .x15(in_vec[9:9]),
    .x16(in_vec[8:8]),
    .x17(in_vec[7:7]),
    .x18(in_vec[6:6]),
    .x19(in_vec[5:5]),
    .x20(in_vec[4:4]),
    .x21(in_vec[3:3]),
    .x22(in_vec[2:2]),
    .x23(in_vec[1:1]),
    .x24(in_vec[0:0]),
    .z00(out_vec[15:15]),
    .z01(out_vec[14:14]),
    .z02(out_vec[13:13]),
    .z03(out_vec[12:12]),
    .z04(out_vec[11:11]),
    .z05(out_vec[10:10]),
    .z06(out_vec[9:9]),
    .z07(out_vec[8:8]),
    .z08(out_vec[7:7]),
    .z09(out_vec[6:6]),
    .z10(out_vec[5:5]),
    .z11(out_vec[4:4]),
    .z12(out_vec[3:3]),
    .z13(out_vec[2:2]),
    .z14(out_vec[1:1]),
    .z15(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h0c9bbbc;
    stim[1] = 25'h068c904;
    stim[2] = 25'h0f2192c;
    stim[3] = 25'h0cd9af7;
    stim[4] = 25'h024ab05;
    stim[5] = 25'h18a2c46;
    stim[6] = 25'h124d154;
    stim[7] = 25'h0e560ad;
    stim[8] = 25'h1474a75;
    stim[9] = 25'h1ab185c;
    stim[10] = 25'h1fcd302;
    stim[11] = 25'h1de5a18;
    stim[12] = 25'h15cb362;
    stim[13] = 25'h1282931;
    stim[14] = 25'h0e55c52;
    stim[15] = 25'h14957fc;
    stim[16] = 25'h115666b;
    stim[17] = 25'h13aec50;
    stim[18] = 25'h0624109;
    stim[19] = 25'h19949b7;
    stim[20] = 25'h1214fe7;
    stim[21] = 25'h1401128;
    stim[22] = 25'h1f4f8ea;
    stim[23] = 25'h0260eb5;
    stim[24] = 25'h1948bf8;
    stim[25] = 25'h140eddb;
    stim[26] = 25'h0879e26;
    stim[27] = 25'h0b1a8b4;
    stim[28] = 25'h1994aec;
    stim[29] = 25'h09ecdab;
    stim[30] = 25'h00335fa;
    stim[31] = 25'h0596929;
    stim[32] = 25'h11d6181;
    stim[33] = 25'h0f4117c;
    stim[34] = 25'h0f55aee;
    stim[35] = 25'h1eb1d59;
    stim[36] = 25'h039c032;
    stim[37] = 25'h0e60e08;
    stim[38] = 25'h07d7289;
    stim[39] = 25'h0b92df8;
    stim[40] = 25'h0175b87;
    stim[41] = 25'h010b9e3;
    stim[42] = 25'h0777407;
    stim[43] = 25'h1e7c39e;
    stim[44] = 25'h1d9790f;
    stim[45] = 25'h06ed2db;
    stim[46] = 25'h03db63b;
    stim[47] = 25'h1c518bc;
    stim[48] = 25'h0ded94c;
    stim[49] = 25'h143130f;
    stim[50] = 25'h012f3a7;
    stim[51] = 25'h0c3c176;
    stim[52] = 25'h0388925;
    stim[53] = 25'h1cc507e;
    stim[54] = 25'h0ce4b66;
    stim[55] = 25'h0eb008d;
    stim[56] = 25'h1bd8708;
    stim[57] = 25'h09254f8;
    stim[58] = 25'h0875f7f;
    stim[59] = 25'h0022ce3;
    stim[60] = 25'h1f183a9;
    stim[61] = 25'h02d5ac3;
    stim[62] = 25'h1684637;
    stim[63] = 25'h1f0c7fe;
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
      expv[0] = 16'h2200;
      expv[1] = 16'h0000;
      expv[2] = 16'h0200;
      expv[3] = 16'h0200;
      expv[4] = 16'h0000;
      expv[5] = 16'h8000;
      expv[6] = 16'h8000;
      expv[7] = 16'h0200;
      expv[8] = 16'h86a2;
      expv[9] = 16'h8800;
      expv[10] = 16'h8000;
      expv[11] = 16'h8800;
      expv[12] = 16'h8305;
      expv[13] = 16'h8680;
      expv[14] = 16'h0000;
      expv[15] = 16'h93d2;
      expv[16] = 16'h8649;
      expv[17] = 16'h8000;
      expv[18] = 16'h0000;
      expv[19] = 16'h86ab;
      expv[20] = 16'h862b;
      expv[21] = 16'h8340;
      expv[22] = 16'h8345;
      expv[23] = 16'h0200;
      expv[24] = 16'h93c0;
      expv[25] = 16'h8800;
      expv[26] = 16'h0200;
      expv[27] = 16'h0200;
      expv[28] = 16'h8352;
      expv[29] = 16'h0200;
      expv[30] = 16'h2200;
      expv[31] = 16'h0200;
      expv[32] = 16'h8000;
      expv[33] = 16'h2200;
      expv[34] = 16'h0200;
      expv[35] = 16'h8800;
      expv[36] = 16'h0200;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h2200;
      expv[40] = 16'h0000;
      expv[41] = 16'h0200;
      expv[42] = 16'h0000;
      expv[43] = 16'h8800;
      expv[44] = 16'h8000;
      expv[45] = 16'h4000;
      expv[46] = 16'h2200;
      expv[47] = 16'h93d2;
      expv[48] = 16'h0000;
      expv[49] = 16'h8000;
      expv[50] = 16'h0200;
      expv[51] = 16'h0200;
      expv[52] = 16'h0200;
      expv[53] = 16'h93d7;
      expv[54] = 16'h0200;
      expv[55] = 16'h0000;
      expv[56] = 16'h8000;
      expv[57] = 16'h2200;
      expv[58] = 16'h2200;
      expv[59] = 16'h0200;
      expv[60] = 16'h8640;
      expv[61] = 16'h0000;
      expv[62] = 16'h86ab;
      expv[63] = 16'h93d7;
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
