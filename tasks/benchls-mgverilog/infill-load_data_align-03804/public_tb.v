// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03804 dut (
    .iMASK(in_vec[37:34]),
    .iSHIFT(in_vec[33:32]),
    .iDATA(in_vec[31:0]),
    .oDATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h28bc9584ef;
    stim[1] = 38'h286be5518f;
    stim[2] = 38'h2bcb37e6b2;
    stim[3] = 38'h244fa91a02;
    stim[4] = 38'h0baf60d4d5;
    stim[5] = 38'h039cb558b3;
    stim[6] = 38'h05a1b20fce;
    stim[7] = 38'h161537cc07;
    stim[8] = 38'h0fedfb1ee9;
    stim[9] = 38'h04016ef3b1;
    stim[10] = 38'h19ee568ee6;
    stim[11] = 38'h1d2013d110;
    stim[12] = 38'h156c4226d6;
    stim[13] = 38'h1f156d7bda;
    stim[14] = 38'h310b2fbb01;
    stim[15] = 38'h0d863bfb5b;
    stim[16] = 38'h1bbe1ecbe2;
    stim[17] = 38'h18dd647656;
    stim[18] = 38'h12d00ea307;
    stim[19] = 38'h300e23e290;
    stim[20] = 38'h1382b181e4;
    stim[21] = 38'h08cfcf8aee;
    stim[22] = 38'h215768b75c;
    stim[23] = 38'h29c7c3007b;
    stim[24] = 38'h3cdb6a2629;
    stim[25] = 38'h3903d4d0e4;
    stim[26] = 38'h0a2c6bb1f9;
    stim[27] = 38'h1a1931bb37;
    stim[28] = 38'h0ae5bf77ab;
    stim[29] = 38'h0c0bce7f52;
    stim[30] = 38'h08741415da;
    stim[31] = 38'h0edc2b46c8;
    stim[32] = 38'h2d52dfbcb1;
    stim[33] = 38'h2c63df2184;
    stim[34] = 38'h32cdc6e415;
    stim[35] = 38'h3ee32ea05d;
    stim[36] = 38'h242e86dffb;
    stim[37] = 38'h0f27f693bd;
    stim[38] = 38'h000ae9464a;
    stim[39] = 38'h0e72cf331b;
    stim[40] = 38'h1940d7fe89;
    stim[41] = 38'h3f0b1919ac;
    stim[42] = 38'h2ef0dfb378;
    stim[43] = 38'h2290fea76f;
    stim[44] = 38'h30b6d6161b;
    stim[45] = 38'h0abf5f02d5;
    stim[46] = 38'h28508f72b9;
    stim[47] = 38'h14c80ac3f2;
    stim[48] = 38'h36ed686843;
    stim[49] = 38'h1f5386192b;
    stim[50] = 38'h16ea327378;
    stim[51] = 38'h25e2b95f5b;
    stim[52] = 38'h3044123a6d;
    stim[53] = 38'h120cc767f6;
    stim[54] = 38'h119c2160bc;
    stim[55] = 38'h2baa961d31;
    stim[56] = 38'h125e798870;
    stim[57] = 38'h21d5b2f61a;
    stim[58] = 38'h085a54cb63;
    stim[59] = 38'h1512ca9195;
    stim[60] = 38'h231a6bf5e4;
    stim[61] = 38'h142f54f09b;
    stim[62] = 38'h241c3358e0;
    stim[63] = 38'h359bd0abfa;
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
      expv[0] = 32'h000084ef;
      expv[1] = 32'h0000518f;
      expv[2] = 32'h0000e6b2;
      expv[3] = 32'h00001a02;
      expv[4] = 32'h00000060;
      expv[5] = 32'h000058b3;
      expv[6] = 32'h000000a1;
      expv[7] = 32'h0000cc07;
      expv[8] = 32'h0000edfb;
      expv[9] = 32'h00000001;
      expv[10] = 32'h00008ee6;
      expv[11] = 32'h0000d110;
      expv[12] = 32'h000026d6;
      expv[13] = 32'h00007bda;
      expv[14] = 32'h0000bb01;
      expv[15] = 32'h0000863b;
      expv[16] = 32'h0000cbe2;
      expv[17] = 32'h00007656;
      expv[18] = 32'h000000a3;
      expv[19] = 32'h0000e290;
      expv[20] = 32'h00000081;
      expv[21] = 32'h000000cf;
      expv[22] = 32'h0000005c;
      expv[23] = 32'h0000007b;
      expv[24] = 32'hdb6a2629;
      expv[25] = 32'h0000d0e4;
      expv[26] = 32'h0000006b;
      expv[27] = 32'h0000bb37;
      expv[28] = 32'h000000bf;
      expv[29] = 32'h00000bce;
      expv[30] = 32'h00000014;
      expv[31] = 32'h0000dc2b;
      expv[32] = 32'h0000bcb1;
      expv[33] = 32'h00002184;
      expv[34] = 32'h0000e415;
      expv[35] = 32'he32ea05d;
      expv[36] = 32'h0000dffb;
      expv[37] = 32'h000027f6;
      expv[38] = 32'h0000464a;
      expv[39] = 32'h000072cf;
      expv[40] = 32'h0000fe89;
      expv[41] = 32'h0b1919ac;
      expv[42] = 32'h0000b378;
      expv[43] = 32'h0000006f;
      expv[44] = 32'h0000161b;
      expv[45] = 32'h0000005f;
      expv[46] = 32'h000072b9;
      expv[47] = 32'h0000c3f2;
      expv[48] = 32'h00006843;
      expv[49] = 32'h0000192b;
      expv[50] = 32'h00007378;
      expv[51] = 32'h00005f5b;
      expv[52] = 32'h00003a6d;
      expv[53] = 32'h00000067;
      expv[54] = 32'h00000060;
      expv[55] = 32'h00001d31;
      expv[56] = 32'h00000088;
      expv[57] = 32'h0000001a;
      expv[58] = 32'h00000054;
      expv[59] = 32'h00009195;
      expv[60] = 32'h000000e4;
      expv[61] = 32'h0000f09b;
      expv[62] = 32'h000058e0;
      expv[63] = 32'h0000abfa;
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
