// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_054778 dut (
    .clk(clk),
    .regWrite(in_vec[48:48]),
    .reset(in_vec[47:47]),
    .regA(in_vec[46:42]),
    .regB(in_vec[41:37]),
    .writeRegister(in_vec[36:32]),
    .writeData(in_vec[31:0]),
    .outA(out_vec[63:32]),
    .outB(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h18acc1b5e5bce;
    stim[1] = 49'h09bfc4d02153a;
    stim[2] = 49'h042e2b5014c2c;
    stim[3] = 49'h10f0204c7396e;
    stim[4] = 49'h03837566cec19;
    stim[5] = 49'h121d3c8887e11;
    stim[6] = 49'h042f99e5944a1;
    stim[7] = 49'h1576f279310be;
    stim[8] = 49'h157f75a0aed50;
    stim[9] = 49'h02819fccd8030;
    stim[10] = 49'h1132ce2ff8148;
    stim[11] = 49'h00da31a40aa63;
    stim[12] = 49'h00f3337064a98;
    stim[13] = 49'h00a14f8176ec2;
    stim[14] = 49'h00045f080757e;
    stim[15] = 49'h002832f53689d;
    stim[16] = 49'h00b3be8a4f5a2;
    stim[17] = 49'h040fd3a910d79;
    stim[18] = 49'h17c1120483b44;
    stim[19] = 49'h17a9339e0c888;
    stim[20] = 49'h05477f7f9dac5;
    stim[21] = 49'h1665f325465e3;
    stim[22] = 49'h11424c95b97a6;
    stim[23] = 49'h10f447ae2263c;
    stim[24] = 49'h05d177bf922ac;
    stim[25] = 49'h17008caea67b3;
    stim[26] = 49'h1444e381e3931;
    stim[27] = 49'h02ff7550e1bba;
    stim[28] = 49'h07dcf1d88779d;
    stim[29] = 49'h11b4dbf1370a4;
    stim[30] = 49'h1443d5fcf66a1;
    stim[31] = 49'h02bb34640bf31;
    stim[32] = 49'h03b94a4f07901;
    stim[33] = 49'h1210bf1f58d6c;
    stim[34] = 49'h0728ea0cb07d8;
    stim[35] = 49'h032f334e9db9f;
    stim[36] = 49'h00b868bfbbc3d;
    stim[37] = 49'h01db9753e28c8;
    stim[38] = 49'h00d5bffc8a826;
    stim[39] = 49'h063bd025dede4;
    stim[40] = 49'h0477d4fd1b27b;
    stim[41] = 49'h061caae48e74a;
    stim[42] = 49'h01d90cd216ab9;
    stim[43] = 49'h0779a3d0cdcb3;
    stim[44] = 49'h07d20019c9e50;
    stim[45] = 49'h02437186a8e09;
    stim[46] = 49'h0087b1f8b3474;
    stim[47] = 49'h00fbe284d1442;
    stim[48] = 49'h0520239b0a5e7;
    stim[49] = 49'h002c8cefa7408;
    stim[50] = 49'h02cf3a282cecf;
    stim[51] = 49'h12b51c9ac8e6c;
    stim[52] = 49'h04514d0e29cb5;
    stim[53] = 49'h10f697dff318d;
    stim[54] = 49'h1041d43507f1a;
    stim[55] = 49'h1312907c02e01;
    stim[56] = 49'h044109d1d5fd7;
    stim[57] = 49'h16c3186ec79e0;
    stim[58] = 49'h1012d9c2b2171;
    stim[59] = 49'h07eaa6498e743;
    stim[60] = 49'h07cdfdaaaa122;
    stim[61] = 49'h1192654c53286;
    stim[62] = 49'h0297483348a69;
    stim[63] = 49'h0413784b072f9;
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
      expv[0] = 64'h0000000000004000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000010000008000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000004000000000;
      expv[5] = 64'h0000000100000040;
      expv[6] = 64'h0000010000008000;
      expv[7] = 64'h0000200000000000;
      expv[8] = 64'h0000200000000000;
      expv[9] = 64'h0000000400000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000020;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h04c7396e00000100;
      expv[14] = 64'h0000000004c7396e;
      expv[15] = 64'h0000000000001000;
      expv[16] = 64'h04c7396e00000000;
      expv[17] = 64'h0000010000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000001000;
      expv[20] = 64'h0000200000000000;
      expv[21] = 64'h0000000000000400;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h5a0aed5000000001;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h20483b4404c7396e;
      expv[27] = 64'h00000008325465e3;
      expv[28] = 64'h325465e3381e3931;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h20483b4400000000;
      expv[31] = 64'h000000045fcf66a1;
      expv[32] = 64'h381e393100000000;
      expv[33] = 64'hcaea67b3caea67b3;
      expv[34] = 64'h0000000000001000;
      expv[35] = 64'he2ff81485a0aed50;
      expv[36] = 64'h04c7396e00000000;
      expv[37] = 64'h00000000bf1370a4;
      expv[38] = 64'h0000000000000004;
      expv[39] = 64'h000000005fcf66a1;
      expv[40] = 64'h20483b4400000000;
      expv[41] = 64'h00000000381e3931;
      expv[42] = 64'h00000000e2ff8148;
      expv[43] = 64'h5fcf66a100000000;
      expv[44] = 64'h325465e300000002;
      expv[45] = 64'h0000000200000000;
      expv[46] = 64'h04c7396e00000000;
      expv[47] = 64'h000000005fcf66a1;
      expv[48] = 64'h0000100000000100;
      expv[49] = 64'h0000000000004000;
      expv[50] = 64'hf1f58d6c00000000;
      expv[51] = 64'h0000000400000000;
      expv[52] = 64'hc9ac8e6ccaea67b3;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'he2ff81487dff318d;
      expv[56] = 64'hc9ac8e6c00000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000007c02e01;
      expv[59] = 64'h325465e300002000;
      expv[60] = 64'h325465e300000000;
      expv[61] = 64'h0000000007c02e01;
      expv[62] = 64'h00000004f1f58d6c;
      expv[63] = 64'h0000010007c02e01;
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
