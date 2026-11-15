// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03060 dut (
    .clock_c(clk),
    .i1(in_vec[65:65]),
    .i2(in_vec[64:64]),
    .i3(in_vec[63:56]),
    .i4(in_vec[55:48]),
    .i5(in_vec[47:40]),
    .i6(in_vec[39:32]),
    .i7(in_vec[31:24]),
    .i8(in_vec[23:16]),
    .i9(in_vec[15:8]),
    .i10(in_vec[7:0]),
    .o1(out_vec[63:48]),
    .o2(out_vec[47:32]),
    .o3(out_vec[31:16]),
    .o4(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h32cc4a2000ed20ee0;
    stim[1] = 66'h0ca184d6a5ed6fb2d;
    stim[2] = 66'h20fb8a45fdae99b4c;
    stim[3] = 66'h3e520938696c04dbe;
    stim[4] = 66'h28b33a7e89015a378;
    stim[5] = 66'h3052434d269fcbdfd;
    stim[6] = 66'h2941bf0a3aa852824;
    stim[7] = 66'h3f95ed6d68a24ec87;
    stim[8] = 66'h2bc14efe239f8332e;
    stim[9] = 66'h0027ec02ef5df1d3d;
    stim[10] = 66'h03db086c2f5a2c78c;
    stim[11] = 66'h0b6f0ab0f386b1fd3;
    stim[12] = 66'h3a6c850807ba794ea;
    stim[13] = 66'h012f81a175c16ae1d;
    stim[14] = 66'h0bf68be83818cd136;
    stim[15] = 66'h2698c0ea14e566760;
    stim[16] = 66'h038f018883aa49954;
    stim[17] = 66'h015844a73dce552de;
    stim[18] = 66'h170139d48075abe7c;
    stim[19] = 66'h3ed49f5d010a82e29;
    stim[20] = 66'h3bbf4e0664cdf86e1;
    stim[21] = 66'h0deb33267ceed7cbc;
    stim[22] = 66'h0b8ee77a0a2040fa0;
    stim[23] = 66'h05e5683ec8a317e1c;
    stim[24] = 66'h172d3232d4ba3e86f;
    stim[25] = 66'h3edab45aec15dc578;
    stim[26] = 66'h0ecc533fc79236af2;
    stim[27] = 66'h29568e410364db7f3;
    stim[28] = 66'h16bd7a5cc8ba2e299;
    stim[29] = 66'h2f71f2c46adbeaed2;
    stim[30] = 66'h1b531e617a76c84b1;
    stim[31] = 66'h3c8aa57e67e4e3203;
    stim[32] = 66'h1fbb8f576adcca673;
    stim[33] = 66'h1251e0caa84a9546c;
    stim[34] = 66'h2b53e5bcfb558d163;
    stim[35] = 66'h0c20f6a9d9bd66842;
    stim[36] = 66'h2b8fd4962ec4f3564;
    stim[37] = 66'h0afffd04e14b13eb7;
    stim[38] = 66'h2c56306c948810c26;
    stim[39] = 66'h10a6efbd134fa5c2c;
    stim[40] = 66'h347ef699e1729d848;
    stim[41] = 66'h09478ea7b54fef033;
    stim[42] = 66'h014f4131f3e15e665;
    stim[43] = 66'h3b481e06048cc0d75;
    stim[44] = 66'h0c3299097d95f7c68;
    stim[45] = 66'h3e6a732521bc77b9f;
    stim[46] = 66'h1cd7b89ccec7e28e0;
    stim[47] = 66'h20fb236319f155279;
    stim[48] = 66'h04582741f71070ae8;
    stim[49] = 66'h1c491b5d93a72961d;
    stim[50] = 66'h0361e9ae7b3ec6507;
    stim[51] = 66'h1780a40df69785fe5;
    stim[52] = 66'h3083d1c665091e981;
    stim[53] = 66'h1644f935063bb3ffb;
    stim[54] = 66'h238c8ef671b6a8dc2;
    stim[55] = 66'h27afe70b9a520bf64;
    stim[56] = 66'h3bd4cbb15669af822;
    stim[57] = 66'h359d0ae02774478d1;
    stim[58] = 66'h28ba1ee95c426f43c;
    stim[59] = 66'h074ee02580b9a9f5b;
    stim[60] = 66'h04bf25992fed240ac;
    stim[61] = 66'h20c48816ddc1cd97c;
    stim[62] = 66'h03ef6b78244fb6676;
    stim[63] = 66'h10d6f8267a57ef3b2;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0cc6a778634c1c34;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h4e30042f6a556cc0;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h62480e07258016ec;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h29dc13602f9d289c;
      expv[10] = 64'h29dc13602f9d289c;
      expv[11] = 64'h29dc13602f9d289c;
      expv[12] = 64'h29dc13602f9d289c;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h1ffe2f0805a23c60;
      expv[17] = 64'h1ffe2f0805a23c60;
      expv[18] = 64'h1ffe2f0805a23c60;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h1f6e1f48a2fc0f30;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'ha6eb17021de8396c;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h7ff915504a4b500d;
      expv[36] = 64'h7ff915504a4b500d;
      expv[37] = 64'ha9a04e130f1d2648;
      expv[38] = 64'ha9a04e130f1d2648;
      expv[39] = 64'h376831e300481dd6;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h09510e9a114c1729;
      expv[49] = 64'h09510e9a114c1729;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h05e852d083a34e0e;
      expv[56] = 64'h4ea21fc053904844;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h6a6c17e6e2d822ec;
      expv[60] = 64'h6a6c17e6e2d822ec;
      expv[61] = 64'h6a6c17e6e2d822ec;
      expv[62] = 64'h0a5007e06d5934cc;
      expv[63] = 64'h0a5007e06d5934cc;
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
