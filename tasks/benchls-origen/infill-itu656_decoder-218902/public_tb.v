// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_218902 dut (
    .iCLK_27(clk),
    .iRST_N(in_vec[10:10]),
    .iSkip(in_vec[9:9]),
    .iSwap_CbCr(in_vec[8:8]),
    .iTD_DATA(in_vec[7:0]),
    .oYCbCr(out_vec[68:53]),
    .oTV_X(out_vec[52:43]),
    .oTV_Y(out_vec[42:33]),
    .oTV_Cont(out_vec[32:1]),
    .oDVAL(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h194;
    stim[1] = 11'h3de;
    stim[2] = 11'h5eb;
    stim[3] = 11'h464;
    stim[4] = 11'h4e8;
    stim[5] = 11'h10e;
    stim[6] = 11'h7ec;
    stim[7] = 11'h717;
    stim[8] = 11'h5b8;
    stim[9] = 11'h5a3;
    stim[10] = 11'h4e0;
    stim[11] = 11'h694;
    stim[12] = 11'h62c;
    stim[13] = 11'h725;
    stim[14] = 11'h5d0;
    stim[15] = 11'h411;
    stim[16] = 11'h412;
    stim[17] = 11'h784;
    stim[18] = 11'h60a;
    stim[19] = 11'h5e0;
    stim[20] = 11'h6bd;
    stim[21] = 11'h515;
    stim[22] = 11'h30c;
    stim[23] = 11'h544;
    stim[24] = 11'h79c;
    stim[25] = 11'h5f5;
    stim[26] = 11'h5ad;
    stim[27] = 11'h4eb;
    stim[28] = 11'h468;
    stim[29] = 11'h6c4;
    stim[30] = 11'h775;
    stim[31] = 11'h432;
    stim[32] = 11'h53d;
    stim[33] = 11'h4ec;
    stim[34] = 11'h7b5;
    stim[35] = 11'h4f4;
    stim[36] = 11'h494;
    stim[37] = 11'h4e7;
    stim[38] = 11'h790;
    stim[39] = 11'h591;
    stim[40] = 11'h5d8;
    stim[41] = 11'h77e;
    stim[42] = 11'h604;
    stim[43] = 11'h414;
    stim[44] = 11'h6b5;
    stim[45] = 11'h70a;
    stim[46] = 11'h5e1;
    stim[47] = 11'h7cd;
    stim[48] = 11'h51b;
    stim[49] = 11'h6c2;
    stim[50] = 11'h4a2;
    stim[51] = 11'h7e0;
    stim[52] = 11'h6cd;
    stim[53] = 11'h6ea;
    stim[54] = 11'h6a0;
    stim[55] = 11'h41b;
    stim[56] = 11'h65d;
    stim[57] = 11'h779;
    stim[58] = 11'h500;
    stim[59] = 11'h547;
    stim[60] = 11'h440;
    stim[61] = 11'h5de;
    stim[62] = 11'h491;
    stim[63] = 11'h6e9;
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
      expv[0] = 69'h000000000000000000;
      expv[1] = 69'h000000000000000000;
      expv[2] = 69'h000000000000000000;
      expv[3] = 69'h000000000000000002;
      expv[4] = 69'h000000000000000004;
      expv[5] = 69'h000000000000000000;
      expv[6] = 69'h000000000000000000;
      expv[7] = 69'h000000000000000002;
      expv[8] = 69'h000000000000000004;
      expv[9] = 69'h000000000000000006;
      expv[10] = 69'h000000000000000008;
      expv[11] = 69'h00000000000000000a;
      expv[12] = 69'h00000000000000000c;
      expv[13] = 69'h00000000000000000e;
      expv[14] = 69'h000000000000000010;
      expv[15] = 69'h000000000000000012;
      expv[16] = 69'h000000000000000014;
      expv[17] = 69'h000000000000000016;
      expv[18] = 69'h000000000000000018;
      expv[19] = 69'h00000000000000001a;
      expv[20] = 69'h00000000000000001c;
      expv[21] = 69'h00000000000000001e;
      expv[22] = 69'h000000000000000000;
      expv[23] = 69'h000000000000000000;
      expv[24] = 69'h000000000000000002;
      expv[25] = 69'h000000000000000004;
      expv[26] = 69'h000000000000000006;
      expv[27] = 69'h000000000000000008;
      expv[28] = 69'h00000000000000000a;
      expv[29] = 69'h00000000000000000c;
      expv[30] = 69'h00000000000000000e;
      expv[31] = 69'h000000000000000010;
      expv[32] = 69'h000000000000000012;
      expv[33] = 69'h000000000000000014;
      expv[34] = 69'h000000000000000016;
      expv[35] = 69'h000000000000000018;
      expv[36] = 69'h00000000000000001a;
      expv[37] = 69'h00000000000000001c;
      expv[38] = 69'h00000000000000001e;
      expv[39] = 69'h000000000000000020;
      expv[40] = 69'h000000000000000022;
      expv[41] = 69'h000000000000000024;
      expv[42] = 69'h000000000000000026;
      expv[43] = 69'h000000000000000028;
      expv[44] = 69'h00000000000000002a;
      expv[45] = 69'h00000000000000002c;
      expv[46] = 69'h00000000000000002e;
      expv[47] = 69'h000000000000000030;
      expv[48] = 69'h000000000000000032;
      expv[49] = 69'h000000000000000034;
      expv[50] = 69'h000000000000000036;
      expv[51] = 69'h000000000000000038;
      expv[52] = 69'h00000000000000003a;
      expv[53] = 69'h00000000000000003c;
      expv[54] = 69'h00000000000000003e;
      expv[55] = 69'h000000000000000040;
      expv[56] = 69'h000000000000000042;
      expv[57] = 69'h000000000000000044;
      expv[58] = 69'h000000000000000046;
      expv[59] = 69'h000000000000000048;
      expv[60] = 69'h00000000000000004a;
      expv[61] = 69'h00000000000000004c;
      expv[62] = 69'h00000000000000004e;
      expv[63] = 69'h000000000000000050;
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
