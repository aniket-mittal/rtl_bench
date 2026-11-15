// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04758 dut (
    .clk(clk),
    .reset_n(in_vec[33:33]),
    .data_in_0(in_vec[32:17]),
    .data_in_1(in_vec[16:1]),
    .data_ready(in_vec[0:0]),
    .u(out_vec[16:1]),
    .pi_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h06cadddee;
    stim[1] = 34'h0f128072b;
    stim[2] = 34'h2925390f6;
    stim[3] = 34'h3ad209411;
    stim[4] = 34'h3a7eea314;
    stim[5] = 34'h222cc8953;
    stim[6] = 34'h24c55fd01;
    stim[7] = 34'h23d44b79b;
    stim[8] = 34'h366cedd71;
    stim[9] = 34'h25cd2f088;
    stim[10] = 34'h3cdafbaec;
    stim[11] = 34'h2d0592c1c;
    stim[12] = 34'h39d85b3d2;
    stim[13] = 34'h242104b98;
    stim[14] = 34'h29e53b5c3;
    stim[15] = 34'h28176ea42;
    stim[16] = 34'h397eca554;
    stim[17] = 34'h34381221e;
    stim[18] = 34'h25f9312ba;
    stim[19] = 34'h2928432e8;
    stim[20] = 34'h29c8d5d2b;
    stim[21] = 34'h2f73f13a7;
    stim[22] = 34'h2ca858d68;
    stim[23] = 34'h3727ad0a4;
    stim[24] = 34'h28ceaed41;
    stim[25] = 34'h2daf36bc2;
    stim[26] = 34'h29b7bb59c;
    stim[27] = 34'h3f2eaed2e;
    stim[28] = 34'h3aaea2233;
    stim[29] = 34'h3c8e635be;
    stim[30] = 34'h328e05891;
    stim[31] = 34'h2b464e74e;
    stim[32] = 34'h2a1218455;
    stim[33] = 34'h2f1cedf6f;
    stim[34] = 34'h33120eeeb;
    stim[35] = 34'h3fe4ead1e;
    stim[36] = 34'h311cfb343;
    stim[37] = 34'h200344e74;
    stim[38] = 34'h2cb002b61;
    stim[39] = 34'h3bf5a1746;
    stim[40] = 34'h389d7c7bb;
    stim[41] = 34'h36e2ff46d;
    stim[42] = 34'h33f1ebf80;
    stim[43] = 34'h2632e6592;
    stim[44] = 34'h36c41bcc0;
    stim[45] = 34'h2e4d9cde9;
    stim[46] = 34'h3be32494f;
    stim[47] = 34'h2e2e0c353;
    stim[48] = 34'h34949336f;
    stim[49] = 34'h264b3a27f;
    stim[50] = 34'h3031b3627;
    stim[51] = 34'h3107dbd98;
    stim[52] = 34'h27ce89f8d;
    stim[53] = 34'h204f02a56;
    stim[54] = 34'h2435338d5;
    stim[55] = 34'h22d1980fe;
    stim[56] = 34'h33f8277a8;
    stim[57] = 34'h247e88c4d;
    stim[58] = 34'h2c7b65554;
    stim[59] = 34'h2ed19696d;
    stim[60] = 34'h23dad0ebe;
    stim[61] = 34'h30a5346e7;
    stim[62] = 34'h28d66b0a9;
    stim[63] = 34'h3a022aecc;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00001;
      expv[4] = 17'h00001;
      expv[5] = 17'h00001;
      expv[6] = 17'h00000;
      expv[7] = 17'h00001;
      expv[8] = 17'h00001;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h07a56;
      expv[13] = 17'h07a56;
      expv[14] = 17'h07a57;
      expv[15] = 17'h172e9;
      expv[16] = 17'h172e9;
      expv[17] = 17'h172e9;
      expv[18] = 17'h172e9;
      expv[19] = 17'h172e9;
      expv[20] = 17'h172e9;
      expv[21] = 17'h172e9;
      expv[22] = 17'h172e9;
      expv[23] = 17'h172e8;
      expv[24] = 17'h172e8;
      expv[25] = 17'h172e8;
      expv[26] = 17'h172e8;
      expv[27] = 17'h172e8;
      expv[28] = 17'h172e8;
      expv[29] = 17'h0aad0;
      expv[30] = 17'h1a362;
      expv[31] = 17'h1a363;
      expv[32] = 17'h1a363;
      expv[33] = 17'h1a363;
      expv[34] = 17'h1a363;
      expv[35] = 17'h1a362;
      expv[36] = 17'h1a362;
      expv[37] = 17'h1a362;
      expv[38] = 17'h1a362;
      expv[39] = 17'h1a362;
      expv[40] = 17'h1a362;
      expv[41] = 17'h0579c;
      expv[42] = 17'h1502e;
      expv[43] = 17'h1502f;
      expv[44] = 17'h1502f;
      expv[45] = 17'h1502f;
      expv[46] = 17'h1502f;
      expv[47] = 17'h1502f;
      expv[48] = 17'h1502e;
      expv[49] = 17'h1502e;
      expv[50] = 17'h1502e;
      expv[51] = 17'h1502e;
      expv[52] = 17'h1502e;
      expv[53] = 17'h1502e;
      expv[54] = 17'h0fffe;
      expv[55] = 17'h0456e;
      expv[56] = 17'h0456f;
      expv[57] = 17'h0456f;
      expv[58] = 17'h0456f;
      expv[59] = 17'h0456f;
      expv[60] = 17'h0456e;
      expv[61] = 17'h0456f;
      expv[62] = 17'h0456f;
      expv[63] = 17'h0456f;
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
