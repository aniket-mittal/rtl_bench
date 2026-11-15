// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09756 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .arg_0(in_vec[32:17]),
    .arg_1(in_vec[16:1]),
    .arg_2(in_vec[0:0]),
    .ret_0(out_vec[33:18]),
    .ret_1(out_vec[17:2]),
    .ret_2(out_vec[1:1]),
    .ret_3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h36fd938ac;
    stim[1] = 34'h34707d63b;
    stim[2] = 34'h1d2917b7d;
    stim[3] = 34'h1a2e1b622;
    stim[4] = 34'h1845dee82;
    stim[5] = 34'h14786b14b;
    stim[6] = 34'h0e4fc2c7f;
    stim[7] = 34'h158527e16;
    stim[8] = 34'h11cddc596;
    stim[9] = 34'h00f0bff37;
    stim[10] = 34'h1f08fe653;
    stim[11] = 34'h11e2cca20;
    stim[12] = 34'h0fcd19249;
    stim[13] = 34'h0466e31a1;
    stim[14] = 34'h12fd20eca;
    stim[15] = 34'h11db741af;
    stim[16] = 34'h0a7c9940d;
    stim[17] = 34'h01e7b2eb2;
    stim[18] = 34'h187635a47;
    stim[19] = 34'h17cc4d4f4;
    stim[20] = 34'h0f8135582;
    stim[21] = 34'h093ca3a87;
    stim[22] = 34'h1cdee094d;
    stim[23] = 34'h04323568f;
    stim[24] = 34'h0ffd6adf4;
    stim[25] = 34'h1a9fff1b5;
    stim[26] = 34'h1f41e28a8;
    stim[27] = 34'h0e6992f6e;
    stim[28] = 34'h08275b5e4;
    stim[29] = 34'h04b777e82;
    stim[30] = 34'h1d8896669;
    stim[31] = 34'h171e45bbf;
    stim[32] = 34'h1180ee408;
    stim[33] = 34'h0b0222910;
    stim[34] = 34'h1e2c47bcf;
    stim[35] = 34'h16056517c;
    stim[36] = 34'h1b1705201;
    stim[37] = 34'h1b960d109;
    stim[38] = 34'h05e5d1eff;
    stim[39] = 34'h0bb96a2d0;
    stim[40] = 34'h027ad48ae;
    stim[41] = 34'h04336e6e3;
    stim[42] = 34'h0507eaa85;
    stim[43] = 34'h1bcd6b994;
    stim[44] = 34'h09441efa2;
    stim[45] = 34'h1d60d9658;
    stim[46] = 34'h1e680cf31;
    stim[47] = 34'h1a736e3a0;
    stim[48] = 34'h1c64c7953;
    stim[49] = 34'h02f71db89;
    stim[50] = 34'h134e2bce7;
    stim[51] = 34'h156b0afe7;
    stim[52] = 34'h19958f5dc;
    stim[53] = 34'h0d945bd54;
    stim[54] = 34'h1f50ef7b3;
    stim[55] = 34'h021bd7257;
    stim[56] = 34'h0a1359a14;
    stim[57] = 34'h06d17a9cf;
    stim[58] = 34'h03a30f821;
    stim[59] = 34'h092aaa7be;
    stim[60] = 34'h1b898a8c3;
    stim[61] = 34'h1081c33e1;
    stim[62] = 34'h1604fbd93;
    stim[63] = 34'h0f46ec8f1;
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
      expv[0] = 34'h2dfb27158;
      expv[1] = 34'h1ac768e0d;
      expv[2] = 34'h3a520f6fa;
      expv[3] = 34'h36c4745c0;
      expv[4] = 34'h3dd0708b8;
      expv[5] = 34'h362968f0c;
      expv[6] = 34'h1c9fa58fd;
      expv[7] = 34'h0fc2eb0a5;
      expv[8] = 34'h38b2e39b8;
      expv[9] = 34'h1fe6c1e14;
      expv[10] = 34'h3e11dcca6;
      expv[11] = 34'h194423c59;
      expv[12] = 34'h1f9a12490;
      expv[13] = 34'h08cde6341;
      expv[14] = 34'h25fa41d96;
      expv[15] = 34'h0835e3b6d;
      expv[16] = 34'h14f912818;
      expv[17] = 34'h25d643cf6;
      expv[18] = 34'h30ec4b48e;
      expv[19] = 34'h1a9eaf989;
      expv[20] = 34'h1f026ab05;
      expv[21] = 34'h12796750d;
      expv[22] = 34'h39bde1298;
      expv[23] = 34'h0ad1c8644;
      expv[24] = 34'h1ffad5be8;
      expv[25] = 34'h1e36b53fd;
      expv[26] = 34'h3e83c5152;
      expv[27] = 34'h1cd325edd;
      expv[28] = 34'h36bc904ea;
      expv[29] = 34'h2fd0496ee;
      expv[30] = 34'h3b110ccd2;
      expv[31] = 34'h2e3cab77c;
      expv[32] = 34'h1c812301d;
      expv[33] = 34'h160445220;
      expv[34] = 34'h3c58af79c;
      expv[35] = 34'h2c0aca2fa;
      expv[36] = 34'h362e2a400;
      expv[37] = 34'h3a21372c0;
      expv[38] = 34'h0bcb83dfc;
      expv[39] = 34'h1772d45a0;
      expv[40] = 34'h2915c4f5a;
      expv[41] = 34'h3cdc4866e;
      expv[42] = 34'h35508a0fe;
      expv[43] = 34'h379ad732a;
      expv[44] = 34'h3df452882;
      expv[45] = 34'h3ac1b2cb0;
      expv[46] = 34'h3cd039e60;
      expv[47] = 34'h1c7434e6d;
      expv[48] = 34'h38c9af2a4;
      expv[49] = 34'h1b7105ee0;
      expv[50] = 34'h379ce69c4;
      expv[51] = 34'h35fcead60;
      expv[52] = 34'h1ebbb32b1;
      expv[53] = 34'h1b28b7aa9;
      expv[54] = 34'h3ea1fef64;
      expv[55] = 34'h0e4ac4378;
      expv[56] = 34'h1426b3429;
      expv[57] = 34'h1539cda2c;
      expv[58] = 34'h3f0407462;
      expv[59] = 34'h14f7d2554;
      expv[60] = 34'h371335184;
      expv[61] = 34'h267c21038;
      expv[62] = 34'h17b26c09d;
      expv[63] = 34'h1e8df91e1;
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
