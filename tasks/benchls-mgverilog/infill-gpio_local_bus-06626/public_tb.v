// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06626 dut (
    .CLK(clk),
    .RST_N(in_vec[102:102]),
    .LOCAL_CS(in_vec[101:101]),
    .LOCAL_RNW(in_vec[100:100]),
    .LOCAL_ADDR(in_vec[99:68]),
    .LOCAL_BE(in_vec[67:64]),
    .LOCAL_WDATA(in_vec[63:32]),
    .GPIO_I(in_vec[31:0]),
    .LOCAL_ACK(out_vec[64:64]),
    .LOCAL_RDATA(out_vec[63:32]),
    .GPIO_OT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h1bdae10fbe1d0775155d5e3940;
    stim[1] = 103'h19d8c2c248f39bf4e1d8ab4896;
    stim[2] = 103'h75984b60e57f7239d5c6544251;
    stim[3] = 103'h552b8e99eabf597baf115d07c9;
    stim[4] = 103'h59a659bd5245759a54627922a1;
    stim[5] = 103'h4d784131cae4535e64c665fe90;
    stim[6] = 103'h6fd3b6ee804f54c39939804db9;
    stim[7] = 103'h6fde55226084feb536b0e3272d;
    stim[8] = 103'h5f2400ce92552b751419180f89;
    stim[9] = 103'h6e828082f9d2bac8d0fc7595ed;
    stim[10] = 103'h59b9a3c19cffff114e58454c15;
    stim[11] = 103'h6e3c651aac56c4785cbdf42ff5;
    stim[12] = 103'h46927a9b1c7459b133a2a9e4d7;
    stim[13] = 103'h336da3e4d0ffd2828bbbb2978f;
    stim[14] = 103'h6b4b86d91e454eb76177403f2f;
    stim[15] = 103'h6cc4dcd97f8ded2776a8a50fe9;
    stim[16] = 103'h6e771d9360d77f2da6ca6fb48f;
    stim[17] = 103'h43b3e6d08d01a2e8fff5c6741a;
    stim[18] = 103'h53c7721e6346f0782e3dff2c73;
    stim[19] = 103'h44a7a9dfaa97b23b89a94c5dbe;
    stim[20] = 103'h70433a533f5af6ce7a311f2a59;
    stim[21] = 103'h6f04b46c498b9edc6d8f228727;
    stim[22] = 103'h77b02a4768cacac82f290c2f1e;
    stim[23] = 103'h440b05489a79f5aaaafa1c85b0;
    stim[24] = 103'h513505a63b94f80e9910f9eb68;
    stim[25] = 103'h5c192a2efba8b524fbf652c65f;
    stim[26] = 103'h63736195e4ae2d17ea6426e1cb;
    stim[27] = 103'h5e94bebfdfb0987988dab6677f;
    stim[28] = 103'h4a45c38009819f692613b7edc3;
    stim[29] = 103'h59694ef03efb886a1263f508c3;
    stim[30] = 103'h7751243d4bc503078c94c57b7b;
    stim[31] = 103'h575ee9e34feb84d68598848161;
    stim[32] = 103'h49545ef696e6200c753dd2b750;
    stim[33] = 103'h70bbd1d1192b8f34e131b1df1d;
    stim[34] = 103'h76aa51b1bda709c555b98756e2;
    stim[35] = 103'h41c50a0a0222f660271f52647f;
    stim[36] = 103'h46ccf14869d97d78abc739bdcd;
    stim[37] = 103'h460b87708403d3b004615988a7;
    stim[38] = 103'h6deadd0a988d719709e37b4f9d;
    stim[39] = 103'h48e166264c98892f799840d394;
    stim[40] = 103'h4bb97396c244aff3295bdae841;
    stim[41] = 103'h65c501ca374cf88d1288e27f51;
    stim[42] = 103'h4d8f383da777d8bccce1278162;
    stim[43] = 103'h78b7c2c625e1a814faa97ee641;
    stim[44] = 103'h6a40ebbf315b6114604493b46a;
    stim[45] = 103'h55a7868df69d6d1b8f19ca3eab;
    stim[46] = 103'h41da69f8c79925cb0bbc38d79f;
    stim[47] = 103'h467f3d018f57e62543990e2701;
    stim[48] = 103'h5c91098b4acfad211db6ca6eea;
    stim[49] = 103'h4aaa8faf1e5f9d78eb7fabfbe6;
    stim[50] = 103'h54886321be07fb95c1008076ae;
    stim[51] = 103'h783a268d93115d3593b8450bee;
    stim[52] = 103'h605998496a577941ee5bbfed88;
    stim[53] = 103'h67f02912a4fd6c8033fe108cf1;
    stim[54] = 103'h657e27568f41b783f934bcf047;
    stim[55] = 103'h7b202d4dd6daa2dc7f886418be;
    stim[56] = 103'h7784fc3cdb2919e598dacd9e01;
    stim[57] = 103'h79261a5543c5dc1d958b62bf8f;
    stim[58] = 103'h772ce0fd21a55f02035e41e908;
    stim[59] = 103'h755557cd7c37daa1a732187247;
    stim[60] = 103'h68b333cddae545ea6a1841232e;
    stim[61] = 103'h64616f430ee4d0819a47788e81;
    stim[62] = 103'h5d9bc1438cf5f5a2f5d4814601;
    stim[63] = 103'h6770aa166bfb1b98742da4b39b;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h10000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h10000000000000000;
      expv[7] = 65'h10000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h10000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h10000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h10000000000000000;
      expv[15] = 65'h10000000000000000;
      expv[16] = 65'h10000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h10000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h10000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h10000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h10000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h10000000000000000;
      expv[35] = 65'h10000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h10000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h10000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h10000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h10000000000000000;
      expv[53] = 65'h10000000000000000;
      expv[54] = 65'h10000000000000000;
      expv[55] = 65'h00000000000000000;
      expv[56] = 65'h10000000000000000;
      expv[57] = 65'h10000000000000000;
      expv[58] = 65'h10000000000000000;
      expv[59] = 65'h10000000000000000;
      expv[60] = 65'h10000000000000000;
      expv[61] = 65'h10000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h10000000000000000;
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
