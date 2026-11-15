// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139943 dut (
    .MTxClk(clk),
    .Reset(in_vec[32:32]),
    .StateJam(in_vec[31:31]),
    .StateJam_q(in_vec[30:30]),
    .RetryCnt(in_vec[29:26]),
    .NibCnt(in_vec[25:10]),
    .ByteCnt(in_vec[9:0]),
    .RandomEq0(out_vec[1:1]),
    .RandomEqByteCnt(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1787684f8;
    stim[1] = 33'h1336d688a;
    stim[2] = 33'h06cef849b;
    stim[3] = 33'h09c278175;
    stim[4] = 33'h023f76d91;
    stim[5] = 33'h032bb8723;
    stim[6] = 33'h0cbc0e1a0;
    stim[7] = 33'h05dae3e85;
    stim[8] = 33'h0f402c324;
    stim[9] = 33'h0cf3f7514;
    stim[10] = 33'h0dfd18e7e;
    stim[11] = 33'h0141fdd27;
    stim[12] = 33'h0c36b9977;
    stim[13] = 33'h077579c4e;
    stim[14] = 33'h01ae730f8;
    stim[15] = 33'h0b229cf44;
    stim[16] = 33'h0b83032f7;
    stim[17] = 33'h0bb957b76;
    stim[18] = 33'h02afe0441;
    stim[19] = 33'h078665f2d;
    stim[20] = 33'h1075c64bd;
    stim[21] = 33'h052efd78a;
    stim[22] = 33'h099a5d521;
    stim[23] = 33'h0241ce00c;
    stim[24] = 33'h0a50cbf4d;
    stim[25] = 33'h05983a314;
    stim[26] = 33'h099a525c5;
    stim[27] = 33'h08439ea43;
    stim[28] = 33'h046da89d4;
    stim[29] = 33'h0cd824f0f;
    stim[30] = 33'h07f34c7fc;
    stim[31] = 33'h0cecb1d44;
    stim[32] = 33'h0809c8594;
    stim[33] = 33'h0de19a71a;
    stim[34] = 33'h0a7ef504c;
    stim[35] = 33'h0996101c7;
    stim[36] = 33'h0986e3bf3;
    stim[37] = 33'h06c6c5a3a;
    stim[38] = 33'h04b7acd2f;
    stim[39] = 33'h0823a024b;
    stim[40] = 33'h02c6547f0;
    stim[41] = 33'h024d98603;
    stim[42] = 33'h0e8804000;
    stim[43] = 33'h0e0613680;
    stim[44] = 33'h0e006fa9a;
    stim[45] = 33'h06604fd94;
    stim[46] = 33'h08cfb3512;
    stim[47] = 33'h0ea548133;
    stim[48] = 33'h0a0b9f21d;
    stim[49] = 33'h06c66132b;
    stim[50] = 33'h0d7c0324d;
    stim[51] = 33'h0e3d7221b;
    stim[52] = 33'h1aebc433c;
    stim[53] = 33'h0ce7c1658;
    stim[54] = 33'h0936013ce;
    stim[55] = 33'h05473e793;
    stim[56] = 33'h08d846e37;
    stim[57] = 33'h09060bec6;
    stim[58] = 33'h09f8b2153;
    stim[59] = 33'h0c18cf2e0;
    stim[60] = 33'h026e95aa1;
    stim[61] = 33'h0c3cc74bc;
    stim[62] = 33'h0d98f318a;
    stim[63] = 33'h05475fb15;
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
      expv[0] = 2'hx;
      expv[1] = 2'h3;
      expv[2] = 2'h3;
      expv[3] = 2'h3;
      expv[4] = 2'h3;
      expv[5] = 2'h2;
      expv[6] = 2'h3;
      expv[7] = 2'h3;
      expv[8] = 2'h3;
      expv[9] = 2'h3;
      expv[10] = 2'h2;
      expv[11] = 2'h3;
      expv[12] = 2'h3;
      expv[13] = 2'h3;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h2;
      expv[19] = 2'h3;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h3;
      expv[23] = 2'h3;
      expv[24] = 2'h3;
      expv[25] = 2'h3;
      expv[26] = 2'h3;
      expv[27] = 2'h3;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h3;
      expv[31] = 2'h3;
      expv[32] = 2'h3;
      expv[33] = 2'h3;
      expv[34] = 2'h3;
      expv[35] = 2'h3;
      expv[36] = 2'h3;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h3;
      expv[42] = 2'h3;
      expv[43] = 2'h3;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h3;
      expv[49] = 2'h3;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h3;
      expv[54] = 2'h3;
      expv[55] = 2'h3;
      expv[56] = 2'h3;
      expv[57] = 2'h3;
      expv[58] = 2'h3;
      expv[59] = 2'h3;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h3;
      expv[63] = 2'h3;
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
