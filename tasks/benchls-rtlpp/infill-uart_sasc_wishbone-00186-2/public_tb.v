// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00186 dut (
    .CLK(clk),
    .RST(in_vec[40:40]),
    .CE(in_vec[39:39]),
    .WE(in_vec[38:38]),
    .SEL(in_vec[37:34]),
    .DATI(in_vec[33:2]),
    .RXD(in_vec[1:1]),
    .CTS(in_vec[0:0]),
    .DATO(out_vec[33:2]),
    .TXD(out_vec[1:1]),
    .RTS(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h155377ad67c;
    stim[1] = 41'h1b0af516428;
    stim[2] = 41'h08cc89f592f;
    stim[3] = 41'h06f6f63f4f1;
    stim[4] = 41'h06d22bef042;
    stim[5] = 41'h06f5a4a84d7;
    stim[6] = 41'h08bf302906f;
    stim[7] = 41'h0630e4d3efa;
    stim[8] = 41'h03bb90341f7;
    stim[9] = 41'h0a719fcc8be;
    stim[10] = 41'h04a35dc17b1;
    stim[11] = 41'h0d998cc366e;
    stim[12] = 41'h03749992682;
    stim[13] = 41'h0a4b31168ba;
    stim[14] = 41'h0e303d165b6;
    stim[15] = 41'h0396f1328cd;
    stim[16] = 41'h0ffc5868fdb;
    stim[17] = 41'h0e6aed14387;
    stim[18] = 41'h0c97fbd814a;
    stim[19] = 41'h0ff2b0a62f5;
    stim[20] = 41'h0e4593e65b6;
    stim[21] = 41'h0b38333b292;
    stim[22] = 41'h09eed093d6e;
    stim[23] = 41'h0fb193a8729;
    stim[24] = 41'h060f312a5aa;
    stim[25] = 41'h08128fc8f9b;
    stim[26] = 41'h06509bf908a;
    stim[27] = 41'h076f1bec78c;
    stim[28] = 41'h0fbf70963d1;
    stim[29] = 41'h0d7ebd54724;
    stim[30] = 41'h06c7285176c;
    stim[31] = 41'h06fc2766557;
    stim[32] = 41'h017cdff54bc;
    stim[33] = 41'h0325cdedbb8;
    stim[34] = 41'h0ac06348c92;
    stim[35] = 41'h0d249947670;
    stim[36] = 41'h0e872249730;
    stim[37] = 41'h0ef002ef783;
    stim[38] = 41'h09d88be52b3;
    stim[39] = 41'h0483eb8c98c;
    stim[40] = 41'h016f75dba38;
    stim[41] = 41'h06ba232420a;
    stim[42] = 41'h01aba7b9f36;
    stim[43] = 41'h0dde2cc3d93;
    stim[44] = 41'h0cfc6449f46;
    stim[45] = 41'h0ba49936de6;
    stim[46] = 41'h08268684e36;
    stim[47] = 41'h16df388c44f;
    stim[48] = 41'h07c44e54227;
    stim[49] = 41'h0ad6343cbdb;
    stim[50] = 41'h073e9603fb0;
    stim[51] = 41'h0dca9ca8fb1;
    stim[52] = 41'h06d5821e770;
    stim[53] = 41'h0adece85d70;
    stim[54] = 41'h04e74806555;
    stim[55] = 41'h0363527e55e;
    stim[56] = 41'h0415e6d05a0;
    stim[57] = 41'h058bf346e8d;
    stim[58] = 41'h032187f772c;
    stim[59] = 41'h0a94805bbf5;
    stim[60] = 41'h0d479271bc8;
    stim[61] = 41'h0ffd421cce3;
    stim[62] = 41'h029ce326f5e;
    stim[63] = 41'h06a9bf3d854;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000xxx;
      expv[2] = 34'h000000xxx;
      expv[3] = 34'h000000001;
      expv[4] = 34'h000000002;
      expv[5] = 34'h000000003;
      expv[6] = 34'h000000xxx;
      expv[7] = 34'h000000002;
      expv[8] = 34'h000000003;
      expv[9] = 34'h000000xxx;
      expv[10] = 34'h000000001;
      expv[11] = 34'h000000xxx;
      expv[12] = 34'h000000002;
      expv[13] = 34'h000cc0xxx;
      expv[14] = 34'h000cc0xxx;
      expv[15] = 34'h000000001;
      expv[16] = 34'h300cc0xxx;
      expv[17] = 34'h3c5840xxx;
      expv[18] = 34'h2ad840xxx;
      expv[19] = 34'h2ad840785;
      expv[20] = 34'h32b080386;
      expv[21] = 34'h05b080386;
      expv[22] = 34'h05b080386;
      expv[23] = 34'h05b080385;
      expv[24] = 34'h000000002;
      expv[25] = 34'h3193801b7;
      expv[26] = 34'h000000002;
      expv[27] = 34'h000000000;
      expv[28] = 34'h3193801b5;
      expv[29] = 34'h3f70801b4;
      expv[30] = 34'h000000000;
      expv[31] = 34'h000000003;
      expv[32] = 34'h000000000;
      expv[33] = 34'h000000000;
      expv[34] = 34'h3f7d401b6;
      expv[35] = 34'h3f7d401b4;
      expv[36] = 34'h3f5940324;
      expv[37] = 34'h071940327;
      expv[38] = 34'h301940327;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000002;
      expv[42] = 34'h000000002;
      expv[43] = 34'h301940383;
      expv[44] = 34'h302cc0382;
      expv[45] = 34'h302cc0382;
      expv[46] = 34'h302cc0382;
      expv[47] = 34'h000000003;
      expv[48] = 34'h000000003;
      expv[49] = 34'h000000787;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000785;
      expv[52] = 34'h000000000;
      expv[53] = 34'h001c807b0;
      expv[54] = 34'h000000001;
      expv[55] = 34'h000000002;
      expv[56] = 34'h000000000;
      expv[57] = 34'h000000001;
      expv[58] = 34'h000000000;
      expv[59] = 34'h001c805b5;
      expv[60] = 34'h001c805b4;
      expv[61] = 34'h0012405b7;
      expv[62] = 34'h000000002;
      expv[63] = 34'h000000000;
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
