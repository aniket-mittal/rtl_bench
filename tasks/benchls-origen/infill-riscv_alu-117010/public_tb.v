// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_117010 dut (
    .alu_ctrl(in_vec[68:64]),
    .alu_in1(in_vec[63:32]),
    .alu_in2(in_vec[31:0]),
    .alu_out(out_vec[32:1]),
    .branch_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h10d12c931ecb51e15f;
    stim[1] = 69'h1c67375abfc3ae760d;
    stim[2] = 69'h05dfebc9d672b66372;
    stim[3] = 69'h13d56ca4902d3f6b8f;
    stim[4] = 69'h105c949ef3de44cf13;
    stim[5] = 69'h132a727d9fef9a342e;
    stim[6] = 69'h08bfa8d8d3792d11ca;
    stim[7] = 69'h12676aee2041b17c5e;
    stim[8] = 69'h1672aea76ab84c40b0;
    stim[9] = 69'h19367f8fa6f9681a19;
    stim[10] = 69'h123f1b224c3b0021c1;
    stim[11] = 69'h1bc0277d6953396b57;
    stim[12] = 69'h11f4292eb84688c221;
    stim[13] = 69'h1665d4587ef6e06835;
    stim[14] = 69'h191a33aaf7e0fe43bf;
    stim[15] = 69'h06369586ee3dafac75;
    stim[16] = 69'h1af238c0ed6de3147d;
    stim[17] = 69'h04296872537b562ebd;
    stim[18] = 69'h19e34885cb0b04e40d;
    stim[19] = 69'h0b5b97b0605d3fa038;
    stim[20] = 69'h0a239154bd065e02e0;
    stim[21] = 69'h1b025cddeccadbb18d;
    stim[22] = 69'h0d888e9c7af24521c3;
    stim[23] = 69'h07e109eece93e69c04;
    stim[24] = 69'h0fce05f6a14fe6332d;
    stim[25] = 69'h0db66c0b578e51f1de;
    stim[26] = 69'h16d5859ab2be07daa3;
    stim[27] = 69'h0c982851b955a94e7d;
    stim[28] = 69'h15a14beb433b377087;
    stim[29] = 69'h138b9a3ea48b718277;
    stim[30] = 69'h072cf2a493171246aa;
    stim[31] = 69'h0d414b5439959838f7;
    stim[32] = 69'h0fadaf3f4d3e070279;
    stim[33] = 69'h1fb93ebc0d44a69444;
    stim[34] = 69'h116cbb8c0f1edc18da;
    stim[35] = 69'h0b02342f1ab788b9c2;
    stim[36] = 69'h08e69e731af4e85590;
    stim[37] = 69'h13f4c366f9a78d67cb;
    stim[38] = 69'h171d64d90c45a4999f;
    stim[39] = 69'h1674194e884e00db04;
    stim[40] = 69'h0bf68dfc28d7f8a10a;
    stim[41] = 69'h04fc7fd4f5d2395a6d;
    stim[42] = 69'h0516382a0730fb2b2b;
    stim[43] = 69'h0d942443cab3df35e1;
    stim[44] = 69'h09423272d80484d1ac;
    stim[45] = 69'h0f7093ceb882f23496;
    stim[46] = 69'h111d6f402b14ec635b;
    stim[47] = 69'h178b7e28181629784c;
    stim[48] = 69'h072d5a3d1aaafcd853;
    stim[49] = 69'h068c701a0fff710c8e;
    stim[50] = 69'h09e659857a27a62ce4;
    stim[51] = 69'h1253c62725a5e6718a;
    stim[52] = 69'h0315efc4a7c5777dba;
    stim[53] = 69'h1c5b566c06cb365709;
    stim[54] = 69'h10e1d9a9a1a7184a65;
    stim[55] = 69'h14a0d478506d8a44ee;
    stim[56] = 69'h16dd4a3ec2e20cb078;
    stim[57] = 69'h1d26ed027ce2c3dca6;
    stim[58] = 69'h15a686656567e933d4;
    stim[59] = 69'h1d36f493ceabfabfed;
    stim[60] = 69'h199dc256eaf0e0562f;
    stim[61] = 69'h0294974dd51fdf38d4;
    stim[62] = 69'h0a1b59180169ce4f64;
    stim[63] = 69'h0f999b90472cab3ded;
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
      expv[0] = 33'h000000001;
      expv[1] = 33'h000000000;
      expv[2] = 33'h04eb00000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h072502184;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000368;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000002;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h04b9eacba;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000001;
      expv[23] = 33'h01c213dd8;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000167952;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h1c910a220;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h182a07000;
      expv[43] = 33'h000000001;
      expv[44] = 33'h08d6de7f8;
      expv[45] = 33'h000000001;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000b56;
      expv[49] = 33'h1fffc6380;
      expv[50] = 33'h1cfff5bfc;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000001;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h0e9702a02;
      expv[62] = 33'h0e52eaeca;
      expv[63] = 33'h000000000;
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
