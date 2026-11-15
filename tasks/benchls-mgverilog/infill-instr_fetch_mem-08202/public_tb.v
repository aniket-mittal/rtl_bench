// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08202 dut (
    .clk(clk),
    .rst(in_vec[100:100]),
    .addr(in_vec[99:68]),
    .im_add(in_vec[67:36]),
    .im_data(in_vec[35:4]),
    .im_en(in_vec[3:3]),
    .im_rd_wr(in_vec[2:2]),
    .stall(in_vec[1:1]),
    .mispredict(in_vec[0:0]),
    .inst1(out_vec[64:33]),
    .inst1_pc(out_vec[32:1]),
    .inst1_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h1e31408f52af7a42a73c2191ad;
    stim[1] = 101'h1defe5bfac92670af3c41f109a;
    stim[2] = 101'h03fa8172e81ea931d2859244cb;
    stim[3] = 101'h08da2e69d5159cb4b6d70aa312;
    stim[4] = 101'h0d178f0f8b54fa8dc8e169ab4e;
    stim[5] = 101'h05bbc22b44d678834c7a2362d8;
    stim[6] = 101'h0c994257f4bf23e0a8e9156cd4;
    stim[7] = 101'h09049a6f8b8ecd6e13c12732fc;
    stim[8] = 101'h00da4a98f31524fd36b134398b;
    stim[9] = 101'h0556edc8549240a3e125520cf3;
    stim[10] = 101'h0a280a6bdbadbb8ed92f25583e;
    stim[11] = 101'h0699dc805b454b7ab8e2fd81e2;
    stim[12] = 101'h0a726c58d31789e829d2a14b86;
    stim[13] = 101'h0db35b902b116aec222ab7e04a;
    stim[14] = 101'h0542a5142acd0f8c1a3e3fa788;
    stim[15] = 101'h0d9887e3352b324dddf0e09b5e;
    stim[16] = 101'h0a8db417a22d6cc55442c3accb;
    stim[17] = 101'h069b80223d641d3cf065d04740;
    stim[18] = 101'h07ff4f1dec3422a59cf97c02b8;
    stim[19] = 101'h03218b499656be142b3db44d35;
    stim[20] = 101'h021aeaf94fdda12ad213f7e38b;
    stim[21] = 101'h0f9e4e6ae8126200628e8ba878;
    stim[22] = 101'h0f3e8b02df2a7c63442ff4ac58;
    stim[23] = 101'h009bfce83e20858008312bd7d4;
    stim[24] = 101'h09f45d84db64fa4e59e46c1033;
    stim[25] = 101'h0eb7a31669ab417a8b4d3e8871;
    stim[26] = 101'h00d3879bb3192b8fb2255ad5d2;
    stim[27] = 101'h0879cea47136cbe6a095b64ba0;
    stim[28] = 101'h089151c78aae13b2612e66daf5;
    stim[29] = 101'h03899b41fa50bd16d8b3503218;
    stim[30] = 101'h10de3e3c4293ae26553d257d3a;
    stim[31] = 101'h077afbab7cfea54f698f6bcc8d;
    stim[32] = 101'h08e8cc11ab8e46883b7b321601;
    stim[33] = 101'h0ce3669c6f07709b5ec384315c;
    stim[34] = 101'h06bcb95fa90927bbef26c0353b;
    stim[35] = 101'h0f9761165a4d0a5248cbfc9c73;
    stim[36] = 101'h0a02af0b135e6ce138041abaa1;
    stim[37] = 101'h0bbd0bcd69aef59e910831d683;
    stim[38] = 101'h0602e624028061bd71704644e6;
    stim[39] = 101'h07304f5a9982fdba56a4f00a28;
    stim[40] = 101'h0803daf3c592b767117e9f50b6;
    stim[41] = 101'h05351c84f511ba8b9b4f1c731e;
    stim[42] = 101'h03662aa06f2979a54cb4c497e7;
    stim[43] = 101'h0a021dbcf9cb3015afda65ab28;
    stim[44] = 101'h0d47c0b69d1b7e5ed1c7dc85e2;
    stim[45] = 101'h01f544bd4ddec09f303c099e39;
    stim[46] = 101'h0cfd9a08ae0dfea530d0981e1c;
    stim[47] = 101'h0927536778db5d0718cb6037c4;
    stim[48] = 101'h076ddc38e72268dd828929aea9;
    stim[49] = 101'h034161c3f7cb17c5c1c446f9e0;
    stim[50] = 101'h0508c3df8d25ec65458c99cccc;
    stim[51] = 101'h0c4427b6acc08e858bf5da4cdc;
    stim[52] = 101'h02b8031c3d4caf2a037a3a3de4;
    stim[53] = 101'h0d25a0c5aaede74d3e89714464;
    stim[54] = 101'h0243efcd4264285fe0914a658e;
    stim[55] = 101'h08ebe87d86cdfaad65b89c4f33;
    stim[56] = 101'h0075459039d73e06b48c502914;
    stim[57] = 101'h0769e1734ca8906fac9d0ea88d;
    stim[58] = 101'h01c7bc82061ee57b138a8c1e45;
    stim[59] = 101'h0d1980a1247b6dd7ca3a5beb84;
    stim[60] = 101'h02eca97832a284c626807db72c;
    stim[61] = 101'h0422a5f8e5f82d64cc791b7b9d;
    stim[62] = 101'h06fba0da8ab635b3b77e0aa666;
    stim[63] = 101'h0c6beac0c3189ee2042a1fd9d4;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h00000000000000000;
      expv[56] = 65'h00000000000000000;
      expv[57] = 65'h00000000000000000;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
