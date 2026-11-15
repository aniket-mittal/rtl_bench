// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  big_sigma_0_512 dut (
    .x(in_vec[63:0]),
    .result(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h4f567e936a11d83e;
    stim[1] = 64'h744fa70f4a84dc8e;
    stim[2] = 64'h387a24bccee7964b;
    stim[3] = 64'h0fbf4d9778c8e2d0;
    stim[4] = 64'he5c56dd7a0ee48a1;
    stim[5] = 64'haa9ce67ed5890978;
    stim[6] = 64'h37736faea04ff505;
    stim[7] = 64'h7d6fbd99403115be;
    stim[8] = 64'h4fddcbe1b3daef6f;
    stim[9] = 64'heb593294378bf52e;
    stim[10] = 64'h77978536a8e017a2;
    stim[11] = 64'h5c99c218572316d1;
    stim[12] = 64'hf9f77c11e29694b9;
    stim[13] = 64'hebf51ca86ba58228;
    stim[14] = 64'hd316efafc359906b;
    stim[15] = 64'h43f5b2cc2488abaf;
    stim[16] = 64'h8ba37585fe5f291e;
    stim[17] = 64'h4db6d2ff030fbcb2;
    stim[18] = 64'h29d7e8f472abd265;
    stim[19] = 64'h5d3ec2ea9585d23c;
    stim[20] = 64'h6ad3e785e6b053c3;
    stim[21] = 64'h458c2d6635108015;
    stim[22] = 64'h5d6b159219a61310;
    stim[23] = 64'h955978db5cccdaa7;
    stim[24] = 64'hd215d341563342fc;
    stim[25] = 64'h52e602ae739d554e;
    stim[26] = 64'h046ff99de268cc82;
    stim[27] = 64'h0e63a9ad32929bdb;
    stim[28] = 64'h33756d42a6a01aa3;
    stim[29] = 64'he6ae29e4449babbf;
    stim[30] = 64'hbeb12a90601626f3;
    stim[31] = 64'h16f00f98a171b001;
    stim[32] = 64'ha08f2f6b4b55ce27;
    stim[33] = 64'h645aa5b02ed17cf7;
    stim[34] = 64'hca36769ca38ea826;
    stim[35] = 64'hf8a1b3222df4733d;
    stim[36] = 64'h650a9e20458f240c;
    stim[37] = 64'hf000ffd0b4bb9d0f;
    stim[38] = 64'h95418befe7f98038;
    stim[39] = 64'h5038d5dc2ebd0276;
    stim[40] = 64'h85b4c58cea74ed42;
    stim[41] = 64'ha829146d379b81f4;
    stim[42] = 64'h2c4deb379cf042ed;
    stim[43] = 64'h264216a8899ec72a;
    stim[44] = 64'h6cd64dd727fc1240;
    stim[45] = 64'hb2ee3fe24cd32d41;
    stim[46] = 64'h7d0f1a12d12f0215;
    stim[47] = 64'hdd45f2c899d183d1;
    stim[48] = 64'h8d2c656d4f26d1fb;
    stim[49] = 64'h9c6b07e1038edf9a;
    stim[50] = 64'h634c43b7af448f25;
    stim[51] = 64'h3107a15b0338b8b9;
    stim[52] = 64'h18ad759b861e62af;
    stim[53] = 64'hacddf7a2e02d5dd3;
    stim[54] = 64'h77fd5b0e4747d2aa;
    stim[55] = 64'h493cd0aa8ca1e4e1;
    stim[56] = 64'ha9dc74502a694b3a;
    stim[57] = 64'h4cec4d59d425be52;
    stim[58] = 64'hf3d905c4d2d77b56;
    stim[59] = 64'h73114e1307ce8d5f;
    stim[60] = 64'h7a9863b93fad7ae7;
    stim[61] = 64'h6ba930dde360fa57;
    stim[62] = 64'ha4b5e92587173e13;
    stim[63] = 64'h80b5bb695946a4ca;
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
      expv[0] = 64'h5d4dd65b1a2cda6f;
      expv[1] = 64'h6479f67dc5010679;
      expv[2] = 64'ha45d4e0ddfcc36aa;
      expv[3] = 64'h7c4d847158047489;
      expv[4] = 64'h499ec4a766ec0cd4;
      expv[5] = 64'h1059c7c6723c67be;
      expv[6] = 64'hf1ac32f83084c7de;
      expv[7] = 64'h619d7ca3355ae989;
      expv[8] = 64'h923ff8f1f0b47774;
      expv[9] = 64'h5d32b84f5293d783;
      expv[10] = 64'h4968bfe0a0729d2d;
      expv[11] = 64'h5757ee8c3c036287;
      expv[12] = 64'h7209c39892f9f0e2;
      expv[13] = 64'hf0660900d47b6795;
      expv[14] = 64'h9ac9d187120d6cc8;
      expv[15] = 64'hd9e18148b121ab14;
      expv[16] = 64'h9199e5fd25c8c3d5;
      expv[17] = 64'h0e3e3b712c9bf6ea;
      expv[18] = 64'hdef2856f1d58daab;
      expv[19] = 64'h28175ceebc19e396;
      expv[20] = 64'h19644861f15f2670;
      expv[21] = 64'h10260051232ac560;
      expv[22] = 64'h383bf9e7e1514a6e;
      expv[23] = 64'had470565ffeb6172;
      expv[24] = 64'hb41499f7ec7c6b63;
      expv[25] = 64'hf9d53b1c267c6649;
      expv[26] = 64'h65d22a99c3ecb84a;
      expv[27] = 64'h3fe83e7193beb7eb;
      expv[28] = 64'h46e4ecaebded65a0;
      expv[29] = 64'h90156646ec84486e;
      expv[30] = 64'h39a7cacae3c381f7;
      expv[31] = 64'h0e058f7128911a73;
      expv[32] = 64'hb11f3a6faf902330;
      expv[33] = 64'h86fe32b272744725;
      expv[34] = 64'h294e35355c7e9880;
      expv[35] = 64'h1061c7f68fc21d8c;
      expv[36] = 64'h091a978d512150b0;
      expv[37] = 64'hc7fe4086e3efc300;
      expv[38] = 64'h59a9908700625f12;
      expv[39] = 64'h58221dfc7b23191e;
      expv[40] = 64'h840706a27f2a0026;
      expv[41] = 64'hee31c83441cb51e0;
      expv[42] = 64'h4701deec55955262;
      expv[43] = 64'hea98fee6b9fd6b0f;
      expv[44] = 64'h1871d8b25688e29c;
      expv[45] = 64'h9a9fb911c13dada3;
      expv[46] = 64'h8319bfd6a548799d;
      expv[47] = 64'h2a5ffeee00b4dbde;
      expv[48] = 64'h7b3ae665c6971745;
      expv[49] = 64'hba0953f0549269e7;
      expv[50] = 64'h70c7588126d1b310;
      expv[51] = 64'h4543d4cc2e59f2a4;
      expv[52] = 64'hb76d8e9f12cd5e35;
      expv[53] = 64'hff1ed0f581b1bc29;
      expv[54] = 64'hf92251a8b6c51c91;
      expv[55] = 64'h3c2f74e503104723;
      expv[56] = 64'h0c5a33f242e3e0fe;
      expv[57] = 64'h84fac1ccf9661e51;
      expv[58] = 64'h9067c54c2c81af37;
      expv[59] = 64'h9b14ebba53369028;
      expv[60] = 64'hc743aa3bb9d513ba;
      expv[61] = 64'hf5115a17ceae1388;
      expv[62] = 64'h5bb800c2853a83c3;
      expv[63] = 64'h108968d33e77b339;
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
