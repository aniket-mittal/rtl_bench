// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04504 dut (
    .RotatorIn(in_vec[38:7]),
    .RotatorBitNum(in_vec[6:2]),
    .RotatorOp(in_vec[1:0]),
    .RotatorOut(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h54aab0a1b4;
    stim[1] = 39'h7a5857befd;
    stim[2] = 39'h4ed34142c0;
    stim[3] = 39'h1467b04229;
    stim[4] = 39'h5ffecc3a53;
    stim[5] = 39'h512b876425;
    stim[6] = 39'h6067b33733;
    stim[7] = 39'h404c68cb95;
    stim[8] = 39'h227a994b72;
    stim[9] = 39'h16484a1555;
    stim[10] = 39'h11e924de19;
    stim[11] = 39'h60eaae372a;
    stim[12] = 39'h5806f940bf;
    stim[13] = 39'h5b71cd6d52;
    stim[14] = 39'h1a7a3b3c0d;
    stim[15] = 39'h5e0016086f;
    stim[16] = 39'h44f2fd383b;
    stim[17] = 39'h64e3f43a7d;
    stim[18] = 39'h513f365b96;
    stim[19] = 39'h6da12a8c61;
    stim[20] = 39'h73321737c7;
    stim[21] = 39'h32af1d80b4;
    stim[22] = 39'h19a3c84e15;
    stim[23] = 39'h5837c64805;
    stim[24] = 39'h49984d63fe;
    stim[25] = 39'h1ca3df474e;
    stim[26] = 39'h237662ae1b;
    stim[27] = 39'h4987086476;
    stim[28] = 39'h1eb844be92;
    stim[29] = 39'h5e67370fc3;
    stim[30] = 39'h033c84b35f;
    stim[31] = 39'h09ab440516;
    stim[32] = 39'h05c6152ccd;
    stim[33] = 39'h15c524dbee;
    stim[34] = 39'h5346b8f4d5;
    stim[35] = 39'h69ba4b2503;
    stim[36] = 39'h145b6c456a;
    stim[37] = 39'h23fd2f4378;
    stim[38] = 39'h1fa781351f;
    stim[39] = 39'h716ccc0c0a;
    stim[40] = 39'h3deefc30ac;
    stim[41] = 39'h5bbd0f1d5a;
    stim[42] = 39'h3cda4b9780;
    stim[43] = 39'h22b704f996;
    stim[44] = 39'h34bad829a5;
    stim[45] = 39'h3326cbcd18;
    stim[46] = 39'h0e38d9818a;
    stim[47] = 39'h38ffe98f45;
    stim[48] = 39'h25ad168aea;
    stim[49] = 39'h2f49f94062;
    stim[50] = 39'h7d14c1876d;
    stim[51] = 39'h5c02a68317;
    stim[52] = 39'h1a1ad5d3e2;
    stim[53] = 39'h7b70c9346c;
    stim[54] = 39'h177e7654b2;
    stim[55] = 39'h6f631eaec5;
    stim[56] = 39'h4982097d6c;
    stim[57] = 39'h5a253a334e;
    stim[58] = 39'h0bb04cb04e;
    stim[59] = 39'h7d33e3677f;
    stim[60] = 39'h5f9ae28597;
    stim[61] = 39'h7a27a01950;
    stim[62] = 39'h3fdd6928ae;
    stim[63] = 39'h5ac33d56ad;
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
      expv[0] = 32'hac286000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h82850000;
      expv[3] = 32'h00000000;
      expv[4] = 32'hfffffbff;
      expv[5] = 32'h00000000;
      expv[6] = 32'hfffc0cf6;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000004;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00307557;
      expv[12] = 32'hffff601b;
      expv[13] = 32'h00000b6e;
      expv[14] = 32'h00000000;
      expv[15] = 32'hfffffff7;
      expv[16] = 32'hfffe2797;
      expv[17] = 32'h00000000;
      expv[18] = 32'h0513f365;
      expv[19] = 32'h00000000;
      expv[20] = 32'hfffff332;
      expv[21] = 32'hc7602000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000001;
      expv[25] = 32'h00000728;
      expv[26] = 32'h011bb315;
      expv[27] = 32'h00000004;
      expv[28] = 32'h03d70897;
      expv[29] = 32'hffffbcce;
      expv[30] = 32'h0000000c;
      expv[31] = 32'h009ab440;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000005;
      expv[34] = 32'h00000000;
      expv[35] = 32'hd374964a;
      expv[36] = 32'h0000000a;
      expv[37] = 32'h80000000;
      expv[38] = 32'h007e9e04;
      expv[39] = 32'h38b66606;
      expv[40] = 32'hefc30800;
      expv[41] = 32'h000002dd;
      expv[42] = 32'h79b4972f;
      expv[43] = 32'h022b704f;
      expv[44] = 32'h00000000;
      expv[45] = 32'h9365e680;
      expv[46] = 32'h071c6cc0;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000012;
      expv[49] = 32'h0000005e;
      expv[50] = 32'h00000000;
      expv[51] = 32'hfdc02a68;
      expv[52] = 32'h00000034;
      expv[53] = 32'h40000000;
      expv[54] = 32'h0002efce;
      expv[55] = 32'h00000000;
      expv[56] = 32'hd0000000;
      expv[57] = 32'h00001689;
      expv[58] = 32'h000002ec;
      expv[59] = 32'hffffffff;
      expv[60] = 32'hfdf9ae28;
      expv[61] = 32'h03200000;
      expv[62] = 32'h000ff75a;
      expv[63] = 32'h00000000;
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
