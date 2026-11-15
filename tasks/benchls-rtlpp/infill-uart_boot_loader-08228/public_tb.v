// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08228 dut (
    .clock(clk),
    .reset(in_vec[12:12]),
    .Read(in_vec[11:11]),
    .Write(in_vec[10:10]),
    .DataIn(in_vec[9:1]),
    .RxD(in_vec[0:0]),
    .DataOut(out_vec[71:55]),
    .Ack(out_vec[54:54]),
    .DataReady(out_vec[53:53]),
    .BootResetCPU(out_vec[52:52]),
    .BootWriteMem(out_vec[51:51]),
    .BootAddr(out_vec[50:33]),
    .BootData(out_vec[32:1]),
    .TxD(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1cbf;
    stim[1] = 13'h1f93;
    stim[2] = 13'h09cf;
    stim[3] = 13'h0a6c;
    stim[4] = 13'h072b;
    stim[5] = 13'h057e;
    stim[6] = 13'h0e35;
    stim[7] = 13'h0eef;
    stim[8] = 13'h08c6;
    stim[9] = 13'h054f;
    stim[10] = 13'h0c7f;
    stim[11] = 13'h0946;
    stim[12] = 13'h0268;
    stim[13] = 13'h0ad4;
    stim[14] = 13'h0ca4;
    stim[15] = 13'h0985;
    stim[16] = 13'h0ecd;
    stim[17] = 13'h04dd;
    stim[18] = 13'h1817;
    stim[19] = 13'h03ba;
    stim[20] = 13'h0d79;
    stim[21] = 13'h09ed;
    stim[22] = 13'h0c47;
    stim[23] = 13'h0fac;
    stim[24] = 13'h0892;
    stim[25] = 13'h06f4;
    stim[26] = 13'h00f3;
    stim[27] = 13'h0ba6;
    stim[28] = 13'h0ae3;
    stim[29] = 13'h0c15;
    stim[30] = 13'h0441;
    stim[31] = 13'h0230;
    stim[32] = 13'h0cce;
    stim[33] = 13'h04e1;
    stim[34] = 13'h0d13;
    stim[35] = 13'h0cd4;
    stim[36] = 13'h0a6b;
    stim[37] = 13'h0b93;
    stim[38] = 13'h0f18;
    stim[39] = 13'h073c;
    stim[40] = 13'h068d;
    stim[41] = 13'h0e29;
    stim[42] = 13'h0471;
    stim[43] = 13'h08ea;
    stim[44] = 13'h066f;
    stim[45] = 13'h06a9;
    stim[46] = 13'h04b2;
    stim[47] = 13'h0484;
    stim[48] = 13'h0c34;
    stim[49] = 13'h007e;
    stim[50] = 13'h04df;
    stim[51] = 13'h0820;
    stim[52] = 13'h0db3;
    stim[53] = 13'h078e;
    stim[54] = 13'h02dd;
    stim[55] = 13'h1a3a;
    stim[56] = 13'h02b1;
    stim[57] = 13'h07e9;
    stim[58] = 13'h08e3;
    stim[59] = 13'h012d;
    stim[60] = 13'h0d1b;
    stim[61] = 13'h028d;
    stim[62] = 13'h009a;
    stim[63] = 13'h017d;
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
      expv[0] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 72'h00000000000000000x;
      expv[2] = 72'h00000000000000000x;
      expv[3] = 72'h00002000000000000x;
      expv[4] = 72'h0000e000000000000x;
      expv[5] = 72'h0000e000000000000x;
      expv[6] = 72'h0000e000000000000x;
      expv[7] = 72'h0000e000000000000x;
      expv[8] = 72'h0000e000000000000x;
      expv[9] = 72'h0000e000000000000x;
      expv[10] = 72'h0000e000000000000x;
      expv[11] = 72'h0000e000000000000x;
      expv[12] = 72'h0000e000000000000x;
      expv[13] = 72'h0000a000000000000x;
      expv[14] = 72'h0000a000000000000x;
      expv[15] = 72'h00006000000000000x;
      expv[16] = 72'h00006000000000000x;
      expv[17] = 72'h00006000000000000x;
      expv[18] = 72'h00006000000000000x;
      expv[19] = 72'h00000000000000000x;
      expv[20] = 72'h00002000000000000x;
      expv[21] = 72'h00002000000000000x;
      expv[22] = 72'h00006000000000000x;
      expv[23] = 72'h00006000000000000x;
      expv[24] = 72'h00006000000000000x;
      expv[25] = 72'h00006000000000000x;
      expv[26] = 72'h00006000000000000x;
      expv[27] = 72'h00002000000000000x;
      expv[28] = 72'h00002000000000000x;
      expv[29] = 72'h00006000000000000x;
      expv[30] = 72'h00006000000000000x;
      expv[31] = 72'h00006000000000000x;
      expv[32] = 72'h00002000000000000x;
      expv[33] = 72'h00002000000000000x;
      expv[34] = 72'h00006000000000000x;
      expv[35] = 72'h00006000000000000x;
      expv[36] = 72'h00006000000000000x;
      expv[37] = 72'h00006000000000000x;
      expv[38] = 72'h00006000000000000x;
      expv[39] = 72'h00006000000000000x;
      expv[40] = 72'h00006000000000000x;
      expv[41] = 72'h00006000000000000x;
      expv[42] = 72'h00006000000000000x;
      expv[43] = 72'h00006000000000000x;
      expv[44] = 72'h00006000000000000x;
      expv[45] = 72'h00006000000000000x;
      expv[46] = 72'h00006000000000000x;
      expv[47] = 72'h00006000000000000x;
      expv[48] = 72'h00006000000000000x;
      expv[49] = 72'h00006000000000000x;
      expv[50] = 72'h00002000000000000x;
      expv[51] = 72'h00002000000000000x;
      expv[52] = 72'h00006000000000000x;
      expv[53] = 72'h00006000000000000x;
      expv[54] = 72'h00006000000000000x;
      expv[55] = 72'h00002000000000000x;
      expv[56] = 72'h00000000000000000x;
      expv[57] = 72'h00002000000000000x;
      expv[58] = 72'h00002000000000000x;
      expv[59] = 72'h00006000000000000x;
      expv[60] = 72'h00002000000000000x;
      expv[61] = 72'h00002000000000000x;
      expv[62] = 72'h00006000000000000x;
      expv[63] = 72'h00002000000000000x;
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
