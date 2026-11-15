// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_151628 dut (
    .in(in_vec[10:3]),
    .Cin(in_vec[2:0]),
    .out1(out_vec[63:56]),
    .out2(out_vec[55:48]),
    .out3(out_vec[47:40]),
    .out4(out_vec[39:32]),
    .out5(out_vec[31:24]),
    .out6(out_vec[23:16]),
    .out7(out_vec[15:8]),
    .out8(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h076;
    stim[1] = 11'h5e5;
    stim[2] = 11'h3a2;
    stim[3] = 11'h650;
    stim[4] = 11'h730;
    stim[5] = 11'h0a6;
    stim[6] = 11'h404;
    stim[7] = 11'h703;
    stim[8] = 11'h7be;
    stim[9] = 11'h0a1;
    stim[10] = 11'h316;
    stim[11] = 11'h49a;
    stim[12] = 11'h0ae;
    stim[13] = 11'h040;
    stim[14] = 11'h24e;
    stim[15] = 11'h0d8;
    stim[16] = 11'h5d2;
    stim[17] = 11'h731;
    stim[18] = 11'h766;
    stim[19] = 11'h0a1;
    stim[20] = 11'h116;
    stim[21] = 11'h22f;
    stim[22] = 11'h5c7;
    stim[23] = 11'h073;
    stim[24] = 11'h095;
    stim[25] = 11'h37c;
    stim[26] = 11'h0d7;
    stim[27] = 11'h663;
    stim[28] = 11'h100;
    stim[29] = 11'h6a4;
    stim[30] = 11'h301;
    stim[31] = 11'h181;
    stim[32] = 11'h05b;
    stim[33] = 11'h3cf;
    stim[34] = 11'h71f;
    stim[35] = 11'h381;
    stim[36] = 11'h6f0;
    stim[37] = 11'h5e3;
    stim[38] = 11'h7d5;
    stim[39] = 11'h67a;
    stim[40] = 11'h58a;
    stim[41] = 11'h2cd;
    stim[42] = 11'h042;
    stim[43] = 11'h7e2;
    stim[44] = 11'h593;
    stim[45] = 11'h27f;
    stim[46] = 11'h70c;
    stim[47] = 11'h358;
    stim[48] = 11'h2f5;
    stim[49] = 11'h0fb;
    stim[50] = 11'h047;
    stim[51] = 11'h034;
    stim[52] = 11'h2dd;
    stim[53] = 11'h00e;
    stim[54] = 11'h03d;
    stim[55] = 11'h09b;
    stim[56] = 11'h6d8;
    stim[57] = 11'h310;
    stim[58] = 11'h6da;
    stim[59] = 11'h274;
    stim[60] = 11'h39f;
    stim[61] = 11'h123;
    stim[62] = 11'h0a1;
    stim[63] = 11'h1f7;
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
      expv[0] = 64'h0000000000000e00;
      expv[1] = 64'h0000000000bc0000;
      expv[2] = 64'h0000740000000000;
      expv[3] = 64'hca00000000000000;
      expv[4] = 64'he600000000000000;
      expv[5] = 64'h0000000000001400;
      expv[6] = 64'h0000000080000000;
      expv[7] = 64'h000000e000000000;
      expv[8] = 64'h000000000000f700;
      expv[9] = 64'h0014000000000000;
      expv[10] = 64'h0000000000006200;
      expv[11] = 64'h0000930000000000;
      expv[12] = 64'h0000000000001500;
      expv[13] = 64'h0800000000000000;
      expv[14] = 64'h0000000000004900;
      expv[15] = 64'h1b00000000000000;
      expv[16] = 64'h0000ba0000000000;
      expv[17] = 64'h00e6000000000000;
      expv[18] = 64'h000000000000ec00;
      expv[19] = 64'h0014000000000000;
      expv[20] = 64'h0000000000002200;
      expv[21] = 64'h0000000000000045;
      expv[22] = 64'h00000000000000b8;
      expv[23] = 64'h0000000e00000000;
      expv[24] = 64'h0000000000120000;
      expv[25] = 64'h000000006f000000;
      expv[26] = 64'h000000000000001a;
      expv[27] = 64'h000000cc00000000;
      expv[28] = 64'h2000000000000000;
      expv[29] = 64'h00000000d4000000;
      expv[30] = 64'h0060000000000000;
      expv[31] = 64'h0030000000000000;
      expv[32] = 64'h0000000b00000000;
      expv[33] = 64'h0000000000000079;
      expv[34] = 64'h00000000000000e3;
      expv[35] = 64'h0070000000000000;
      expv[36] = 64'hde00000000000000;
      expv[37] = 64'h000000bc00000000;
      expv[38] = 64'h0000000000fa0000;
      expv[39] = 64'h0000cf0000000000;
      expv[40] = 64'h0000b10000000000;
      expv[41] = 64'h0000000000590000;
      expv[42] = 64'h0000080000000000;
      expv[43] = 64'h0000fc0000000000;
      expv[44] = 64'h000000b200000000;
      expv[45] = 64'h000000000000004f;
      expv[46] = 64'h00000000e1000000;
      expv[47] = 64'h6b00000000000000;
      expv[48] = 64'h00000000005e0000;
      expv[49] = 64'h0000001f00000000;
      expv[50] = 64'h0000000000000008;
      expv[51] = 64'h0000000006000000;
      expv[52] = 64'h00000000005b0000;
      expv[53] = 64'h0000000000000100;
      expv[54] = 64'h0000000000070000;
      expv[55] = 64'h0000001300000000;
      expv[56] = 64'hdb00000000000000;
      expv[57] = 64'h6200000000000000;
      expv[58] = 64'h0000db0000000000;
      expv[59] = 64'h000000004e000000;
      expv[60] = 64'h0000000000000073;
      expv[61] = 64'h0000002400000000;
      expv[62] = 64'h0014000000000000;
      expv[63] = 64'h000000000000003e;
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
