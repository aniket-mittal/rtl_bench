// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066011 dut (
    .iOSC_28(clk),
    .iERASE(in_vec[8:8]),
    .iPROGRAM(in_vec[7:7]),
    .iVERIFY(in_vec[6:6]),
    .iOK(in_vec[5:5]),
    .iFAIL(in_vec[4:4]),
    .iRESET_N(in_vec[3:3]),
    .p_ready(in_vec[2:2]),
    .WE_CLK(in_vec[1:1]),
    .iFLASH_RY_N(in_vec[0:0]),
    .oFLASH_ADDR(out_vec[30:7]),
    .oFLASH_CMD(out_vec[6:3]),
    .oFLASH_TR(out_vec[2:2]),
    .oREAD_PRO_END(out_vec[1:1]),
    .oVERIFY_TIME(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h177;
    stim[1] = 9'h183;
    stim[2] = 9'h09c;
    stim[3] = 9'h18d;
    stim[4] = 9'h10e;
    stim[5] = 9'h079;
    stim[6] = 9'h0b8;
    stim[7] = 9'h05b;
    stim[8] = 9'h009;
    stim[9] = 9'h05c;
    stim[10] = 9'h14d;
    stim[11] = 9'h14c;
    stim[12] = 9'h0c0;
    stim[13] = 9'h198;
    stim[14] = 9'h078;
    stim[15] = 9'h139;
    stim[16] = 9'h19b;
    stim[17] = 9'h1dc;
    stim[18] = 9'h13e;
    stim[19] = 9'h15a;
    stim[20] = 9'h1bb;
    stim[21] = 9'h0bd;
    stim[22] = 9'h00f;
    stim[23] = 9'h12f;
    stim[24] = 9'h1fc;
    stim[25] = 9'h018;
    stim[26] = 9'h15e;
    stim[27] = 9'h02e;
    stim[28] = 9'h00e;
    stim[29] = 9'h1ec;
    stim[30] = 9'h0ad;
    stim[31] = 9'h0bc;
    stim[32] = 9'h119;
    stim[33] = 9'h0b9;
    stim[34] = 9'h11c;
    stim[35] = 9'h0f8;
    stim[36] = 9'h0dd;
    stim[37] = 9'h0ac;
    stim[38] = 9'h13f;
    stim[39] = 9'h1ca;
    stim[40] = 9'h108;
    stim[41] = 9'h0bf;
    stim[42] = 9'h0cb;
    stim[43] = 9'h0dc;
    stim[44] = 9'h18d;
    stim[45] = 9'h00d;
    stim[46] = 9'h129;
    stim[47] = 9'h038;
    stim[48] = 9'h13b;
    stim[49] = 9'h05e;
    stim[50] = 9'h1cf;
    stim[51] = 9'h058;
    stim[52] = 9'h018;
    stim[53] = 9'h02c;
    stim[54] = 9'h16a;
    stim[55] = 9'h0cd;
    stim[56] = 9'h168;
    stim[57] = 9'h16c;
    stim[58] = 9'h08c;
    stim[59] = 9'h09e;
    stim[60] = 9'h13b;
    stim[61] = 9'h118;
    stim[62] = 9'h07e;
    stim[63] = 9'h04e;
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
      expv[0] = 31'h00000005;
      expv[1] = 31'h00000004;
      expv[2] = 31'h00000004;
      expv[3] = 31'h00000024;
      expv[4] = 31'h00000004;
      expv[5] = 31'h00000015;
      expv[6] = 31'h00000044;
      expv[7] = 31'h00000025;
      expv[8] = 31'h00000040;
      expv[9] = 31'h00000005;
      expv[10] = 31'h00000045;
      expv[11] = 31'h00000005;
      expv[12] = 31'h00000005;
      expv[13] = 31'h00000004;
      expv[14] = 31'h00000005;
      expv[15] = 31'h00000044;
      expv[16] = 31'h00000014;
      expv[17] = 31'h00000005;
      expv[18] = 31'h00000004;
      expv[19] = 31'h00000015;
      expv[20] = 31'h00000004;
      expv[21] = 31'h00000004;
      expv[22] = 31'h00000020;
      expv[23] = 31'h00000004;
      expv[24] = 31'h00000015;
      expv[25] = 31'h00000000;
      expv[26] = 31'h00000005;
      expv[27] = 31'h00000000;
      expv[28] = 31'h00000000;
      expv[29] = 31'h00000005;
      expv[30] = 31'h00000004;
      expv[31] = 31'h00000024;
      expv[32] = 31'h00000024;
      expv[33] = 31'h00000014;
      expv[34] = 31'h00000024;
      expv[35] = 31'h00000015;
      expv[36] = 31'h00000005;
      expv[37] = 31'h00000004;
      expv[38] = 31'h00000024;
      expv[39] = 31'h00000015;
      expv[40] = 31'h00000004;
      expv[41] = 31'h00000014;
      expv[42] = 31'h00000025;
      expv[43] = 31'h00000005;
      expv[44] = 31'h00000004;
      expv[45] = 31'h00000000;
      expv[46] = 31'h00000004;
      expv[47] = 31'h00000010;
      expv[48] = 31'h00000004;
      expv[49] = 31'h00000015;
      expv[50] = 31'h00000045;
      expv[51] = 31'h00000005;
      expv[52] = 31'h00000040;
      expv[53] = 31'h00000000;
      expv[54] = 31'h00000005;
      expv[55] = 31'h00000005;
      expv[56] = 31'h00000005;
      expv[57] = 31'h00000005;
      expv[58] = 31'h00000004;
      expv[59] = 31'h00000024;
      expv[60] = 31'h00000024;
      expv[61] = 31'h00000014;
      expv[62] = 31'h00000015;
      expv[63] = 31'h00000045;
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
