// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_073952 dut (
    .ac97_bit_clock(clk),
    .command_address(in_vec[67:60]),
    .command_data(in_vec[59:44]),
    .command_valid(in_vec[43:43]),
    .left_data(in_vec[42:23]),
    .left_valid(in_vec[22:22]),
    .right_data(in_vec[21:2]),
    .right_valid(in_vec[1:1]),
    .ac97_sdata_in(in_vec[0:0]),
    .ready(out_vec[42:42]),
    .left_in_data(out_vec[41:22]),
    .right_in_data(out_vec[21:2]),
    .ac97_sdata_out(out_vec[1:1]),
    .ac97_synch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'he5ebd5f61e46871a0;
    stim[1] = 68'h5a0adcaf0732df9f6;
    stim[2] = 68'h9f120af213a355604;
    stim[3] = 68'h4535ed7b6886d0cfe;
    stim[4] = 68'h199f2c825024e3440;
    stim[5] = 68'hc5a23b7b6b77bbed2;
    stim[6] = 68'h4705c0046d01be9b7;
    stim[7] = 68'h9028e09d655349db0;
    stim[8] = 68'hed7d2d910f4a78ee2;
    stim[9] = 68'h337e7900dfc0950c5;
    stim[10] = 68'h400d58b5291d0102a;
    stim[11] = 68'hfbd836bfb94a4957a;
    stim[12] = 68'h564bf52fb968a907b;
    stim[13] = 68'h6510ce1f77f70be22;
    stim[14] = 68'h574db579dc47490a0;
    stim[15] = 68'h746ed17546e190411;
    stim[16] = 68'had1237d9c98bb1fde;
    stim[17] = 68'h6cec15f5038c819a8;
    stim[18] = 68'h00f016254490d4060;
    stim[19] = 68'hd15c44b7e4f07bfcd;
    stim[20] = 68'hc7b8c0d86e5d68605;
    stim[21] = 68'h6a5e3a42a1bf71a7c;
    stim[22] = 68'hd22ee534486ddb78a;
    stim[23] = 68'h8f837e6d9d49eda22;
    stim[24] = 68'h498ebbe4bf715abb3;
    stim[25] = 68'hdb4531781f025ca5f;
    stim[26] = 68'h16e2e0d9f1f95b822;
    stim[27] = 68'hdea6e98fe4f2e666e;
    stim[28] = 68'he465559e688e9b5a6;
    stim[29] = 68'h490dae6666c39d2d1;
    stim[30] = 68'h8288102bf5268cd33;
    stim[31] = 68'hb2b99ca4bb2596907;
    stim[32] = 68'h3226c7fd4d212ddf4;
    stim[33] = 68'h5623b17fa5daf4bb9;
    stim[34] = 68'ha07a944e3b7a86281;
    stim[35] = 68'h09aa7dd1d31cd6442;
    stim[36] = 68'h87ca59c08940806d9;
    stim[37] = 68'hddf6f2202665f2691;
    stim[38] = 68'h56995006795681581;
    stim[39] = 68'h75c0a1ae24a610253;
    stim[40] = 68'hf49a66daaa56a983c;
    stim[41] = 68'h357c0951d0cc0b388;
    stim[42] = 68'h1a40c3094d3f26e9d;
    stim[43] = 68'h42687c6552815d7e0;
    stim[44] = 68'h985c534ebb4127469;
    stim[45] = 68'he9a8a5d06a87d8f5d;
    stim[46] = 68'h74fa1ab752ae928e3;
    stim[47] = 68'hd8c9760793c71f62d;
    stim[48] = 68'hd2c024636b495222f;
    stim[49] = 68'he748f0b7d53ce1474;
    stim[50] = 68'hdd561295f9323ded5;
    stim[51] = 68'h1e828e2c133f80f12;
    stim[52] = 68'hdaf22f94965dcdee1;
    stim[53] = 68'h084f4fc3d19ee625d;
    stim[54] = 68'h0f6f2f84ba1677b96;
    stim[55] = 68'hdc3c825e58eac8d84;
    stim[56] = 68'h11fe4db82c2805c0b;
    stim[57] = 68'hac35bd2fb7a59b4f0;
    stim[58] = 68'hf3ed81951ef79a10d;
    stim[59] = 68'hcecbbb2efa9325a7e;
    stim[60] = 68'h1cc877b620f27a86f;
    stim[61] = 68'h1cd4d447eb4fb306f;
    stim[62] = 68'h697cc6f5043ffe807;
    stim[63] = 68'h3f5b69b0b76cb8ead;
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
      expv[0] = 43'h00000000000;
      expv[1] = 43'h00000000002;
      expv[2] = 43'h00000000000;
      expv[3] = 43'h00000000000;
      expv[4] = 43'h00000000000;
      expv[5] = 43'h00000000000;
      expv[6] = 43'h00000000000;
      expv[7] = 43'h00000000000;
      expv[8] = 43'h00000000000;
      expv[9] = 43'h00000000000;
      expv[10] = 43'h00000000000;
      expv[11] = 43'h00000000000;
      expv[12] = 43'h00000000000;
      expv[13] = 43'h00000000000;
      expv[14] = 43'h00000000000;
      expv[15] = 43'h00000000000;
      expv[16] = 43'h00000000000;
      expv[17] = 43'h00000000000;
      expv[18] = 43'h00000000000;
      expv[19] = 43'h00000000000;
      expv[20] = 43'h00000000000;
      expv[21] = 43'h00000000000;
      expv[22] = 43'h00000000000;
      expv[23] = 43'h00000000000;
      expv[24] = 43'h00000000000;
      expv[25] = 43'h00000000000;
      expv[26] = 43'h00000000000;
      expv[27] = 43'h00000000000;
      expv[28] = 43'h00000000000;
      expv[29] = 43'h00000000000;
      expv[30] = 43'h00000000000;
      expv[31] = 43'h00000000000;
      expv[32] = 43'h00000000000;
      expv[33] = 43'h00000000000;
      expv[34] = 43'h00000000000;
      expv[35] = 43'h00000000000;
      expv[36] = 43'h00000000000;
      expv[37] = 43'h00000000000;
      expv[38] = 43'h00000000000;
      expv[39] = 43'h00000000000;
      expv[40] = 43'h00000000000;
      expv[41] = 43'h00000000000;
      expv[42] = 43'h00000000000;
      expv[43] = 43'h00000000000;
      expv[44] = 43'h00000000000;
      expv[45] = 43'h00000000000;
      expv[46] = 43'h00000000000;
      expv[47] = 43'h00000000000;
      expv[48] = 43'h00000000000;
      expv[49] = 43'h00000000000;
      expv[50] = 43'h00000000000;
      expv[51] = 43'h00000000000;
      expv[52] = 43'h00000000000;
      expv[53] = 43'h00000000000;
      expv[54] = 43'h00000000000;
      expv[55] = 43'h00000000000;
      expv[56] = 43'h00000000000;
      expv[57] = 43'h00000400000;
      expv[58] = 43'h00000800000;
      expv[59] = 43'h00001400000;
      expv[60] = 43'h00002800000;
      expv[61] = 43'h00005400000;
      expv[62] = 43'h0000ac00000;
      expv[63] = 43'h00015c00000;
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
