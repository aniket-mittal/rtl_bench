// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01155 dut (
    .din(in_vec[59:0]),
    .dout(out_vec[67:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'h4a9df421fbd6bf4;
    stim[1] = 60'h32f4f4060d9c3a6;
    stim[2] = 60'hfa04336c3a54d38;
    stim[3] = 60'hfeb02566d81bf4d;
    stim[4] = 60'he579ec1a0c7ed7a;
    stim[5] = 60'ha98ad176bcd40b0;
    stim[6] = 60'h2227a1e12e004eb;
    stim[7] = 60'h0ceff675d087b3c;
    stim[8] = 60'h111555736fa7db2;
    stim[9] = 60'h3172cbbbd29bd9a;
    stim[10] = 60'h8707b3fe095ebb4;
    stim[11] = 60'h9afb6fd447cd189;
    stim[12] = 60'h329272b0731f34c;
    stim[13] = 60'h12a02625058044e;
    stim[14] = 60'h22ebad28a74bc1c;
    stim[15] = 60'h1e468c7ed8f1613;
    stim[16] = 60'h64b324db39b4928;
    stim[17] = 60'he55dd58058ac7eb;
    stim[18] = 60'h5174bb16714f234;
    stim[19] = 60'h6a467f40a95d249;
    stim[20] = 60'hf2dd997589b8a2f;
    stim[21] = 60'hde701021338b38f;
    stim[22] = 60'h4e2e3726f312c29;
    stim[23] = 60'h9d93d6419666e2d;
    stim[24] = 60'hb8900710cb86b10;
    stim[25] = 60'h143e97f3edf4881;
    stim[26] = 60'h29bda16b0f099f4;
    stim[27] = 60'h8946f07e9806b8b;
    stim[28] = 60'hed2418685e75f3d;
    stim[29] = 60'he85b00d36e24de0;
    stim[30] = 60'hc6a4be76082b156;
    stim[31] = 60'h636085f3f4539d4;
    stim[32] = 60'h30c70e28a5c89f1;
    stim[33] = 60'hde5dad7cd1d9baa;
    stim[34] = 60'h7a8a6b1ec96e320;
    stim[35] = 60'h25d41ef4641451c;
    stim[36] = 60'hb2d20e5250a2edf;
    stim[37] = 60'hd25f11c403ddd1d;
    stim[38] = 60'hdeba46b87cd0c53;
    stim[39] = 60'hee1f92a2223aad3;
    stim[40] = 60'h47d33bfc0c233e2;
    stim[41] = 60'h10a59fc73f5c6ab;
    stim[42] = 60'h9b862d7c67c1bba;
    stim[43] = 60'hb885b8a6bfad988;
    stim[44] = 60'hdec152f909aa0c0;
    stim[45] = 60'h82140babf5a1d48;
    stim[46] = 60'h7b0dc240b6fbaa7;
    stim[47] = 60'hcc8199bff4774d2;
    stim[48] = 60'h7970ec34f4be9f9;
    stim[49] = 60'h47aab42541de7b8;
    stim[50] = 60'h763009731aaa3bf;
    stim[51] = 60'h3851b7d52f2dddb;
    stim[52] = 60'h445b4dcc05b2ad0;
    stim[53] = 60'h04c65e721b2c743;
    stim[54] = 60'h2ffaec134cdb92d;
    stim[55] = 60'h4b7500311f7fb23;
    stim[56] = 60'hde7a5d4c7b36245;
    stim[57] = 60'h11cfc82a145642b;
    stim[58] = 60'h6227a05827430f1;
    stim[59] = 60'hd6ef009ee4154de;
    stim[60] = 60'h4e4773575819dde;
    stim[61] = 60'hb8cef5f51383189;
    stim[62] = 60'hd0942906345a48a;
    stim[63] = 60'hd2d5a61261ea1ca;
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
      expv[0] = 68'h4a9df421fbd6bf4fd;
      expv[1] = 68'h32f4f4060d9c3a6e1;
      expv[2] = 68'hfa04336c3a54d38b7;
      expv[3] = 68'hfeb02566d81bf4dc1;
      expv[4] = 68'he579ec1a0c7ed7a5c;
      expv[5] = 68'ha98ad176bcd40b0ac;
      expv[6] = 68'h2227a1e12e004eb06;
      expv[7] = 68'h0ceff675d087b3cb2;
      expv[8] = 68'h111555736fa7db2f5;
      expv[9] = 68'h3172cbbbd29bd9a63;
      expv[10] = 68'h8707b3fe095ebb483;
      expv[11] = 68'h9afb6fd447cd1893f;
      expv[12] = 68'h329272b0731f34c74;
      expv[13] = 68'h12a02625058044e05;
      expv[14] = 68'h22ebad28a74bc1c19;
      expv[15] = 68'h1e468c7ed8f16133f;
      expv[16] = 68'h64b324db39b49280c;
      expv[17] = 68'he55dd58058ac7eb33;
      expv[18] = 68'h5174bb16714f23440;
      expv[19] = 68'h6a467f40a95d2497e;
      expv[20] = 68'hf2dd997589b8a2ff5;
      expv[21] = 68'hde701021338b38fa8;
      expv[22] = 68'h4e2e3726f312c2913;
      expv[23] = 68'h9d93d6419666e2d19;
      expv[24] = 68'hb8900710cb86b10f9;
      expv[25] = 68'h143e97f3edf48813c;
      expv[26] = 68'h29bda16b0f099f4b4;
      expv[27] = 68'h8946f07e9806b8bb2;
      expv[28] = 68'hed2418685e75f3d11;
      expv[29] = 68'he85b00d36e24de0b6;
      expv[30] = 68'hc6a4be76082b15659;
      expv[31] = 68'h636085f3f4539d428;
      expv[32] = 68'h30c70e28a5c89f19a;
      expv[33] = 68'hde5dad7cd1d9baa58;
      expv[34] = 68'h7a8a6b1ec96e32089;
      expv[35] = 68'h25d41ef4641451c59;
      expv[36] = 68'hb2d20e5250a2edf45;
      expv[37] = 68'hd25f11c403ddd1d55;
      expv[38] = 68'hdeba46b87cd0c5395;
      expv[39] = 68'hee1f92a2223aad32d;
      expv[40] = 68'h47d33bfc0c233e23b;
      expv[41] = 68'h10a59fc73f5c6abce;
      expv[42] = 68'h9b862d7c67c1bba76;
      expv[43] = 68'hb885b8a6bfad9889e;
      expv[44] = 68'hdec152f909aa0c069;
      expv[45] = 68'h82140babf5a1d48c9;
      expv[46] = 68'h7b0dc240b6fbaa75a;
      expv[47] = 68'hcc8199bff4774d28c;
      expv[48] = 68'h7970ec34f4be9f932;
      expv[49] = 68'h47aab42541de7b817;
      expv[50] = 68'h763009731aaa3bfb8;
      expv[51] = 68'h3851b7d52f2dddb3b;
      expv[52] = 68'h445b4dcc05b2ad0e8;
      expv[53] = 68'h04c65e721b2c74331;
      expv[54] = 68'h2ffaec134cdb92d59;
      expv[55] = 68'h4b7500311f7fb2374;
      expv[56] = 68'hde7a5d4c7b36245ec;
      expv[57] = 68'h11cfc82a145642b6d;
      expv[58] = 68'h6227a05827430f11b;
      expv[59] = 68'hd6ef009ee4154de5b;
      expv[60] = 68'h4e4773575819dde46;
      expv[61] = 68'hb8cef5f5138318907;
      expv[62] = 68'hd0942906345a48a42;
      expv[63] = 68'hd2d5a61261ea1caa0;
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
