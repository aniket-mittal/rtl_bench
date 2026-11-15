// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_126043 dut (
    .clk(clk),
    .rst(in_vec[49:49]),
    .data_in(in_vec[48:17]),
    .data_valid(in_vec[16:16]),
    .mss(in_vec[15:0]),
    .tcp_packet_out(out_vec[33:2]),
    .packet_valid(out_vec[1:1]),
    .segmentation_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h200ce1fbf9720;
    stim[1] = 50'h3de0b272a4b50;
    stim[2] = 50'h05e25f4b9912a;
    stim[3] = 50'h1f488407f0e5d;
    stim[4] = 50'h166644540734b;
    stim[5] = 50'h15af45f7f5c88;
    stim[6] = 50'h1c0bfbc00d5eb;
    stim[7] = 50'h1fe70adb48ea8;
    stim[8] = 50'h11ad8cbe34048;
    stim[9] = 50'h1d2b673960709;
    stim[10] = 50'h02c9a77a24239;
    stim[11] = 50'h0814e504a386b;
    stim[12] = 50'h1272673c41931;
    stim[13] = 50'h037928ce99ee9;
    stim[14] = 50'h1daca4ee77462;
    stim[15] = 50'h052edef0849bb;
    stim[16] = 50'h09df4bc6bc003;
    stim[17] = 50'h017f3d3a772c8;
    stim[18] = 50'h019e79b7d3a6b;
    stim[19] = 50'h0ddb56f423f82;
    stim[20] = 50'h0c218f7b65e2c;
    stim[21] = 50'h05c664939aaaf;
    stim[22] = 50'h00b20424b5b76;
    stim[23] = 50'h0b7e36b59358a;
    stim[24] = 50'h0c41598ff4b87;
    stim[25] = 50'h07692048ab4ed;
    stim[26] = 50'h0ca072cfefdaa;
    stim[27] = 50'h1cc874b6a4344;
    stim[28] = 50'h22649a536799e;
    stim[29] = 50'h1692f9da7a387;
    stim[30] = 50'h0176769966853;
    stim[31] = 50'h1e1374c6fab60;
    stim[32] = 50'h1af5ae72b49be;
    stim[33] = 50'h0a5d18a38d528;
    stim[34] = 50'h153a9ff34e30e;
    stim[35] = 50'h35b67842f5e4b;
    stim[36] = 50'h15ad78cebb385;
    stim[37] = 50'h0b504018f5ba6;
    stim[38] = 50'h1f9266ce86e9e;
    stim[39] = 50'h146cd0fb68d49;
    stim[40] = 50'h177d63210d16b;
    stim[41] = 50'h17078ee3fb063;
    stim[42] = 50'h1150e61bb12fa;
    stim[43] = 50'h0eb103c1f90a2;
    stim[44] = 50'h0b3736072995d;
    stim[45] = 50'h1be834a0c7989;
    stim[46] = 50'h196c4b0d0f5ca;
    stim[47] = 50'h07f39b3750075;
    stim[48] = 50'h1457200939085;
    stim[49] = 50'h0af4cc6722bb5;
    stim[50] = 50'h0f1fd45fa49cb;
    stim[51] = 50'h073b274ee5d54;
    stim[52] = 50'h087dc015b6e9d;
    stim[53] = 50'h07ca7081a0f65;
    stim[54] = 50'h0c4eb18625108;
    stim[55] = 50'h1b54d83594a91;
    stim[56] = 50'h0d23aac69dc7e;
    stim[57] = 50'h06e940088652e;
    stim[58] = 50'h0744b3a00d6ba;
    stim[59] = 50'h11f3d26c4d970;
    stim[60] = 50'h04a24d214c49e;
    stim[61] = 50'h02b4195e777e3;
    stim[62] = 50'h1b6866de21988;
    stim[63] = 50'h052ef1aa30a2d;
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
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000002;
      expv[4] = 34'h0bc4be972;
      expv[5] = 34'h0bc4be972;
      expv[6] = 34'h3e91080fe;
      expv[7] = 34'h3e91080fe;
      expv[8] = 34'h3e91080fe;
      expv[9] = 34'h2b5e8befe;
      expv[10] = 34'h2b5e8befe;
      expv[11] = 34'h2b5e8befe;
      expv[12] = 34'h2b5e8befe;
      expv[13] = 34'h2b5e8befe;
      expv[14] = 34'h235b197c6;
      expv[15] = 34'h06f2519d2;
      expv[16] = 34'h06f2519d2;
      expv[17] = 34'h3b5949dce;
      expv[18] = 34'h13be978d6;
      expv[19] = 34'h02fe7a74e;
      expv[20] = 34'h02fe7a74e;
      expv[21] = 34'h02fe7a74e;
      expv[22] = 34'h033cf36fa;
      expv[23] = 34'h0b8cc9272;
      expv[24] = 34'h016408496;
      expv[25] = 34'h16fc6d6b2;
      expv[26] = 34'h16fc6d6b2;
      expv[27] = 34'h16fc6d6b2;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h000000002;
      expv[31] = 34'h000000002;
      expv[32] = 34'h2d25f3b4e;
      expv[33] = 34'h3c26e98de;
      expv[34] = 34'h3c26e98de;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000000;
      expv[37] = 34'h000000002;
      expv[38] = 34'h2b5af19d6;
      expv[39] = 34'h2b5af19d6;
      expv[40] = 34'h2b5af19d6;
      expv[41] = 34'h2b5af19d6;
      expv[42] = 34'h16a08031e;
      expv[43] = 34'h2e0f1dc7e;
      expv[44] = 34'h22a1cc376;
      expv[45] = 34'h22a1cc376;
      expv[46] = 34'h22a1cc376;
      expv[47] = 34'h22a1cc376;
      expv[48] = 34'h1d620783e;
      expv[49] = 34'h0fe7366ea;
      expv[50] = 34'h0fe7366ea;
      expv[51] = 34'h0fe7366ea;
      expv[52] = 34'h0fe7366ea;
      expv[53] = 34'h28ae40126;
      expv[54] = 34'h28ae40126;
      expv[55] = 34'h28ae40126;
      expv[56] = 34'h10fb802b6;
      expv[57] = 34'h36a9b06b2;
      expv[58] = 34'h36a9b06b2;
      expv[59] = 34'h36a9b06b2;
      expv[60] = 34'h36a9b06b2;
      expv[61] = 34'h36a9b06b2;
      expv[62] = 34'h1a47558d2;
      expv[63] = 34'h1a47558d2;
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
